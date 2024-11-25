/*
 AppDependencies.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

import DataLayer
import SwiftUI

public final class AppDependencies: Sendable {
    public let loggingSystemClient: LoggingSystemClient

    public nonisolated init(
        loggingSystemClient: LoggingSystemClient = .liveValue
    ) {
        self.loggingSystemClient = loggingSystemClient
    }
}

struct AppDependenciesKey: EnvironmentKey {
    static let defaultValue = AppDependencies(
        loggingSystemClient: .testValue
    )
}

public extension EnvironmentValues {
    var appDependencies: AppDependencies {
        get { self[AppDependenciesKey.self] }
        set { self[AppDependenciesKey.self] = newValue }
    }
}
