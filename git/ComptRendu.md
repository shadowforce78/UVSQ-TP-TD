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
    mkdir src
    echo "print('Hello World')" > src/hello.py
    ```

7) ```bash
    git add src/hello.py
    git commit -m "Hello World (py)"
    ```

8) ```bash
    git log
    ```

## Exercice 2

1) ```bash
    git status
    ```

2) ```bash
    git diff
    ```

## Exercice 3
1) ```bash
    gitk --all
    ```

2) Sur la fenetre on voit 3 zones principales :
- La zone en haut : liste des commits effectués sur le projet
- La zone du milieu : affiche le hash du commit
- La zone du bas : affiche l'ensemble des info du commit, comme le message de commit, l'auteur, la date, etc.
