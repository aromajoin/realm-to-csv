//
//  FileUtils.swift
//  RealmToCSV
//
//  Created by Quang Nguyen on 2018/11/30.
//  Copyright © 2018 Aromajoin. All rights reserved.
//

import Foundation

func isFolderExist(folderFullPath: String) -> Bool {
  let fileManager = FileManager.default
  var isDir : ObjCBool = false
  if fileManager.fileExists(atPath: folderFullPath, isDirectory:&isDir) {
    if isDir.boolValue {
      // file exists and is a directory
      return true
    } else {
      // file exists and is not a directory
      return false
    }
  } else {
    // file does not exist
    return false
  }
}

func isFileExist(fileFullPath: String) -> Bool {
  let fileManager = FileManager.default
  var isDir : ObjCBool = false
  if fileManager.fileExists(atPath: fileFullPath, isDirectory:&isDir) {
    if isDir.boolValue {
      // file exists and is a directory
      return false
    } else {
      // file exists and is not a directory
      return true
    }
  } else {
    // file does not exist
    return false
  }
}
