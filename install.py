from __future__ import print_function
import os
import sys
from colorama import Fore, init


def should_ignore(fname):
    if fname.endswith('~'):
        return True
    return False


def symlink(source, link_name):
    os_symlink = getattr(os, "symlink", None)
    if callable(os_symlink):
        os_symlink(source, link_name)
    else:
        import ctypes

        csl = ctypes.windll.kernel32.CreateSymbolicLinkW
        csl.argtypes = (ctypes.c_wchar_p, ctypes.c_wchar_p, ctypes.c_uint32)
        csl.restype = ctypes.c_ubyte
        flags = 1 if os.path.isdir(source) else 0
        if csl(link_name, source, flags) == 0:
            raise ctypes.WinError()


init()
print(Fore.YELLOW, "\n*** creating lnk files ***", Fore.RESET)
homedir = os.path.expanduser('~')
curdir = os.path.dirname(os.path.abspath(sys.argv[0]))
MSYS_ROOT=r"C:\MinGW\msys\1.0"
MSYS_PROFILE_DST= os.path.join(MSYS_ROOT, r'etc\profile')
MSYS_PROFILE_SRC= os.path.join(curdir, 'msys_profile')
if os.path.exists(MSYS_PROFILE_DST):
    os.remove(MSYS_PROFILE_DST)
symlink(MSYS_PROFILE_SRC, MSYS_PROFILE_DST)

for f in os.listdir(curdir):
    if f.startswith('_') and not should_ignore(f):
        basename = os.path.basename(f)
        old_path = os.path.abspath(f)
        targetname = '.' + basename[1:]
        new_path = os.path.join(homedir, targetname)
        if os.path.exists(new_path):
            try:
                os.remove(new_path)
            except:
                import shutil
                shutil.rmtree(new_path)
        symlink(old_path, new_path)
