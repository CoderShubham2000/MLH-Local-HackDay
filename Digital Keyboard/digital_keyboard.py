import sys

from PyQt5.QtWidgets import QApplication
from mingus.midi import fluidsynth

from interface import DigitalInstrumentWidget

def main():
    fluidsynth.init("HS Synth Collection I.sf2", "alsa")
    app = QApplication(sys.argv)
    DigitalInstrumentWidget()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()
