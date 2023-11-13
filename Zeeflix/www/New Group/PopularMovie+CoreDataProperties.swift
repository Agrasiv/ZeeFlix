//
//  PopularMovie+CoreDataProperties.swift
//  
//
//  Created by Pyae Phyo Oo on 13/11/2023.
//
//

import Foundation
import CoreData


extension PopularMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PopularMovie> {
        return NSFetchRequest<PopularMovie>(entityName: "PopularMovie")
    }

    @NSManaged public var image: String?
    @NSManaged public var title: String?

}
