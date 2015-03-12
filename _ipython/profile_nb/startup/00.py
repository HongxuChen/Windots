#  vim: set ft=python ts=8 sw=4 tw=0 et :
from __future__ import print_function

import os
import sys
import shutil
import random
import re
import platform
import subprocess
import tempfile
import gc

import glob


import grp
# import pwd # conflict with magic %pwd
import pipes
import traceback
import trace
import sysconfig
import uuid

import symtable
import string
import difflib


import json
import lxml


import linecache
import contextlib
import multiprocessing
import threading
import Queue
import filecmp
import hashlib
import abc
# import shlex
import zmq
import decimal
import struct
import copy
import operator
import sqlalchemy
import inspect
import math
import ast
import psutil
# import pstats
import binascii
import array

# import time
# import datetime
# import calendar
# import locale
# import pytz
import arrow

import heapq
import bisect
# import sched
import weakref
import fractions
import functools
import base64
# import mailbox
# import email.utils
# import codecs
import ctypes
import textwrap
import robotparser
import urlparse
import fileinput
import fnmatch
import dircache

# import Cookie
# import socket
# import SocketServer
import requests

# RFC2104 verify integrity of information passed between applications or stored in a potentially vulnerable location
# import hmac

# import bz2
# import gzip
# import tarfile
# import zipfile
# import zipimport
# import zlib

from xml.etree.ElementTree import Element, SubElement, tostring

from itertools import *
from collections import *
from cStringIO import StringIO


def my_trim_whitespace(s):
    """
    Returns a string that has at most one whitespace
    character between non-whitespace characters.
    >>> trim_whitespace(' hi   there')
    'hi there'
    """
    buffer = ''
    for i, letter in enumerate(s):
        if letter.isspace():
            try:
                if s[i + 1].isspace():
                    continue
            except IndexError:
                pass
        buffer = buffer + letter
    return buffer.strip()