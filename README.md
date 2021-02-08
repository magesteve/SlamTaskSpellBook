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

### SlamTask

Single named task to complete. 

### SlamTaskAppProtocol

App Delegate protocol for those that support SlamTasks.

### SlamTaskBossProtocol

Protocol for Controllers of tasks (NSWindowController, NSViewController, NSDocument).

### SlamTaskButton

Task based button (subclass of NSButton).

### SlamTaskInfo

Structure with details of invoking item (MenuItem, ToolbarItem, Button).

### SlamTaskMenuItem

Task based version of Menus (NSMenuItem).

### SlamTaskSpellBook

Abstract Structure for SlamTaskSpellBook.

### SlamTaskToolbarItem

Task based version of Toolbar Itme (NSToolbarItem).

## License

CocoaSpellBook is available as open source under the terms of the [MIT](https://github.com/magesteve/SlamTaskSpellBook/blob/main/LICENSE) License.
