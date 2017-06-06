#!/bin/sh

paps "${1}" | ps2pdf - "${1%%.*}".pdf
