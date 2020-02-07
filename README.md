# Words Bingo

This bash script chooses one random word at a time from a given my-words.txt file.

Used to play [Sight Words Bingo](https://sightwords.com/sight-words/games/bingo/).

## Usage

Place all the words used on your Bingo Cards in the file `my-words.txt` and start the script with the following command:

```bash
bash words-bingo.sh
```

At the end of the game remove the file `.used-my-words.txt` with the following command:

```bash
rm .used-my-words.txt
```

## Advanced Usage

Place all the words used on your Bingo Cards in a **custom file** (e.g. `my-top150-words.txt`) and start the script with the following command:

```bash
bash words-bingo.sh my-top150-words.txt
```

At the end of the game remove the file `.used-my-top150-words.txt` with the following command:

```bash
rm .used-my-top150-words.txt
```

## Dependencies

This script uses `espeak` TTS to output the spoken words and `cowsay` to output the word on screen. To install with apt-get use the following command:

```bash
sudo apt-get install espeak cowsay
```
