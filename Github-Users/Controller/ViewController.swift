//
//  ViewController.swift
//  Github-Users
//
//  Created by Darshil Agrawal on 11/05/21.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var mainViewModel = MainViewModel()
    let refresh = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        tableView.refreshControl = refresh
        mainViewModel.fetchData()
        checkBindings()
        setUpBack()
        refresh.addTarget(self, action: #selector(refreshPulled), for: .valueChanged)
        self.title = "Github Users"
    }
    @objc func refreshPulled(refreshControl: UIRefreshControl){
        refreshControl.beginRefreshing()
        let font=UIFont.systemFont(ofSize: 15)
        let color=UIColor.systemGray3
        let attributes=[NSAttributedString.Key.font:font,NSAttributedString.Key.foregroundColor:color]
        refreshControl.attributedTitle = NSAttributedString(string: "Loading Users",attributes: attributes)
        mainViewModel.fetchedUser = []
        mainViewModel.fetchData()
        checkBindings()
    }
    
    func setUpBack(){
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "chevron.backward")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)

        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.backward")
        self.navigationController?.navigationBar.tintColor = .black
    }
    func checkBindings(){
        mainViewModel.succesBindingToVC = {
            DispatchQueue.main.async {
                self.refresh.endRefreshing()
                self.tableView.reloadData()
            }
        }
        
        mainViewModel.failedBindingToVC = {
            let alert = UIAlertController(title: "Check Connectivity", message: "No Stable Connection Found", preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry", style: .default) { UIAlertAction in
                self.mainViewModel.fetchData()
            }
            alert.addAction(retryAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

// MARK: Table View Delegate Components
extension ViewController:UITableViewDataSource  , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.fetchedUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! CustomTableViewCell
        cell.userDataObject = mainViewModel.fetchedUser[indexPath.row]
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == mainViewModel.fetchedUser.count-1{
            mainViewModel.since=mainViewModel.since+20
            mainViewModel.fetchData()
            
        }
    }

}

// MARK: Preparation for Segues

extension ViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath=tableView.indexPathForSelectedRow
        
        let showDetailsController = segue.destination as! ShowDetailsController
        if let index = indexPath?.row {
            showDetailsController.login=mainViewModel.fetchedUser[index].login
            showDetailsController.imageValue=mainViewModel.fetchedUser[index].avatar_url
        }
    }
}
