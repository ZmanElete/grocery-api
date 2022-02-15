#!/usr/bin/env python
'''light-weight /usr/bin/jq replacement.'''
import bdb
import functools
import json
import logging
import sys

_log = logging.getLogger(__name__)

def _main(argv):
    try:
        obj = json.load(sys.stdin)
        paths = (len(argv) > 1 and argv[1] or '').split('.')

        result = functools.reduce(lambda any, attr: any.get(attr, None), paths, obj)
        json.dump(result, sys.stdout)
        print()

    except (KeyboardInterrupt, bdb.BdbQuit) as ex:
        _log.warning("%s", type(ex).__name__)

    except:
        _log.exception("fatal error")
        return -1

    return 0


if __name__ == '__main__':
    sys.exit(_main(sys.argv))
