//
//  UpcomingMovie+CoreDataProperties.swift
//  
//
//  Created by Pyae Phyo Oo on 13/11/2023.
//
//

import Foundation
import CoreData


extension UpcomingMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UpcomingMovie> {
        return NSFetchRequest<UpcomingMovie>(entityName: "UpcomingMovie")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?

}
