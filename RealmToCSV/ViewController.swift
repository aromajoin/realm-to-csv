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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
  
  @IBAction func startConvert(_ sender: NSButton) {
    let realmFilePath = "/Users/user/Desktop/RealmSample/default.realm" // Absolute file path to my Realm file
    let outputFolderPath = "/Users/user/Desktop/RealmSample/" // Absolute path to the folder which will hold the CSV files
    
    convertRealmToCSV(realmFilePath: realmFilePath, outputFolderPath: outputFolderPath)
  }
  
  private func convertRealmToCSV(realmFilePath: String, outputFolderPath: String) {
    let csvDataExporter = try! CSVDataExporter(realmFilePath: realmFilePath)
    try! csvDataExporter.export(toFolderAtPath: outputFolderPath)
  }
}

