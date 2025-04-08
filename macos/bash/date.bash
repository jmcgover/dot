#!/usr/bin/env bash

function date_now() {
    date +"%T"
}

function date_today() {
    date +"%Y-%m-%d"
}

export ISO8601_FMT='%Y-%m-%dT%H:%M:%S%Z'
function date_iso8601() {
    date +"${ISO8601_FMT}"
}

function iso8601() {
    date_iso8601
}

function iso8601_filesafe() {
    iso8601 | tr -d ':'
}

function iso8601_underscores() {
    iso8601 | tr '-' '_' | tr ':' '_'
}

