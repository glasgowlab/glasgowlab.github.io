import unittest
from pytraj import *
<<<<<<< HEAD
import pytest
=======
>>>>>>> parent of b8ef017... deleting pytraj


class Test(unittest.TestCase):
    def test_0(self):
        def test_class(self):
            class FA(Trajectory):
                pass

            FA(fn('Tc5b.x'), fn('Tc5b.top'))

<<<<<<< HEAD
        with pytest.raises(TypeError):
            test_class()
=======
        self.assertRaises(TypeError, lambda: test_class())
>>>>>>> parent of b8ef017... deleting pytraj


if __name__ == "__main__":
    unittest.main()
