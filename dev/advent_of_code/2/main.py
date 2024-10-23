file = "testinput.txt"

with open(file, "r") as f:
    data = f.readlines()
    lines = len(data)


red_count = 0
blue_count = 0
green_count = 0

for i in range(lines):
    data[i] = data[i].replace("\n", "").replace("Game ", "").split(";")
    separated_data = []
    for item in data[i]:
        separated_data.extend(item.split(", "))

    actualI = str(i + 1)

    data[i] = [item.replace(actualI + ": ", "") for item in separated_data]
    data[i] = [item.split(" ") for item in data[i]]

    for j in range(len(data[i])):
        if len(data[i][j]) > 2:
            data[i][j].pop(0)
        for k in range(len(data[i][j])):
            if data[i][j][k] == "red":
                red_count += 1
            elif data[i][j][k] == "blue":
                blue_count += 1
            elif data[i][j][k] == "green":
                green_count += 1


print(f"Number of 'red': {red_count}")
print(f"Number of 'blue': {blue_count}")
print(f"Number of 'green': {green_count}")
