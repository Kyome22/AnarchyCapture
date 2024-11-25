/*
 CaptureService.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

import AVFoundation

public actor CaptureService {
    public init() {}

    public func printDevices() {
        let discoverySession = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera, .external],
            mediaType: .video,
            position: .unspecified
        )
        let captureSession = AVCaptureSession()
        Swift.print("Device Count: \(discoverySession.devices.count)")
        discoverySession.devices.forEach { device in
            Swift.print(device.localizedName)
            do {
                let videoInput = try AVCaptureDeviceInput(device: device)
                let available = captureSession.canAddInput(videoInput)

                Swift.print("\tConnected: \(device.isConnected)")
                Swift.print("\tSuspended: \(device.isSuspended)")
                Swift.print("\tAvailable: \(available)")
                Swift.print("\tIs In Use: \(device.isInUseByAnotherApplication)")
                Swift.print()
            } catch {
                Swift.print(error.localizedDescription)
            }
        }
    }
}
