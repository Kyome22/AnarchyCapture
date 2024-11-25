/*
 VideoViewProxyActions.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/26.
 
*/

import AVFoundation
import SwiftUI

public struct VideoViewProxyActions: Sendable {
    public private(set) var setPreviewLayer: @MainActor @Sendable (AVCaptureVideoPreviewLayer) -> Void
    public private(set) var updateFrame: @MainActor @Sendable (CGRect) -> Void

    public init(
        setPreviewLayer: @escaping @MainActor @Sendable (AVCaptureVideoPreviewLayer) -> Void,
        updateFrame: @escaping @MainActor @Sendable (CGRect) -> Void
    ) {
        self.setPreviewLayer = setPreviewLayer
        self.updateFrame = updateFrame
    }
}

private struct VideoViewProxyActionsKey: EnvironmentKey {
    static let defaultValue = VideoViewProxyActions(
        setPreviewLayer: { _ in },
        updateFrame: { _ in }
    )
}

extension EnvironmentValues {
    public var videoViewProxyActions: VideoViewProxyActions {
        get { self[VideoViewProxyActionsKey.self] }
        set { self[VideoViewProxyActionsKey.self] = newValue }
    }
}
