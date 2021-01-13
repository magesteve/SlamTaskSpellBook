//
//  SlamTaskButton.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

// MARK: - Class

/// Task based button (subclass of NSButton).
public class SlamTaskButton: NSButton {
    
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

    // MARK: - Lifecycle Methods
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.target = self
        self.action = #selector(slamTaskButtonAction)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.target = self
        self.action = #selector(slamTaskButtonAction)
    }
    
    // MARK: - Action Methods
    
    /// Action to invoked with user presses button.
    /// - Parameter sender: Object that invoked the method
    @objc public func slamTaskButtonAction(sender: Any!) {
        let title = slamTitle
        
        guard !title.isEmpty,
              let app = SlamTaskSpellBook.sharedApp() else { return }
        
        let info = makeInfo()

        app.appRunTask(info: info, title: title, forWindow: nil)
    }

}


