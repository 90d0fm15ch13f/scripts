#!/bin/sh

LAST=ls ${1}hw*.txt | sed 's/\([0-9]\+\).*/\1/g' | sort -n | tail -1
echo "${LAST}"
paps "${1}"hw"${LAST}".txt | ps2pdf - "${1}"hw"${LAST}".pdf
