//
//  SlamTaskAppProtocol.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

// MARK: - Protocol

/// App Delegate protocol for Slam
public protocol SlamTaskAppProtocol: NSApplicationDelegate, SlamTaskBossProtocol {
    
}

// MARK: - Extensions

public extension SlamTaskAppProtocol {
    
    /// App find a Task,wtih given name.
    ///
    /// - Parameter title: String Name of task to find
    /// - Parameter window: Optional NSWindow to search. If nil, will use apps main window
    /// - Returns: Task
    func appFindTask(title: String, forWindow window: NSWindow?) -> SlamTask? {
        let aWindow:NSWindow? = window ?? NSApp.mainWindow
        
        if let foundWindow = aWindow {
            if let aVC = foundWindow.contentViewController as? SlamTaskBossProtocol {
                if let task = aVC.findTask(title: title) {
                    return task
                }
                
            }
            
            if let doc = foundWindow.windowController?.document as? NSDocument {
                if let docBoss = doc as? SlamTaskBossProtocol {
                    if let task = docBoss.findTask(title: title) {
                        return task
                    }
                }
            }
        }
        
        return findTask(title: title)
    }

    /// Run find a Task,wtih given name.
    ///
    /// - Parameter info: SlamTaskInfo that invoked run
    /// - Parameter title: String Name of task to find
    /// - Parameter window: Optional NSWindow to search. If nil, will use apps main window
    func appRunTask(info: SlamTaskInfo, title: String, forWindow window: NSWindow?)  {
        if let task = appFindTask(title: title, forWindow: window) {
            task.runTask(info: info)
        }
    }
}
