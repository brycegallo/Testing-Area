: HELLO
    33 111 108 108 101 72 emit emit emit emit emit ;

: say-hello  ." Hello there!" ;

: print-stack-top  cr dup ." The top of the stack is " .
  cr ." which looks like '" dup emit ." ' in ascii  " ;