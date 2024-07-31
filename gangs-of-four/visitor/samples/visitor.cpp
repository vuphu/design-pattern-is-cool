#include <iostream>
#include <vector>
#include <memory>
#include <string>

class Visitor;
class File;
class Folder;

class Element {
  public:
    Element(const std::string &name) : name(name) {}
    virtual ~Element() {}
    virtual void accept(Visitor &v) = 0;
    std::string getName() const { return name; }
  private:
    std::string name;
};

class Visitor {
  public:
    virtual ~Visitor() {}
    virtual void visit(File &file) = 0;
    virtual void visit(Folder &folder) = 0;
};

class File : public Element {
  public:
    File(const std::string &name) : Element(name) {}

    void accept(Visitor &v) {
        v.visit(*this);
    };
};

class Folder : public Element {
  public:
    Folder(const std::string &name) : Element(name) {}
    
    void add(Element *element) {
        elements.push_back(element);
    }

    void accept(Visitor &v) {
        v.visit(*this);
    }
    
    std::vector<Element *> getElements() {
        return elements;
    }

  private:
    std::vector<Element *> elements;
};


class PrintVisitor : public Visitor {
  public:
    void visit(File &file) {
        printIndent();
        std::cout << "📄 " << file.getName() << std::endl;
    };

    void visit(Folder &folder) {
        printIndent();
        std::cout << "📁 " << folder.getName() << std::endl;
        indentLevel += 1;
        for (auto &element : folder.getElements()) {
            element->accept(*this);
        }
        indentLevel -= 1;
    }

  private:
    int indentLevel = 0;
    
    void printIndent() {
        for (int i = 0; i < indentLevel; i++) {
            std::cout << "\t";
        }
    }
};


int main() {
    auto file1 = new File("File 1");
    auto file2 = new File("File 2");
    auto file3 = new File("File 3");
    auto folder = new Folder("Folder");
    auto subFolder = new Folder("Sub folder");
    
    folder->add(file1);
    folder->add(file2);
    subFolder->add(file3);
    folder->add(subFolder);

    PrintVisitor visitor;
    folder->accept(visitor);

    return 0;
}
