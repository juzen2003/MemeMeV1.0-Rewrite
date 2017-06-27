//
//  ViewController.swift
//  MemeMeV1
//
//  Created by Yu-Jen Chang on 6/26/17.
//  Copyright © 2017 Yu-Jen Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImagePickView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        let imagePickerView = UIImagePickerController()
        imagePickerView.delegate = self
        imagePickerView.sourceType = source
        self.present(imagePickerView, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            self.ImagePickView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
 

}

