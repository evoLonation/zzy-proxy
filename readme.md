## 使用前须知
本项目的目的是为linux服务器提供科学上网的能力。但是该项目的拉取使用http仍然大概率需要科学上网，因此需要使用ssh模式来clone到本地。
- 因为使用ssh来clone需要密钥权限，因此首先要在服务器中使用ssh-keygen -t rsa来生成密钥文件，并将公钥文件(.pub后缀文件)的内容上传到github上，从而获取github的访问权限。如果已经做过这步的可以忽略。

## TODO
### 各种软件的代理的开启或者关闭脚本
- git
- docker
- apt
### 自动更新配置