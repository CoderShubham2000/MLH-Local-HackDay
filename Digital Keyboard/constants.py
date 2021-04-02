from enum import Enum
from PyQt5.QtCore import *

class DiscreteNotes(Enum):
    C0   = 0
    Cs0  = 1
    D0   = 2
    Ds0  = 3
    E0   = 4
    F0   = 5
    Fs0  = 6
    G0   = 7
    Gs0  = 8
    A0   = 9
    As0  = 10
    B0   = 11
    C1   = 12
    Cs1  = 13
    D1   = 14
    Ds1  = 15
    E1   = 16
    F1   = 17
    Fs1  = 18
    G1   = 19
    Gs1  = 20
    A1   = 21
    As1  = 22
    B1   = 23


#init octave dict to map to the number keys
#key up and down are special cases caught by updateOctave
octaveDict = {
    Qt.Key_Up:   -2,
    Qt.Key_Down: -1,
    Qt.Key_1:     1,
    Qt.Key_2:     2,
    Qt.Key_3:     3,
    Qt.Key_4:     4,
    Qt.Key_5:     5,
}

selected_keyboard = 'asdf keyboard'

keyboard_types = {
    'asdf keyboard': {
        Qt.Key_Z: DiscreteNotes.C0,
        Qt.Key_X: DiscreteNotes.D0,
        Qt.Key_C: DiscreteNotes.E0,
        Qt.Key_A: DiscreteNotes.F0,
        Qt.Key_S: DiscreteNotes.G0,
        Qt.Key_D: DiscreteNotes.A0,
        Qt.Key_F: DiscreteNotes.B0,
        Qt.Key_Q: DiscreteNotes.Cs0,
        Qt.Key_W: DiscreteNotes.Ds0,
        Qt.Key_E: DiscreteNotes.Fs0,
        Qt.Key_R: DiscreteNotes.Gs0,
        Qt.Key_T: DiscreteNotes.As0,
        Qt.Key_B: DiscreteNotes.C1,
        Qt.Key_N: DiscreteNotes.D1,
        Qt.Key_M: DiscreteNotes.E1,
        Qt.Key_H: DiscreteNotes.F1,
        Qt.Key_J: DiscreteNotes.G1,
        Qt.Key_K: DiscreteNotes.A1,
        Qt.Key_L: DiscreteNotes.B1,
        Qt.Key_Y: DiscreteNotes.Cs1,
        Qt.Key_U: DiscreteNotes.Ds1,
        Qt.Key_I: DiscreteNotes.Fs1,
        Qt.Key_O: DiscreteNotes.Gs1,
        Qt.Key_P: DiscreteNotes.As1,
    },
    'bat keyboard': {
        Qt.Key_F: DiscreteNotes.C0,
        Qt.Key_G: DiscreteNotes.D0,
        Qt.Key_C: DiscreteNotes.E0,
        Qt.Key_I: DiscreteNotes.F0,
        Qt.Key_V: DiscreteNotes.G0,
        Qt.Key_A: DiscreteNotes.A0,
        Qt.Key_D: DiscreteNotes.B0,
        Qt.Key_Q: DiscreteNotes.Cs0,
        Qt.Key_W: DiscreteNotes.Ds0,
        Qt.Key_E: DiscreteNotes.Fs0,
        Qt.Key_R: DiscreteNotes.Gs0,
        Qt.Key_T: DiscreteNotes.As0,
        Qt.Key_B: DiscreteNotes.C1,
        Qt.Key_N: DiscreteNotes.D1,
        Qt.Key_M: DiscreteNotes.E1,
        Qt.Key_H: DiscreteNotes.F1,
        Qt.Key_J: DiscreteNotes.G1,
        Qt.Key_K: DiscreteNotes.A1,
        Qt.Key_L: DiscreteNotes.B1,
        Qt.Key_Y: DiscreteNotes.Cs1,
        Qt.Key_U: DiscreteNotes.Ds1,
        Qt.Key_S: DiscreteNotes.Fs1,
        Qt.Key_O: DiscreteNotes.Gs1,
        Qt.Key_P: DiscreteNotes.As1,
    },
}

orange = 0xef8a62
cyan = 0x5ab4ac
yellow = 0xffffbf
green = 0x91cf60
highlighted_key_color = orange