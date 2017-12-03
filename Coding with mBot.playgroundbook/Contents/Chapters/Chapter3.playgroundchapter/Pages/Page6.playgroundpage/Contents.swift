/*:
 Using the line sensor make the mBot follow a straight line.
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
    
    func onSensor(value: Float) {
        
        plotData(data:value)
        //#-editable-code
        
        //#-end-editable-code
    }
    
    //#-hidden-code
    viewController.setShowGraphView(show: true)
    subscribeLineSensor(callback: onSensor)
    
}
//#-end-hidden-code

