#!/bin/bash

PLUGIN_PATH='/gcc-callgraph-plugin/gcc-callgraph-plugin.py'

gcc -fplugin=python -fplugin-arg-python-script=$PLUGIN_PATH -flto -flto-partition=none $ARGS
