import Foundation
import UIKit

public class BasicCommands {
    public var mBot: MBot
    private var ultrasonicCallback: ((Float)->Void)?
    private var lightnessCallback: ((Float)->Void)?
    private var lineCallback: ((Float)->Void)? //ADDED
    
    public init(robot:MBot) {
        mBot = robot
    }
    
    /*public func helloWorld () {
     mBot.setRGBLED(position: .all, red: 0, green:255, blue: 0)
     mBot.turnLeft(speed:200)
     Thread.sleep(forTimeInterval: 0.5)
     mBot.turnRight(speed:200)
     mBot.setRGBLED(position: .all, red: 0, green:0, blue: 255)
     Thread.sleep(forTimeInterval: 0.5)
     mBot.turnLeft(speed:200)
     Thread.sleep(forTimeInterval: 0.5)
     mBot.turnRight(speed:200)
     Thread.sleep(forTimeInterval: 0.5)
     mBot.stopMoving()
     mBot.setRGBLED(position: .all, red:0, green:0, blue:0)
     }
     
     public func forward () {
     mBot.moveForward(speed:200)
     Thread.sleep(forTimeInterval: 1)
     mBot.stopMoving()
     }*/
    
    //NEW FUNCTIONS
    public func move(s:Int) {
        mBot.moveForward(speed:s)
    }
    
    public func wait(t: Double){
        Thread.sleep(forTimeInterval: t)
    }
    
    public func stop(){
        mBot.stopMoving()
    }
    
    public func turn(s: Int){
        mBot.turnLeft(speed: s)
    }
    
    //END NEW FUNCTIONS
    
    /*public func back () {
     mBot.moveBackward(speed:200)
     Thread.sleep(forTimeInterval: 1)
     mBot.stopMoving()
     }
     
     public func left () {
     mBot.turnLeft(speed:200)
     Thread.sleep(forTimeInterval: 1)
     mBot.stopMoving()
     }
     
     public func right () {
     mBot.turnRight(speed:200)
     Thread.sleep(forTimeInterval: 1)
     mBot.stopMoving()
     }
     */
    
    let WaitLengthForRGBLED = 0.5
    public func setRGBLED(position:MBot.RGBLEDPosition, color:UIColor) {
        mBot.setRGBLED(position:position, color:color)
        Thread.sleep(forTimeInterval: WaitLengthForRGBLED)
    }
    
    public func beepDo() {
        mBot.setBuzzer(pitch:.C5, duration: .quarter)
        Thread.sleep(forTimeInterval: 1)
    }
    
    public func beepMi() {
        mBot.setBuzzer(pitch:.E5, duration: .quarter)
        Thread.sleep(forTimeInterval: 1)
    }
    
    public func beepSol() {
        mBot.setBuzzer(pitch:.G5, duration: .quarter)
        Thread.sleep(forTimeInterval: 1)
    }
    
    public func subscribeUltrasonicSensor(callback:@escaping (Float)->Void) {
        ultrasonicCallback = callback
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[weak self] (timer) in
            self?.mBot.getUltrasonicSensorValue { (value) in
                self?.ultrasonicCallback!(value)
            }
        }
    }
    
    public func subscribeLightnessSensor(callback:@escaping (Float)->Void) {
        lightnessCallback = callback
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[weak self] (timer) in
            self?.mBot.getLightnessSensorValue { (value) in
                self?.lightnessCallback!(value)
            }
        }
    }
    
    //Line Following working but not the best solution.
    public func subscribeLineSensor(callback:@escaping (Float)->Void){
        lineCallback = callback
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[weak self] (timer) in
            self?.mBot.getLinefollowerSensorValue { (value) in
                if (value == .LeftBlackRightBlack){
                    self?.lineCallback!(Float(0.0))
                }
                else if (value == .LeftBlackRightWhite){
                    self?.lineCallback!(Float(1.0))
                }
                else if (value == .LeftWhiteRightBlack){
                    self?.lineCallback!(Float(2.0))
                }
                else if (value == .LeftWhiteRightWhite){
                    self?.lineCallback!(Float(3.0))
                }
            }
        }
    }

    
    
    public func getDistance(callback:@escaping (Float)->Void) {
        mBot.getUltrasonicSensorValue { (value) in
            callback(value)
        }
    }
    
    public func getLightStrength(callback:@escaping (Float)->Void) {
        mBot.getLightnessSensorValue { (value) in
            callback(value)
        }
    }
}

