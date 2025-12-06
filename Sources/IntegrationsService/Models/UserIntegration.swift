//
//  UserIntegration.swift
//  IntegrationsService
//
//  Created by Alberto Orrantia on 06/12/25.
//

import Foundation

// Tracks the users current state for an integration
struct UserIntegration: Codable {
    let userId: String
    let userIntegrationId: String
    var status: IntegrationStatus
}
