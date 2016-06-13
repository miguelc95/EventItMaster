//
//  EventosViewController.swift
//  EventItMaster
//
//  Created by Miguel Cuellar on 4/17/16.
//  Copyright © 2016 Miguel Cuellar. All rights reserved.
//
import Foundation
import WebKit
import UIKit

class EventosViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    var values:NSArray=[]

   
    override func viewDidLoad() {
        super.viewDidLoad()
        get()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func get(){
        let url=NSURL(string: "http://softitution.mx/obtener.php")
        let data = NSData(contentsOfURL: url!)
        values = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        table.reloadData()
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return values.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell=table.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath) as! SpecialCell
        let maindata = values[indexPath.row]
        cell.Nombre.text=maindata["Nombre"] as? String
        cell.Tipo.text=maindata["Tipo"] as? String
        cell.Descripcion.text=maindata["Descripcion"] as? String
        return cell
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
