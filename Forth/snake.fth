variable snake-x-head  ok

500 cells allot  ok

  ok

variable snake-y-head  ok

500 cells allot  ok

  ok

variable apple-x  ok

variable apple-y  ok

  ok

0 constant left  ok

1 constant up  ok

2 constant right  ok

3 constant down  ok

  ok

24 constant width  ok

24 constant height  ok

  ok

variable direction  ok

variable length  ok

  ok

: snake-x ( offset -- address ) 

  cells snake-x-head + ;  ok

  ok

: snake-y ( offset -- address ) 

  cells snake-y-head + ;  ok

  ok

: convert-x-y ( x y -- offset )  24 cells * + ;  ok

: draw ( color x y -- )  convert-x-y graphics + ! ;  ok

: draw-white ( x y -- )  1 rot rot draw ;  ok

: draw-black ( x y -- )  0 rot rot draw ;  ok

  ok

: draw-walls 

  width 0 do 

    i 0 draw-black 

    i height 1 - draw-black 

  loop 

  height 0 do 

    0 i draw-black 

    width 1 - i draw-black 

  loop ;  ok

  ok

: initialize-snake 

  4 length ! 

  length @ 1 + 0 do 

    12 i - i snake-x ! 

    12 i snake-y ! 

  loop 

  right direction ! ;  ok

  ok

: set-apple-position apple-x ! apple-y ! ;  ok

  ok

: initialize-apple  4 4 set-apple-position ;  ok

  ok

: initialize 

  width 0 do 

    height 0 do 

      j i draw-white 

    loop 

  loop 

  draw-walls 

  initialize-snake 

  initialize-apple ;  ok

  ok

: move-up  -1 snake-y-head +! ;  ok

: move-left  -1 snake-x-head +! ;  ok

: move-down  1 snake-y-head +! ;  ok

: move-right  1 snake-x-head +! ;  ok

  ok

: move-snake-head  direction @ 

  left over  = if move-left else 

  up over    = if move-up else 

  right over = if move-right else 

  down over  = if move-down 

  then then then then drop ;  ok

  ok

\ Move each segment of the snake forward by one  ok

: move-snake-tail  0 length @ do 

    i snake-x @ i 1 + snake-x ! 

    i snake-y @ i 1 + snake-y ! 

  -1 +loop ;  ok

  ok

: is-horizontal  direction @ dup 

  left = swap 

  right = or ;  ok

  ok

: is-vertical  direction @ dup 

  up = swap 

  down = or ;  ok

  ok

: turn-up     is-horizontal if up direction ! then ;  ok

: turn-left   is-vertical if left direction ! then ;  ok

: turn-down   is-horizontal if down direction ! then ;  ok

: turn-right  is-vertical if right direction ! then ;  ok

  ok

: change-direction ( key -- ) 

  37 over = if turn-left else 

  38 over = if turn-up else 

  39 over = if turn-right else 

  40 over = if turn-down 

  then then then then drop ;  ok

  ok

: check-input 

  last-key @ change-direction 

  0 last-key ! ;  ok

  ok

\ get random x or y position within playable area  ok

: random-position ( -- pos ) 

  width 4 - random 2 + ;  ok

  ok

: move-apple 

  apple-x @ apple-y @ draw-white 

  random-position random-position 

  set-apple-position ;  ok

  ok

: grow-snake  1 length +! ;  ok

  ok

: check-apple 

  snake-x-head @ apple-x @ = 

  snake-y-head @ apple-y @ = 

  and if 

    move-apple 

    grow-snake 

  then ;  ok

  ok

: check-collision ( -- flag ) 

  \ get current x/y position 

  snake-x-head @ snake-y-head @ 

 

  \ get color at current position 

  convert-x-y graphics + @ 

 

  \ leave boolean flag on stack 

  0 = ;  ok

  ok

: draw-snake 

  length @ 0 do 

    i snake-x @ i snake-y @ draw-black 

  loop 

  length @ snake-x @ 

  length @ snake-y @ 

  draw-white ;  ok

  ok

: draw-apple 

  apple-x @ apple-y @ draw-black ;  ok

  ok

  ok

: game-loop ( -- ) 

  begin 

    draw-snake 

    draw-apple 

    100 sleep 

    check-input 

    move-snake-tail 

    move-snake-head 

    check-apple 

    check-collision 

  until 

  ." Game Over" ;  ok

  ok

: start  initialize game-loop ;  ok

  ok