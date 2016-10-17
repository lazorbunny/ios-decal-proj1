//
//  TodoItem.swift
//  Todo List
//
//  Created by chena on 10/17/16.
//  Copyright © 2016 julie. All rights reserved.
//

import UIKit

class TodoItem: NSObject {
    let itemLabel: String
    var isComplete: Bool
    
    init(itemLabel: String, isComplete: Bool = false) {
        self.itemLabel = itemLabel
        self.isComplete = isComplete
    }
}
