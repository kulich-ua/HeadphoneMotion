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
                
        setupMotion()
    }
    
    func setupMotion() {
                        
        if motionManager.isDeviceMotionAvailable {
            
            motionManager.delegate = self

            motionManager.startDeviceMotionUpdates()
            
//            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (motion, error) in
//
//                if let error = error {
//
//                    print(error)
//                }
//                guard let deviceMotion = motion else { return }
//                
//                print(deviceMotion.sensorLocation.rawValue)
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
