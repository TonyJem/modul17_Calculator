# iOS App «Calculator»
Assignment for Modul #7 in iOS development cource by [SkilFactory](https://skillfactory.ru)
 
[Description](#task-description)

[Requirements](#requirements)

[Estimated result](#estimated-result)

[Hints](#hints)

[Acceptance criteria](#acceptance-criteria)

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

Подсказка №1
Простой калькулятор обычно работает с тремя числами: два числа берёт на вход, а третье отдаёт как результат действий над двумя введёнными числами.

Подсказка №2
Калькулятору не нужен `<Textfield>`, чтобы отображать результаты ввода и математических операций, ведь в основном в `<TextField>` вводят значения с клавиатуры, а экранная клавиатура в требованиях не заявлена.

Подсказка №3
Калькулятор работает с разным типом чисел. Главное — не забывать о том, что есть способ приведения для работы с любым типом чисел.

##  Acceptance criteria:

1. Присутствуют десять числовых кнопок, точка и кнопки с действиями над числами:
- да — 1 балл,
- нет — 0 баллов.

2. `<AutoLayout>` настроен так, чтобы приложение работало как в портретном, так и в ландшафтном режиме без интерфейсных ошибок:
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

7. В калькуляторе реализовано сложение:
- да — 1 балл,
- нет — 0 баллов

8. В калькуляторе реализовано вычитание:
- да — 1 балл,
- нет — 0 баллов

9. В калькуляторе реализовано деление:
- да — 1 балл,
- нет — 0 баллов

10. В калькуляторе реализовано умножение:
- да — 1 балл,
- нет — 0 баллов

11. Помимо основных требований в калькуляторе есть и другие действия с числами (проценты, корень квадратный и тд):
- да — 2 балла,
- нет — 0 баллов
