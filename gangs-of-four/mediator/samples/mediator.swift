import Foundation

class CheckboxGroup {
    private var checkboxes: [Checkbox] = []
    private var checkedOrders: [Checkbox] = []

    func addCheckbox(_ checkbox: Checkbox) {
        checkboxes.append(checkbox)
    }

    func notify(_ sender: Checkbox, action: String) {
        if action == "check" {
            if checkboxes.allSatisfy({ $0.isChecked }) {
                checkedOrders.first?.uncheck()
                checkedOrders.removeFirst()
            }
            if !checkedOrders.contains(where: { $0 === sender }) {
                checkedOrders.append(sender)
            }
        }
    }
}

class Checkbox {
    private let group: CheckboxGroup
    private(set) var isChecked: Bool = false
    private let title: String

    init(title: String, group: CheckboxGroup) {
        self.title = title
        self.group = group;
        self.group.addCheckbox(self)
    }

    func getTitle() -> String {
        return title
    }

    func check() {
        if !isChecked {
            isChecked = true
            group.notify(self, action: "check")
        }
    }

    func uncheck() {
        if isChecked {
            isChecked = false
            group.notify(self, action: "uncheck")
        }
    }
}

let life = CheckboxGroup()
let time = Checkbox(title: "Time", group: life)
let money = Checkbox(title: "Money", group: life)
let health = Checkbox(title: "Health", group: life)

for checkbox in [time, money, health, time, money] {
    checkbox.check()
    print([time.isChecked, money.isChecked, health.isChecked])
}
