//
//  CardsTableViewController.swift
//  cards
//
//  Created by hyperactive on 02/12/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class CardsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   //     Translate.translates = []
        let cellNib = UINib(nibName: "Card", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "Cell")
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StorgeOfWords.words.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath) as! CardTableViewCell
        cell.cardView.word.text = StorgeOfWords.words[indexPath.row]
        Translate.getTranslate(withWord: StorgeOfWords.words[indexPath.row]){ (word) in
            DispatchQueue.main.async {
                cell.cardView.translate.text! = word
                //self.tableView.reloadData()
            }
        }
        
        return cell
    }
    
   

}
