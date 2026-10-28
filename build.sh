#!/bin/sh
# Wraps src/body.html into a standalone index.html for static hosting.
cd "$(dirname "$0")"
{ printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  sed -n '1,/<\/style>/p' src/body.html | grep -v 'claude:viewport'
  printf '</head>\n<body>\n'
  sed -n '/<\/style>/,$p' src/body.html | tail -n +2 | sed 's#<span class="plain">umalani@uchicago.edu</span>#<a href="mailto:umalani@uchicago.edu">umalani@uchicago.edu</a>#'
  printf '</body>\n</html>\n'; } > index.html
