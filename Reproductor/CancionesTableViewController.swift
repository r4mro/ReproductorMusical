//
//  CancionesTableViewController.swift
//  Reproductor
//
//  Created by Ricardo Roman Landeros on 26/12/15.
//  Copyright © 2015 lagunahack. All rights reserved.
//

import UIKit

class CancionesTableViewController: UITableViewController {
    
    var canciones = ["Ganas - Apache", "Hay Yo Vengo - Chicos de Barrio", "Baila Conmigo - Mentira"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return canciones.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        let tocarCancion = canciones[indexPath.row]
        cell.textLabel?.text = tocarCancion

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    func seleccionCancion() -> (String, String, String)
    {
        var cancion = "Ganas"
        var inter = "Apache"
        var image = "apache"
        
        let seleccion = canciones[(tableView.indexPathForSelectedRow?.row)!]
        print(seleccion)
        switch seleccion
        {
            case "Ganas - Apache":
                cancion = "Ganas"
                inter = "Apache"
                image = "apache.jpg"
                return (cancion, inter, image)
            case "Hay Yo Vengo - Chicos de Barrio":
                cancion = "Hay Yo Vengo"
                inter = "Chicos de Barrio"
                image = "chicos.jpg"
                return (cancion, inter, image)
            case "Baila Conmigo - Mentira":
                cancion = "Baila Conmigo"
                inter = "Mentira"
                image = "mentira.jpg"
                return (cancion, inter, image)
        default:
            return (cancion, inter, image)
        }
        
        //return (cancion, inter, image)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let tuplaCancion = seleccionCancion()
        let segue = segue.destinationViewController as! DetalleViewController
        segue.nombreCancion = tuplaCancion.0
        segue.nombreInter = tuplaCancion.1
        segue.nombreImagen = tuplaCancion.2
        
    }


}
