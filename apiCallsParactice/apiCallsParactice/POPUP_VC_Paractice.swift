//
//  POPUP_VC_ParacticeViewController.swift
//  apiCallsParactice
//
//  Created by Saqib Rehman on 22/11/2020.
//  Copyright © 2020 Saqib Rehman. All rights reserved.
//

import UIKit

class POPUP_VC_Paractice: UIViewController {

    @IBOutlet var contentView : UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewAppeared()
    }
    
    func viewAppeared(){
        
        let gestViewTapped = UITapGestureRecognizer(target: self , action: #selector(objc_viewTapped))
        self.view.addGestureRecognizer( gestViewTapped )
        self.view.alpha = 0
        self.view.transform = CGAffineTransform(scaleX: 1.3 , y: 1.3 )
        UIView.animate(withDuration: 0.25 ) {
            self.view.transform = CGAffineTransform(scaleX: 1 , y: 1 )
            self.view.alpha = 1
        }
    }
    
    @IBAction func close(){
        
        closeAnimation()
        
    }

    
    func closeAnimation(){
        
        UIView.animate(withDuration: 0.25
            , animations: {
                self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3 )
                self.view.alpha = 0
            }) { (done) in
                self.removeFromParent()
            }
        }
    
    @objc func objc_viewTapped(){
        closeAnimation()
    }
    

}
