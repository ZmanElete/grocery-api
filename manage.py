#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys

_ENV = os.environ

def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'grocery_api.settings')
    try:
        from django.core.management import execute_from_command_line
        from django.conf import settings

        if settings.DEBUG:
            if settings.DEBUG and _ENV.get('RUN_MAIN') and (debug_binding := _ENV.get('HOST_DEBUGGER_BINDING')):
                import debugpy
                iface, port = '0.0.0.0', 3000

                print(f"Remote debugger listening on local={iface}:{port} / host={debug_binding}...", file=sys.stderr)
                debugpy.listen((iface, port))

                del iface, port, debug_binding

    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()
