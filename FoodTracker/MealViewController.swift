//
//  MealViewController.swift
//  FoodTracker
//
//  Created by xuzepei on 15/12/3.
//  Copyright © 2015年 xuzepei. All rights reserved.
//

import UIKit

class MealViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    //MARK: Properties
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    //MARK: Actions
    @IBAction func clickedCancelButton(sender: UIBarButtonItem) {
        
        NSLog(__FUNCTION__);
        
        let isPresentingInAddMealMode = self.presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode{
            self.dismissViewControllerAnimated(true, completion:nil);
        }else{
            self.navigationController!.popViewControllerAnimated(true)
        }
        
    }
    
    @IBAction func clickedSaveButton(sender: UIBarButtonItem) {

    }
    
    @IBAction func clickedImageView(sender: UITapGestureRecognizer) {
        
        self.nameTextField.resignFirstResponder();
        
        let picker = UIImagePickerController();
        picker.delegate = self;
        picker.sourceType = .PhotoLibrary;
        self.presentViewController(picker, animated: true, completion: nil);
    }
    
    @IBAction func clickedButton(sender: UIButton) {
    }
    
    //MARK: Navigation
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender{
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            meal = Meal(name:name, photo: photo, rating: rating)
        }
    }
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.delegate = self;
        
        if self.meal != nil{
            self.updateContent(self.meal!)
        }
        
        self.checkValidMealName();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField .resignFirstResponder();
        
        return true;
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.saveButton.enabled = false;
    }

    func textFieldDidEndEditing(textField: UITextField)
    {
        self.checkValidMealName();
        
        self.navigationItem.title = self.nameTextField.text;
    }
    
    //MARK: - UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage;
        
        self.photoImageView.image = selectedImage;
        
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func checkValidMealName()
    {
        let name = self.nameTextField.text ?? ""
        self.saveButton.enabled = !name.isEmpty
    }
    
    func updateContent(meal:Meal){
        
        self.nameTextField.text = meal.name;
        self.photoImageView.image = meal.photo;
        self.ratingControl.rating = meal.rating;
    }
}

