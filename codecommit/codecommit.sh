echo "Criar o Repositório do Projeto de Testes BDD:"
aws codecommit create-repository --repository-name wildamplify --repository-description "wildrydes-site for amplify" --region us-east-1
echo "Configurar as credenciais"
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true
#echo "Clonar o repo que foi criado"
#git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/wildrydes
echo "Salvar o código fonte do Projeto:"
#aws s3 cp s3://wildrydes-us-east-1/WebApplication/1_StaticWebHosting/website ./ --recursive
aws s3 cp s3://ttt-wildrydes/wildrydes-site ./site --recursive
cd site
rm -rf .git
# echo -e '*/target/**' >> .gitignore
git init
git add *
git commit -m "criando repo"
git remote add origin "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/wildamplify"
# verificar se deu erro, precisei ajustar o remote manualmente, pq estava us-west-2
cat .git/config
git push -f origin master
