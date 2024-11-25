/*
 WorkspaceView.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

import AVKit
import DataLayer
import Domain
import SwiftUI

struct WorkspaceView: View {
    @State var viewModel: WorkspaceViewModel

    init(
        captureService: CaptureService,
        logService: LogService
    ) {
        viewModel = .init(captureService, logService)
    }

    var body: some View {
        VStack {
            VideoViewReader { proxy in
                VideoView()
                    // .aspectRatio(0.5625, contentMode: .fit)
                    .frame(width: 640, height: 360)
                    .onChange(of: viewModel.selecdedDevice) { _, _ in
                        Task {
                            await viewModel.connectDevice { captureSession in
                                proxy.setCaptureSession(captureSession)
                            }
                        }
                    }
            }
            Form {
                Picker(selection: $viewModel.selecdedDevice) {
                    Text("unselected", bundle: .module)
                        .tag(CaptureDevice?.none)
                    ForEach(viewModel.captureDevices) { device in
                        Text(device.name).tag(device)
                    }
                } label: {
                    Text("device", bundle: .module)
                }
            }
            .fixedSize()
        }
        .padding()
        .task {
            await viewModel.onTask(screenName: String(describing: Self.self))
        }
    }
}

#Preview {
    WorkspaceView(
        captureService: .init(),
        logService: .init(.testValue)
    )
}
