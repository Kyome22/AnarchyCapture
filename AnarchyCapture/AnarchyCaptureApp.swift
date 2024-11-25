//
//  AnarchyCaptureApp.swift
//  AnarchyCapture
//
//  Created by Takuto Nakamura on 2024/11/25.
//

import Domain
import Presentation
import SwiftUI

@main
struct AnarchyCaptureApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WorkspaceWindowScene()
            .environment(\.appDependencies, appDelegate.appDependencies)
            .environment(\.appServices, appDelegate.appServices)
    }
}
