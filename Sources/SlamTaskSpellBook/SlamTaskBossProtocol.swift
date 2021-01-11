//
//  SlamTaskBossProtocol.swift
//  SlamTaskSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

// MARK: - Protocol

/// Protocol for Controllers of tasks
public protocol SlamTaskBossProtocol {

    // MARK: - Properties

    /// List of named tasks items
    var listTasks: SlamTaskList { get }

}

// MARK: - Extensions

public extension SlamTaskBossProtocol {
    
    // MARK: - Methods
    
    /// Find a Task wtih given name.
    ///
    /// - Parameter referral: Name of task to find
    /// - Returns: Task
    func findTask(title: String) -> SlamTask? {
        guard !title.isEmpty, let task = listTasks.list[title] else { return nil }
        
        return task
    }

    /// Add an task to list. Will be used by menus, toolbars, etc.
    ///
    /// - Parameter task: Task to attach to boss
    func add(task: SlamTask) {
        listTasks.list[task.title] = task
    }
}
