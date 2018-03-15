//
//  ConfigViewController.swift
//  Pensamentos
//
//  Created by Usuário Convidado on 14/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    //MARK: - Lets and Vars
    let config = Configuration.shared
    
    //MARK: - IBOutlets
    @IBOutlet weak var autorefreshSwitch: UISwitch!
    @IBOutlet weak var timeIntervalLabel: UILabel!
    @IBOutlet weak var timeIntervalSlider: UISlider!
    @IBOutlet weak var colorSchemeSegmentedControl: UISegmentedControl!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        formatView()
    }
    
    //MARK: - Custom Methods
    func formatView() {
        autorefreshSwitch.setOn(config.autorefresh, animated: false)
        timeIntervalSlider.setValue(Float(config.timeInterval), animated: false)
        colorSchemeSegmentedControl.selectedSegmentIndex = config.colorScheme
        changeTimeIntervalLabel(with: config.timeInterval)
    }
    
    func changeTimeIntervalLabel(with value: Double) {
        timeIntervalLabel.text = "Mudar após \(Int(value)) segundos"
    }
    
    //MARK: - IBActions
    @IBAction func changeAutorefresh(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLabel(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }

    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
