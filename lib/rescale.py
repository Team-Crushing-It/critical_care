inputvalue = [
  50,
  50.0,
  50,
  50,
  50.0,
  50,
  50,
  57.5,
  65,
  65,
  57.5,
  50,
  50,
  75.0,
  100,
  100,
  57.5,
  15,
  15,
  40.0,
  65,
  65,
  57.5,
  50,
  50,
  50.0,
  50,
  50,
  50.0,
  50,
  50,
  50.0,
  50,
  50,
  50.0,
  50,
  50,
  50.0,
  50,
  50,
  50.0,
  50,
  50,
  50.0,
  50,
  50,
  50.0,
  50,
  50,
  50.0,
  50,
  50,
  50.0,
  50
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
