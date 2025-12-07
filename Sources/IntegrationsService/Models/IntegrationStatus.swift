//
//  IntegrationStatus.swift
//  IntegrationsService
//
//  Created by Alberto Orrantia on 06/12/25.
//

import Foundation

// Represent the possible states of a users integration workflow
enum IntegrationStatus: String, Codable {
    case disconnected
    case pending
    case connected
    case error
}
