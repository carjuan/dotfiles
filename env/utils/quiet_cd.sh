#!/usr/bin/env bash

quiet_cd() {

	CDPATH='' cd -- "$@" &>/dev/null || return

}
