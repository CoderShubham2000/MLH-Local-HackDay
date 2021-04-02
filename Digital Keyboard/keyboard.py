from PyQt5.QtCore import QCoreApplication
from PyQt5.QtCore import Qt

import constants
from sound import Sound
from db import db

class Keyboard(object):
    def __init__(self, shortcutMappings):
        # self.DigitalInstrumentWidget = DigitalInstrumentWidget()
        self.sound = Sound()
        self.mapping_db = db()
        self.initKeyboard(shortcutMappings)

        self.octave = 1;
        self.noteDict = constants.keyboard_types[constants.selected_keyboard]
        self.pedal_pressed = False
        self.play_over = False
        self.mapping_notes = []

    def initKeyboard(self, shortcutMappings):
        # Contains override keys that will be hit first
        self.utilsDict = {
            Qt.Key_Escape: QCoreApplication.instance().quit,
            Qt.Key_Control: lambda *args: -1,
        }

        # Contains keyboard shortcuts; ctrl+listed key
        # This must be initialized in interface.py so we can open interface dialogs
        self.shortcutDict = shortcutMappings

        self.customMapping = {}

        self.reservedKeys = [
            Qt.Key_Escape,
            Qt.Key_Space,
            Qt.Key_Tab,
            Qt.Key_CapsLock,
        ]

    def updateOctave(self, value):
        #if value is -2, up key was pressed
        #so move octave up one step
        if value == -2:
            if self.octave == 5:
                self.octave = 1
            else:
                self.octave = (self.octave + 1) % 6

        #if value is -1, down key was pressed
        #so move octave down one step
        elif value == -1 and self.octave > 1:
            self.octave = (self.octave - 1) % 6

        #update octave to value mod 8
        else:
            self.octave = value % 6

        self.sound.set_octave(self.octave)

    def startNote(self, note):
        print("{} started".format(note))
        # print note
        print 'note.value: {}'.format(note.value)
        self.sound.play_note(note.value)

    def endNote(self, note):
        print(str(note) + " ended")
        if self.play_over or not self.pedal_pressed:
            self.sound.stop_note(note.value)

    def noteMapper(self, key):
        #check custom mapping first, so it takes priority
        notes = []
        if key in self.customMapping:
            notes = self.customMapping[key]

        #if key pressed is mapped to a note,
        #return that note, else return false
        elif key in self.noteDict:
            notes.append(self.noteDict[key])

        return notes

    def commandMapper(self, key, modifier):
        """Maps pressed keys to commands
        returns true to update UI and stop there
        returns false to play note and not immediatly update UI
        returns -1 to not update UI
        """

        # if key is in the utility dictionary
        # call function mapped to that key
        if key in self.utilsDict:
            return self.utilsDict[key]()

        elif modifier == Qt.ControlModifier and key in self.shortcutDict:
            self.shortcutDict[key]()
            return -1

        # if key pressed is mapped to an octave,
        # change current octave to that key
        elif key in constants.octaveDict:
            argument = constants.octaveDict[key]
            self.updateOctave(argument)
            return True

        # If we already started mapping notes by clicking on keys,
        # map the clicked notes the the pressed key, stop mapping,
        # then return False so that the note can be played
        elif self.mapping_notes and key not in self.reservedKeys:
            print 'mapping notes: ' + str(self.mapping_notes)
            self.customMapping[key] = self.mapping_notes
            print self.customMapping[key]
            self.mapping_notes = []
            return False

        elif key == Qt.Key_Space:
            if not self.pedal_pressed:
                self.pedal_pressed = True

            else:
                self.pedal_pressed = False
                self.play_over = False
                self.sound.stop_all()
            return True

        elif key == Qt.Key_Tab or key == Qt.Key_CapsLock:
            self.play_over = not self.play_over
            return True

        # else key pressed is not a command
        else:
            return False

    def defaultButton(self, dialog_output):
        print("Default button pressed")

        keyboard_name = dialog_output[0]
        dialog_accepted = dialog_output[1]
        if not (keyboard_name and dialog_accepted):
            print 'Keyboard change canceled'
            return False

        self.noteDict = constants.keyboard_types[keyboard_name]
        return True


    def resetButton(self):
        print("Reset Button Pressed")
        if self.mapping_notes:
            self.mapping_notes = []
        else:
            self.customMapping = {}
        return True

    def saveButton(self, dialog_output):
        print("Save Button Pressed")
        mapping_name = dialog_output[0]
        dialog_accepted = dialog_output[1]
        if not (mapping_name and dialog_accepted):
            print 'Save canceled'
            return False

        save_mapping = []
        for key, val in self.customMapping.iteritems():
            for note in val:
                save_mapping.append((mapping_name, key, note.value))

        self.mapping_db.insert_mapping(save_mapping)
        print('New mapping saved:\n{0}'.format(save_mapping))

    def getMappingNames(self):
        return self.mapping_db.get_all_mapping_names()

    def loadButton(self, dialog_output):
        print("Load Button Pressed")
        mname = dialog_output[0]
        dialog_accepted = dialog_output[1]
        if mname == ' - ' or not dialog_accepted:
            print 'Load canceled'
            return False

        loaded_mapping = self.mapping_db.get_mapping_from_name(mname)
        print loaded_mapping
        for maps in loaded_mapping:
            if maps[0] in self.customMapping:
                self.customMapping[maps[0]].append(constants.DiscreteNotes(maps[1]))
            else:
                self.customMapping[maps[0]] = [constants.DiscreteNotes(maps[1])]

        return True

    def deleteButton(self, dialog_output):
        print("Delete Button Pressed")
        mname = dialog_output[0]
        dialog_accepted = dialog_output[1]
        if mname == ' - ' or not dialog_accepted:
            print 'Delete canceled'
            return False

        self.mapping_db.delete_mapping_from_name(mname)