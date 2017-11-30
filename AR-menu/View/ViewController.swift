//
//  ViewController.swift
//  AR-menu
//
//  Created by Erik Hric on 28/11/2017.
//  Copyright © 2017 Erik Hric. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var setUp = false // whether scene was set up
    var contentController:VRMenuController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        contentController?.vrContentView.frame = self.view.frame
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        
        if (setUp) {
            return
        }
        
        setUp = true
        
        // Create a SceneKit plane to visualize the plane anchor using its position and extent.
        //        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        let plane = SCNPlane(width: sceneView.bounds.width/3000, height: sceneView.bounds.height/3000)
        let planeNode = SCNNode(geometry: plane)
        planeNode.simdPosition = float3(planeAnchor.center.x, 0, planeAnchor.center.z)
        
        /*
         `SCNPlane` is vertically oriented in its local coordinate space, so
         rotate the plane to match the horizontal orientation of `ARPlaneAnchor`.
         */
        planeNode.eulerAngles.x = -.pi / 2
        
        // Make the plane visualization semitransparent to clearly show real-world placement.
//        planeNode.opacity = 0.1
        
        plane.firstMaterial?.blendMode = .max
        plane.firstMaterial?.diffuse.contents = self.contentController?.view
        print("setting transparency mode")
//        plane.firstMaterial?.transparencyMode = SCNTransparencyMode.rgbZero
        /*
         Add the plane visualization to the ARKit-managed node so that it tracks
         changes in the plane anchor as plane estimation continues.
         */
        
        node.addChildNode(planeNode)
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
