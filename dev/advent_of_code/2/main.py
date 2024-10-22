file = "testinput.txt"

with open(file, "r") as f:
    data = f.readlines()
    lines = len(data)

for i in range(lines):
    data[i] = data[i].replace("\n", "").replace("Game ", "").split(";")
    separated_data = []
    for item in data[i]:
        separated_data.extend(item.split(", "))
        
    actualI = str(i+1)
        
    data[i] = [item.replace(actualI+": ", "") for item in separated_data]
    data[i] = [item.split(" ") for item in data[i]]
    print(data[1])