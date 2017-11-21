#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
set -x

prefix=$1
version=$2

atlas_dir="${prefix}/usr/lib/atlas-server"
etc_dir="${prefix}/etc/atlas"

install -d -m 0755 "${prefix}/usr/lib/"
install -d -m 0755 "${prefix}/var/log/atlas"

tar xf "distro/target/apache-atlas-${version}-bin.tar.gz" -C "${prefix}/usr/lib/"
mv "${prefix}/usr/lib/apache-atlas-${version}" "${atlas_dir}"
mv "${atlas_dir}/conf" "${etc_dir}/conf"
cp -r "${etc_dir}/conf" "${etc_dir}/conf.dist"

ln -nsf "/etc/atlas/conf" "${atlas_dir}/conf"
