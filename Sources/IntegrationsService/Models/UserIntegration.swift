//
//  UserIntegration.swift
//  IntegrationsService
//
//  Created by Alberto Orrantia on 06/12/25.
//

import Vapor

// Tracks the users current state for an integration
struct UserIntegration: Content {
    let userId: String
    let integrationId: String
    var status: IntegrationStatus
}
