/*
 VideoViewReader.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/26.
 
*/

import Domain
import SwiftUI

struct VideoViewReader<Content: View>: View {
    @State private var proxy = VideoViewProxy()

    private var content: (VideoViewProxy) -> Content

    init(@ViewBuilder content: @escaping (VideoViewProxy) -> Content) {
        self.content = content
    }

    var body: some View {
        content(proxy)
            .environment(\.videoViewProxyActions, VideoViewProxyActions(
                setPreviewLayer: { proxy.setPreviewLayer($0) },
                updateFrame: { proxy.updateFrame($0) }
            ))
    }
}
