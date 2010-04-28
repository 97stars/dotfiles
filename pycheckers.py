import sys
import os
from subprocess import call, PIPE

fn = os.path.join(os.getcwd(), sys.argv[1])

print fn

call(["pep8", "--ignore=E701,E302", "--repeat", fn])
call(["epylint.bat", "--disable-msg=W0511", fn], stderr=PIPE)
