String[] readNumbers; //array of strings to read the data from the file
String joinNumbers; //string to join the data from the file
String[] splitNumbers; //array of strings to split the data from the file
int[] numbers; //arra of integers to convert the data from the file to integers
int targetNumber=333; //target number for the search to locate
int lowNumber, midNumber, highNumber; //variables for the lowest number, middle number, and highest number
float time; //variable to store time passed
boolean endTimer; //boolean to end the timer

void setup() {
  size(400, 400); //size of the run window
  readNumbers = loadStrings("Numbers.txt"); //loads the data from the file
  joinNumbers=join(readNumbers, ","); //joins the data from the file
  splitNumbers=split(joinNumbers, ","); //splits the data from the file
  numbers=int(splitNumbers); //converts the data from the file to integers

  bubbleSort();

  lowNumber=numbers[0]; //the lowest number is the first number of the sorted data
  highNumber=numbers.length; //the highest number is the last number of the sorted data
}

void draw() {
  background(0); //size of the run window
  timer();
  binarySearch();
}

void bubbleSort() { //sorts the values of displayNumbers in ascending order
  for (int index1=0; index1<splitNumbers.length-1; index1++) { //index1 variable has an initial value of 0, must be less than the length of splitNumbers array minus 1, and increases by increments of 1
    for (int index2=0; index2<splitNumbers.length-index1-1; index2++) { //index2 variable has an initial value of 0, must be less than the length of splitNumbers array minus index1 minus 1, and increases by increments of 1
      if (numbers[index2] > numbers[index2+1]) { //if a number in the displayNumbers array is greater than the next number in the array
        int temporaryNumber=numbers[index2]; //the value of the greater number is temporarily stored
        numbers[index2]=numbers[index2+1]; //the value of the lesser number replaces the position of the greater number
        numbers[index2+1]=temporaryNumber; //the value of the greater number moves to the original position of the lesser number
      }
    }
  }
}

void timer() { //displays the time between opening the program and the targetNumber being found
  if (endTimer==false) //if the timer has not ended
    time=millis(); //the time is equal to the number of milliseconds passed since opening the program

  textSize(50); //changes the text size to 50
  textAlign(CENTER); //aligns the text in the center of the screen
  text(time/1000, width/2, height/2); //displays the time passed in the middle of the screen
}

void binarySearch() { //searches the data by repeatedly dividing the search interval in half until it finds the target number
  while (lowNumber<=highNumber) { //while the lowest number is less than or equal to the highest number
    midNumber=(highNumber+lowNumber)/2; //the middle number is equal to the number in the middle of the lowest number and highest number

    if (numbers[midNumber]<targetNumber) { //if the middle number in the numbers array is less than the target number
      lowNumber=midNumber++; //the lowest number is equal to the middle number plus one, meaning the target number is in the greater half
    } else if (numbers[midNumber] == targetNumber && endTimer==false) { //if the target number is found and the timer has not ended
      println(targetNumber + " is in index " + midNumber + " of the array.");
      endTimer=true; //the timer ends
      break; //ends the while loop
    } else
      highNumber=midNumber++; //the highest number is equal to the middle number plus one, meaning the target number is in the lower half
  }
}
