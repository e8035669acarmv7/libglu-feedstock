#!/bin/bash

export CFLAGS="-I${PREFIX}/include"
if [[ ${HOST} =~ .*powerpc64le.* ]] || [[ ${HOST} =~ .*aarch64.* ]]; then
  export LDFLAGS="${LDFLAGS} -Wl,-rpath-link,${PREFIX}/lib"
  echo "cos7 architecture"
  echo "LDFLAGS=${LDFLAGS}"
else
  export LDFLAGS="-L${PREFIX}/lib"
  echo "cos6 architecture"
  echo "LDFLAGS=${LDFLAGS}"
fi
./configure  --prefix=$PREFIX ##--disable-static
make
make install
