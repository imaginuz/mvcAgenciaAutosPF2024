<section class="fullCenter">
  <style>
    /* Contenedor principal centrado */
    .fullCenter {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background: url(https://wallpapers.com/images/hd/shiny-black-sports-cars-6191f2yq38g0wroe.jpg)no-repeat center center/cover;
      margin: 0;

    }

    /* Tarjeta del formulario */
    .depth-1 {
      border-radius: 12px;
      box-shadow: 0 4px 2px rgba(178, 200, 237, 0.1);
      background-color: rgba(0, 0, 0, 0.8);


    }

    h1 {
      font-size: 2rem;
      font-weight: 400;
      color: #f8f6f6;
      text-align: center;
      margin-bottom: 1rem;
    }


    label {
      font-size: 15px;
      font-weight: 250;
      color: #f7f9fc;
      align-items: center;
    }


    input[type="email"],
    input[type="password"] {
      border: 1px solid #dadce0;
      border-radius: 4px;
      padding: 0.75rem;
      font-size: 0.875rem;
      width: 100%;
      color: #030303;
      transition: border-color 0.2s, box-shadow 0.2s;
    }

    input[type="email"]:focus,
    input[type="password"]:focus {
      border-color: #1a73e8;
      box-shadow: 0 0 3px rgba(26, 115, 232, 0.5);
      outline: none;
    }


    button.primary {
      background-color: #3684cc;
      color: #ffffff;
      border: none;
      border-radius: 4px;
      padding: 0.75rem 1.5rem;
      font-size: 0.875rem;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.2s;
    }

    button.primary {
      display: block;
      margin: 0 auto;
    }

    button.primary:hover {
      background-color: #1669c1;
    }

    /* Errores */
    .error {
      font-size: 0.75rem;
      color: #d93025;
      margin-top: 0.5rem;
    }

    /* Responsive */
    @media (min-width: 768px) {
      .row {
        display: flex;
        align-items: center;
      }

      .col-m-4 {
        flex: 0 0 33.33%;
      }

      .col-m-8 {
        flex: 0 0 66.67%;
      }

      .offset-m-2 {
        margin-left: 16.67%;
      }
    }
  </style>

  <form class="grid" method="post" action="index.php?page=sec_login{{if redirto}}&redirto={{redirto}}{{endif redirto}}">
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="col-12">Inicio de Sesion</h1>
      <br>
      <br>
      <br>
      <br>

      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtEmail">Correo Electrónico</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}" />
        </div>
        {{if errorEmail}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorEmail}}</div>
        {{endif errorEmail}}
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtPswd">Contraseña</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" />
        </div>
        {{if errorPswd}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorPswd}}</div>
        {{endif errorPswd}}
      </div>
      {{if generalError}}
      <div class="row">
        {{generalError}}
      </div>

      {{endif generalError}}
      <br>
      <br>
      <br>
      <br>
      <div class="row right flex-end px-4">
        <button class="primary" id="btnLogin" type="submit">Iniciar Sesión</button>
      </div>
    </section>
  </form>
</section>