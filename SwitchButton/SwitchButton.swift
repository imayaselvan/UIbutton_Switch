//
//  SwitchButton.swift
//
//  Created by imayaselvan on 1/12/16.
//  Copyright © 2016 Xome. All rights reserved.
//

import UIKit

class SwitchButton: UIButton {
  
    var siblingButtons: [AnyObject] = []
    
    required init(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)!

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(SwitchButton.toggleOn), forControlEvents: .TouchUpInside)

    }

    override var selected: Bool {
        willSet(newValue) {
            super.selected = newValue;
            self.userInteractionEnabled = !selected
            if selected {
                reloadSiblingsButton()
            }
        }
    }
    
    func toggleOn() {
        self.selected = true
    }
    
    func reloadSiblingsButton(){
        for i in 0..<siblingButtons.count{
            var sbutton: UIButton
            sbutton = siblingButtons[i] as! UIButton
            sbutton.selected = false;
        }
    }
}
