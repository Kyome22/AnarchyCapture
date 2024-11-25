/*
 AppServices.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

import DataLayer
import SwiftUI

public final class AppServices: Sendable {
    public let captureService: CaptureService
    public let logService: LogService

    public nonisolated init(appDependencies: AppDependencies) {
        captureService = .init()
        logService = .init(appDependencies.loggingSystemClient)
    }
}

struct AppServicesKey: EnvironmentKey {
    static let defaultValue = AppServices(appDependencies: AppDependenciesKey.defaultValue)
}

public extension EnvironmentValues {
    var appServices: AppServices {
        get { self[AppServicesKey.self] }
        set { self[AppServicesKey.self] = newValue }
    }
}
