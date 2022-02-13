 //
//  MainViewController.swift
//  TestTableViewApp
//
//  Created by Евгений Тимофеев on 13.02.2022.
//

import UIKit

class MainViewController: UITableViewController {
    var objects = [MyData(emoji: "🫀", name: "Heart", decsription: "Let's love eachother.", isFavourite: false),
                    MyData(emoji: "😎", name: "Sunglasses", decsription: "Too shiny.", isFavourite: false),
                    MyData(emoji: "🥳", name: "Party", decsription: "Do you know something 'bout YOLO?", isFavourite: false),
                    MyData(emoji: "🐐", name: "Goat", decsription: "I'm pushin' P", isFavourite: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

  
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.title = "Test App"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainViewCell
        let objectCons = objects[indexPath.row]
        cell.setValue(objectCons: objectCons)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete
        }

    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObj = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedObj, at: destinationIndexPath.row)
        tableView.reloadData()
    }
        
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
                objects.remove(at: indexPath.row)
                tableView.deleteRows(at:  [indexPath], with: .fade)
            
        }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let fav = makeFavAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done, fav])
    }
    func doneAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Done") { (action, view, completion)  in
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
            
        }
        action.backgroundColor = .systemGreen
       // action.image = .checkmark
        return action
    }
    
    
    func makeFavAction(at indexPath: IndexPath) -> UIContextualAction {
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Favourite") { (action, view, completion) in
            object.isFavourite = !object.isFavourite
            self.objects[indexPath.row] = object
            completion(true)
        }
        action.backgroundColor = object.isFavourite ? .systemPurple : .systemBlue
        action.image = UIImage.init(systemName: "heart")
        return action
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "SaveSegue" else {return}
        
        let sourceVC = segue.source as! NewItemViewController
        let emoji = sourceVC.emoji
        let newIndexPath = IndexPath(row: objects.count, section: 0)
        objects.append(emoji)
      
        tableView.insertRows(at: [newIndexPath], with: .fade)
        
    }
}
