/*:
 Put the `move()` and `wait()` functions ina  sequential order to make your mBot move forward. To stop the motors set the speed to 0.
 */
//#-hidden-code

execiseCode = {
    
    //#-end-hidden-code
    //#-editable-code
    move(speed: -100)
    wait(time: 1)
    move(speed: 0)
    //#-end-editable-code
    //#-hidden-code
    
}

runWithCommands()

//#-end-hidden-code

