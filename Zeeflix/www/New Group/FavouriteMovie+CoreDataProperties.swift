//
//  FavouriteMovie+CoreDataProperties.swift
//  
//
//  Created by Pyae Phyo Oo on 13/11/2023.
//
//

import Foundation
import CoreData


extension FavouriteMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteMovie> {
        return NSFetchRequest<FavouriteMovie>(entityName: "FavouriteMovie")
    }

    @NSManaged public var image: String?
    @NSManaged public var title: String?

}
