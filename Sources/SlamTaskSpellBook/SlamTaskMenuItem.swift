//
//  SlamTaskMenuItem.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

// MARK: - Class

/// Task based version of Menus (NSMenuItem).
///
/// While this action can be set for this menu item, it is more common to set the Task. This way MenuItems, ToolbarItems and such can share same Task. For this to work, the App  (and any other similar controllers) must support the corect protocol, and Tasks must be registered.
@objc public class SlamTaskMenuItem: NSMenuItem {
    
    // MARK: - Inspectable Properties
    
    @IBInspectable public var slamTitle: String = ""
    
    @IBInspectable public var slamWord: String = ""
    
    @IBInspectable public var slamTag: Int = 0
    
    // MARK: - Private Functions
    
    /// Make a info structure filled with details.
    func makeInfo() -> SlamTaskInfo {
        var info = SlamTaskInfo()
        
        info.word = slamWord
        info.tag = slamTag
        
        return info
    }

    // MARK: - Lifecycle
    
    public override init(title string: String, action selector: Selector?, keyEquivalent charCode: String) {
        super.init(title:string, action:selector, keyEquivalent:charCode)
        
        target = self
        action = #selector(slamTaskMenuAction)
    }
    
    public required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
        target = self
        action = #selector(slamTaskMenuAction)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        target = self
        action = #selector(slamTaskMenuAction)
    }

    @objc public func validateMenuItem(_ item: NSMenuItem) -> Bool {
        let actionSelector = #selector(slamTaskMenuAction)
        if item.action == actionSelector {
            guard let app = SlamTaskSpellBook.sharedApp() else { return false }

            let title = self.slamTitle
            
            guard !title.isEmpty else { return false }
            
            var foundTask: SlamTask? = nil
            let info = makeInfo()
            
            foundTask = app.appFindTask(title: title, forWindow: nil)

            guard let task = foundTask else { return false }
            
            if let source = task.mark {
                if source(info) {
                    self.state = .on
                } else {
                    self.state = .off
                }
            } else {
                self.state = .off
            }

            if let source = task.label {
                self.title = source(info)
            }

            if let source = task.valid {
                self.isEnabled =  source(info)
            }

            return task.validateTask(info: info)
        }
        
        return false
    }

    @objc public func validatesUserInterfaceItem(_ item: NSValidatedUserInterfaceItem) -> Bool {
        let actionSelector = #selector(slamTaskMenuAction)
        if item.action == actionSelector {
            guard let app = SlamTaskSpellBook.sharedApp() else { return false }

            let title = self.slamTitle
            
            guard !title.isEmpty else { return false }
            
            var foundTask: SlamTask? = nil
            let info = makeInfo()
            
            foundTask = app.appFindTask(title: title, forWindow: nil)

            guard let task = foundTask else { return false }
            
            if let source = task.mark {
                if source(info) {
                    self.state = .on
                } else {
                    self.state = .off
                }
            } else {
                self.state = .off
            }

            if let source = task.label {
                self.title = source(info)
            }

            if let source = task.valid {
                self.isEnabled =  source(info)
            }

            return task.validateTask(info: info)
        }
        
        return false
    }
    
    // MARK: - Action Functions
    
    /// Action to to invoked when menu item selected.
    /// - Parameter sender: Object that invoked the function
    @objc @IBAction public func slamTaskMenuAction(_ sender: Any) {
        let title = slamTitle
        
        guard !title.isEmpty,
              let app = SlamTaskSpellBook.sharedApp() else { return }
        
        let info = makeInfo()

        app.appRunTask(info: info, title: title, forWindow: nil)
    }
    
}
