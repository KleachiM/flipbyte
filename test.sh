#!/bin/sh
echo
echo "Testing: no specified parameter, must crash with exit code 1 ... \c"
if ! ./flipbyte > /dev/null
  then
    echo ok
  else
    echo not ok # program work with not specified parameter
    ./flipbyte
    exit 1
fi

echo "Testing: specified string, must crash with exit code 1 ... \c"
param="hello"
if ! ./flipbyte > /dev/null $param
  then
    echo ok
  else
    echo not ok # program work with string
    ./flipbyte $param
    exit 1
fi

echo "Testing: specified float, must crash with exit code 1 ... \c"
param="6.0"
if ! ./flipbyte > /dev/null $param
  then
    echo ok
  else
    echo not ok # program work with float
    ./flipbyte $param
    exit 1
fi

echo "Testing: specified signed int, must crash with exit code 1 ... \c"
param="+6"
if ! ./flipbyte > /dev/null $param
  then
    echo ok
  else
    echo not ok # program work with signed int
    ./flipbyte $param
    exit 1
fi

echo "Testing: specified unsigned int, must work correctly ... \c"
param="6"
if ./flipbyte > /dev/null $param
  then
    echo ok
  else
    echo not ok # program not work with uint
    ./flipbyte $param
    exit 1
fi

echo "Testing: specified 6, must return 96 ... \c"
param="6"
out=`./flipbyte $param`
if [ $out == 96 ]
  then
    echo ok
  else
    echo not ok, returned $out
    exit 1
fi

echo "Testing: specified 96, must return 6 ... \c"
param="96"
out=`./flipbyte $param`
if [ $out == 6 ]
  then
    echo ok
  else
    echo not ok, returned $out
    exit 1
fi

echo "Testing: specified 3, must return 192 ... \c"
param="3"
out=`./flipbyte $param`
if [ $out == 192 ]
  then
    echo ok
  else
    echo not ok, returned $out
    exit 1
fi

echo "Testing: specified 192, must return 3 ... \c"
param="192"
out=`./flipbyte $param`
if [ $out == 3 ]
  then
    echo ok
  else
    echo not ok, returned $out
    exit 1
fi

echo "Testing: specified 5, must return 160 ... \c"
param="5"
out=`./flipbyte $param`
if [ $out == 160 ]
  then
    echo ok
  else
    echo not ok, returned $out
    exit 1
fi

echo "Testing: specified 160, must return 5 ... \c"
param="160"
out=`./flipbyte $param`
if [ $out == 5 ]
  then
    echo ok
  else
    echo not ok, returned $out
    exit 1
fi

echo "Testing: specified 255, must return 255 ... \c"
param="255"
out=`./flipbyte $param`
if [ $out == 255 ]
  then
    echo ok
  else
    echo not ok, returned $out
    exit 1
fi

echo "Testing: specified 0, must return 0 ... \c"
param="0"
out=`./flipbyte $param`
if [ $out == 0 ]
  then
    echo ok
  else
    echo not ok, returned $out
    exit 1
fi

echo "Testing: specified 256, must crash with exit code 1 ... \c"
param="256"
if ! ./flipbyte > /dev/null $param
  then
    echo ok
  else
    echo not ok # program work with integer great than 255
    ./flipbyte $param
    exit 1
fi

echo "Testing: specified 257, must crash with exit code 1 ... \c"
param="257"
if ! ./flipbyte > /dev/null $param
  then
    echo ok
  else
    echo not ok # program work with integer great than 255
    ./flipbyte $param
    exit 1
fi

echo "Testing: specified 6asdf, must crash with exit code 1 ... \c"
param="6asdf"
if ! ./flipbyte > /dev/null $param
  then
    echo ok
  else
    echo not ok # program work with not integer value
    ./flipbyte $param
    exit 1
fi

echo "Testing: specified /, must crash with exit code 1 ... \c"
param=""
if ! ./flipbyte > /dev/null $param
  then
    echo ok
  else
    echo not ok # program work with not integer value
    ./flipbyte $param
    exit 1
fi

echo "Testing: specified MAX_INT, must crash with exit code 1 ... \c"
param="2147483647"
if ! ./flipbyte > /dev/null $param
  then
    echo ok
  else
    echo not ok # program work with MAX_INT value
    ./flipbyte $param
    exit 1
fi

echo "Testing: specified MAX_INT + 1, must crash with exit code 1 ... \c"
param="2147483648"
if ! ./flipbyte > /dev/null $param
  then
    echo ok
  else
    echo not ok # program work with MAX_INT value
    ./flipbyte $param
    exit 1
fi