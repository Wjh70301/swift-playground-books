/*:
 Task description
 */
//#-hidden-code
runWithCommands()
//#-code-completion(everything, hide)
//#-code-completion(keyword, if)
//#-code-completion(identifier, show, beepDo(), beepMi(), beepSol(), moveForward(), moveBack(), moveLeft(), moveRight(), lightLeft(color:), lightRight(color:), lightBoth(color:))
execiseWithViewController = { viewController in
    func plotData(data: Float){
        viewController.setHintInfo(content:"Data Output:\(data)")
        viewController.appendValue(value:Double(data))
    }
    //#-end-hidden-code
    //#-editable-code
    func onSensor(value: Float) {
        
        plotData(data:value)
        
        if value <= 30{
            move(speed: -100)
            wait(time: 1)
            move(speed: 0)
        }
        else if value > 31 && value <= 450{
            move(speed: 100)
            wait(time: 1)
            move(speed: 0)
        }
    }
    
    
    viewController.setShowGraphView(show: true)
    subscribeUltrasonicSensor(callback: onSensor)
    //#-end-editable-code
    //#-hidden-code
}
//#-end-hidden-code

