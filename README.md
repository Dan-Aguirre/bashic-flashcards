# bashic-flashcards
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

Basic bash flashcard app

A small and simple flashcard app written in bash, takes a questions file and an answers file, randomly presents a question, then when enter is pressed, displays answer,
cycling though until all questions have been asked. Written to help me study for CompTIA.

## Requirements
This program uses a `Bash` shell

## Installation
```
git clone https://github.com/Dan-Aguirre/bashic-flashcards.git
cd bashic-flashcards/src
chmod +x flashcards.sh
./flashcards.sh -h
```


## Usage
```
Usage: ./flashcards.sh -q [questions file] -a [answers file]

Randomly presents a question, then when enter is pressed, displays answer,
cycling though until all questions have been asked.

Options:
  -h                     print help
  -q [questions file]    set questions file
  -a [answers file]      set answers file
```
