//
//  GameViewController.swift
//  Basics
//
//  Created by Hirad on 2017-09-08.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var sceneView: SCNView?
    var scene = GameScene(create: true)
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = self.view as? SCNView
        if let view = sceneView {
            view.scene = scene
            view.showsStatistics = true
            view.backgroundColor = UIColor.black
            view.antialiasingMode = SCNAntialiasingMode.multisampling2X
            
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(gesture:)))
            view.addGestureRecognizer(panGesture)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cameraGesture))
            view.addGestureRecognizer(tapGesture)
        }
    }
    
    func handlePan(gesture: UIPanGestureRecognizer)  {
        let translation = gesture.translation(in: sceneView!).x
        print(translation)
        let xTranslation = Float(translation/view.frame.width)
        if gesture.state == UIGestureRecognizerState.began || gesture.state == UIGestureRecognizerState.changed {
            scene.geometryNodes.slide(xTranslation: xTranslation)
        } else if gesture.state == UIGestureRecognizerState.ended {
            if translation > 100 {
                scene.geometryNodes.realign(direction: "RIGHT")
            } else if translation < -100 {
                scene.geometryNodes.realign(direction: "LEFT")
            } else {
                scene.geometryNodes.realign(direction: "STAY")
            }
        }
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    func cameraGesture() {
        
        if scene.cameraNode.camera!.usesOrthographicProjection == false {
            scene.cameraNode.camera!.usesOrthographicProjection = true
        } else {
            scene.cameraNode.camera!.usesOrthographicProjection = false
        }
    }
    
}
