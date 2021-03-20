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
    @NSManaged public var accountName: String
    @NSManaged public var email: String
    @NSManaged public var password: String

}

extension UserProfData : Identifiable {

}
