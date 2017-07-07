//
//  ViewController.swift
//  dynamicCells
//
//  Created by Erick Lui on 7/6/17.
//  Copyright © 2017 Erick Lui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var tasks = [
    "Something cool",
    "Something VERY cool",
    "Something EXTREMELY cool"
  ]
  
  @IBOutlet weak var taskTextField: UITextField!
  @IBOutlet weak var tableView: UITableView!
  
  @IBAction func beastButtonPressed(_ sender: UIButton) {
//    print(taskTextField?.text ?? "Text field is nil")
    if let text = taskTextField.text {
      if text.characters.count > 0 {
        tasks.append(text)
        taskTextField.text = ""
        print(tasks)
        tableView.reloadData()
      }
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Tell tableview to ask this ViewController the two questions
    tableView.dataSource = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController: UITableViewDataSource {
  // UITableViewDataSource protocol needed when data in table is dynamic
  // ViewController will be our delegate, and it must answer 2 questions
  // How many cells do we need?
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // return an integer that indicates how many rows (cells) to draw
    return tasks.count
  }
  // How should I create each cell?
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Get the UITableViewCell and create/populate it with data then return it
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    cell.textLabel?.text = tasks[indexPath.row]
    return cell
  }
}
