package br.gov.justica.cidadaoalerta;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class CadastroActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cadastro);
    }

    public void salvar(View v) {

        EditText nome = (EditText) findViewById(R.id.editText8);
        EditText email = (EditText) findViewById(R.id.editText9);
        EditText usuario = (EditText) findViewById(R.id.editText10);
        EditText senha = (EditText) findViewById(R.id.editText11);

        TextView lbl = (TextView) findViewById(R.id.textView16);

        if (nome.getText().toString().trim().equals("") || email.getText().toString().trim().equals("") || usuario.getText().toString().trim().equals("")
                || senha.getText().toString().trim().equals("")){

            lbl.setVisibility(View.INVISIBLE);

            AlertDialog.Builder builder1 = new AlertDialog.Builder(this);
            builder1.setTitle("Cadastro");
            builder1.setMessage("Informe todos os campos para concluir o cadastro.");
            builder1.setCancelable(true);

            builder1.setPositiveButton(
                    "OK",
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int id) {
                            dialog.cancel();
                        }
                    });

            AlertDialog alert11 = builder1.create();
            alert11.show();
        }
        else {
            lbl.setVisibility(View.VISIBLE);
        }
    }
}
