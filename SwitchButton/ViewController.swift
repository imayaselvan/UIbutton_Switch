//
//  ViewController.swift
//  SwitchButton
//
//  Created by imayaselvan on 14/09/16.
//  Copyright © 2016 imayaselvan. All rights reserved.
//

import UIKit
import Cartography

class ViewController: UIViewController {

    private var btnFacebook: SwitchButton!
    private var btnTwitter: SwitchButton!
    private  var btnLinkedIn: SwitchButton!
    private var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initViews()
        initConstraints()
        
    }
    
    func initViews() {
        contentView = UIView()
        contentView.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(contentView)
        
        btnFacebook = SwitchButton()
        btnFacebook.setImage(UIImage(asset : .fb), forState: .Normal)
        btnFacebook.setImage(UIImage(asset : .fb_select), forState: .Selected)
        contentView.addSubview(btnFacebook)
        
        btnTwitter = SwitchButton()
        btnTwitter.setImage(UIImage(asset : .tw), forState: .Normal)
        btnTwitter.setImage(UIImage(asset : .tw_select), forState: .Selected)
        contentView.addSubview(btnTwitter)
        
        btnLinkedIn = SwitchButton()
        btnLinkedIn.setImage(UIImage(asset : .link), forState: .Normal)
        btnLinkedIn.setImage(UIImage(asset : .link_select), forState: .Selected)
        contentView.addSubview(btnLinkedIn)
        
        
        //Set the siblings button
        btnFacebook.siblingButtons = [btnTwitter, btnLinkedIn]
        btnTwitter.siblingButtons    = [btnFacebook, btnLinkedIn]
        btnLinkedIn.siblingButtons     = [btnTwitter, btnFacebook]
    }
    
    
    func initConstraints(){

        let margin :CGFloat = 50
        
        constrain(view, contentView ){root, content in
            content.width == root.width
            content.height == 300
            content.center == root.center
        }
        
        constrain(contentView, btnFacebook, btnTwitter,btnLinkedIn ){content, fb, tw, link in
            
            fb.width == 64
            fb.height == 64
            fb.centerY == content.centerY
            fb.left == content.left + margin
            
            tw.left == fb.right + margin
            tw.centerY == content.centerY
            tw.width == 64
            tw.height == 64
            
            link.left == tw.right + margin
            link.centerY == content.centerY
            link.width == 64
            link.height == 64
        }
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension UIImage {
    
    enum Asset: String {
        case fb = "fb"
        case fb_select = "fb_selected"
        case tw = "twitter"
        case tw_select = "twitter_selected"
        case link = "linkedIn"
        case link_select = "linkedIn_selected"

        var image: UIImage {
            return UIImage(named: self.rawValue)!
        }
    }
    
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}


