import unittest
from mock import MagicMock

from keyboard import Keyboard

class TestKeyboard(unittest.TestCase):
	def testResetButton(self):
		Keyboard.initKeyboard = MagicMock(0)
		keyboard = Keyboard()
		keyboard.mapping_notes = [1, 2]
		keyboard.customMapping = {1:2}

		keyboard.resetButton()
		self.assertEqual(keyboard.mapping_notes, [])
		self.assertNotEqual(keyboard.customMapping, {})

		keyboard.resetButton()
		self.assertEqual(keyboard.mapping_notes, [])
		self.assertEqual(keyboard.customMapping, {})