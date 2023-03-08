Author: Hunter Adam

PsuedoCode: Not sure what to do with this one as the code was provided this time.

// functions provided by grader script
void addValueToStack(int numElements, int value);
void printStack(int numElements);
void printPaths(int* grid, int xMax, int yMax, int curX, int curY,
int stackLen) {
// base case
if (xMax <= 0 || yMax <= 0) { return; }
// include current cell in route
addValueToStack(stackLen, grid[curX + curY * xMax]);
stackLen++;
// if the last cell is reached
if (curY == yMax - 1 && curX == xMax - 1) {
printStack(stackLen);
return;
}
// move down if (curY + 1 < yMax) {
printPaths(grid, xMax, yMax, curX, curY + 1, stackLen);
}
// move right
if (curX + 1 < xMax) {
printPaths(grid, xMax, yMax, curX + 1, curY, stackLen);
}
// move diagonally
if (curY + 1 < yMax && curX + 1 < xMax) {
printPaths(grid, xMax, yMax, curX + 1, curY + 1, stackLen);
}
}

Challenges:
	I definitely had a hard time figuring out what needed to
	be saved and what needed to be resaved.

Likes: 
	I like recursion and this one was a real recursion unlike
	the last assignment which was fun. I also liked the complexity
	of this assignment even though it gave me a headache.

Time: 
	I spent about 7 hours of focused work and a few more than 
	that unfocused but still working.