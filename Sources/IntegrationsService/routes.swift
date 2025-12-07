import Vapor

func routes(_ app: Application) throws {
    // Build dependancies
    let repository = InMemoryIntegrationRepository()
    let service = IntegrationService(repository: repository)
    let controller = IntegrationController(service: service)
    
    try app.register(collection: controller)
}
