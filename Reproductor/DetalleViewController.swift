//
//  DetalleViewController.swift
//  Reproductor
//
//  Created by Ricardo Roman Landeros on 26/12/15.
//  Copyright © 2015 lagunahack. All rights reserved.
//

import UIKit
import AVFoundation

class DetalleViewController: UIViewController {

    @IBOutlet weak var slaiderVolumen: UISlider!
    
    @IBOutlet weak var ImageV: UIImageView!
    
    @IBOutlet weak var textCancion: UILabel!
    @IBOutlet weak var textInterprete: UILabel!
    
    var arrayCancion = [String]()
    var nombreCancion: String = ""
    var nombreInter: String = ""
    var nombreImagen: String = ""
    
    private var reproductor: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(nombreCancion)
        print(nombreInter)
        textCancion.text = nombreCancion
        textInterprete.text = nombreInter
        ImageV.image = UIImage(named: nombreImagen)
        
        let URLCancion = NSBundle.mainBundle().URLForResource(nombreCancion, withExtension: "mp3")
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: URLCancion!)
        }catch
        {
            print("error al abrir el archivo")
        }
        
        reproductor.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func pause(sender: UIButton) {
        if reproductor.playing
        {
            reproductor.pause()
        }
    }
    @IBAction func play() {
        
        if !reproductor.playing
        {
            reproductor.play()
        }
    }
    
    @IBAction func stop(sender: UIButton) {
        
        if reproductor.playing
        {
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    
    @IBAction func cambirVolumen(sender: UISlider) {
        reproductor.volume = sender.value
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
