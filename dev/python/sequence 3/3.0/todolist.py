def todo(task, priority):
    """Ajouter une tâche à la liste de tâches à faire

    Args:
        task (string): La tâche à ajouter
        priority (integer): Priorité de la tâche 1-3 (1 étant la plus base)
    """
    priorityOrder = {1: "low", 2: "mid", 3: "high"}
    