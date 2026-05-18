# bc-seminarska-ekipa1
# Git Workflow Guide – AL Seminar (Dynamics 365 Business Central)

## Namen
Ta dokument opisuje pravila dela v skupinskem GitHub repozitoriju za seminarsko nalogo iz programiranja (AL – Dynamics 365 Business Central).

Cilj:
- vsak študent aktivno sodeluje
- delo je sledljivo
- uporablja se profesionalni Git workflow (branch + PR)

---

# 1. Priprava projekta (enkrat na začetku)

## Kloniranje repozitorija
git clone <URL-repozitorija>
## Odpri projekt v VS Code
- File → Open Folder

## Posodobi main vejo
- git checkout main
- git pull

---

# 2.  Pravilo: delo v vejah (BRANCHES)

❗ Nikoli ne delamo direktno na `main`.

Vsaka naloga se dela v svoji veji.

## Ustvarjanje nove veje
Vedno iz `main`:
git checkout main
git pull
git checkout -b task1-ime
## Imenovanje vej
- `task1-ana`
- `task2-marko`
- `task3-eva`

---

# 3. Delo na nalogi

- razvijaj v svoji veji
- redno shranjuj spremembe (commit)

---

# 4. Commit pravila

## Dodaj spremembe:
git add .
## Commit:
git commit -m "Opis spremembe"
## Dobri primeri:
- Added customer table
- Implemented page extension
- Fixed validation logic

## Slabi primeri:
- fix
- update
- done

---

# 5. Push na GitHub
- git push origin task1-ime
---

# 6. Pull Request (PR)

Na GitHubu:

1. odpri repozitorij
2. klikni **Compare & pull request**
3. nastavi:
   - base: `main`
   - compare: `task1-ime`
4. klikni **Create pull request**

---

# 7. Code Review

- sošolci pregledajo kodo
- dodajo komentarje
- predlagajo izboljšave

Avtor:
- popravi kodo, če je potrebno
- ponovno push-a spremembe

---

# 8. Merge v main

Ko je PR odobren:
- klikni **Merge pull request**

Po merge:
- branch se lahko izbriše

---

# 9. Naslednji task
- git checkout main
- git pull
- git checkout -b task2-ime
