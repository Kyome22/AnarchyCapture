/*
 File.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/26.
 
*/

import Foundation

public struct CaptureDevice: Identifiable, Hashable, Sendable {
    public var id: String
    public var name: String

    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
