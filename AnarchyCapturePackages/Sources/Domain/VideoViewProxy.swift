/*
 VideoViewProxy.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/26.
 
*/

import AVFoundation
import SwiftUI

@MainActor public final class VideoViewProxy: ObservableObject {
    private(set) weak var previewLayer: AVCaptureVideoPreviewLayer?

    public nonisolated init() {}

    public func setPreviewLayer(_ previewLayer: AVCaptureVideoPreviewLayer) {
        self.previewLayer = previewLayer
    }

    public func updateFrame(_ frame: CGRect) {
        previewLayer?.frame = frame
    }

    public func setCaptureSession(_ captureSession: AVCaptureSession) {
        previewLayer?.session = captureSession
    }
}
