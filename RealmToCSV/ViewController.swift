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

  }
  
  @IBAction func chooseOutputFolder(_ sender: NSButton) {
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

