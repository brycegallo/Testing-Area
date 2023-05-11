weather(islamabad, summer, hot).
weather(karachi, summer, warm).
weather(islamabad, winter, cold).
weather(karachi, winter, warm).

main :- write('This is sample Prolog program'),
write(' This program is written into testing.pl file').

/* How to Run
?- [testing].
    true.
?- weather(City, summer, hot), weather(City, winter, cold).
    City = islamabad.
?- weather(City, _, hot).
    City = islamabad.
?- weather(City, _, cold).
    City = islamabad.
?- weather(City, _, warm).
    City = karachi.
?- main.
    This program is written into testing.pl file
*/