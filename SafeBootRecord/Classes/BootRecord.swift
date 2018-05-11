/**
    @file BootRecord.swift
    SafeBootRecord

    Created by Kasim on 5/10/18.
    Copyright © 2018 Tekk Innovations LLC. All rights reserved.
*/

import Foundation

/// Manual tracker for app booting.
/// Useful tracking whether the app is crashing on boot or not.
@objc public class BootRecord: NSObject {

  private let kBootRecordKey = "kBootRecordKey"
  
  private func bootLogs() -> [String] {
    if let logs = UserDefaults.standard.array(forKey: kBootRecordKey) as? [String] {
      return logs
    }
    
    return [String]()
  }
  
  private var bootFailureCount: Int {
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
