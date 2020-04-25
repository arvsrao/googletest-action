#!/usr/bin/env bash

###############################################################################
#                                entrypoint.sh                                #
###############################################################################
# Checks all C files (.c and .h) in the GitHub workspace for conforming to
# clang-format. If any C files are incorrectly formatted, the script lists them
# and exits with 1.
# Define your own formatting rules in a .clang-format file at your repository
# root. Otherwise, the LLVM style guide is used as a default.


###############################################################################
#                             format_diff function                            #
###############################################################################
# Accepts a filepath argument. The filepath passed to this function must point
# to a .c or .h file. The file is formatted with clang-format and that output is
# compared to the original file.
format_diff(){
    local filepath="$1"
    local_format="$(clang-format-9 --style=file --fallback-style=LLVM "${filepath}")"
    diff -q <(cat "${filepath}") <(echo "${local_format}") > /dev/null
    diff_result="$?"
    if [[ "${diff_result}" -ne 0 ]]; then
    	echo "${filepath} is not formatted correctly." >&2
		return 1;
    fi
    return 0;
}

cd "$GITHUB_WORKSPACE" || exit 1

# All files improperly formatted will be printed to the output.
acc=0;

files=$(find ./src ./include ./test -regextype posix-extended  -regex '.*.(h|cpp)')
for f in $files; do
    format_diff $f
    acc=$((acc + $?))
done

#for i in {1..5}; do ((acc++)); done
if [[ $acc -ne 0 ]]; then
    echo $acc "file(s) not properly formatted."
    exit 1;
fi
exit 0;
