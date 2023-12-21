//
//  Bookmark+CoreDataProperties.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//
//

import Foundation
import CoreData


extension Bookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmark> {
        return NSFetchRequest<Bookmark>(entityName: "Bookmark")
    }

    @NSManaged public var bookmarkURL: String?

}

extension Bookmark : Identifiable {

}
