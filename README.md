# ssh-gen

An easy way to configure git SSH key, clip and paste to your GitHub account.

## how to run

just run

   ```sh ssh-gen.sh```

inside ssh-get folder to begin your configuration

## how to sign commits

after installing the key, you can sign commits with the commands below:

to sign with a ssh key:
```@shell
git config --global gpg.format ssh
```

to configure your key:
```@shell
git config --global user.signingkey ~/.ssh/id_ed25519.pub
```

now you can sign commits whith the `-S` flag on commits:

```@shell
git commit -S -m "my commit"
```

or you can tell to git sign them automatically with:

```@shell
git config --global commit.gpgsign true
```