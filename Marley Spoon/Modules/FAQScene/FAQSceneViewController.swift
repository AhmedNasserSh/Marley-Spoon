//
//  FAQSceneViewController.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import UIKit

class FAQSceneViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: FAQSceneTableViewCell.identifier, bundle: nil),
                               forCellReuseIdentifier: FAQSceneTableViewCell.identifier)
        }
    }
    var sectionItems = [FAQScene.FAQViewSection]()
    var interactor: FAQSceneBusinessLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        showProgess()
        self.interactor?.getFAQs()
        
    }



}
extension FAQSceneViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionItems[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FAQSceneTableViewCell.identifier, for: indexPath) as! FAQSceneTableViewCell
        cell.configure(item: sectionItems[indexPath.section].items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.sectionItems[indexPath.section].items[indexPath.row]
        self.interactor?.setExpanded(section: indexPath.section,
                                     items: self.sectionItems[indexPath.section].items,
                                     id: item.id)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionItems[section].title
    }
    
}

extension FAQSceneViewController: FAQSceneDisplayView {

    func setFAQs(items: [FAQScene.FAQViewSection]) {
        hidProgress()
        self.sectionItems = items
        self.tableView.reloadData()
    }
    func updateSection(section: Int, items: [FAQScene.FAQViewSectionItem]) {
        self.sectionItems[section].updateItems(items: items)
        self.tableView.reloadSections(IndexSet(integersIn: section...section), with: .automatic)
    }
    
    func displayError(error: NetworkError) {
        
    }
    
    
}
