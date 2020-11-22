//
//  secondViewViewController.swift
//  apiCallsParactice
//
//  Created by Saqib Rehman on 22/11/2020.
//  Copyright © 2020 Saqib Rehman. All rights reserved.
//

import UIKit

class VC_SecondView: UIViewController {
    
    @IBOutlet var cv : UICollectionView!
    
    let urls  = ["Hello " , "Hi" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cv.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func fetchImageFromURLSession (urlString : String  , imageView : UIImageView ){
        
        let convertedUrlFromString = URL(string: urlString )
        URLSession.shared.dataTask(with: convertedUrlFromString! ){data ,response ,err in
            guard let res = response as? HTTPURLResponse else {
                return
            }
            
            switch res.statusCode {
            case 200 :
                
                guard let imageData = data  else { return }
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: imageData )
                }
                
            default:
                print("case Default")
            }
            
        }//session
        .resume()
    }

}

extension VC_SecondView : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return urls.count
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath ) as! Cell_CVCollectionViewCell
        fetchImageFromURLSession(urlString: urls[indexPath.row ], imageView: cell.imageView )
        return cell
        
    }
    
    
}
