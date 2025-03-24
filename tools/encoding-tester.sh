#! /bin/bash
#
# encoding tester based on iconv
# iconv is available on Linux, MacOS and Windows (cygwin and git for Windows)
#

# ---------------------------------
IFS='
'
# ---------------------------------
ERROR=0
# ---------------------------------
# /dev/null showed problems on MacOS, therefore a tmp file
TMP_FILE=`mktemp`
# ---------------------------------

for texfile in $(find . -type f -name "*.tex" -print)
do
    iconv -f UTF-8 -t UTF-16 "${texfile}" > "${TMP_FILE}" ; RC=$?
    if [ ${RC} -gt 0 ]
    then
        echo "${texfile} is not UTF-8 encoded"
        ERROR=1
    fi
done

rm "${TMP_FILE}"

exit ${ERROR}

# ---------------------------------

