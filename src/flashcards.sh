#!/bin/bash

questionsFile="";
answersFile="";


printHelp () {
    echo "Usage: $0 -q [questions file] -a [answers file]";
    echo;
    echo "Randomly presents a question, then when enter is pressed, displays answer,";
    echo "cycling though until all questions have been asked.";
    echo;
    echo "Options:";
    echo -e "  -h \t\t\t print help";
    echo -e "  -q [questions file]\t set questions file";
    echo -e "  -a [answers file]\t set answers file";
}


# processing flags
while getopts :hq:a: opt; do
    case $opt in
        h) printHelp; exit;;
        q) questionsFile=$OPTARG;;
        a) answersFile=$OPTARG;;
        ?) echo Unknown option -$OPTARG; exit 1;;
    esac
done


if [ -z $questionsFile ]; then
    echo "Must provide a questions file";
    exit;
fi

if [ -z $answersFile ]; then
    echo "Must provide an answers file";
    exit;
fi


# create question and answer pools
questions=$(cat $questionsFile);
answers=$(cat $answersFile);


while [ ! -z "$questions" ]; do
    # print row of dashes
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -;

    # grab random question and answer out of available questions and answers
    numQuestions=$(echo "$questions" | wc -l | awk '{print $1}');
    rand=$(echo $(((RANDOM % numQuestions)+1)));

    question=$(echo "$questions" | sed -e "$rand q;d");
    answer=$(echo "$answers" | sed -e "$rand q;d");

    # print question, wait for enter, print answer
    echo $question;
    read -s;
    echo $answer;

    # removes question and answer from available pool
    questions=$(echo "$questions" | sed "$rand d");
    answers=$(echo "$answers" | sed "$rand d");
done;
