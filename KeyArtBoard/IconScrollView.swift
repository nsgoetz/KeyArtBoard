//
//  IconScrollView.swift
//  KeyArtBoardApp
//
//  Created by Noah Goetz on 9/28/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class IconScrollView: UIScrollView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}
