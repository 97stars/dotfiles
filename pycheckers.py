import sys
import os
from subprocess import call, PIPE

fn = os.path.join(os.getcwd(), sys.argv[1])

print fn

call(["pep8", "--ignore=E701", "--repeat", fn])
call(["epylint.bat", fn], stderr=PIPE)
