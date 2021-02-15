//
//  SlamTaskGesture.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/30/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

// MARK: - Class

/// Task based button (subclass of NSButton).
public class SlamTaskGesture: NSClickGestureRecognizer {
    
    // MARK: - Inspectable Properties
    
    @IBInspectable public var slamTitle: String = ""
    
    @IBInspectable public var slamWord: String = ""
    
    @IBInspectable public var slamTag: Int = 0
    
    // MARK: - Private Functions
    
    /// Make a info structure filled with details.
    func makeInfo() -> SlamTaskInfo {
        var info = SlamTaskInfo(slamWord, slamTag)
        
        info.word = slamWord
        info.tag = slamTag
        
        return info
    }

    // MARK: - Action Methods
    
    /// Action to invoked with user presses button.
    /// - Parameter sender: Object that invoked the method
    public func invokeAction(view: NSView) {
        let title = slamTitle
        
        guard !title.isEmpty,
              let app = SlamTaskSpellBook.sharedApp() else { return }
        
        let info = makeInfo()

        app.appRunTask(info: info, title: title, forWindow: view.window)
    }
    
}

// MARK: - Extension

// Extenion to NSView to handle Tasks.
public extension NSView {
    
    /// Action to invoked with user presses button.
    /// - Parameter sender: Object that invoked the method
    @objc func slamTaskGestureAction(gestureRecognizer: NSGestureRecognizer) {
        guard let gesture = gestureRecognizer as? SlamTaskGesture else { return }
        
        gesture.invokeAction(view: self)
    }

    func SlamTaskAddTap(title: String, word: String, tag: Int) {
        let gesture = SlamTaskGesture(target: self, action: #selector(slamTaskGestureAction) )
        gesture.slamTitle = title
        gesture.slamWord = word
        gesture.slamTag = tag
        self.addGestureRecognizer(gesture)
    }

}


