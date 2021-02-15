//
//  SlamTaskInfo.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

// MARK: - Structure

/// Structure with details of invoking item (MenuItem, ToolbarItem, Button).
public struct SlamTaskInfo {
    
    // MARK: - Variables
    
    // word associated with menu item
    public var word: String = ""
    
    /// tag (int) associated with menu item.
    public var tag: Int = 0
    
    // MARK: - Lifecycle
    
    public init(_ word: String = "", _ tag: Int = 0) {
        self.word = word
        self.tag = tag
    }
}
