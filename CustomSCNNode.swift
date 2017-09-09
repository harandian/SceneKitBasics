//
//  CustomSCNNode.swift
//  Basics
//
//  Created by Hirad on 2017-09-08.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class CustomSCNNode: SCNNode {

    var positionToSlideFrom = SCNVector3Zero
    
    convenience init(geometry: SCNGeometry, initialPosition: SCNVector3) {
        self.init()
        self.geometry = geometry
        self.position = initialPosition
        self.positionToSlideFrom = initialPosition
        
    }
}
