//
//  Teacher+CoreDataProperties.swift
//  ClassesManager
//
//  Created by Ekko on 2019/12/19.
//  Copyright © 2019 Ekko. All rights reserved.
//
//

import Foundation
import CoreData


extension Teacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var adminClass: String?
    @NSManaged public var name: String?
    @NSManaged public var adminClasses: Classes?

}
