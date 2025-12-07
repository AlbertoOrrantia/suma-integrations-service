//
//  InMemoryIntegrationRepository.swift
//  IntegrationsService
//
//  Created by Alberto Orrantia on 06/12/25.
//

import Foundation

// Stores a fixed catalog and connection state
final class InMemoryIntegrationRepository: IntegrationRepository {
    // Static catalog of available integrations
    // As per this MVP strings are hardcoded. Localized strings are a must for production ready product
    private let catalog: [Integration] = [
        Integration(
            id: "gmail",
            name: "Gmail",
            description: "Sync your Gmail inbox so Charlie can access, read and summarize messages",
            provider: "Google",
            scopes: [
                "https://mail.google.com/",
                "https://www.googleapis.com/auth/gmail.readonly"
            ]),
        Integration(
            id: "google-calendar",
            name: "Google Calendar",
            description: "Let Charlie read your events and suggest schedule changes",
            provider: "Google",
            scopes: [
                "https://www.googleapis.com/auth/calendar.readonly"
            ]
        ),
        Integration(
            id: "google-meet",
            name: "Google Meet",
            description: "Allow Charlie to create and manage Meet links",
            provider: "Google",
            scopes: [
                "https://www.googleapis.com/auth/calendar.events"
            ]
        )
    ]
    
    // Note: Dictionaries are NOT thread safe, for MVP purposes this is OK, a real production system should wrap in an actor
    private var userStates: [String: [UserIntegration]] = [:]
    
    func getCatalog() -> [Integration] {
        catalog
    }
    
    func getUserIntegrations(for userId: String) -> [UserIntegration] {
        if let existing = userStates[userId] {
            return existing
        }
        
        // If first time, all integrations are disconnected
        let initial = catalog.map {
            UserIntegration(userId: userId,
                            integrationId: $0.id,
                            status: .disconnected
            )
        }
        
        userStates[userId] = initial
        return initial
    }
    
    @discardableResult
    func updateUserIntegration(for userId: String, integrationId: String, to newStatus: IntegrationStatus) -> [UserIntegration] {
        var integrations = getUserIntegrations(for: userId)
        
        if let index = integrations.firstIndex(where: { $0.integrationId == integrationId }) {
            integrations[index].status = newStatus
        }
        
        userStates[userId] = integrations
        return integrations
    }
    
}
