year="1900"
babynames=[]
name_count={}
while year<=2017:
    filename= "data/names_"+year+".txt"
    file= open(filename,"r")
    reading= filename.readline().split('|')
    names= reading[1:2]
    for i in names:
        if i not in babynames:
            babynames.append(i)
            name_count[i]=1
        else:
            name_count[i]+=1
    year+=1



def popBabyNames(input_name):
    nameString= str(input_name)
    if input_name in name_count:
        return(nameString+"was the most popular name " + str(name_count[nameString])+" times")

print(popBabyNames("mary"))




