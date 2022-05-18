//
//  ViewController.swift
//  iQuiz
//
//  Created by Patricia Ma on 5/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tappedSetting: UIBarButtonItem!
    
    let categories = ["Mathematics", "Marvel Super Heroes", "Science"]
    let descriptions = ["A quiz about mathematics!", "Do you like Marvel?", "Science quiz time!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func settings () {
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {action in print("Settings tapped")}))
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped on the cell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell",
                                                 for: indexPath) as! CustomCell
        cell.TitleView.text = categories[indexPath.row]
        cell.DescriptionView.text = descriptions[indexPath.row]
        let category = categories[indexPath.row]
        cell.ImageView.image = UIImage(named: category)
        return cell
    }
}
