//
//  SlamTaskSpellBook.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

// MARK: - Structures

/// Abstract Structure for SlamTaskSpellBook
public struct SlamTaskSpellBook {
    
    // MARK: - Task Name Static Constants
    
    /// Name to use for Open URL Task
    public static let openUrlTaskName = "url"
    
    /// Name to use for Open Bundled File Task
    public static let openFileTaskName = "file"
    
    /// Name to use for Open Help Task
    public static let openHelpTaskName = "help"
    
    /// Name to use for Save Image Task
    public static let saveImageTaskName = "saveimage"
    
    /// Name to use for Save SVG Task
    public static let saveSVGTaskName = "savesvg"
    
    // MARK: - Special Purpose Closures
    
    /// closure that is  passed int & string, but returns nothing
    public typealias  ActionClosure = (SlamTaskInfo) -> Void

    /// closure that is  passed int & string, returns Boolean
    public typealias  ActionBoolClosure = (SlamTaskInfo) -> Bool

    /// closure that is  passed int & string, returns String
    public typealias  ActionStringClosure = (SlamTaskInfo) -> String

    // MARK: - Static Function
    
    /// Share singleton for AppDelegate if supporting this protocol.
    public static func sharedApp() -> SlamTaskAppProtocol? {
        return NSApp.delegate as? SlamTaskAppProtocol
    }
    
}
