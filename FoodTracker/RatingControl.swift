//
//  RatingControl.swift
//  FoodTracker
//
//  Created by xuzepei on 15/12/8.
//  Copyright © 2015年 xuzepei. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: Properties
    var rating = 0{
        
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]();
    var spacing:CGFloat = 5
    var starCount = 5
    
    //MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        let emptyStar = UIImage(named: "emptyStar");
        let filledStar = UIImage(named: "filledStar");
        
        
        for i in 0..<starCount{
            
            let x = CGFloat(i)*self.frame.size.height;
            let button = UIButton(frame: CGRectMake(x, 0, self.frame.size.height, self.frame.size.height))
            //button.backgroundColor = UIColor.greenColor();
            button.setImage(emptyStar, forState: .Normal)
            button.setImage(filledStar, forState: .Highlighted)
            button.setImage(filledStar, forState: .Selected)
            button.setImage(filledStar, forState: [.Selected,.Highlighted])
            button.adjustsImageWhenHighlighted = false;
            button.addTarget(self, action:"ratingButtonTapped:", forControlEvents:.TouchDown)
            self.addSubview(button);
            
            ratingButtons.append(button);
        }
        
        
    }
    
    override func layoutSubviews() {
        
        let buttonSize = CGFloat(self.frame.size.height);
        var buttonFrame = CGRectMake(0, 0, buttonSize, buttonSize);
        
        for (index,button) in ratingButtons.enumerate(){
            
            buttonFrame.origin.x = CGFloat(CGFloat(index) * (buttonSize + self.spacing));
            button.frame = buttonFrame;
        }
        
        self.updateButtonSelectionStates();
    }
    
    override func intrinsicContentSize() -> CGSize {
        
        let buttonSize:CGFloat = self.frame.size.height;
        return CGSizeMake((buttonSize+spacing)*CGFloat(starCount) - spacing, buttonSize);
    }
    
    //MARK: - Button Actions
    func ratingButtonTapped(button:UIButton){
        print("Button pressed")
        
        let index = ratingButtons.indexOf(button);
        if index == 0 && button.selected == true && self.rating == 1{
            self.rating = 0;
            //self.updateButtonSelectionStates();
            return;
        }
        
        rating = ratingButtons.indexOf(button)! + 1;
        
        //self.updateButtonSelectionStates();
    }
    
    func updateButtonSelectionStates(){
        
        for (index,button) in ratingButtons.enumerate(){
        
            button.selected = index < rating;
        }
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
