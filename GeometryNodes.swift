//
//  GeometryNodes.swift
//  Basics
//
//  Created by Hirad on 2017-09-08.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit
import SceneKit
import QuartzCore

class GeometryNodes {
    
    let cube = CustomSCNNode(geometry: SCNBox.init(width: 0.5, height:0.5, length: 0.5, chamferRadius: 0) , initialPosition: SCNVector3(0,0.5,0))
    let sphere = CustomSCNNode(geometry: SCNSphere.init(radius: 0.25), initialPosition:SCNVector3( -2,0.5,0))
    let pyramid = CustomSCNNode(geometry: SCNPyramid.init(width: 0.5, height: 0.5, length: 0.5) , initialPosition:SCNVector3( 2,0.25,0))
    let defaultMaterial = SCNMaterial()
    init() {
        defaultMaterial.diffuse.contents = UIColor.white
        defaultMaterial.specular.contents = UIColor.blue
        defaultMaterial.emission.contents = UIColor.gray
        
        cube.geometry!.firstMaterial = defaultMaterial
        sphere.geometry!.firstMaterial = defaultMaterial
        pyramid.geometry!.firstMaterial = defaultMaterial
    }
    
    func addNodes(parentNode: SCNNode) {
        parentNode.addChildNode(cube)
        parentNode.addChildNode(sphere)
        parentNode.addChildNode(pyramid)
        
    }
    
    func slideFunction(node: CustomSCNNode, translation: Float)  {
        node.position.x = node.positionToSlideFrom.x + translation
    }
    func slide(xTranslation:Float) {
        slideFunction(node: cube, translation: xTranslation)
        slideFunction(node: sphere, translation: xTranslation)
        slideFunction(node: pyramid, translation: xTranslation)
        
    }
    func realignFunction (node: CustomSCNNode, direction: String) {
        var animationTime = 0.3
        if direction == "LEFT" {
            node.positionToSlideFrom.x -= 2.0
        } else if direction == "RIGHT" {
            node.positionToSlideFrom.x += 2.0
        }
        if node.positionToSlideFrom.x > 2.0
        {
            node.positionToSlideFrom.x = -2.0
            animationTime = 0
        } else if  node.positionToSlideFrom.x < -2.0{
            node.positionToSlideFrom.x = 2.0
            animationTime = 0
        }
        let move = SCNAction.move(to: node.positionToSlideFrom, duration: animationTime)
        move.timingMode = SCNActionTimingMode.easeInEaseOut
        node.runAction(move)
    }
    
    func realign(direction: String)  {
        realignFunction(node: cube, direction: direction)
        realignFunction(node: pyramid, direction: direction)
        realignFunction(node: sphere, direction: direction)

    }
}




