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
    let choosenPath = chooseFileOrFolder(folderSelection: false, fileSelection: true, fileTypes: ["realm"])
    
    guard let path = choosenPath else {
      return
    }
    
    realmFileTextField.stringValue = path
    realmFilePath = path
  }
  
  @IBAction func chooseOutputFolder(_ sender: NSButton) {
    let choosenPath = chooseFileOrFolder(folderSelection: true, fileSelection: false, fileTypes: [])
    
    guard let path = choosenPath else {
      return
    }
    
    outputFolderTextField.stringValue = path
    outputFolderPath = path
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
  
  /// Opens dialog to choose a file or folder.
  ///
  /// - Parameters:
  ///   - folderSelection: if folder selection is allowed.
  ///   - fileSelection: if file selection is allowed.
  ///   - fileTypes: allowed file types
  /// - Returns: The path of the choosen folder/file. Return nil if it is canceled.
  private func chooseFileOrFolder(folderSelection: Bool, fileSelection: Bool, fileTypes: [String]) -> String? {
    let dialog = NSOpenPanel()
    
    dialog.title                   = "Choose an output folder for .csv files"
    dialog.showsResizeIndicator    = true
    dialog.showsHiddenFiles        = true
    dialog.canChooseDirectories    = folderSelection
    dialog.canChooseFiles          = fileSelection
    dialog.canCreateDirectories    = true
    dialog.allowsMultipleSelection = false
    if (!fileTypes.isEmpty) {
      dialog.allowedFileTypes        = fileTypes
    }
    
    if (dialog.runModal() == NSApplication.ModalResponse.OK) {
      guard let url = dialog.url else {
        return nil
      }
      
      return url.path
    } else {
      // User clicked on "Cancel"
      return nil
    }
  }
  
  private func convertRealmToCSV(realmFilePath: String, outputFolderPath: String) {
    let csvDataExporter = try! CSVDataExporter(realmFilePath: realmFilePath)
    try! csvDataExporter.export(toFolderAtPath: outputFolderPath)
  }
}

