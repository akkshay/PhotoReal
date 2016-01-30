//
//  PostImageViewController.swift
//  PhotoReal
//
//  Created by Akkshay Khoslaa on 1/14/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import UIKit
import Parse
class PostImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var selectButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
        effectView.frame = self.view.frame
        backgroundImageView.clipsToBounds = true
        backgroundImageView.addSubview(effectView)
        
        selectButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectImage(sender: AnyObject) {
        let image = UIImagePickerController()
        
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        //Once the user has chosen the image, the imageView in our viewcontroller gets this image.
        postImageView.image = image
        
    }
    
    @IBAction func postImage(sender: AnyObject) {
        var imageObject = PFObject(className: "Images")
        imageObject["createdBy"] = PFUser.currentUser()?.username
        imageObject["image"] = PFFile(data: UIImageJPEGRepresentation(postImageView.image!, 0.5)!)
        imageObject.saveInBackgroundWithTarget(nil, selector: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
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
