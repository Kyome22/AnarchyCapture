/*
 WorkspaceView.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/25.
 
*/

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
        Text("Hello, World!")
            .onAppear {
                viewModel.onAppear(screenName: String(describing: Self.self))
            }
    }
}

#Preview {
    WorkspaceView(
        captureService: .init(),
        logService: .init(.testValue)
    )
}
