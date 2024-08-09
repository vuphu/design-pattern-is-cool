from abc import ABC, abstractmethod


class PaymentStrategy(ABC):
    @abstractmethod
    def pay(self, amount: float) -> None:
        pass


class CreditCardPayment(PaymentStrategy):
    def __init__(self, card_number: str):
        self.card_number = card_number

    def pay(self, amount: float) -> None:
        print(f"Paying {amount} using Credit Card {self.card_number}")


class PayPalPayment(PaymentStrategy):
    def __init__(self, email: str):
        self.email = email

    def pay(self, amount: float) -> None:
        print(f"Paying {amount} using PayPal account {self.email}")


class Order:
    def __init__(self, id: str, amount: int):
        self.id = id
        self.amount = amount


class PaymentGateway:
    def execute_payment(self, method: PaymentStrategy, order: Order) -> None:
        print(f"Processing payment for order {order.id}")
        method.pay(order.amount)


if __name__ == "__main__":
    gateway = PaymentGateway()
    credit_card_payment = CreditCardPayment(card_number="<card_number>")
    paypal_payment = PayPalPayment(email="<email>")

    gateway.execute_payment(credit_card_payment, Order("1", 1000))
    gateway.execute_payment(paypal_payment, Order("2", 2000))
