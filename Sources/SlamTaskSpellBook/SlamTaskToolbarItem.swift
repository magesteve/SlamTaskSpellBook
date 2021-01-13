//
//  SlamTaskToolbarItem.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Cocoa

/// Task based version of Toolbar Itme (NSToolbarItem).
@objc class SlamTaskToolbarItem: NSToolbarItem {

    // MARK: Inspectable Properties
    
    @IBInspectable public var slamTitle: String = ""
    
    @IBInspectable public var slamWord: String = ""
    
    @IBInspectable public var slamTag: Int = 0
    

    // MARK: Private Functions
    
    /// Make a info structure filled with details.
    func makeInfo() -> SlamTaskInfo {
        var info = SlamTaskInfo()
        
        info.word = slamWord
        info.tag = slamTag
        
        return info
    }

    // MARK: Lifecycle Methods
    
    public override init(itemIdentifier: NSToolbarItem.Identifier) {
        super.init(itemIdentifier: itemIdentifier)

        autovalidates = false
    }
    
    override func validate() {
        action = #selector(slamToolbarItemAction(_:))
        target = self

        guard let app = SlamTaskSpellBook.sharedApp() else { return }
        
        if !slamTitle.isEmpty {
            if let task = app.appFindTask(title: title, forWindow: view?.window) {
                let info = makeInfo()

                if let source = task.valid {
                    let flag = source(info)
                
                    isEnabled = flag
                }

                if let source = task.mark {
                    let flag = source(info)
                
                    isBordered = flag
                }
            }
        }
    }
    
    @objc public func validateUserInterfaceItem(_ item: NSValidatedUserInterfaceItem) -> Bool {
        guard let menu = item as? SlamTaskMenuItem,
              let app = SlamTaskSpellBook.sharedApp() else {
            return false
        }
        
        if !menu.slamTitle.isEmpty {
            if let task = app.appFindTask(title: title, forWindow: view?.window) {
                let info = makeInfo()

                return task.validateTask(info: info)
            }
        }
        
        return false
    }
    
    // MARK: Action Methods
    
    @IBAction @objc public func slamToolbarItemAction(_ sender: Any) {
        guard let app = SlamTaskSpellBook.sharedApp() else {
            return 
        }

        if !slamTitle.isEmpty {
            if let task = app.appFindTask(title: title, forWindow: view?.window) {
                let info = makeInfo()

                task.runTask(info: info)
            }
        }
    }
}
