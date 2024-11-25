/*
 CriticalEvent.swift
 AnarchyCapturePackages

 Created by Takuto Nakamura on 2024/11/24.

*/

import Logging

public enum CriticalEvent {
    case failedOperation(any Error)

    public var message: Logger.Message {
        switch self {
        case .failedOperation:
            "Failed to operate something."
        }
    }

    public var metadata: Logger.Metadata? {
        switch self {
        case let .failedOperation(error):
            ["cause": "\(error.localizedDescription)"]
        }
    }
}
