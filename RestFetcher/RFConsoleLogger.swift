//
//  ConsoleLogger.swift
//  RestFetcher
//
//  Created by Charles Oder on 5/26/16.
//  Copyright © 2016 Charles Oder. All rights reserved.
//

import UIKit

@objc
public protocol RFLogger {
    func debug(_ message: String)
    func error(_ message: String)
}

@objc
public class RFConsoleLogger: NSObject, RFLogger {

    public func debug(_ message: String) {
        print("DEBUG: \(message)")
    }
    
    public func error(_ message: String) {
        print("ERROR: \(message)")
    }
    
    public func logRequest(callId: String, url: String?, headers: [String: String], body: String?) {
        var logMessage = "Request: \(callId)\nURL: \(String(describing: url))\n Headers:\n"
        for (key, val) in headers {
            logMessage += "\t\(key): \(val)\n"
        }
        logMessage += "Body: \(String(describing: body))"
        debug(logMessage)
    }
    
    public func logResponse(callId: String, url: String?, code: Int, headers: [String: String], body: String?) {
        var logMessage = "Response: \(callId) received: \(code)\nHeaders:\n"
        for (key, val) in headers {
            logMessage += "\(key): \(val)"
        }
        logMessage += "\nBody: \(String(describing: body))"
        debug(logMessage)
    }
}
