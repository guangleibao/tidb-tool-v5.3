#!/bin/bash
~/.tiup/bin/tiup cluster clean test-kv --all --yes
~/.tiup/bin/tiup cluster destroy test-kv --yes
