from mingus.core import progressions, intervals
from mingus.core import chords as ch
from mingus.containers import NoteContainer, Note
from mingus.midi import fluidsynth
import time
import sys

class Sound(object):
    base_octave = 0
    playing_notes = []

    def set_octave(self, octave):
        self.base_octave = octave - 3
        print('set octave: ' + str(self.base_octave))
        return

    def convert_note(self, note):
        play = note + 48 + (12 * self.base_octave)

        print play
        return play

    def play_note(self, note_enum):
        play = self.convert_note(note_enum)
        fluidsynth.play_Note(play)
        self.playing_notes.append(play)
        return

    def stop_note(self, note_enum):
        stop = 0
        play = self.convert_note(note_enum)
        for note in self.playing_notes:
            if play == note:
                stop = note
                self.playing_notes.remove(note)
                break

        fluidsynth.stop_Note(stop, 1)
        return

    def stop_all(self):
        for note in self.playing_notes:
            fluidsynth.stop_Note(note, 1)

        del self.playing_notes[:]
        return
