//
//  RemoteMovie+CoreDataProperties.swift
//  
//
//  Created by Esraa Hassan on 4/1/20.
//
//

import Foundation
import CoreData


extension RemoteMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RemoteMovie> {
        return NSFetchRequest<RemoteMovie>(entityName: "RemoteMovie")
    }

    @NSManaged public var genre: String
    @NSManaged public var image: String
    @NSManaged public var name: String
    @NSManaged public var rate: Double
    @NSManaged public var releaseYear: NSDecimalNumber

}
