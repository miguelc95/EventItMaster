//
//  RegistrarViewController.swift
//  EventItMaster
//
//  Created by Miguel Cuellar on 4/17/16.
//  Copyright © 2016 Miguel Cuellar. All rights reserved.
//

import UIKit

class RegistrarViewController: UIViewController {

    @IBOutlet weak var Nombre: UITextField!
    @IBOutlet weak var Apellido: UITextField!
    @IBOutlet weak var Correo: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var PasswordRepetido: UITextField!
    
    @IBOutlet weak var Genero: UISegmentedControl!
    @IBOutlet weak var gen : UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func Registrar(sender: AnyObject) {
       
        let request = NSMutableURLRequest(URL: NSURL(string: "http://softitution.mx/registrar.php")!)
        request.HTTPMethod = "POST"
        let postString = "a=\(Correo.text!)&b=\(Password.text!)&c=\(Nombre.text!)&d=\(Apellido.text!)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            else{
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
                
                let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("EventosViewController") as! EventosViewController
                
                self.navigationController!.pushViewController(secondViewController, animated: true)
            }
        }
        task.resume()
        
        
        
        
        
    }

    func displayMyAlertMessage(userMessage:String){
        var myAlert=UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction=UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
