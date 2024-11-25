/*
 VideoView.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/26.
 
*/

import AVFoundation
import Domain
import SwiftUI

struct VideoView: NSViewRepresentable {
    @Environment(\.videoViewProxyActions) private var videoViewProxyActions

    @MainActor func makeNSView(context: Context) -> NSView {
        let view = NSView()
        view.wantsLayer = true
        let previewLayer = AVCaptureVideoPreviewLayer()
        previewLayer.frame = view.bounds
        previewLayer.videoGravity = .resizeAspect
        view.layer?.addSublayer(previewLayer)
        videoViewProxyActions.setPreviewLayer(previewLayer)
        return view
    }

    @MainActor func updateNSView(_ nsView: NSView, context: Context) {
        videoViewProxyActions.updateFrame(nsView.bounds)
    }
}
