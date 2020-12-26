import UIKit

class CalcButton: UIButton {
    
    var title: String = ""
    var explanation: String = ""
    
    var basicOperation: BasicOperation? {
        switch explanation {
        case __("addition_button_explanation"):
            return .addition
        case __("subtraction_button_explanation"):
            return .subtraction
        case __("multiplication_button_explanation"):
            return .multiplication
        case __("division_button_explanation"):
            return .division
        default:
            return .addition
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Set Button title from Localzable.stings
extension CalcButton {
    func setProperties(for button: CalcButton) -> (title: String, explanation: String) {
        if let buttonTitle = button.title(for: .normal) {
            switch buttonTitle {
            case __("number_0_button_explanation"):
                return (__("number_0_button_title"), __("number_0_button_explanation"))
                
            case __("number_1_button_explanation"):
                return (__("number_1_button_title"), __("number_1_button_explanation"))
                
            case __("number_2_button_explanation"):
                return (__("number_2_button_title"), __("number_2_button_explanation"))
                
            case __("number_3_button_explanation"):
                return (__("number_3_button_title"), __("number_3_button_explanation"))
                
            case __("number_4_button_explanation"):
                return (__("number_4_button_title"), __("number_4_button_explanation"))
                
            case __("number_5_button_explanation"):
                return (__("number_5_button_title"), __("number_5_button_explanation"))
                
            case __("number_6_button_explanation"):
                return (__("number_6_button_title"), __("number_6_button_explanation"))
                
            case __("number_7_button_explanation"):
                return (__("number_7_button_title"), __("number_7_button_explanation"))
                
            case __("number_8_button_explanation"):
                return (__("number_8_button_title"), __("number_8_button_explanation"))
                
            case __("number_9_button_explanation"):
                return (__("number_9_button_title"), __("number_9_button_explanation"))
                
            case __("addition_button_explanation"):
                return (__("addition_button_title"), __("addition_button_explanation"))
                
            case __("subtraction_button_explanation"):
                return (__("subtraction_button_title"), __("subtraction_button_explanation"))
                
            case __("multiplication_button_explanation"):
                return (__("multiplication_button_title"), __("multiplication_button_explanation"))
                
            case __("division_button_explanation"):
                return (__("division_button_title"), __("division_button_explanation"))
                
            case __("square_root_button_explanation"):
                return (__("square_root_button_title"), __("square_root_button_explanation"))
                
            case __("percent_button_explanation"):
                return (__("percent_button_title"), __("percent_button_explanation"))
                
            case __("reset_button_explanation"):
                return (__("reset_button_title"), __("reset_button_explanation"))
                
            case __("equals_button_explanation"):
                return (__("equals_button_title"), __("equals_button_explanation"))
                
            case __("decimal_point_button_explanation"):
                return (__("decimal_point_button_title"), __("decimal_point_button_explanation"))
                
            case __("plus_minus_button_explanation"):
                return (__("plus_minus_button_title"), __("plus_minus_button_explanation"))
                
            default:
                //  TODO: Create Error handling, when current button title was not found in current button titles list
                return ("Error1.1", "Error1.2")
            }
        }
        //  TODO: Create Error handling, when buttons title is nil
        return ("Error2.1", "Error2.2")
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
