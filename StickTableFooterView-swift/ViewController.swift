//
//  ViewController.swift
//  StickTableFooterView-swift
//
//  Created by Phil Chang on 2022/7/13.
//  Copyright © 2022 . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Constants {
        static let innerViewHeight: CGFloat = 80
        static let settingsButtonHeight: CGFloat = 40
    }

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInsetAdjustmentBehavior = .never
        let innerView = ViewWithOutboundsButtons(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Constants.innerViewHeight))
        innerView.backgroundColor = .yellow
        innerView.translatesAutoresizingMaskIntoConstraints = false

        let tableFooterView = ViewWithOutboundsButtons(frame: innerView.frame)
        self.tableView.tableFooterView = tableFooterView
        self.tableView.tableFooterView?.backgroundColor = .red

        let footerViewTitle = UILabel()
        footerViewTitle.translatesAutoresizingMaskIntoConstraints = false
        footerViewTitle.text = "The Footer View"
        innerView.addSubview(footerViewTitle)

        NSLayoutConstraint.activate([
            footerViewTitle.topAnchor.constraint(equalTo: innerView.topAnchor),
            footerViewTitle.bottomAnchor.constraint(equalTo: innerView.bottomAnchor),
            footerViewTitle.leftAnchor.constraint(equalTo: innerView.leftAnchor),
            footerViewTitle.rightAnchor.constraint(equalTo: innerView.rightAnchor)
        ])

        let settingsButton = UIButton(type: .system)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.setTitle("Setting", for: .normal)
        settingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        settingsButton.backgroundColor = .clear
        settingsButton.addTarget(self, action: #selector(didClickSettingsButton), for: .touchUpInside)
        innerView.addSubview(settingsButton)

        NSLayoutConstraint.activate([
            settingsButton.rightAnchor.constraint(equalTo: innerView.rightAnchor, constant: -28),
            settingsButton.bottomAnchor.constraint(equalTo: innerView.bottomAnchor),
            settingsButton.heightAnchor.constraint(equalToConstant: Constants.settingsButtonHeight)
        ])

        tableFooterView.addSubview(innerView)
        NSLayoutConstraint.activate([
            innerView.leftAnchor.constraint(equalTo: tableFooterView.leftAnchor),
            innerView.rightAnchor.constraint(equalTo: tableFooterView.rightAnchor),
            innerView.bottomAnchor.constraint(equalTo: tableFooterView.bottomAnchor),
            innerView.bottomAnchor.constraint(greaterThanOrEqualTo: self.view.bottomAnchor),
            innerView.heightAnchor.constraint(equalToConstant: Constants.innerViewHeight)
        ])
    }
}

extension ViewController {
    @IBAction func didClickSettingsButton() {
        NSLog("didClickSettingsButton")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
}
