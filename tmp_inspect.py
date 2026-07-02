import sys
import pathlib
import importlib.util
import glob
import zipfile

print('sys.path:')
for p in sys.path:
    print(' -', p)

print('\nspec main:', importlib.util.find_spec('hyperswitch_python'))
print('spec ext:', importlib.util.find_spec('hyperswitch_python._hyperswitch_python'))

site = pathlib.Path('/home/devuser/.local/lib/python3.13/site-packages')
print('\nsite exists:', site.exists())
if site.exists():
    print('site contents:')
    for p in sorted(site.iterdir()):
        print(' -', p.name)
    print('\n.pth files:')
    for p in sorted(site.glob('*.pth')):
        print(' -', p.name)
        print(p.read_text())
    print('\n.egg-link files:')
    for p in sorted(site.glob('*.egg-link')):
        print(' -', p.name)
        print(p.read_text())

print('\nwheels:')
for wheel in glob.glob('/tmp/pip-ephem-wheel-cache-*/wheels/*.whl'):
    print(' -', wheel)
    with zipfile.ZipFile(wheel) as z:
        print('   contents:')
        for name in z.namelist():
            print('    -', name)
