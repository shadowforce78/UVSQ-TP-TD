file = "listtest.txt"

char = "0123456789"
numerouschar = {
    "three": 3,
    "eight": 8,
    "ten": 10,
    "nine": 9,
    "two": 2,
    "one": 1,
    "seven": 7,
    "six": 6,
    "five": 5,
    "four": 4,
}


with open(file, "r") as f:
    wordlist = f.readlines()

wordlist = [x.strip() for x in wordlist]

regex = []

for words in wordlist:
    for key in numerouschar.keys():
        if key in words:
            words = words.replace(key, str(numerouschar[key]))
    regex.append(words)

regex = [word.strip() for word in regex]
regex = ["".join(filter(lambda x: x in char, word)) for word in regex]

# print(regex)
finallist = []

for numbers in regex:
    # add the first number to the last number and remove the between numbers
    if len(numbers) > 1:
        result = (numbers[0]) + (numbers[-1])
        print(f"{result}")
        finallist.append(result)
    else:
        finallist.append(str(numbers) + str(numbers))

total = 0
for i in finallist:
    total += int(i)

print(f"Total: {total}")
