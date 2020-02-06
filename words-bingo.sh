#!/bin/bash

wordlist_filename=my-words.txt
used_words_filename=.used-my-words.txt

espeak_command="espeak -v en-us"

list_left_words() {
    cat $wordlist_filename | \
        sort -u | \
        comm -23 - <(cat $used_words_filename | sort -u)
}

# is there a wordlist?
if [ ! -f $wordlist_filename ]; then
    echo -e "\e[31mError\e[0m: Please provide \"$wordlist_filename\""
    exit 1
fi

# ensure used words file exists
touch $used_words_filename

# as long as we have unused words in the list
while [ 0 -lt "$( list_left_words | wc -l )" ]; do
    clear
    echo -e "\e[33m"
    word=$(list_left_words | \
        shuf -n 1)
    echo $word | \
        tee -a $used_words_filename
    echo -e "\e[0m"

    if [ -n "$espeak_command" ]; then
        counter=0
        while : ; do
            $espeak_command "$word"

            # wait for user input...
            [ $counter -eq 0 ] && echo '
r ........ repeat current word
ENTER .... next random word
q ........ quit program'
            read -n1 -p "" user_input
            ((counter++))

            [ "$user_input" == "r" ] && continue
            [ "$user_input" == "q" ] && { echo; exit 0; }
            break
        done
    else
        # wait for user input...
        echo '
ENTER .... next random word
q ........ quit program'
        read -p "" user_input

        [ "$user_input" == "q" ] && { echo; exit 0; }
    fi
done

# all words used up
echo
echo -e "\e[36mHint\e[0m: All words from \"$wordlist_filename\" are used up"
echo    "      Please use \"rm $used_words_filename\" to start over"
