file = "testinput.txt"

with open(file, "r") as f:
    data = f.readlines()
    lines = len(data)

data = [line.strip() for line in data]

# Games are lines
# Sets are in game separated by semicolon
# Format : Game x: x blue, x red; x red, x green, x blue; x green

maxRed = 12
maxGreen = 13
maxBlue = 14

for lines in data:
    game = lines.split(": ")
    gameName = game[0]
    sets = game[1].split("; ")

    redCounter = 0
    greenCounter = 0
    blueCounter = 0

    for set in sets:
        colors = set.split(", ")
        for color in colors:
            colorCount = int(color.split(" ")[0])
            colorName = color.split(" ")[1]
            if colorName == "red":
                redCounter += colorCount
                if redCounter <= maxRed:
                    print(f"{gameName}: {colorCount} {colorName}")
            elif colorName == "green":
                greenCounter += colorCount
                if greenCounter <= maxGreen:
                    print(f"{gameName}: {colorCount} {colorName}")
            elif colorName == "blue":
                blueCounter += colorCount
                if blueCounter <= maxBlue:
                    print(f"{gameName}: {colorCount} {colorName}")
                    
    

print(f"Total red: {redCounter}")
print(f"Total green: {greenCounter}")
print(f"Total blue: {blueCounter}")