//
//  NewItemViewController.swift
//  TestTableViewApp
//
//  Created by Евгений Тимофеев on 13.02.2022.
//

import UIKit

class NewItemViewController: UITableViewController {
    
    var emoji = MyData(emoji: "", name: "", decsription: "", isFavourite: false)
    
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
    }
    
    private func updateSaveButton() {
        let emojiText = emojiTextField.text ?? ""
        let titleText = titleTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !titleText.isEmpty && !descriptionText.isEmpty
    }

    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "SaveSegue" else {return }
        let emoji = emojiTextField.text ?? ""
        let name = titleTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        self.emoji = MyData(emoji: emoji, name: name, decsription: description, isFavourite: self.emoji.isFavourite)
        
    }
}
