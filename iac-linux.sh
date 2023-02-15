#!/bin/bash

#Criando diretório dinamicamente
dir=("publico" "adm" "ven" "sec");

for i in ${dir[@]}; do
  if [ -d $(ls / | grep $i) ]; then
    echo 'Diretório '$i' não existe, criando...';
    mkdir /$i
  else
    echo 'Diretório '$i' já existe!';
  fi
done;
seq -s '#' 169 | tr -d [:digit:]
echo '									Diretórios já criados ou existentes!'
seq -s '#' 169 | tr -d [:digit:]

#Criando grupo dinamicamente
grup=("GRP_ADM" "GRP_VEN" "GRP_SEC");

for i in ${grup[@]}; do
  if [ $(cat /etc/group | grep $i) ]; then
    echo 'Grupo '$i' já existe!';
  else
     echo 'Grupo '$i' não existe, criando...';
     groupadd $i
  fi
done;
seq -s '#' 169 | tr -d [:digit:]
echo '                                                                          Grupos já criados ou existentes!'
seq -s '#' 169 | tr -d [:digit:]

#Criando usuário dinamicamente
user=("carlos" "maria" "joao_");
name=("Carlos Magnata" "Maria joaquina" "João pedro");
groupUser=("GRP_ADM" "GRP_VEN" "GRP_SEC");
cont=-1;

for i in ${user[@]}; do
  cont=$cont+1;
  if [ $(cat /etc/passwd | grep -m1 -o -h -a joao | uniq) ]; then
    echo 'Usuário '$i' já criado!'
  else
    #Senha encriptografada na base SHA512
    useradd $i -c "${name[$cont]}" -G ${groupUser[$cont]} -p $(openssl passwd -6 123) -m -s /bin/bash
  fi
done;
seq -s '#' 169 | tr -d [:digit:]
echo '                                                                          Usuários já criados ou existentes!'
seq -s '#' 169 | tr -d [:digit:]


#Atribuir todos os diretórios criados para o root e adiciondo os diretórios a seus respectivos grupos
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

#Atribuir permissões para os diretórios
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico
