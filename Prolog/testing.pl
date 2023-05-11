weather(islamabad, summer, hot).
weather(karachi, summer, warm).
weather(islamabad, winter, cold).
weather(karachi, winter, warm).

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
*/