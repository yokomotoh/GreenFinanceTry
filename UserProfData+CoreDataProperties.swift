//
//  UserProfData+CoreDataProperties.swift
//  GreenFinanceTry
//
//  Created by vincent schmitt on 16/03/2021.
//
//

import Foundation
import CoreData


extension UserProfData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserProfData> {
        return NSFetchRequest<UserProfData>(entityName: "UserProfData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var firstName: String
    @NSManaged public var age: String

}

extension UserProfData : Identifiable {

}
