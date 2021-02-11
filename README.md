# SlamTaskSpellBook

[![Swift](https://img.shields.io/badge/Swift-5-blue.svg)](https://swift.org)
[![macOS](https://img.shields.io/badge/os-macOS-blue.svg)](https://apple.com/mac)
[![Xcode](https://img.shields.io/badge/Xcode-12-blue.svg)](https://developer.apple.com/xcode)
[![SPM](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager)
[![MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Swift Package of Closure based Tasks, used by Menus, Toolbars & Buttons for Macintosh App development (Cocoa).

## Installation

### Requirements

- MacOS 10.15
- Swift 5
- Xcode 11

### Repository

  https://github.com/magesteve/SlamTaskSpellBook

## Components

Refer to code documentation for explanation for specific calls.

### SlamTaskSpellBook

Abstract Structure for SlamTaskSpellBook. It supports some aliases.

### SlamTaskInfo

Structure with details of invoking item (MenuItem, ToolbarItem, Button).  Each structure contains the name of the task, with associated word (string) & tag (int). Most of the closure for a task have this structure as a parameter.  When the task is invoked, the Info usually reflects the fields of the Button/ToolbarItem/MenuItem that invoked the Task. For example, two menu items can have the same Task (ex: "openurl"), with different word parameters (ex: "apple.com" vs "github.com". Then each Task would cause a different webpage to appear.

### SlamTask

SlamTask is single task to complete. It uses closures to invoke and display the task.  The "action" closure is called when the task need to run, the "valid" is called to determine if the task is available, the "mark" closure returns true if the task should be checked (ala Menu), and the "label" closure returns the display name of the task. All save the first "action" tasks are optional/  A title is used to identify the task.  

### SlamTaskBossProtocol

Protocol for Controllers of tasks (NSWindowController, NSViewController, NSDocument).  For a controller to be able to invoke a task by a given title, it must maintain a list of Tasks. This protocol has a single required variable listTasks of type SlamTaskList (list of tasks).  Extension to this protocol check is a given task with given tittle is in the list.

### SlamTaskAppProtocol

App Delegate protocol for those that support SlamTasks.  This is a sub protocol of SlamTaskBossProtocol, with similar requirement. It has additional extension specific to being an App Delegate.

### SlamTaskMenuItem

Task based version of Menus (subclass of NSMenuItem). It has IBInspectable title (string), word (string) & tag (Int). There is no need to attach this menu to any IBAction. When the user selects it, the Task with the associated title will be invoked.  If the optional closure that affect appearance (validate, mark, label) are not nil, they are invoked to change the item's appearance.

### SlamTaskToolbarItem

Task based version of Toolbar Item (subclass of NSToolbarItem). It has IBInspectable title (string), word (string) & tag (Int). There is no need to attach this menu to any IBAction. When the user selects it, the Task with the associated title will be invoked.  If the optional closure that affect appearance (validate, mark, label) are not nil, they are invoked to change the item's appearance.

### SlamTaskButton

Task based version of button (subclass of NSButton). It has IBInspectable title (string), word (string) & tag (Int). There is no need to attach this menu to any IBAction. When the user selects it, the Task with the associated title will be invoked.  Only if the static function slamTaskButtonPrepare(button:) is called, will the optional appearance closures try to change the appearance of the button.

## Demo App

Sample code using this SpellBook can be found in the open-source Cocoa App [CocoaGrimoire](https://github.com/magesteve/CocoaGrimoire). Other SpellBooks by the author are also demonstrated there.

## License

CocoaSpellBook is available as open source under the terms of the [MIT](https://github.com/magesteve/SlamTaskSpellBook/blob/main/LICENSE) License.
