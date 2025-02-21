//
//  PlacePostView.swift
//  path
//
//  Created by Gabriela Azulay Lewin on 13/02/25.
//

import Foundation
import UIKit


class PlacePostView: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarPlace: UISearchBar!
    @IBOutlet weak var tableViewPlace: UITableView!
    
    var filteredPlaceList: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewPlace.delegate = self
        tableViewPlace.dataSource = self
        searchBarPlace.delegate = self
        
        let placeXib = UINib(nibName: "PlaceCellView", bundle: nil)
        tableViewPlace.register(placeXib, forCellReuseIdentifier: "PlaceCellView")
        
        filteredPlaceList = PlaceData.placeList
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPlaceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCellView", for: indexPath) as? PlaceCellView else {
            return UITableViewCell()
        }
        
        let place = filteredPlaceList[indexPath.row]
        cell.placeName.text = place.name
        cell.placeAddress.text = place.address
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let writePostVC = storyboard.instantiateViewController(withIdentifier: "WritePostView") as? WritePostView {
            writePostVC.selectedPlace = filteredPlaceList[indexPath.row] 
            navigationController?.pushViewController(writePostVC, animated: true)
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredPlaceList = PlaceData.placeList
        } else {
            filteredPlaceList = PlaceData.placeList.filter { place in
                place.name.lowercased().contains(searchText.lowercased()) ||
                place.address.lowercased().contains(searchText.lowercased())
            }
        }
        tableViewPlace.reloadData()
    }
}

