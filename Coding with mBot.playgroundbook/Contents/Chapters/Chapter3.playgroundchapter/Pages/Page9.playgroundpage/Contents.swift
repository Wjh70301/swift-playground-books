/*:
 See the project description in the accompanying iTunes U course.  Your mBot must simulate an ambulance and get to the prescribed locations as quick as possible.
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

