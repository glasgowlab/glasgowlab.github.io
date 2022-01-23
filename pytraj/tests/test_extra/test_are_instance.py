from __future__ import print_function
import unittest

from pytraj import io as mdio
from pytraj.utils.check_and_assert import are_instance
<<<<<<< HEAD
=======
from pytraj.externals.six import string_types
>>>>>>> parent of b8ef017... deleting pytraj
from pytraj import *

from utils import fn


<<<<<<< HEAD
def test():
    traj = mdio.iterload(fn('Tc5b.x'), fn('Tc5b.top'))
    assert are_instance([traj, traj], TrajectoryIterator) == True
    assert are_instance([traj, ""], TrajectoryIterator) == False
    assert are_instance(["my comment", ""], str) == True
=======
class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.iterload(fn('Tc5b.x'), fn('Tc5b.top'))
        assert are_instance([traj, traj], TrajectoryIterator) == True
        assert are_instance([traj, ""], TrajectoryIterator) == False
        assert are_instance(["my comment", ""], string_types) == True


if __name__ == "__main__":
    unittest.main()
>>>>>>> parent of b8ef017... deleting pytraj
