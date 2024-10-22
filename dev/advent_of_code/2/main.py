file = "testinput.txt"

with open(file, "r") as f:
    data = f.readlines()
    lines = len(data)
    
totalRed = 0
totalGreen = 0
totalBlue = 0
    
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
            if len(data[i][j][k]) > 2:
                pass
            else:
                data[i][j][k] = int(data[i][j][k])
            
            if data[i][j][1] == "red":
                totalRed += data[i][j][0]
            elif data[i][j][1] == "green":
                totalGreen += data[i][j][0]
            elif data[i][j][1] == "blue":
                totalBlue += data[i][j][0]
                
print("Red: " + str(totalRed))
print("Green: " + str(totalGreen))
print("Blue: " + str(totalBlue))