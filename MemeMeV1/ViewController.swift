//
//  ViewController.swift
//  MemeMeV1
//
//  Created by Yu-Jen Chang on 6/26/17.
//  Copyright © 2017 Yu-Jen Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var ImagePickView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    let imagePickerView = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imagePickerView.delegate = self
        self.topTextField.delegate = self
        self.bottomTextField.delegate = self
        setDefaultTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // diabled camera button if no camera available
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }

    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        presentImagePicker(.photoLibrary)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        presentImagePicker(.camera)
    }
    
    // present image picker for different sourceType
    func presentImagePicker(_ source: UIImagePickerControllerSourceType) {
        imagePickerView.sourceType = source
        self.present(imagePickerView, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.ImagePickView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // clear default text when user tap textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setDefaultTextField() {
        self.topTextField.defaultTextAttributes = memeTextAttributes
        self.bottomTextField.defaultTextAttributes = memeTextAttributes
        self.topTextField.borderStyle = .none
        self.bottomTextField.borderStyle = .none
        self.topTextField.text = "TOP"
        self.bottomTextField.text = "BOTTOM"
        self.topTextField.textAlignment = .center
        self.bottomTextField.textAlignment = .center
    }
    
    // textField attributes
    let memeTextAttributes: [String:Any] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        // a zero value for stroke width indicates fill with no stroke
        // a positive value makes a stroke with no fill
        // a negative value for stroke width creates both a fill and stroke
        NSStrokeWidthAttributeName: NSNumber(value: -5.0)
        
    ]

}

