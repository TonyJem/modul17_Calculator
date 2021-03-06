import UIKit

// TODO: -1. Label can contain max: "999 999 999", if number is bigger it has to be turned into "7.901235e29" and operate with it. If anything wrong, just frop error to screen, that possible to delete with AC. As bigger number as smaller Fonts size comes <- need to do it flexible

class MainViewController: UIViewController {
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var primaryButtons: [CalcButton]!
    @IBOutlet private var secondaryButtons: [CalcButton]!
    @IBOutlet private var actionButtons: [CalcButton]!
    
    // MARK: Properties:
    var currentOperation: BasicOperation? = nil
    var operandFirst: Double = 0
    var operandSecond: Double = 0
    
    var resultLabelIsEnabled: Bool = true {
        didSet {
            guard resultLabelIsEnabled else {
                setupLabelUI(for: resultLabel, with: .resultLabelNotActiveDTO)
                return
            }
            setupLabelUI(for: resultLabel, with: .resultLabelActiveDTO)
        }
    }
    
    private func turnUItoErrorMode() {
        resultLabel.text = __("error_on_screen")
        /* TODO: Add more functionality for errorMode:
         disable all buttons,
         Turn reset button background to special color
         enable only Reset button
         when Reset is pressed, all apearance and internal variable fully reseting
        */
    }
    
    private var currentLabelText: String = "" {
        didSet {
            guard currentLabelText != "nan",
                  currentLabelText != "inf"
            else {
                turnUItoErrorMode()
                return
            }
            resultLabel.text = currentLabelText
            currentLabelTextNumeric = Double(currentLabelText) ?? 0
        }
    }

    var currentLabelTextNumeric: Double = 0
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLabelText = "0"
        setupUI()
    }
    
    // MARK: - SetupUI Methods:
    private func setupUI() {
        setupViewUI(for: backgroundView)
        resultLabelIsEnabled = true
        setupAllButtonsUI()
    }
    
    private func setupViewUI(for view: UIView) {
        view.backgroundColor = Colors.applicationBackgroundColor
    }
      
    private func setupLabelUI(for label: UILabel, with dto: CalcLabelDTO) {
        label.textColor = dto.fontColor
        label.font = UIFont.systemFont(ofSize: dto.fontSize)
    }
    
    // MARK: - Calculation and Logic:
    private func calculate(_ operation: BasicOperation, for operand1: Double, with operand2: Double) -> Double {
            switch operation {
            case .addition:
                return operand1 + operand2
            case .subtraction:
                return operand1 - operand2
            case .multiplication:
                return operand1 * operand2
            case .division:
                return operand1 / operand2
            }
        }
    // MARK: - Actions:
    @IBAction func anyButtonTapped(_ sender: CalcButton) {
        unlock(actionButtons)
        sender.showAnimatedClick()
    }
    
    @IBAction func numericButtonTapped(_ sender: CalcButton) {
        guard resultLabelIsEnabled else {
            resultLabelIsEnabled = true
            currentLabelText = sender.explanation
            return
        }
        
        guard currentLabelText != "0" else {
            currentLabelText = sender.explanation
            return
        }
        currentLabelText += sender.explanation
    }
    
    @IBAction func resetButtonTapped(_ sender: CalcButton) {
        currentLabelText = "0"
        resultLabelIsEnabled = true
        currentOperation = nil
        operandFirst = 0
        operandSecond = 0
    }
    
    @IBAction func squareRootButtonTapped(_ sender: CalcButton) {
        let newValue = currentLabelTextNumeric.squareRoot()
            
        if currentOperation == nil {
            operandFirst = newValue
        } else {
            operandSecond = newValue
        }

        resultLabelIsEnabled = false
        currentLabelText = newValue.cutDotZeroEnd()
    }
    
    @IBAction func percentButtonTapped(_ sender: CalcButton) {
        var newValue: Double
        if currentOperation == nil {
            newValue = currentLabelTextNumeric / 100
            operandFirst = newValue
        } else {
            newValue = operandFirst / 100 * currentLabelTextNumeric
            operandSecond = newValue
           }
        resultLabelIsEnabled = false
        currentLabelText = newValue.cutDotZeroEnd()
    }
    
    private func unlock(_ buttons: [CalcButton]) {
        for button in buttons {
            button.isLocked = false
        }
    }
    
    @IBAction func basicOperationButtonTapped(_ sender: CalcButton) {
        guard let calledOperation = sender.basicOperation else { return } // TODO: Throw Error if returned
        sender.isLocked = true
        
        guard resultLabelIsEnabled else {
            self.currentOperation = calledOperation
            return
        }
        
        resultLabelIsEnabled = false
        
        guard currentOperation != nil else {
            operandFirst = currentLabelTextNumeric
            currentOperation = calledOperation
            return
        }
        operandSecond = currentLabelTextNumeric
        equalsButtonTapped(sender)
    }
    
    @IBAction func equalsButtonTapped(_ sender: CalcButton) {
        guard let calledOperation = currentOperation else { return }
        
        if resultLabelIsEnabled {
            operandSecond = currentLabelTextNumeric
        }
        
        let calculationResult = calculate(calledOperation, for: operandFirst, with: operandSecond)
        operandFirst = calculationResult
        resultLabelIsEnabled = false
        currentLabelText = calculationResult.cutDotZeroEnd()
    }
    
    @IBAction func decimalPointButtonTapped(_ sender: CalcButton) {
        guard resultLabelIsEnabled, !currentLabelText.contains(".") else { return }
        currentLabelText += "."
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: CalcButton) {
        guard currentLabelTextNumeric != 0 else { return }
        
        let newValue = -1 * currentLabelTextNumeric
        currentLabelText = newValue.cutDotZeroEnd()
        
        guard resultLabelIsEnabled else {
            operandFirst = newValue
            return
        }
    }
}

// MARK: - Buttons UI Setup:
extension MainViewController {
    private func setupAllButtonsUI() {
        setButtonsUI(for: primaryButtons, with: .primaryButtonDTO)
        setButtonsUI(for: secondaryButtons, with: .secondaryButtonDTO)
        setButtonsUI(for: actionButtons, with: .actionButtonActiveDTO)
    }

    private func setButtonsUI(for buttons: [CalcButton], with dto: CalcButtonDTO) {
        for button in buttons {
            setProperties(for: button)
            setFont(for: button, with: dto)
            setBackground(for: button, with: dto)
            setBorders(for: button, with: dto)
        }
    }
    
    private func setProperties(for button: CalcButton) {
        let buttonProperties = button.setProperties(for: button)
        button.title = buttonProperties.title
        button.explanation = buttonProperties.explanation
        button.setTitle(button.title, for: .normal)
    }
    
    private func setFont(for button: CalcButton, with dto: CalcButtonDTO) {
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: dto.fontSize)
        button.setTitleColor(dto.fontColor, for: .normal)
    }
    
    private func setBackground(for button: CalcButton, with dto: CalcButtonDTO) {
        button.backgroundColor = dto.backgroundColor
    }
    
    private func setBorders(for button: CalcButton, with dto: CalcButtonDTO) {
        button.layer.borderWidth = dto.borderWidth
        button.layer.borderColor = dto.borderColor.cgColor
        button.layer.cornerRadius = dto.cornerRadius
    }
}

extension Double {
    func cutDotZeroEnd() -> String {
        let numberTexted = String(self)
        guard numberTexted.hasSuffix(".0") else { return numberTexted }
        return String(numberTexted.dropLast(2))
    }
}
