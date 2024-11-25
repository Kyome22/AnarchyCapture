/*
 File.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

import AVFoundation
import DataLayer
import Observation
import SwiftUI

@MainActor @Observable public final class WorkspaceViewModel {
    private let captureService: CaptureService
    private let logService: LogService

    public var captureDevices = [CaptureDevice]()
    public var selecdedDevice: CaptureDevice?

    public init(
        _ captureService: CaptureService,
        _ logService: LogService
    ) {
        self.captureService = captureService
        self.logService = logService
    }

    public func onTask(screenName: String) async {
        logService.notice(.screenView(name: screenName))
        do {
            captureDevices = try await captureService.fetchDevices()
        } catch {
            logService.critical(.failedOperation(error))
        }
    }

    public func connectDevice(proxyAction: @escaping (AVCaptureSession) -> Void) async {
        if let selecdedDevice {
            await captureService.stop()
            do {
                let captureSession = try await captureService.connect(to: selecdedDevice)
                proxyAction(captureSession)
                await captureService.start()
            } catch {
                logService.critical(.failedOperation(error))
            }
        } else {
            await captureService.stop()
        }
    }
}
