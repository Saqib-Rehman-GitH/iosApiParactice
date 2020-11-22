//
//  ViewController.swift
//  apiCallsParactice
//
//  Created by Saqib Rehman on 22/11/2020.
//  Copyright © 2020 Saqib Rehman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var counter : UILabel!
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var imageActivityIndicator : UIActivityIndicatorView!
    
    let imageUrl = "https://www.gstatic.com/images/branding/product/2x/photos_96dp.png"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doCount()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func fetchImage(){
    
        //downloadImage()
        fetchImageFromURLSession()
    }
    
    func fetchImage2(){
        
        
    }

    func downloadImage (){
        
        self.imageActivityIndicator.startAnimating()
        DispatchQueue.global(qos: .userInteractive).async {
            
            let convertedUrlFromString = URL(string: self.imageUrl)
            do {
                
                let imageDataDownloadedFromUrl = try Data(contentsOf: convertedUrlFromString!)
                
                
                let Image  = UIImage(data: imageDataDownloadedFromUrl )
                
                DispatchQueue.main.async {
                        self.imageView.image = Image
                        self.imageActivityIndicator.stopAnimating()
                }
                
            }catch let _ {
                
                print("caught Some Error")
                
            }
            
        }
        
    }//DOWNLOAD IMAGE

    func doCount(){
        
        var i  = 0
        DispatchQueue.global(qos: .userInitiated ).async {
            repeat {
                
                usleep( 500 )
                i += 1
                DispatchQueue.main.async {
                    self.counter.text = "\(i)"
                }
                
            }while true
        }
        
    }
    
    func fetchImageFromURLSession (){
        
        let convertedUrlFromString = URL(string: self.imageUrl)
        URLSession.shared.dataTask(with: convertedUrlFromString! ){data ,response ,err in
            guard let res = response as? HTTPURLResponse else {
                return
            }
            
            switch res.statusCode {
            case 200 :
                
                guard let imageData = data  else { return }
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData )
                }
                
            default:
                print("case Default")
            }
            
        }//session
        .resume()
    }
    
    @IBAction func gotToSecondController () {
        
        let vc = storyboard?.instantiateViewController(identifier: "VC_SecondView")
        vc?.modalPresentationStyle = .fullScreen
        guard let evc = vc else { return }
        present( evc , animated: true , completion: nil )
        
    }
    
}

