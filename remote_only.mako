<%page args="binary, host=None, port=None, user=None, password=None, libc=None, remote_path=None, quiet=False, notmuxswap=False, netcat=None, authority=None"/>\
<%
if netcat:
    host, port = netcat.split(' ')[1:]

if authority:
    host, port = authority.split(':')

if port is None:
    port = 1337
if host is None:
    host = "localhost"
%>\
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from pwn import *

%if not quiet:
# Suppress warnings about using strings instead of bytes
%endif
warnings.filterwarnings(action='ignore',category=BytesWarning)

%if not quiet:
# Many built-in settings can be controlled on the command-line and show up
# in "args".  For example, to dump all data sent/received
# ./exploit.py DEBUG
# ./exploit.py HOST=example.com PORT=4141
%endif
host = args.HOST or ${repr(host)}
port = int(args.PORT or ${port})


def start(argv=[], *a, **kw):
    '''Start the exploit against the remote target.'''
    return connect(host, port)


%if not quiet:
#===========================================================
#                    EXPLOIT GOES HERE
#===========================================================
%else:
# -- Exploit goes here --
%endif

io = start()

%if not quiet:
# io.sendline(...)
%endif

io.interactive()
