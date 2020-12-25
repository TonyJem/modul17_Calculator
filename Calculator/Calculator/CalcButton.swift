import UIKit

class CalcButton: UIButton {
    var title: String { setTitle(for: self).buttonTitle }
    var explanation: String { setTitle(for: self).buttonExplanation }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Set Button title from Localzable.stings
extension CalcButton {
    private func setTitle(for button: CalcButton) -> (buttonTitle: String, buttonExplanation: String) {
        if let buttonTitle = button.title(for: .normal) {
            switch buttonTitle {
            case "0":
                return (__("number_0_button_title"), __("number_0_button_explanation"))
            case "1":
                return (__("number_1_button_title"), __("number_1_button_explanation"))
            case "2":
                return (__("number_2_button_title"), __("number_2_button_explanation"))
            case "3":
                return (__("number_3_button_title"), __("number_3_button_explanation"))
            case "4":
                return (__("number_4_button_title"), __("number_4_button_explanation"))
            case "5":
                return (__("number_5_button_title"), __("number_5_button_explanation"))
            case "6":
                return (__("number_6_button_title"), __("number_6_button_explanation"))
            case "7":
                return (__("number_7_button_title"), __("number_7_button_explanation"))
            case "8":
                return (__("number_8_button_title"), __("number_8_button_explanation"))
            case "9":
                return (__("number_9_button_title"), __("number_9_button_explanation"))
            case "addition":
                return (__("addition_button_title"), __("addition_button_explanation"))
            case "subtraction":
                return (__("subtraction_button_title"), __("subtraction_button_explanation"))
            case "multiplication":
                return (__("multiplication_button_title"), __("multiplication_button_explanation"))
            case "division":
                return (__("division_button_title"), __("division_button_explanation"))
            case "squareroot":
                return (__("square_root_button_title"), __("square_root_button_explanation"))
            case "percent":
                return (__("percent_button_title"), __("percent_button_explanation"))
            case "reset":
                return (__("reset_button_title"), __("reset_button_explanation"))
            case "equals":
                return (__("equals_button_title"), __("equals_button_explanation"))
            case "decimalpoint":
                return (__("decimal_point_button_title"), __("decimal_point_button_explanation"))
            case "plusminus":
                return (__("plus_minus_button_title"), __("plus_minus_button_explanation"))
            default:
                //  TODO: Create Error handling, when current button title was not found in current button titles list
                return ("Error2", "Error2")
            }
        }
        //  TODO: Create Error handling, when buttons title is nil
        return ("Error1", "Error1")
    }
}

// MARK: - Animated Click
extension CalcButton {
    func showAnimatedClick() {
        animateWithPulsate()
        animateWithFlash()
    }
    
    private func animateWithPulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.97
        pulse.toValue = 1.0
//        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
//        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    
    private func animateWithFlash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.1
        flash.fromValue = 1
        flash.toValue = 0.7
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        flash.autoreverses = true
        flash.repeatCount = 1
        layer.add(flash, forKey: nil)
    }
}
