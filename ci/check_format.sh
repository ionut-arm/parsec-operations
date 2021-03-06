#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Copyright (c) 2020, Arm Limited, All Rights Reserved
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#          http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------

set -e

# Check the git diff between the clang-formatted file and the actual file to
# make sure they match.

OUT_DIR="/tmp/parsec-operations-ci"
mkdir -p $OUT_DIR

# protobuf tests
mkdir -p $OUT_DIR/protobuf
PROTOBUF_FILES=protobuf/*.proto
for f in $PROTOBUF_FILES
do
	clang-format $f > $OUT_DIR/$f
	git diff $f $OUT_DIR/$f
done
