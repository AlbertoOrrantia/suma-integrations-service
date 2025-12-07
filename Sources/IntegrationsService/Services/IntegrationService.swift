//
//  IntegrationService.swift
//  IntegrationsService
//
//  Created by Alberto Orrantia on 06/12/25.
//

import Foundation

final class IntegrationService {
    // High level operations for integrations, keeps controllers out of storage details
    private let repository: any IntegrationRepository
    init(repository: any IntegrationRepository){
        self.repository = repository
    }
    
    func getCatalog() -> [Integration] {
        repository.getCatalog()
    }
    
    // MARK: - User Integrations
    func getUserIntegrations(for userId: String) -> [UserIntegration] {
        repository.getUserIntegrations(for: userId)
    }
    
    // For MVP purposes, more steps needed for OAuth
    func startConnection(for userId: String, integrationId: String) -> [UserIntegration] {
        repository.updateUserIntegration(for: userId, integrationId: integrationId, to: .connected)
    }
    
    func completeConnection(for userId: String, integrationId: String, success: Bool) -> [UserIntegration] {
        let newStatus: IntegrationStatus = success ? .connected : .error
        return repository.updateUserIntegration(for: userId, integrationId: integrationId, to: newStatus)
        
    }
    
    func disconnectIntegration(for userId: String, integrationId: String) -> [UserIntegration] {
        repository.updateUserIntegration(for: userId, integrationId: integrationId, to: .disconnected)
    }
    
}
