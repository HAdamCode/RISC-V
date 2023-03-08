1) Hunter Adam

2)
#include <iostream>
#include <vector>
#include <math.h>
using namespace std;

int main() {
    while (true) {
        int base;
        string str;
        cout << "Please enter the base of the number you are using (0 to exit): ";
        cin >> base;
        if (base == 0) {
            break;
        }
        if (base < 0 || base == 1 || base > 36) {
            continue;
        }
        cout << "Please enter the value: ";
        cin >> str;
        vector<int> vec;
        bool neg = 0;

        for (int i = 0; i < str.size(); i++) {
            if (i == 0) {
                if (str[i] == '-') {
                    neg = 1;
                    continue;
                }
            }
            int temp = int(str[i]);
            if (temp > 122) {
                cout << "The value entered is not valid for the base entered " << endl;
                break;
            }
            else if (temp >= 97) {
                temp -= 87;
                vec.push_back(temp);
            }
            else if (temp >= 91) {
                cout << "The value entered is not valid for the base entered " << endl;
                break;
            }
            else if (temp >= 65) {
                temp -= 55;
                vec.push_back(temp);
            }
            else if (temp >= 91) {
                cout << "The value entered is not valid for the base entered " << endl;
                break;
            }
            else if (temp >= 48) {
                temp -= 48;
                vec.push_back(temp);
            }
            else {
                cout << "The value entered is not valid for the base entered " << endl;
                break;
            }
        }
        int total = 0;
        int j = vec.size()-1;
        for (int i = 0; i < vec.size(); i++) {
            int temp = pow(base, j);
            temp *= vec.at(i);
            total += temp;
            j-=1;
        }
        if (neg == 1) {
            total *= -1;
        }
        cout << "The given value in base 10 is: " << total << endl;
    }
    return 0;
}

3) One challenge I encountered was getting the negative to 
	only check on the first run of the string loop.
	I figured out I could just use a boolean to determine
	whether it was the first run or not. If it was the 
	first run, then I can check but if not, move on. 
	Another challenge was figuring out how to push data
	back to a string when it was changed. Then I remembered
	that you cannot do that so I instead made a new array
	and pushed the changed data to that array instead. 
	This allowed me to then incremement by 4 instead of 
	by one byte. 

4) I really liked how this assignment was at first super complex
	and seemed to be very tough but in the end it was
	not very difficult but just required a bit of forethought.
	On a lot of the assignments I would just start writing code
	which is bad but it often times worked. For this assignment
	I felt it necessary to write out what I was going to do and
	in what steps. This pseudocode ended up helping so much 
	in the end. 

5) About 4.5 hours