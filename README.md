Elixir + Cowboy Discovery Project
======
Elixir is a dynamic, functional language designed for building scalable and maintainable applications. ~~ https://elixir-lang.org

Cowboy is a small, fast and modular HTTP server written in Erlang. ~~ https://github.com/ninenines/cowboy

Setup
-----
Get Dependencies

    mix deps.get

Run
-----
Compile and run the application

    mix run --no-halt

Interact
-----
View available api calls

    http://localhost:8001/api/


Get the character count or whatever is sent into the api

    http://localhost:8001/api/characters/[:string]

Enter a number of loops to process. Once complete, 
the endpoint will respond with the number of milliseconds it took.

    http://localhost:8001/api/benchmark/[:loops]
    
Get the word count of whatever is sent into the api

    http://localhost:8001/api/words/[:string]