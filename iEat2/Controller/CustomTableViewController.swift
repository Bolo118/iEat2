//
//  CustomTableViewController.swift
//  iEat2
//
//  Created by Adithep on 6/24/20.
//  Copyright © 2020 Adithep. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {

    static var foodList = ["Pizza", "Sushi", "Cheeseburger", "Burrito", "Suki-Yaki"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return CustomTableViewController.foodList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)
        cell.textLabel?.text = CustomTableViewController.foodList[indexPath.row]
        return cell
    }
    
    // delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alert = UIAlertController(title: "Edit or Delete", message: " ", preferredStyle: .alert)
        
        let edit = UIAlertAction(title: "Edit Food", style: .default) { (action) in
            var textField = UITextField()
            
            let alert = UIAlertController(title: "Edit the Food's list", message: " ", preferredStyle: .alert)
            
            let edit = UIAlertAction(title: "Edit Food", style: .default) { (action) in
                CustomTableViewController.foodList[indexPath.row] = textField.text!
                MainViewController.foodList[indexPath.row] = textField.text!
                self.tableView.reloadData()
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
                self.dismiss(animated: true, completion: nil)
            }
            
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "Edit New Item.."
                textField = alertTextField
            }
            
            alert.addAction(edit)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        let delete = UIAlertAction(title: "Delete Food", style: .default) { (action) in
            
            let alert = UIAlertController(title: "Delete the Food from the list", message: " ", preferredStyle: .alert)
            
            let delete = UIAlertAction(title: "Delete Food", style: .default) { (action) in
                CustomTableViewController.foodList.remove(at: indexPath.row)
                MainViewController.foodList.remove(at: indexPath.row)
                self.tableView.reloadData()
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
                self.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(delete)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(delete)
        alert.addAction(edit)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Food", message: " ", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Food", style: .default) { (action) in
            CustomTableViewController.foodList.append(textField.text!)
            MainViewController.foodList.append(textField.text!)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Item.."
            textField = alertTextField
        }
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
