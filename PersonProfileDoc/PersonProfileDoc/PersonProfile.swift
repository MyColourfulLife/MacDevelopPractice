//
//  PersonProfile.swift
//  PersonProfileDoc
//
//  Created by Ekko on 2019/12/17.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa
let kPersonKey:String = "PersonKey"
class PersonProfile: NSObject,NSCoding {
    
  @objc dynamic var name:String?
  @objc dynamic var age:NSInteger = 0
  @objc dynamic var address:String?
  @objc dynamic var mobile:String?
  @objc dynamic var image:NSImage?
    
    
    func encode(with coder: NSCoder) {
        print("encode with coder")
        coder.encode(name, forKey: "name")
        coder.encode(age, forKey: "age")
        coder.encode(address, forKey: "address")
        coder.encode(mobile, forKey: "mobile")
        coder.encode(image, forKey: "image")
    }
    
    
    required  init?(coder: NSCoder) {
        print("decoder with coder")
        self.name = coder.decodeObject(forKey: "name") as? String
        self.age = coder.decodeObject(forKey: "age") as! NSInteger
        self.address = coder.decodeObject(forKey: "address") as? String
        self.mobile = coder.decodeObject(forKey: "mobile") as? String
        self.image = coder.decodeObject(forKey: "image") as? NSImage
    }
    
    override init() {
        
    }
    
    static func profileFrom(_ data:Data) -> PersonProfile? {
        let unarchiver = try? NSKeyedUnarchiver(forReadingFrom: data)
        let aPerson = unarchiver?.decodeObject(forKey: kPersonKey) as? PersonProfile
        return aPerson
    }
    
    func docData()->Data{
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(self, forKey: kPersonKey)
        archiver.finishEncoding()
        return data as Data
    }

}
