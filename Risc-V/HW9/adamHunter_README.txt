1) Hunter Adam
	Danil Shpurik helped break my code

2) 
int mult(int x, int y) { 
	int counter = 0;
	int max = 2^32;
	int right = 0;
	int left = 0;
	while (counter < max) {
		if (x % 2 == 1) {
			left = left + y;
			x >> 1;
			right >> 1;
			if (left % 2 == 1) {
				int temp = 1;
				temp << 31;
				right += temp;
			}
			left >> 1;
		else {
			x >> 1;
			right >> 1;
			if (left % 2 == 1) {
				int temp = 1;
				temp << 31;
				right += temp;
			}
			left >> 1;
		}
	}
}

3) Honestly I did not encounter any challenges. This code was fairly straight forward and not hard to follow.

4) I liked how simplistic this assingment was. Recursion made my brain hurt but this assignment did not have the same effect.

5) I spent about 45 minutes on this assignment.
