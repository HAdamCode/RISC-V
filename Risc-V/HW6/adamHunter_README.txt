Author: Hunter Adam


void binarySearch (int arr[], int startInd, int endInd, int val){
    cout << sum();
    if (arr[(startInd + endInd)/2] == val) return startInd;
    else{
        if (arr[(startInd + endInd)/2] < val){
            return stuff(arr, (startInd + endInd)/2, endInd, val);
        }
        else
        return stuff(arr, startInd, (startInd + endInd)/2, val);
    }
}

Challenges:
	I was definitely a little bit confused as to how the recursive aspect 
	of the code was supposed to work but I think I figured it out. 

Likes:
	I thought it was really nice being able to use a recursive function.
	This will allow for simple instructions to still be very technical.

Time: 
	Way too long. I think about 5 hours

