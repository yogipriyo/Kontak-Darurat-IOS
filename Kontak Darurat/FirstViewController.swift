//
//  FirstViewController.swift
//  Kontak Darurat
//
//  Created by yogi prayogo on 3/2/16.
//  Copyright © 2016 DIUI. All rights reserved.
//

import UIKit
import RealmSwift

class FirstViewController: UIViewController {
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var KTPField: UITextField!
    @IBOutlet weak var BPJSField: UITextField!
    @IBOutlet weak var NoIbuField: UITextField!
    @IBOutlet weak var NoBapakField: UITextField!
    @IBOutlet weak var NoKantorField: UITextField!
    @IBOutlet weak var NoLainField: UITextField!
    
//    var Contact = Contacts()
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let existingContact = realm.objects(Contacts)
        //print(existingContact)
        
        if existingContact.count > 0 {
            NameField.text = String(existingContact[0]["name"]!)
            KTPField.text = String(existingContact[0]["ktp"]!)
            BPJSField.text = String(existingContact[0]["bpjs"]!)
            NoIbuField.text = String(existingContact[0]["noIbu"]!)
            NoBapakField.text = String(existingContact[0]["noBapak"]!)
            NoKantorField.text = String(existingContact[0]["noKantor"]!)
            NoLainField.text = String(existingContact[0]["noLain"]!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BuatQRCode(sender: AnyObject) {
        let Contact = Contacts()
        //Contact.id = 0
        Contact.name = NameField.text!
        Contact.ktp = KTPField.text!
        Contact.bpjs = BPJSField.text!
        Contact.noIbu = NoIbuField.text!
        Contact.noBapak = NoBapakField.text!
        Contact.noKantor = NoKantorField.text!
        Contact.noLain = NoLainField.text!
        
        try! realm.write({ () -> Void in
            realm.add(Contact, update: true)
        })
        print(Contact)
    }
    
    @IBAction func SimpanQRCode(sender: AnyObject) {
        
    }

}

