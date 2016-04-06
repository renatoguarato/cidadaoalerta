package br.gov.justica.cidadaoalerta;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

public class LoginActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
    }

    public void esqueceu(View v) {

        Intent login = new Intent(this, RecuperarSenhaActivity.class);
        startActivity(login);
    }

    public void entrar(View v) {

        EditText usuario = (EditText) findViewById(R.id.editText5);

        if (!usuario.getText().toString().trim().equals("")) {

        }
    }

    public void cadastrado(View v) {

        Intent cadastro = new Intent(this, CadastroActivity.class);
        startActivity(cadastro);
    }
}
