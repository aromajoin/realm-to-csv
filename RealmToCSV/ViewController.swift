//
//  ViewController.swift
//  RealmToCSV
//
//  Created by Quang Nguyen on 2018/10/31.
//  Copyright © 2018 Aromajoin. All rights reserved.
//

import Cocoa
import RealmConverter

class ViewController: NSViewController {
  @IBOutlet weak var realmFileTextField: NSTextField!
  @IBOutlet weak var outputFolderTextField: NSTextField!
  
  private var realmFilePath: String?
  private var outputFolderPath: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
  
  @IBAction func chooseRealmFile(_ sender: NSButton) {
    let dialog = NSOpenPanel()
    
    dialog.title                   = "Choose a .realm file"
    dialog.showsResizeIndicator    = true
    dialog.showsHiddenFiles        = true
    dialog.canChooseDirectories    = false
    dialog.canCreateDirectories    = true
    dialog.allowsMultipleSelection = false
    dialog.allowedFileTypes        = ["realm"]
    
    if (dialog.runModal() == NSApplication.ModalResponse.OK) {
      guard let url = dialog.url else {
        return
      }
      let path = url.path
      realmFileTextField.stringValue = path
      realmFilePath = path
    } else {
      // User clicked on "Cancel"
      return
    }
  }
  
  @IBAction func chooseOutputFolder(_ sender: NSButton) {
    let dialog = NSOpenPanel()
    
    dialog.title                   = "Choose an output folder for .csv files"
    dialog.showsResizeIndicator    = true
    dialog.showsHiddenFiles        = true
    dialog.canChooseDirectories    = true
    dialog.canChooseFiles          = false
    dialog.canCreateDirectories    = true
    dialog.allowsMultipleSelection = false
    
    if (dialog.runModal() == NSApplication.ModalResponse.OK) {
      guard let url = dialog.url else {
        return
      }
      let path = url.path
      outputFolderTextField.stringValue = path
      outputFolderPath = path
    } else {
      // User clicked on "Cancel"
      return
    }
  }
  
  @IBAction func startConvert(_ sender: NSButton) {
    guard let realmFilePath = realmFilePath else {
      return
    }
    
    guard let outputFolderPath = outputFolderPath else {
      return
    }
    
    convertRealmToCSV(realmFilePath: realmFilePath, outputFolderPath: outputFolderPath)
  }
  
  private func convertRealmToCSV(realmFilePath: String, outputFolderPath: String) {
    let csvDataExporter = try! CSVDataExporter(realmFilePath: realmFilePath)
    try! csvDataExporter.export(toFolderAtPath: outputFolderPath)
  }
}

