#! /bin/bash
#
# This is an example of how stdlib::get_from_bucket behaves.
#

# EXPECT compiled crcmod: False
echo "679EBF864666 $(gsutil version -l | grep '^compiled crcmod:')"
# Exercise the behavior of compiling in crcmod
stdlib::init_gsutil_crcmod_el
# Expect compiled crcmod: True
echo "28BBEF21C095 $(gsutil version -l | grep '^compiled crcmod:')"

# Check for crcmod
# https://cloud.google.com/storage/docs/gsutil/addlhelp/CRC32CandInstallingcrcmod
stdlib::info 'TEST UUID E62A3897-AAA0-4577-A564-F00B4B54869B'
# Check the message in the object is the expected content
tmpdir="$(mktemp -d)"
# This should create a file named `${object}` in the target directory
stdlib::get_from_bucket -u "gs://${bucket}/${object}" -d "$${tmpdir}"
echo 'EXPECTED: ${content}'
echo -n 'ACTUAL: '
cat "$${tmpdir}/${object}"

echo "Finished with startup-script-custom example 3FF02EC9-BFFE-4B47-BEE7-C98A07818251"
