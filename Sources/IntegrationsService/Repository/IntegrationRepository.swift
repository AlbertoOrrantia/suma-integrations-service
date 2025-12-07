//
//  IntegrationRepository.swift
//  IntegrationsService
//
//  Created by Alberto Orrantia on 06/12/25.
//

import Foundation

// Repository contract for integration storage
// Note: This MVP uses an in memory storage, all operations are synchronous, in real deployment implement async throws.
protocol IntegrationRepository {
    func getCatalog() -> [Integration]
    func getUserIntegrations(for userId: String) -> [UserIntegration]
    @discardableResult
    func updateUserIntegration(for userId: String, integrationId: String, to newStatus: IntegrationStatus) -> [UserIntegration]
}
