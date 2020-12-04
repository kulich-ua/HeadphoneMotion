//
//  GameViewController+SceneRendererDelegate.swift
//  HeadphoneMotion
//
//  Created by Kolibaba, Volodymyr on 04.12.20.
//

import SceneKit


extension GameViewController: SCNSceneRendererDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
                
        guard let deviceMotion = motionManager.deviceMotion else { return }
        
        let node = self.containerNode
        
        let attitude = deviceMotion.attitude
        
        let pitch = attitude.pitch
        let yaw = attitude.yaw
        let roll = attitude.roll

        node.eulerAngles.x = -Float(pitch);
        node.eulerAngles.y = -Float(yaw);
        node.eulerAngles.z = -Float(roll);

//        let userAcceleration = deviceMotion.userAcceleration
//
//        shipNode.position.x = -Float(userAcceleration.x)
//        shipNode.position.y = Float(userAcceleration.y)
//        shipNode.position.z = Float(userAcceleration.z)
    }
}
