#!/bin/bash

# Check if Apache is running
if ! ps aux | grep -v grep | grep -q apache2; then
  exit 1
fi

# Check if website is responding
if ! curl -f http://localhost:8765/; then
  exit 1
fi

# All checks passed
exit 0 