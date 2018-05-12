/**
    @file BootRecord.swift
    SafeBootRecord

    Created by Kasim on 5/10/18.
    Copyright © 2018 Tekk Innovations LLC. All rights reserved.
*/

import Foundation

/// A convenience class to track app booting success. Allows for marking
/// boot start and boot end.
///
/// If boot start is marked and boot end is not, then the record will be
/// persisted and can be read during a subsequent boot.
///
/// This may be useful for tracking whether the app is crashing on boot or not.
@objc public class BootRecord: NSObject {

  private let kBootRecordKey = "kBootRecordKey"
  
  public func bootLogs() -> [String] {
    if let logs = UserDefaults.standard.array(forKey: kBootRecordKey) as? [String] {
      return logs
    }
    
    return [String]()
  }
  
  public var bootFailureCount: Int {
    return bootLogs().count
  }
  
  public var didBootSuccessfully: Bool {
    return bootFailureCount == 0
  }
  
  public func markStart() -> Bool {
    var logs = UserDefaults.standard.array(forKey: kBootRecordKey) ?? [String]()
    logs.append(bootLine())
    UserDefaults.standard.set(logs, forKey: kBootRecordKey)
    return UserDefaults.standard.synchronize()
  }
  
  public func bootLine() -> String {
    let kBootFilePrefix = "_bootStart"
    let nowSecs: TimeInterval = Date.timeIntervalSinceReferenceDate
    let filename = "\(kBootFilePrefix)_\(nowSecs).mark"
    return filename
  }
  
  public func markFinish() -> Bool {
    UserDefaults.standard.removeObject(forKey: kBootRecordKey)
    return UserDefaults.standard.synchronize()
  }
}
