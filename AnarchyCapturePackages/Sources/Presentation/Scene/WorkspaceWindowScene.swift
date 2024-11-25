/*
 SwiftUIView.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

import Domain
import SwiftUI

public struct WorkspaceWindowScene: Scene {
    public init () {}

    public var body: some Scene {
        Window(Text("appTitle", bundle: .module), id: "workspace") {
            WorkspaceView()
        }
        .windowResizability(.contentSize)
        .defaultPosition(.center)
    }
}
