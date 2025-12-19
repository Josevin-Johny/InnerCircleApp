//
//  LifestylesViewController.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import UIKit

protocol LifestylesViewControllerDelegate: AnyObject {
    func didSelectLifestyles(_ lifestyles: [String])
}

class LifestylesViewController: UIViewController {
    
    weak var delegate: LifestylesViewControllerDelegate?
    
    private let lifestyles = ["Fitness", "Travel", "Foodie", "Music", "Reading", "Gaming"]
    private var selectedLifestyles: [String] = []
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Select Lifestyles"
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -10),
            
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            doneButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func doneTapped() {
        delegate?.didSelectLifestyles(selectedLifestyles)
    }
}

extension LifestylesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifestyles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let lifestyle = lifestyles[indexPath.row]
        cell.textLabel?.text = lifestyle
        cell.accessoryType = selectedLifestyles.contains(lifestyle) ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let lifestyle = lifestyles[indexPath.row]
        
        if let index = selectedLifestyles.firstIndex(of: lifestyle) {
            selectedLifestyles.remove(at: index)
        } else {
            selectedLifestyles.append(lifestyle)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
