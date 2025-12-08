//
//  IntegrationController.swift
//  IntegrationsService
//
//  Created by Alberto Orrantia on 06/12/25.
//

import Vapor

struct IntegrationController: RouteCollection {
    // Exposes HTTP endpoints for listening integrations and updating user states
    // Logic lives in IntegrationService
    let service: IntegrationService

    func boot(routes: any RoutesBuilder) throws {
        let integrations = routes.grouped("integrations")
        integrations.get(use: getCatalog)

        let users = routes.grouped("users")
        users.get(":userId", "integrations", use: getUserIntegrations)
        users.post(":userId", "integrations", ":integrationId", "start", use: startConnection)
        users.post(":userId", "integrations", ":integrationId", "complete", use: completeConnection)
        users.post(":userId", "integrations", ":integrationId", "disconnect", use: disconnectIntegration)
    }
    
    // MARK: - DTO
    // Simulated OAuth URL for MVP
    struct StartConnectionResponse: Content {
        let authUrl: String
    }
    
    struct CompleteRequest: Content {
        let success: Bool
    }
    
    // MARK: - Handlers
    func getCatalog(_ req: Request) throws -> [Integration] {
        service.getCatalog()
    }

    func getUserIntegrations(_ req: Request) throws -> [UserIntegration] {
        guard let userId = req.parameters.get("userId") else {
            throw Abort(.badRequest, reason: "Missing userId")
        }
        return service.getUserIntegrations(for: userId)
    }

    func startConnection(_ req: Request) throws -> StartConnectionResponse {
        guard
            let userId = req.parameters.get("userId"),
            let integrationId = req.parameters.get("integrationId")
        else {
            throw Abort(.badRequest, reason: "Missing userId or integrationId")
        }

        _ = service.startConnection(
            for: userId,
            integrationId: integrationId
        )
        
        let authUrl = "https://auth.suma.local/authorize?userId=\(userId)&integrationId=\(integrationId)"
        return StartConnectionResponse(authUrl: authUrl)
    }
    
    func completeConnection(_ req: Request) throws -> [UserIntegration] {
        guard
            let userId = req.parameters.get("userId"),
            let integrationId = req.parameters.get("integrationId")
        else {
            throw Abort(.badRequest, reason: "Missing userId or integrationId")
        }

        let body = try req.content.decode(CompleteRequest.self)

        return service.completeConnection(
            for: userId,
            integrationId: integrationId,
            success: body.success
        )
    }

    func disconnectIntegration(_ req: Request) throws -> [UserIntegration] {
        guard
            let userId = req.parameters.get("userId"),
            let integrationId = req.parameters.get("integrationId")
        else {
            throw Abort(.badRequest, reason: "Missing userId or integrationId")
        }

        return service.disconnectIntegration(
            for: userId,
            integrationId: integrationId
        )
    }
}
