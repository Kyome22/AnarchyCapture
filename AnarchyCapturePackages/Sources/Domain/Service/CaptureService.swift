/*
 CaptureService.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

import AVFoundation
import DataLayer

public actor CaptureService {
    private var availableDevices = [AVCaptureDevice]()
    private var captureSession: AVCaptureSession?

    public init() {}

    public func fetchDevices() throws -> [CaptureDevice] {
        let discoverySession = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera, .external],
            mediaType: .video,
            position: .unspecified
        )
        let captureSession = AVCaptureSession()
        availableDevices = try discoverySession.devices.filter { device in
            let videoInput = try AVCaptureDeviceInput(device: device)
            return captureSession.canAddInput(videoInput)
        }
        print(devices: availableDevices)
        return availableDevices.map {
            CaptureDevice(id: $0.uniqueID, name: $0.localizedName)
        }
    }

    public func print(devices: [AVCaptureDevice]) {
        Swift.print("Device Count: \(devices.count)")
        devices.forEach { device in
            Swift.print(device.localizedName)
            Swift.print("\tConnected: \(device.isConnected)")
            Swift.print("\tSuspended: \(device.isSuspended)")
            Swift.print("\tIs In Use: \(device.isInUseByAnotherApplication)")
        }
    }

    public func connect(to captureDevice: CaptureDevice) throws -> AVCaptureSession {
        guard let device = availableDevices.first(where: { captureDevice.id == $0.uniqueID }) else {
            throw OperationError.availableDeviceNotFound
        }
        let videoInput = try AVCaptureDeviceInput(device: device)
        let captureSession = AVCaptureSession()
        guard captureSession.canAddInput(videoInput) else {
            throw OperationError.cannotAddInput
        }
        captureSession.addInput(videoInput)
        let videoOutput = AVCaptureVideoDataOutput()
        guard captureSession.canAddOutput(videoOutput) else {
            throw OperationError.cannotAddOutput
        }
        captureSession.addOutput(videoOutput)
        captureSession.sessionPreset = .medium

        self.captureSession = captureSession
        return captureSession
    }

    public func start() {
        captureSession?.startRunning()
    }

    public func stop() {
        captureSession?.stopRunning()
    }

    enum OperationError: Error {
        case availableDeviceNotFound
        case cannotAddInput
        case cannotAddOutput
    }
}

extension AVCaptureSession: @retroactive @unchecked Sendable {}
