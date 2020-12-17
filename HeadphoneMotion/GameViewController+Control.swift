//
//  GameViewController+Control.swift
//  HeadphoneMotion
//
//  Created by Kolibaba, Volodymyr on 09.12.20.
//

import SceneKit

extension GameViewController {
 
    func setupControl() {
        
        let segmentedControl = UISegmentedControl(frame: CGRect.zero, actions: [
            UIAction(title: "Head motion",  handler: { action in
                
                self.activeNode?.eulerAngles = SCNVector3(x: 0, y: 0, z: 0)
                self.activeNode = self.shipNode
                self.stopSound()
            }),
            UIAction(title: "Positional audio",  handler: { action in
                
                self.activeNode?.eulerAngles = SCNVector3(x: 0, y: 0, z: 0)
                self.activeNode = self.containerNode
                self.playSound()
            }),
        ])
        segmentedControl.selectedSegmentIndex = 0
        self.view.addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        view.addConstraints([horizontalConstraint, verticalConstraint, ])
    }
}
