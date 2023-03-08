Author: Hunter Adam

Psuedocode:
def sum(array, n):
    sums = 0
    for i in range(n):
        sums += array[i]
    return sums


def prod(array, n):
    prods = array[0] * array[1]
    for i in range(2, n):
        prods *= array[i]
    return prods


def max(array, n):
    maxs = array[0]
    for i in range(2, n):
        if array[i] > maxs:
            maxs = array[i]
    return maxs


print("Summation:", sum([1, 2, 3, 4], 4))
print("Product:", prod([1, 2, 3, 4], 4))
print("Max:", max([1, 2, 3, 4], 4))

Challenges: At first I did not understand how the GraderScript worked but eventually
	    I figured it out and found that it was super helpful.

Likes: I really liked the simplicity of the project and how it was about the
	arithmatic more than just figuring out how to format everything.

Time: I spent about an hour total on this project.

Extra Credit: I quickly implemented the min function because we had max and did not have min.
	      To test it, I just commented out the max function and renamed the min function
	      to max and ran it. It worked beautifully.