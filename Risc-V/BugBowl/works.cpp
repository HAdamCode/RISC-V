#include <iostream>
using namespace std;
/*
 * Author: Hunter Adam
 * Description: C++ code for Bug Bowl. Determines area of triangle, rectangle, or circle.
 */

// Triangle function for determining triangle area.
void triangle() {
    int base, height;
    // grab data from user and report solution
    cout << "What is the base?" << endl;
    cin >> base;
    cout << "What is the height?" << endl;
    cin >> height;
    cout << "Area is: " << base * height /2 << endl;
}
// Rectangle function for determining triangle area.
void rectangle() {
    int side1, side2;
    // grab data from user and report solution
    cout << "What is the first side length?" << endl;
    cin >> side1;
    cout << "What is the second side length?" << endl;
    cin >> side2;
    cout << "Area is: " << side1 * side2 << endl;
}
// Circle function for determining triangle area.
void circle() {
    int radius;
    // grab data from user and report solution
    cout << "What is the radius?" << endl;
    cin >> radius;
    cout << "Area is: " << int(3.14 * radius * radius) << endl;
}

int main() {
    int determ;
    // Determine which area user would like
    cout << "Would you like area of Triangle(1), Rectangle(2) or Circle(3)?" << endl;
    cin >> determ;
    // Call functions
    if (determ == 1) triangle();
    if (determ == 2) rectangle();
    if (determ == 3) circle();
    return 0;
}
