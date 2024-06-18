from abc import ABC, abstractmethod
from typing import List


class Component(ABC):

    @abstractmethod
    def get_size(self):
        pass


class File(Component):
    def __init__(self, size: int):
        self.size = size

    def get_size(self):
        return self.size


class Folder(Component):
    def __init__(self, components: List[Component]):
        self.components = components

    def get_size(self):
        return sum(it.get_size() for it in self.components)


if __name__ == '__main__':
    root = Folder(components=[
        File(10),
        File(20),
        Folder(components=[
            File(10),
            Folder(components=[
                File(10)
            ]),
            File(30)
        ])
    ])

    print(root.get_size())  # Output: 80
