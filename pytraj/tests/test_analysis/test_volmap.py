from __future__ import absolute_import

import unittest
import pytraj as pt
from utils import fn
from pytraj.testing import aa_eq
from pytraj.all_actions import volmap
<<<<<<< HEAD
import pytest
=======
>>>>>>> parent of b8ef017... deleting pytraj

cm = "dummy.dat 0.5 0.5 0.5 :WAT@O buffer 2.0 centermask !:1-13 radscale 1.36"

txt = """
parm {}
trajin {} 1 1
rms first :1-13
center :1-13 mass origin
volmap {} {} {}
"""


<<<<<<< HEAD
class TestVolmap:
    def test_volmap(self, tmpdir):
        traj = pt.iterload(fn('tz2.ortho.nc'), fn('tz2.ortho.parm7'))[:1]
        size = ''
        center = ''
        with tmpdir.as_cwd():
            state = pt.load_cpptraj_state(
                txt.format(
                    fn('tz2.ortho.parm7'), fn('tz2.ortho.nc'), cm, size, center))
            state.run()
=======
class TestVolmap(unittest.TestCase):
    def test_volmap(self):
        traj = pt.iterload(fn('tz2.ortho.nc'), fn('tz2.ortho.parm7'))[:1]
        size = ''
        center = ''
        state = pt.load_cpptraj_state(
            txt.format(
                fn('tz2.ortho.parm7'), fn('tz2.ortho.nc'), cm, size, center))
        state.run()
>>>>>>> parent of b8ef017... deleting pytraj
        cpp_data = state.data[-2].values  # last one is totalvolume

        traj = traj.superpose(mask=':1-13').center(':1-13 mass origin')
        ds = pt.volmap(
            traj,
            mask=':WAT@O',
            grid_spacing=(0.5, 0.5, 0.5),
            buffer=2.0,
            centermask='!:1-13',
            radscale=1.36)

        aa_eq(cpp_data, ds)

        # assert
<<<<<<< HEAD
        with pytest.raises(AssertionError):
            pt.volmap(traj, mask=':WAT@O', grid_spacing='0.5 0.5 0.5')
        with pytest.raises(AssertionError):
            pt.volmap(traj, mask=':WAT@O', grid_spacing=(0.5, 0.5))
        with pytest.raises(ValueError):
            pt.volmap(traj, mask=':WAT@O', grid_spacing=(0.5, 0.5, 0.5), size='20 20 20')
=======
        self.assertRaises(
            AssertionError,
            lambda: pt.volmap(traj, mask=':WAT@O', grid_spacing='0.5 0.5 0.5'))
        self.assertRaises(
            AssertionError,
            lambda: pt.volmap(traj, mask=':WAT@O', grid_spacing=(0.5, 0.5)))
        self.assertRaises(ValueError, lambda: pt.volmap(traj, mask=':WAT@O', grid_spacing=(0.5, 0.5, 0.5), size='20 20 20'))
>>>>>>> parent of b8ef017... deleting pytraj

    def test_volmap_RuntimeError(self):
        # raise RuntimeError
        dry_traj = pt.iterload(fn('tz2.nc'), fn('tz2.parm7'))
<<<<<<< HEAD
        with pytest.raises(RuntimeError):
            pt.volmap(dry_traj, mask=':WAT@O',
                                                          grid_spacing=(0.5, 0.5, 0.5))
=======
        self.assertRaises(RuntimeError, lambda: pt.volmap(dry_traj, mask=':WAT@O',
                                                          grid_spacing=(0.5, 0.5, 0.5)))
>>>>>>> parent of b8ef017... deleting pytraj
