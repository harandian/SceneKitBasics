//
//  GameScene.swift
//  Basics
//
//  Created by Hirad on 2017-09-08.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
class GameScene: SCNScene {
    
    let cameraNode = SCNNode()

    var geometryNodes = GeometryNodes()
    convenience init(create:Bool) {
        self.init()
        
        geometryNodes.addNodes(parentNode: rootNode)
        
        let floor = SCNFloor()
        floor.firstMaterial!.diffuse.contents = UIColor.white
        floor.firstMaterial!.specular.contents = UIColor.white
        floor.firstMaterial!.reflective.contents = UIColor.black
        let floorNode = SCNNode(geometry: floor)
        rootNode.addChildNode(floorNode)
        
        cameraNode.camera = SCNCamera()
        cameraNode.camera!.usesOrthographicProjection = false
        cameraNode.position = SCNVector3(0, 1, 2)
        cameraNode.rotation = SCNVector4(1, 0, 0, Float(-Double.pi / 16.0))
        self.rootNode.addChildNode(cameraNode)
        
        
        let lightNodeSpot = SCNNode()
        lightNodeSpot.light = SCNLight()
        lightNodeSpot.light!.type = .spot
        lightNodeSpot.light!.attenuationStartDistance = 0
        lightNodeSpot.light!.attenuationFalloffExponent = 2
        lightNodeSpot.light!.attenuationEndDistance = 30
        lightNodeSpot.position = SCNVector3(0,3,2)
        let emptyTarget = SCNNode()
        emptyTarget.position = SCNVector3(0,0,0)
        
        rootNode.addChildNode(lightNodeSpot)
        lightNodeSpot.constraints = [SCNLookAtConstraint.init(target: emptyTarget)]
        
        
    }

}
