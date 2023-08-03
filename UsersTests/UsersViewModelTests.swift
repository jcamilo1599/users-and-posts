//
//  UsersViewModelTests.swift
//  UsersTests
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import XCTest
import CoreData
@testable import Users

final class UsersViewModelTests: XCTestCase {
    var managedObjectContext: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        managedObjectContext = setUpInMemoryManagedObjectContext()
    }
    
    override func tearDown() {
        managedObjectContext = nil
        super.tearDown()
    }
    
    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        } catch {
            fatalError("Falla al iniciar: \(error)")
        }
        
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        return managedObjectContext
    }
    
    func testUsersAPI() {
        let sut = UsersViewModel(usersAPI: UsersAPIMock())
        sut.getUsers(managedObjectContext)
        
        XCTAssert(sut.users.count == 1)
    }
}
