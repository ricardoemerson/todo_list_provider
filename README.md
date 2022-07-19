<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <img src="github-images/logo.png" alt="Logo" >

  <h3 align="center">Todo List Provider</h3>

  <p align="center">
    Projeto de lista de tarefas criado no curso da Academia do Flutter, que ensina a utilizar o Provider para injeção de dependências e gerência de estados da aplicação.
    <br />
  </p>
</div>

![GitHub followers](https://img.shields.io/github/followers/ricardoemerson?style=social)
![GitHub User's stars](https://img.shields.io/github/stars/ricardoemerson?style=social)
![YouTube Channel Views](https://img.shields.io/youtube/channel/views/UC_UuIxnjQ5yLiT-UGSj774A?style=social)
![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UC_UuIxnjQ5yLiT-UGSj774A?style=social)



<!-- ABOUT THE PROJECT -->
## Sobre o projeto

<img src="github-images/login.png" alt="Página de Login" width="300" height="auto">&nbsp;&nbsp;&nbsp;<img src="github-images/registration.png" alt="Página de Registro do Usuário"  width="300" height="auto">&nbsp;&nbsp;&nbsp;<img src="github-images/home-week-tasks.png" alt="Página principal comm tarefas da semana"  width="300" height="auto">
<br/>
<br/>


<!-- ABOUT THE PROJECT -->
## Sobre o projeto

Projeto de lista de tarefas criado no curso da Academia do Flutter, que ensina a utilizar o Provider para injeção de dependências e gerência de estados da aplicação.

<p align="right">(<a href="#top">back to top</a>)</p>



### Construído Utilizando

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Iniciando

Para que você possa executar o projeto é necessário que o Flutter na versão 3.0.5 esteja instalalado em seu sistema operacional.

Para facilitar esse processo o projeto está configurado com o FVM e uma vez que o FVM esteja instalado em seu sistema basta executar o comando `fvm install` e a versão 3.0.5 do Flutter já será instalada eu seu sistema.

### Pré-requisitos

Como pré-requisito para execução do projeto, será necessário que o Flutter na versão 3.0.5 esteja instalado e no meu canal do Youtube eu tenho um vídeo ensinando a como instalar o Flutter utilizando o FVM (Flutter Version Manager) que é um gerenciador de versões para o Flutter.

[![✅ [2022] Como instalar o FLUTTER com FVM para Windows e integrá-lo ao Visual Studio Code?](https://img.youtube.com/vi/d8p0nGxbAng/0.jpg)](https://youtu.be/d8p0nGxbAng)


### Instalação

1. No terminal, acesse a sua pasta de projetos e clone o repositório do Todo List:
   ```sh
   git clone https://github.com/ricardoemerson/todo_list_provider.git
   ```

2. Instale o Flutter 3.0.5:
   ```sh
   fvm install
   ```

3. Instale as dependências/packages do projeto
   ```sh
   fvm flutter pub get
   ```

4. Execute o projeto
   ```js
   fvm flutter run
   ```

<p align="right">(<a href="#top">back to top</a>)</p>


## Packages utilizados

✅ flutter_localizations <br/>
✅ provider: `^6.0.3` <br/>
✅ sqflite: `^2.0.3` <br/>
✅ wakelock: `^0.6.2` <br/>
✅ path: `^1.8.1` <br/>
✅ synchronized: `^3.0.0+2` <br/>
✅ google_fonts: `^3.0.1` <br/>
✅ flutter_signin_button: `^2.0.0` <br/>
✅ firebase_core: `^1.19.1` <br/>
✅ firebase_auth: `^3.4.1` <br/>
✅ validatorless: `^1.2.1` <br/>
✅ flutter_overlay_loader: `^2.0.0` <br/>
✅ google_sign_in: `^5.4.0`  <br/>
✅ date_picker_timeline: `^1.2.3` <br/>
✅ intl: `^0.17.0` <br/>
✅ dart_date: `^1.1.1`

<!-- USAGE EXAMPLES -->
## Uso

O aplicativo permite o acesso através do cadastramento de usuário com e-mail e senha e também permite realizar a autenticação do usuário através da conta do Google.
<br/>

<img src="github-images/login.png" alt="Página de Login" width="300" height="auto">&nbsp;&nbsp;&nbsp;<img src="github-images/login-google.png" alt="Login com Google" width="300" height="auto">&nbsp;&nbsp;&nbsp;<img src="github-images/registration.png" alt="Página de Registro do Usuário" width="300" height="auto">

<br/>
<br/>

Ao acessar o aplicativo, serão exibidas as tarefas do Dia (Hoje) e também será possível visualizar as tafefas do dia seguinte (Amanhã) e da Semana.

<img src="github-images/home-tasks.png" alt="Página principal com tarefas" width="300" height="auto">&nbsp;&nbsp;&nbsp;<img src="github-images/home-tomorrow-tasks.png" alt="Página principal com tarefas de amanhã" width="300" height="auto">&nbsp;&nbsp;&nbsp;<img src="github-images/home-week-tasks.png" alt="Página principal comm tarefas da semana" width="300" height="auto">

<br/>
<br/>

Caso não existam tarefas registradas o aplicativo apresentará uma mensagem informando.

<img src="github-images/home-empty-tasks.png" alt="Página principal sem tarefas" width="300" height="auto">&nbsp;&nbsp;&nbsp;<img src="github-images/week-tasks-empty.png" alt="Página principal sem tarefas da semana" width="300" height="auto">


<br/>
<br/>

O usuário do sistema poderá a qualquer momento realizar a alteração do seu nome no aplicativo.

<img src="github-images/change-name.png" alt="Alteração do nome do usuário" width="300" height="auto">

<br/>
<br/>

O usuário poderá criar suas tarefas informando o nome da mesma e a data da programada, bem como realizar a exclusão de uma tarefa registrada.

<img src="github-images/create-task-page.png" alt="Página de criação de tarefa" width="300" height="auto">&nbsp;&nbsp;&nbsp;<img src="github-images/select-date-task.png" alt="Selecionar data da tarefa" width="300" height="auto">&nbsp;&nbsp;&nbsp;<img src="github-images/remove-tasks.png" alt="Modal de confirmação de exclusão de uma tarefa" width="300" height="auto">

<br/>
<br/>

Também é possível através do Menu Popup de Filtragem exibir ou ocultar as tarefas já finalizadas.

<img src="github-images/show-tasks-done.png" alt="Página principal com tarefas pendentes e concluídas" width="300" height="auto">

<br/>
<br/>

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contato

Ricardo Emerson - [@ricardo_emerson](https://twitter.com/ricardo_emerson) - ricardo_emerson@yahoo.com

Project Link: [https://github.com/ricardoemerson/todo_list_provider](https://github.com/ricardoemerson/todo_list_provider)

<p align="right">(<a href="#top">back to top</a>)</p>





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[flutter-shield]: https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white
[contributors-shield]: https://img.shields.io/github/contributors/ricardoemerson/todo_list_provider.svg?style=for-the-badge
[contributors-url]: https://github.com/ricardoemerson/todo_list_provider/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ricardoemerson/todo_list_provider.svg?style=for-the-badge
[forks-url]: https://github.com/ricardoemerson/todo_list_provider/network/members
[stars-shield]: https://img.shields.io/github/stars/ricardoemerson/todo_list_provider.svg?style=for-the-badge
[stars-url]: https://github.com/ricardoemerson/todo_list_provider/stargazers
[issues-shield]: https://img.shields.io/github/issues/ricardoemerson/todo_list_provider.svg?style=for-the-badge
[issues-url]: https://github.com/ricardoemerson/todo_list_provider/issues
[license-shield]: https://img.shields.io/github/license/ricardoemerson/todo_list_provider.svg?style=for-the-badge
[license-url]: https://github.com/ricardoemerson/todo_list_provider/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/ricardojardim
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com
