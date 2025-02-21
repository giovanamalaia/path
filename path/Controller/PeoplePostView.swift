//
//  PeoplePostView.swift
//  path
//
//  Created by Gabriela Azulay Lewin on 13/02/25.
//

import Foundation
import UIKit

class PeoplePostView: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarPeople: UISearchBar!
    @IBOutlet weak var tableViewPeople: UITableView!
    
    var filteredContactList: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewPeople.delegate = self
        tableViewPeople.dataSource = self
        searchBarPeople.delegate = self
        
        let personXib = UINib(nibName: "PersonCellView", bundle: nil)
        tableViewPeople.register(personXib, forCellReuseIdentifier: "PersonCellView")
        
        filteredContactList = PeopleData.peopleList 
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredContactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCellView", for: indexPath) as? PersonCellView else {
            return UITableViewCell()
        }
        
        let person = filteredContactList[indexPath.row]
        cell.contactName.text = person.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedPerson = filteredContactList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let writePostVC = storyboard.instantiateViewController(withIdentifier: "WritePostView") as? WritePostView {
            writePostVC.selectedPerson = selectedPerson 
            navigationController?.pushViewController(writePostVC, animated: true)
        }
    }

    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredContactList = PeopleData.peopleList
        } else {
            filteredContactList = PeopleData.peopleList.filter { person in
                person.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableViewPeople.reloadData()
    }
}
