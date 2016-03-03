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
    
    var Contact = Contacts()
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let existingContact = realm.objects(Contacts)
        if existingContact[0]["name"] !=  nil {
            NameField.text = String(existingContact[0]["name"]!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BuatQRCode(sender: AnyObject) {
        Contact.name = NameField.text!
        Contact.ktp = KTPField.text!
        Contact.bpjs = BPJSField.text!
        Contact.noIbu = NoIbuField.text!
        Contact.noBapak = NoBapakField.text!
        Contact.noKantor = NoKantorField.text!
        Contact.noLain = NoLainField.text!
        
        try! realm.write({ () -> Void in
            realm.add(Contact)
        })
        
        let coba = realm.objects(Contacts)
        print(coba)
    }
    
    @IBAction func SimpanQRCode(sender: AnyObject) {
        
    }


}

