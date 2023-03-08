1) Hunter Adam

2) Pseudocode:

void branchPredictionSim(vector<int> numList) {
	int counter = 0;
	vector<int> returnList;
	for (int i = 0; i < numList.size(); i++) {
		if (counter == 0) {
			if (numList.at(i) == 1) {
				returnList.push_back(1);
				counter = 0;
			}
			else {
				returnList.push_back(1);
				counter = 1;
			}
		}
		else if (counter == 1) {
			if (numList.at(i) == 1) {
				returnList.push_back(1);
				counter = 0;
			}
			else {
				returnList.push_back(1);
				counter = 2;
			}
		}
		else if (counter == 2) {
			if (numList.at(i) == 1) {
				returnList.push_back(2);
				counter = 1;
			}
			else {
				returnList.push_back(2);
				counter = 3;
			}
		}
		else if (counter == 3) {
			if (numList.at(i) == 1) {
				returnList.push_back(2);
				counter = 2;
			}
			else {
				returnList.push_back(2);
				counter = 3;
			}
		}
	}
	return returnList;
}

3) My only issue with the code was that I used s0 which was used
	in the gradescript which definitely messed me up.

4) I liked that this assignment was not super complex in terms
	of the coding but it was a slight challenge to understand
	the logical side of it.

5) 1.5 hrs

6) None