//
//  SlamTaskInfo.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

/// Structure with details of invoking menu item (or other items).
public struct SlamTaskInfo {
    
    // word associated with menu item
    public var word: String = ""
    
    /// tag (int) associated with menu item.
    public var tag: Int = 0
}
