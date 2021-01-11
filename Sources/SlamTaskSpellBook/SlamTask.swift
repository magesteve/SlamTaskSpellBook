//
//  SlamTask.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

// MARK: Class

/// Single named task to complete
///
/// A instance of SlamTask is an object that uses closures to define a specific action for the App, a Document or a Window.  While a closures can be attached to specific UI element (button), it often better to register a Task, so the closure can be invoked anywhere within the program.  Using Taskable protocol, a element can have a Task title set. Using the Boassable protocol, when the element is invoked (button pressed, menu item selected, toolbar item touched), the Boas is informed of the title, and if their is an assocated task (one with same title), that title in invoked.
///
/// Beside the action itself, the Task object also used closures to define any user interface setting for the task (ex: acvtions what are invalid woud dim their appeareance).  These elements invlude is action is Valid, if action should show a Mark and if action has a string Label.
public class SlamTask {
    
    // MARK: Public Properties
    
    // Title identifier of task.
    public var title: String
    
    /// Task's Task closure
    public let action: SlamTaskSpellBook.ActionClosure?
    
    /// Task's Validate closure
    public let valid: SlamTaskSpellBook.ActionBoolClosure?
    
    /// Task's Checkmark closure
    public let mark: SlamTaskSpellBook.ActionBoolClosure?
    
    /// Task's text source closure
    public let label: SlamTaskSpellBook.ActionStringClosure?

    // MARK: Lifecycle Functions
    
    /// Tasks Initializer, filling in required and optional fields.
    ///
    /// - Parameters:
    ///   - title: Required name
    ///   - action: optional action closure
    ///   - valid: optional valid closure
    ///   - mark: optional mark closure
    ///   - label: optional label closure
    public init(title: String = "",
                action: SlamTaskSpellBook.ActionClosure? = nil,
                valid: SlamTaskSpellBook.ActionBoolClosure? = nil,
                mark: SlamTaskSpellBook.ActionBoolClosure? = nil,
                label: SlamTaskSpellBook.ActionStringClosure? = nil) {
        self.title = title
        self.action = action
        self.valid = valid
        self.mark = mark
        self.label = label
    }

    /// Invoke the given Task.
    /// - Parameters:
    ///   - info: SlamTaskInfo to help task run
    public func runTask(info: SlamTaskInfo) {
        if let block = action {
            block(info)
        }
    }
    
    /// Check if given task is valid.
    ///
    /// - Returns: Returns true if task is valid (can be invoked)
    /// - Parameters:
    ///   - info: SlamTaskInfo to help task run
    public func validateTask(info: SlamTaskInfo) -> Bool {
        if let block = valid {
            return block(info)
        }
        else if let _ = action {
            return true
        }
        
        return false
    }
}

/// List of tasks, keyed strings
public class SlamTaskList {

/// Internal dictionary of Tasks
    public var list: [String : SlamTask] = [:]
    
    public init() {
        list = [:]
    }
}
