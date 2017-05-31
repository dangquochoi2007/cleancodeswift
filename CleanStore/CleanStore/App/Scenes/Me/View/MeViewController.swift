//
//  MeViewController.swift
//  CleanStore
//
//  Created by hoi on 30/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

protocol MeViewControllerInput: MePresenterOutput {

}

protocol MeViewControllerOutput {
    
    func fetchPromotions(request: MeViewModel.FetchPromotion.Request)
    var promotionList: [Promotion]? { get }
}


class MeViewController: UIViewController {
    
    var output: MeViewControllerOutput!
    var router: MeRouterProtocol!
    
    var displayedPromotionsList: [MeViewModel.FetchPromotion.ViewModel.DisplayedPromotion] = []
    
    @IBOutlet weak var meTableView: UITableView!
    
    
    // MARK: - Initializers
    init(configurator: MeConfigurator = MeConfigurator.sharedInstance) {
        super.init(nibName: "MeViewController", bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    
    // MARK: - Configurator
    private func configure(configurator: MeConfigurator = MeConfigurator.sharedInstance) {
        configurator.configure(viewController: self)
    }
    
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configureTableViewOnLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Load data
    func doSomethingOnLoad() {
        // TODO: Ask the Interactor to do some work

    }
    
}


// MARK: - iBeaconPresenterOutput

extension MeViewController: MeViewControllerInput {
    
    
    // MARK: - Display logic
    
    func displaySomething(viewModel: MeViewModel) {
        
        // TODO: Update UI
    }
}

// MARK: - Me TableView DataSource & Delegate

extension MeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    // load config default for tableview
    func configureTableViewOnLoad() {
        meTableView.delegate = self
        meTableView.dataSource = self
        meTableView.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        meTableView.register(MeTableViewCell.nib, forCellReuseIdentifier: MeTableViewCell.nibName)
        meTableView.contentInset.top = UIApplication.shared.statusBarFrame.height
        meTableView.estimatedRowHeight = 85.0
        meTableView.rowHeight = UITableViewAutomaticDimension
        automaticallyAdjustsScrollViewInsets = false
    }

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MeTableViewCell.nibName, for: indexPath) as! MeTableViewCell
        
        return cell
    }
}
