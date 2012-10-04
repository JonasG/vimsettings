#!/bin/bash

pushd vimsettings/.vim && python getbundles.py
popd
tar -czf vimconfig.tgz vimsettings
cp vimconfig.tgz /home/jonas/configs
