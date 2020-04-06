//
//  LocalMovie+CoreDataProperties.swift
//  
//
//  Created by Esraa Hassan on 4/1/20.
//
//

import Foundation
import CoreData


extension LocalMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocalMovie> {
        return NSFetchRequest<LocalMovie>(entityName: "LocalMovie")
    }

    @NSManaged public var genre: String
    @NSManaged public var image: String
    @NSManaged public var name: String
    @NSManaged public var rate: Double
    @NSManaged public var releaseYear: NSDecimalNumber

}
