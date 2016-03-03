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
    
    dynamic var name = ""
    dynamic var ktp = ""
    dynamic var bpjs = ""
    dynamic var noIbu = ""
    dynamic var noBapak = ""
    dynamic var noKantor = ""
    dynamic var noLain = ""
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
