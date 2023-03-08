Hunter Adam

Psuedocode:
x = input("Please enter a string: ")
while x:
    length = len(x)
    total = 0
    for i in range(0, length):
        temp1 = ord(x[i])
        temp2 = ord(x[length-1])
        temp1 = temp1 * temp2
        total += temp1
        length -= 1
    print("Hash value for the string is: ", total)
    x = input("Please enter a string: ")
print("Hash value for the string is: ", 0)

Challenges: I honestly had no idea what I was doing at first. I spent a very long time looking through examples and trying to understand how the code worked. 

Likes: I liked the fact that there were a lot of different ways to implement the program and it was kind of like a puzzle.

Time: I think I spent 3 hours solidly working on it plus some time very distracted. 

Extra Credit: Did not do anything