//
//  SlamTaskSpellBook.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

/// Abstract Structure for SlamTask
public struct SlamTaskSpellBook {
    
    // MARK: Special Purpose Closures
    
    /// closure that is  passed int & string, but returns nothing
    public typealias  ActionClosure = (SlamTaskInfo) -> Void

    /// closure that is  passed int & string, returns Boolean
    public typealias  ActionBoolClosure = (SlamTaskInfo) -> Bool

    /// closure that is  passed int & string, returns String
    public typealias  ActionStringClosure = (SlamTaskInfo) -> String

    // MARK: Static Function
    
    /// Share singleton for AppDelegate if supporting this protocol.
    static func sharedApp() -> SlamTaskAppProtocol? {
        return NSApp.delegate as? SlamTaskAppProtocol
    }
    
}
