#!/bin/sh

script_dir=$(dirname $(realpath $0))

if test -d ${script_dir}/packages; then
  echo "Note: ${script_dir}/packages already exists"
  echo "Note: No work to be done"
fi

# Setup initial Python virtual environment
echo "Note: Setting up initial Python virtual environment"
python3 -m venv ${script_dir}/packages/python
if test $? -ne 0; then exit 1; fi

echo "Note: Installing ivpm"
${script_dir}/packages/python/bin/pip install --upgrade ivpm
if test $? -ne 0; then exit 1; fi

echo "Note: Updating packages"
${script_dir}/packages/python/bin/ivpm update
if test $? -ne 0; then exit 1; fi
