//
//  Profile+CoreDataProperties.swift
//  School
//
//  Created by Ekko on 2019/12/19.
//  Copyright © 2019 Ekko. All rights reserved.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var address: String?
    @NSManaged public var birthday: Date?
    @NSManaged public var homephone: String?
    @NSManaged public var photo: Data?
    @NSManaged public var studentProfile: Students?

}
