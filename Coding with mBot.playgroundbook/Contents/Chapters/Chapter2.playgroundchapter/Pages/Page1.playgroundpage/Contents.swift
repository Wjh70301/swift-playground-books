/*:
 Functions are used to create a block of sequenced steps which are frequently used.  Create functions for `goForward()` and `goBack()`.  When mBot goes forwards it should turn both lights to green, they should turn red when it goes backwards.
 */
//#-hidden-code

execiseCode = {
    
    //#-end-hidden-code
    //#-editable-code
    def goForward(){
        move(speed: 100)
        wait(time: 1)
        stop()
    }
    
    //#-end-editable-code
    //#-hidden-code
    
}

runWithCommands()

//#-end-hidden-code


