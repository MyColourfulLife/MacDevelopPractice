//
//  Classes+CoreDataProperties.swift
//  ClassesManager
//
//  Created by Ekko on 2019/12/19.
//  Copyright © 2019 Ekko. All rights reserved.
//
//

import Foundation
import CoreData


extension Classes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Classes> {
        return NSFetchRequest<Classes>(entityName: "Classes")
    }

    @NSManaged public var studentNum: Int16
    @NSManaged public var title: String?
    @NSManaged public var classStudent: NSSet?
    @NSManaged public var monitor: Classes?
    @NSManaged public var teacher: Teacher?
    @NSManaged public var classInfo: ClassInfo?

}

// MARK: Generated accessors for classStudent
extension Classes {

    @objc(addClassStudentObject:)
    @NSManaged public func addToClassStudent(_ value: Students)

    @objc(removeClassStudentObject:)
    @NSManaged public func removeFromClassStudent(_ value: Students)

    @objc(addClassStudent:)
    @NSManaged public func addToClassStudent(_ values: NSSet)

    @objc(removeClassStudent:)
    @NSManaged public func removeFromClassStudent(_ values: NSSet)

}
