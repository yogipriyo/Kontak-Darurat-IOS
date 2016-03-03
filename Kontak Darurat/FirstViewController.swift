//
//  FirstViewController.swift
//  Kontak Darurat
//
//  Created by yogi prayogo on 3/2/16.
//  Copyright © 2016 DIUI. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

class FirstViewController: UIViewController {
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var KTPField: UITextField!
    @IBOutlet weak var BPJSField: UITextField!
    @IBOutlet weak var NoIbuField: UITextField!
    @IBOutlet weak var NoBapakField: UITextField!
    @IBOutlet weak var NoKantorField: UITextField!
    @IBOutlet weak var NoLainField: UITextField!
    @IBOutlet weak var QRCodeImage: UIImageView!
    
    var BaseUrl = "http://chart.apis.google.com/chart?cht=qr&chs=400x600&chld=M&choe=UTF-8&chl="
    var ParamsSequences = ""
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
        
        if NameField.text != "" {
            self.ParamsSequences += "Nama : \(NameField.text!)\n"
            
            if KTPField.text != ""{
                self.ParamsSequences += "KTP : \(KTPField.text!)\n"
            }
            if BPJSField.text != ""{
                self.ParamsSequences += "BPJS : \(BPJSField.text!)\n"
            }
            if NoIbuField.text != ""{
                self.ParamsSequences += "No.Tlp Ibu/Istri : \(NoIbuField.text!)\n"
            }
            if NoBapakField.text != ""{
                self.ParamsSequences += "No.Tlp Bapak/Suami : \(NoBapakField.text!)\n"
            }
            if NoKantorField.text != ""{
                self.ParamsSequences += "No.Tlp Kantor : \(NoKantorField.text!)\n"
            }
            if NoLainField.text != ""{
                self.ParamsSequences += "No.Tlp Lain : \(NoLainField.text!)\n"
            }
            
            let EscapedParams = self.ParamsSequences.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
            let FinalUrl = self.BaseUrl+EscapedParams!
            let imageUrl:NSURL? = NSURL(string: FinalUrl)
            if let url = imageUrl{
                QRCodeImage.sd_setImageWithURL(url)
            }
            print(FinalUrl)
        } else {
            errorPopUp("Mohon isi kolom nama")
        }
    }
    
    @IBAction func SimpanQRCode(sender: AnyObject) {
        
    }
    
    func errorPopUp(errorMessage: String!){
        let alert = UIAlertController(title: "Sorry!", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

