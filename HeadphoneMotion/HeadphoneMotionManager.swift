//
//  HeadphoneMotionManager.swift
//  HeadphoneMotion
//
//  Created by Kolibaba, Volodymyr on 01.10.20.
//

import Foundation
import CoreMotion

class HeadphoneMotionManager: NSObject {

    let motionManager = CMHeadphoneMotionManager()
    
    var deviceMotion: CMDeviceMotion? { motionManager.deviceMotion }
    
    override init() {
        super.init()
        
        motionManager.delegate = self
        
        setupMotion()
    }
    
    func setupMotion() {
                        
        if motionManager.isDeviceMotionAvailable {
            
            motionManager.startDeviceMotionUpdates()
//            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { [self] (motion, error) in
//
//                if let error = error {
//
//                    print(error)
//                }
//                print(motion?.sensorLocation.rawValue)
//                
//                guard let deviceMotion = motionManager.deviceMotion else { return }
//
//                self.deviceMotions.append(deviceMotion)
//                self.deviceMotions = Array(self.deviceMotions.suffix(smoothThresholdNumber))
//            }
        }
    }
}

extension HeadphoneMotionManager: CMHeadphoneMotionManagerDelegate {
    
    func headphoneMotionManagerDidConnect(_ manager: CMHeadphoneMotionManager) {
        
        print("connect")
    }
    func headphoneMotionManagerDidDisconnect(_ manager: CMHeadphoneMotionManager) {
        
        print("disconnect")
    }
}
