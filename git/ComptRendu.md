# TD 3 GIT

## Exercice 1

1) ```bash 
    git config --global user.name "Adam Planque" && git config --global user.email "planque.adam@gmail.com"
    ```

2) ```bash
    mkdir my-repo
    cd my-repo
    ```

3) ```bash
    git init
    ```

4) ```bash
    echo "Hello Wolrd" > README.md
    ```

5) ```bash
    git add README.md
    git commit -m "Initial commit w/ Readme"
    ```

6) ```bash
    echo "print('Hello World')" > src/hello.py
    ```

7) ```bash
    git add src/hello.py
    git commit -m "Hello World"
    ```

##### On push tous les commits sur la branche main
```bash
git push -u origin main
```

8) ```bash
    git log
    ```

## Exercice 2

<!-- En ligne de commande réalisez quelques commits de test supplémentaires. Par exemple modifiez
hello.py pour lui faire afficher d’autre message, mettez à jour le README etc. A chaque étape :
1 Utilisez la commande git status et analysez sa sortie avant un git add, après un git add et après
un git commit
2 Utilisez la commande git diff et analysez sa sortie -->


1) ```bash
    git status
    ```

2) ```bash
    git diff
    ```

3) ```bash
