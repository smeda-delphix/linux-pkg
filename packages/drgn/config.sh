#!/bin/bash
#
# Copyright 2019, 2020 Delphix
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# shellcheck disable=SC2034
DEFAULT_PACKAGE_GIT_URL="https://github.com/delphix/drgn.git"
PACKAGE_DEPENDENCIES="libkdumpfile"

UPSTREAM_GIT_URL="https://github.com/osandov/drgn.git"
UPSTREAM_GIT_BRANCH="master"

function prepare() {
	#
	# Strictly speaking libkdumpfile is not a hard prerequisite for
	# drgn itself, but it is a hard requirement in our use-case as
	# we do want to use drgn for kdump-compressed crash dumps.
	#
	logmust install_pkgs "$DEPDIR"/libkdumpfile/*.deb
	logmust install_build_deps_from_control_file
}

function build() {
	logmust dpkg_buildpackage_default
}

function update_upstream() {
	logmust update_upstream_from_git
}
