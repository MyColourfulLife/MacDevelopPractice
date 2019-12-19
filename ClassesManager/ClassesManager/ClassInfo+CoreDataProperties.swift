//
//  ClassInfo+CoreDataProperties.swift
//  ClassesManager
//
//  Created by Ekko on 2019/12/19.
//  Copyright © 2019 Ekko. All rights reserved.
//
//

import Foundation
import CoreData


extension ClassInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClassInfo> {
        return NSFetchRequest<ClassInfo>(entityName: "ClassInfo")
    }

    @NSManaged public var motto: String?
    @NSManaged public var photo: Data?
    @NSManaged public var video: Data?
    @NSManaged public var belongToClass: Classes?

}
