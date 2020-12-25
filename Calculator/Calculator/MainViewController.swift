import UIKit

// TODO: -1. Label can contain max: "999 999 999", if number is bigger it has to be turned into "7.901235e29" and operate with it. If anything wrong, just frop error to screen, that possible to delete with AC. As bigger number as smaller Fonts size comes <- need to do it flexible

class MainViewController: UIViewController {
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var allButtons: [CalcButton]!
    
    // MARK: Properties:
    
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods:
    private func setupUI() {
        setupApplicationBackground()
        setupLabelUIFor(resultLabel)
        setupButtonUIFor(allButtons)
    }
    
    private func setupApplicationBackground() {
        backgroundView.backgroundColor = Colors.applicationBackgroundColor
    }
      
    private func setupLabelUIFor(_ label: UILabel) {
        label.textColor = CalcLabelDTO.resultLabelActive.fontColor
        label.font = UIFont.systemFont(ofSize: CalcLabelDTO.resultLabelActive.fontSize)
    }
    
    private func setupButtonUIFor(_ buttons: [CalcButton]) {
        for button in buttons {
            createTitleFor(button)
        }
    }
    
    private func createTitleFor(_ button: CalcButton) {
            button.setTitle(button.titleToShow, for: .normal)
    }
    
    private func setPrimaryButtonBackgroudFor(_ button: CalcButton) {
        button.backgroundColor = CalcButtonDTO.primaryButton.backgroundColor
    }
    
    private func setSecondaryButtonBackgroudFor(_ button: CalcButton) {
        button.backgroundColor = CalcButtonDTO.secondaryButton.backgroundColor
    }
    
    private func setActionButtonActiveBackgroudFor(_ button: CalcButton) {
        button.backgroundColor = CalcButtonDTO.actionButtonActive.backgroundColor
    }
    
    private func setactionButtonNotActiveFor(_ button: CalcButton) {
        button.backgroundColor = CalcButtonDTO.actionButtonNotActive.backgroundColor
    }
    
    // MARK: Actions:
    @IBAction func numericButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func resetButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func squareroot(_ sender: CalcButton) {
    }
    
    @IBAction func percentButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func basicOperationButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func equalsButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func decimalpointButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func plusminusButtonTapped(_ sender: CalcButton) {
    }
}
