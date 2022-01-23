#!/usr/bin/env python

from __future__ import print_function
import unittest
import pytraj as pt
from utils import fn
from pytraj.testing import aa_eq


class TestPipeline(unittest.TestCase):
    def test_pieline(self):
<<<<<<< HEAD
        traj = pt.iterload(fn('tz2.ortho.nc'), fn('tz2.ortho.parm7'))
=======
        traj = pt.iterload(fn('tz2.nc'), fn('tz2.parm7'))
>>>>>>> parent of b8ef017... deleting pytraj

        fi = pt.pipe(traj, [
            'autoimage',
        ])
        aa_eq(pt.get_coordinates(fi), traj[:].autoimage().xyz)

        fi = pt.pipe(
            traj, [
                'autoimage',
            ], frame_indices=[3, 5])
        aa_eq(pt.get_coordinates(fi), traj[[3, 5]].autoimage().xyz)


if __name__ == "__main__":
    unittest.main()
