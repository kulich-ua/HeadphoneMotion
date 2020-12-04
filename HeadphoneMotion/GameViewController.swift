//
//  GameViewController.swift
//  HeadphoneMotion
//
//  Created by Kolibaba, Volodymyr on 04.12.20.
//

import UIKit
import QuartzCore
import SceneKit


class GameViewController: UIViewController {

    // create a new scene
    let scene = SCNScene(named: "art.scnassets/ship.scn")!
    
    lazy var shipNode = scene.rootNode.childNode(withName: "ship", recursively: true)!
    lazy var containerNode = scene.rootNode.childNode(withName: "container", recursively: true)!
    
    let motionManager = HeadphoneMotionManager()
    
    /// Source for audio playback
    var audioSource: SCNAudioSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
        
        setUpAudio()
        playSound()
    }
    
    func setupScene() {
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        scnView.delegate = self
        
        // set the scene to the view
        scnView.scene = scene
        scnView.isPlaying = true
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.black
    }
        
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

}
