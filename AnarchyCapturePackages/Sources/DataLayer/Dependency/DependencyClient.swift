/*
 DependencyClient.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

public protocol DependencyClient: Sendable {
    static var liveValue: Self { get }
    static var testValue: Self { get }
}
