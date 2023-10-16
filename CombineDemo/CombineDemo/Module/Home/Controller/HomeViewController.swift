//
//  HomeViewController.swift
//  CombineDemo
//
//  Created by Santosh Kumar Singh on 18/03/23.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    private var subscribers = Set<AnyCancellable>()
    
    var homeViewMoel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupBinding()
    }
        
    private func setupBinding() {
        self.updateUIWithBinding1()
        
        self.updateUIWithBinding2()
        updateStartButtonUI()
    }
    
    private func updateUIWithBinding2() {
        subscribers = [
            homeViewMoel.$firstName.assign(to: \.text!, on: lblFirstName),
            homeViewMoel.$lastName.assign(to: \.text!, on: lblLastName),
            homeViewMoel.$address.assign(to: \.text!, on: lblAddress)
        ]
    }
    
    private func updateUIWithBinding1() {
        homeViewMoel.$firstName
            .receive(on: RunLoop.main)
            .sink { firstName in
                self.lblFirstName.text = firstName
            }.store(in: &subscribers)
        homeViewMoel.$lastName
            .receive(on: RunLoop.main)
            .sink { lastName in
                self.lblLastName.text = lastName
            }.store(in: &subscribers)
        homeViewMoel.$address
            .receive(on: RunLoop.main)
            .sink { address in
                self.lblAddress.text = address
            }.store(in: &subscribers)
    }
    
    private func updateStartButtonUI() {
        homeViewMoel.startButton.$titleForNormalState.compactMap({ $0 })
            .receive(on: RunLoop.main)
            .assign(to: \.normalTitleText, on: startButton)
            .store(in: &subscribers)
        
        homeViewMoel.startButton.$imageNameForNormalState.compactMap({ UIImage(systemName: $0 ?? "") })
            .receive(on: RunLoop.main)
            .assign(to: \.normalStateImage, on: startButton)
            .store(in: &subscribers)
        
        homeViewMoel.startButton.$backgroundColor.compactMap({ $0 })
            .receive(on: RunLoop.main)
            .assign(to: \.backgroundColor, on: startButton)
            .store(in: &subscribers)
        
        homeViewMoel.startButton.$cornorRadius.compactMap({ $0 })
            .receive(on: RunLoop.main)
            .assign(to: \.cornerRadius, on: startButton)
            .store(in: &subscribers)
        
        homeViewMoel.startButton.$isHidden.compactMap({ $0 })
            .receive(on: RunLoop.main)
            .assign(to: \.isHidden, on: startButton)
            .store(in: &subscribers)
    }
    
    @IBAction func setTiTleStartButton() {
        if startButton.currentTitle == "Start" {
            homeViewMoel.startButton.titleForNormalState = "Stop"
        } else {
            homeViewMoel.startButton.titleForNormalState = "Start"
        }
    }
    
    @IBAction func setImageStartButton() {
        if startButton.image(for: .normal) == UIImage(systemName: "trash") {
            homeViewMoel.startButton.imageNameForNormalState = "trash.slash"
        } else {
            homeViewMoel.startButton.imageNameForNormalState = "trash"
        }
    }
    
    @IBAction func setBackgroundColorStartButton() {
        if homeViewMoel.startButton.backgroundColor == .green {
            homeViewMoel.startButton.backgroundColor = .blue
        } else {
            homeViewMoel.startButton.backgroundColor = .green
        }
    }
    
    @IBAction func setCornerRadiusStartButton() {
        if startButton.layer.cornerRadius == 17.5 {
            homeViewMoel.startButton.cornorRadius = 7.0
        } else {
            homeViewMoel.startButton.cornorRadius = 17.5
        }
    }
    
    @IBAction func setIsHiddenStartButton() {
        homeViewMoel.startButton.isHidden = !startButton.isHidden
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

private typealias HomeUITextFieldDelegateHandler = HomeViewController
extension HomeUITextFieldDelegateHandler: UITextFieldDelegate {
    
    override func resignFirstResponder() -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
