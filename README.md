# iOS App «Calculator»
Assignment for Modul #7 in iOS development cource by [SkilFactory](https://skillfactory.ru)

[Implementation and screenshots](#implementation-and-screenshots)

[Description](#task-description)

[Requirements](#requirements)

[Estimated result](#estimated-result)

[Hints](#hints)

[Acceptance criteria](#acceptance-criteria)

## Implementation and screenshots:

- [x] 1. Присутствуют десять числовых кнопок, точка и кнопки с действиями над числами:
<img src="/readMeImages/screen01.png" width="25%">
<br>
<br>

- [x] 2. `<AutoLayout>` настроен так, чтобы приложение работало как в портретном, так и в ландшафтном режиме **без** интерфейсных ошибок:
<img src="/readMeImages/screen02.gif" width="33%">
<br>
<br>

- [x] 3. Реализовано решение с двумя типами данных:

Variable `<currentLabelTextNumeric>` is `<Double>` and holds converted from `<String>` value of `<currentLabelText>`'s and is updated each moment as `<currentLabelText>` text value is changing:
```swift
    var currentLabelTextNumeric: Double = 0
    
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
```
<br>

`<Extention>` for Type `<Double>` enables to convert any `<Double>` in any code place to `<String>` and removes `<".0">` from the end of that `<String>`:
```swift
extension Double {
    func cutDotZeroEnd() -> String {
        let numberTexted = String(self)
        guard numberTexted.hasSuffix(".0") else { return numberTexted }
        return String(numberTexted.dropLast(2))
    }
}
```
<br>
<br>

- [x] 4. Интерфейс по собственной задумке:

Is included nice looking animation for button click, also was used easy to modify ColorScheme:
```swift
struct Colors {
    static let applicationBackgroundColor: UIColor = .black
    
    static let labelFontColorActive: UIColor = .white
    static let labelFontColorNotActive: UIColor = .gray
    static let labelBackgroundColor: UIColor = Colors.applicationBackgroundColor
    
    static let buttonFontColor: UIColor = .blue
    static let buttonBorderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    
    static let primaryButton: UIColor = .cyan
    static let secondaryButton: UIColor = .lightGray
    static let actionButtonActive: UIColor = .orange
    static let actionButtonNotActive: UIColor = UIColor(red: 239/255, green: 94/255, blue: 28/255, alpha: 1.0)
}
```
<br>
<br>

- [x] 5. Каждый ряд кнопок — `<StackView>` из кнопок:
<img src="/readMeImages/screen05.png" width="33%">
<br>
<br>

- [x] 6. Все элементы интерфейса помещены в `<StackView>`:
<img src="/readMeImages/screen06.png" width="33%">
<br>
<br>

- [x] 7. В калькуляторе реализовано *сложение*:
<br>
<br>

- [x] 8. В калькуляторе реализовано *вычитание*:
<br>
<br>

- [x] 9. В калькуляторе реализовано *деление*:
<br>
<br>

- [x] 10. В калькуляторе реализовано *умножение*:
<br>
<br>

- [x] 11. Помимо основных требований в калькуляторе есть и другие действия с числами (*проценты*, *корень квадратный* и тд):
<br>
<br>

## Task Description:

<img src="/readMeImages/hero.svg" width="40%">
<br>

В рамках практической работы мы создадим приложение «*Калькулятор*».

Так выглядит стандартное приложение для простых расчётов на *iPhone*:

<img src="/readMeImages/example0.png" width="25%">
<br>

По скриншоту видно, что приложение состоит из одного экрана, но при этом каждой кнопке соответствует собственный функционал: 

- Десять кнопок отвечают за ввод чисел.
- Шесть кнопок выполняют математические операции.
- Одна кнопка отвечает за добавление точки в дробных числах при вводе цифр.
- Одна кнопка отвечает за то, каким будет число (отрицательным или положительным).
- Одна кнопка обнуляет введённое на экране число.
- Есть элемент, который отображает введённые числа и результат математических действий.

**Суть задания** — научиться строить интерфейс приложения  «Калькулятор».

 
## Requirements:

1. Используйте `<AutoLayout>`, чтобы была возможность переворачивать экран и пользоваться приложением в ландшафтном режиме.
2. Используйте `<StackView>` для группировки элементов — так гораздо удобнее, чем расставлять `<Constraints>` на каждый элемент.
3. Используйте `<Constraints>` по необходимости (лучше для самих `<StackView>`, чем внутри них).
4. Интерфейс в вашем проекте может отличаться от того, что представлен на скриншоте выше: кнопки могут быть квадратными или любой другой формы, цвет тоже может быть любым.
5. Важно, чтобы приложение выполняло свою прямую функцию — приём двух чисел для выполнения математических операций над ними и возвращение результата.

P.S.: Собственное решение помогает лучше усвоить материал.

## Estimated result:

<img src="/readMeImages/example1.png" width="30%"> <img src="/readMeImages/example2.png" width="60%">
<br>

## Hints:

**Подсказка №1**

Простой калькулятор обычно работает с тремя числами: два числа берёт на вход, а третье отдаёт как результат действий над двумя введёнными числами.

**Подсказка №2**

Калькулятору не нужен `<Textfield>`, чтобы отображать результаты ввода и математических операций, ведь в основном в `<TextField>` вводят значения с клавиатуры, а экранная клавиатура в требованиях не заявлена.

**Подсказка №3**

Калькулятор работает с разным типом чисел. Главное — не забывать о том, что есть способ приведения для работы с любым типом чисел.

##  Acceptance criteria:

1. Присутствуют десять числовых кнопок, точка и кнопки с действиями над числами:
- да — 1 балл,
- нет — 0 баллов.

2. `<AutoLayout>` настроен так, чтобы приложение работало как в портретном, так и в ландшафтном режиме **без** интерфейсных ошибок:
- да — 2 балла,
- нет — 1 балл

3. Реализовано решение с двумя типами данных:
- да — 1 балл,
- нет — 0 баллов

4. Интерфейс по собственной задумке:
- да — 2 балла,
- нет — 1 балл

5. Каждый ряд кнопок — `<StackView>` из кнопок:
- да — 1 балл,
- нет — 0 баллов

6. Все элементы интерфейса помещены в `<StackView>`:
- да — 2 балла,
- нет — 1 балл

7. В калькуляторе реализовано *сложение*:
- да — 1 балл,
- нет — 0 баллов

8. В калькуляторе реализовано *вычитание*:
- да — 1 балл,
- нет — 0 баллов

9. В калькуляторе реализовано *деление*:
- да — 1 балл,
- нет — 0 баллов

10. В калькуляторе реализовано *умножение*:
- да — 1 балл,
- нет — 0 баллов

11. Помимо основных требований в калькуляторе есть и другие действия с числами (*проценты*, *корень квадратный* и тд):
- да — 2 балла,
- нет — 0 баллов
