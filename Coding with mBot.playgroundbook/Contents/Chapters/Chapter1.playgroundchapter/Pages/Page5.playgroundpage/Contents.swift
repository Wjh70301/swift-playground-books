/*:
 Make the mBot turn the other way.
 */
//#-hidden-code

execiseCode = {
    
    //#-end-hidden-code
    //#-editable-code
    turn(speed: 100)
    wait(time: 1)
    stop()
    lightLeft(color: #colorLiteral(red: 0.584313750267029, green: 0.823529422283173, blue: 0.419607847929001, alpha: 1.0))
    lightBoth(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
    //#-end-editable-code
    //#-hidden-code
    
}

runWithCommands()

//#-end-hidden-code
