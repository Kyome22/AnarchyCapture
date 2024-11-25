/*
 File.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

import Observation
import SwiftUI

@MainActor @Observable public final class WorkspaceViewModel {
    private let captureService: CaptureService
    private let logService: LogService

    public init(
        _ captureService: CaptureService,
        _ logService: LogService
    ) {
        self.captureService = captureService
        self.logService = logService
    }

    public func onAppear(screenName: String) {
        logService.notice(.screenView(name: screenName))
        Task {
            await captureService.printDevices()
        }
    }
}
