inputvalue = [
     50,
    50,
    50,
    65,
    50,
    100,
    15,
    65,
    50,
    50,
    50,
    50,
    50,
    50,
    50,
]

newvalues = []
counter = 0
print("start")
while counter < len(inputvalue)-1:
    tempint=(inputvalue[counter+1]-inputvalue[counter])/2+inputvalue[counter]
    newvalues.append(inputvalue[counter])
    newvalues.append(tempint)
    newvalues.append(inputvalue[counter+1])
    counter+=1

print(newvalues)
