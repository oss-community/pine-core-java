ssh-keygen -t rsa -C "My Laptop" -N '' -f ~/.ssh/id_rsa
ssh-add add ~/.ssh/id_rsa.pub
gh auth login
gh ssh-key add ~/.ssh/id_rsa.pub
ssh -T git@github.com