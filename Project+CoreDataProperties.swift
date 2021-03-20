//
//  Project+CoreDataProperties.swift
//  GreenFinanceTry
//
//  Created by vincent schmitt on 20/03/2021.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String
    @NSManaged public var description_project: String
    @NSManaged public var budget: String
    @NSManaged public var picture: String
    @NSManaged public var video: String?
    @NSManaged public var created_date: Date
    @NSManaged public var finished_date: Date
    @NSManaged public var category: String

}

extension Project : Identifiable {

}
