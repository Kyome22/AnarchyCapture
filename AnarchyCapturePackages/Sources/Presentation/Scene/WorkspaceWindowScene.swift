/*
 SwiftUIView.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

import Domain
import SwiftUI

public struct WorkspaceWindowScene: Scene {
    @Environment(\.appServices) private var appServices

    public init () {}

    public var body: some Scene {
        Window(Text("appTitle", bundle: .module), id: "workspace") {
            WorkspaceView(
                captureService: appServices.captureService,
                logService: appServices.logService
            )
        }
        .windowResizability(.contentSize)
        .defaultPosition(.center)
    }
}
