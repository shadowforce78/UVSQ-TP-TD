def CreateTodoList():
    """Créer une liste de tâches à faire vide"""
    todolist = []
    return todolist


def AddTodo(task, priority, todoList):
    """Ajouter une tâche à la liste de tâches à faire

    Args:
        task (string): La tâche à ajouter
        priority (integer): Priorité de la tâche 1-3 (1 étant la plus base)
    """
    priorityOrder = {1: "low", 2: "mid", 3: "high"}
    taskWithPriority = [priorityOrder[priority], task]
    todoList.append(taskWithPriority)
    return todoList


def RemoveTodo(todolist, task):
    """Supprimer une tâche de la liste de tâches à faire

    Args:
        High (list): Liste des tâches prioritaires hautes
        Mid (list): Liste des tâches prioritaires moyennes
        Low (list): Liste des tâches prioritaires basses
        task (string): La tâche à supprimer (index)
    """
    todolist.sort()
    todolist.pop(task - 1)
    return todolist

def GetTodoList(todolist):
    """Récupérer la liste de tâches à faire

    Args:
        todolist (list): La liste de tâches à faire
    """
    todolist.sort()
    HighPriority = []
    MidPriority = []
    LowPriority = []

    for task in todolist:
        if task[0] == "high":
            HighPriority.append(task[1])
        elif task[0] == "mid":
            MidPriority.append(task[1])
        elif task[0] == "low":
            LowPriority.append(task[1])
    return HighPriority, MidPriority, LowPriority


def ShowTodoList(High, Mid, Low):
    order = 0
    """Afficher la liste de tâches à faire

    Args:
        High (list): Liste des tâches prioritaires hautes
        Mid (list): Liste des tâches prioritaires moyennes
        Low (list): Liste des tâches prioritaires basses
    """
    print("Tâches prioritaires hautes :")
    for task in High:
        print(f" {order + 1} - {task}")
        order += 1
    print("Tâches prioritaires moyennes :")
    for task in Mid:
        print(f" {order + 1} - {task}")
        order += 1
    print("Tâches prioritaires basses :")
    for task in Low:
        print(f" {order + 1} - {task}")
        order += 1

def menu():
    """Menu principal de selection
    """
    print("1. Ajouter une tâche")
    print("2. Supprimer une tâche")
    print("3. Afficher la liste des tâches")
    print("4. Quitter")
    choice = input("Votre choix : ")
    return choice

def main():
    todolist = CreateTodoList()
    while True:
        choice = menu()
        if choice == "1":
            print("\033[H\033[J")
            task = input("Entrez la tâche à ajouter : ")
            priority = int(input("Entrez la priorité de la tâche (1-3) : "))
            todolist = AddTodo(task, priority, todolist)
        elif choice == "2":
            print("\033[H\033[J")
            task = int(input("Entrez la tâche à supprimer (index) : "))
            todolist = RemoveTodo(todolist, task)
        elif choice == "3":
            print("\033[H\033[J")
            HighPriority, MidPriority, LowPriority = GetTodoList(todolist)
            ShowTodoList(HighPriority, MidPriority, LowPriority)
        elif choice == "4":
            break
        else:
            print("Choix invalide")