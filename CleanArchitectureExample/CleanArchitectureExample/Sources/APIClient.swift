//
//  APIClient.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/24.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

// MARK: - Interface
public protocol APIClient {
    func endpointString(with resource: String) -> String
}

extension APIClient where Self: DataStore {
    public var baseURLString: String {
        return ""
    }
    
    public func endpointString(with resource: String) -> String {
        let fileName = resource.replacingOccurrences(of: "/", with: "_")
        let resourcePath = Bundle.main.resourcePath
        let resourceURL = URL(fileURLWithPath: resourcePath!, isDirectory: true)
        let stubDirectoryURL = resourceURL.appendingPathComponent("stub", isDirectory: true)
        let fileURL = stubDirectoryURL.appendingPathComponent("\(fileName).json")
        return fileURL.absoluteString
    }
}
