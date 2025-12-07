//
//  Integration.swift
//  IntegrationsService
//
//  Created by Alberto Orrantia on 06/12/25.
//

import Vapor

// Describes available third partu integration
struct Integration: Content {
    let id: String
    let name: String
    let description: String
    let provider: String
    let scopes: [String]
}
