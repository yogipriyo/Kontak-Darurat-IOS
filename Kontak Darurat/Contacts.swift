//
//  Contacts.swift
//  Kontak Darurat
//
//  Created by yogi prayogo on 3/2/16.
//  Copyright © 2016 DIUI. All rights reserved.
//

import Foundation
import RealmSwift

class Contacts: Object {
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var ktp = ""
    dynamic var bpjs = ""
    dynamic var noIbu = ""
    dynamic var noBapak = ""
    dynamic var noKantor = ""
    dynamic var noLain = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
