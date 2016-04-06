package br.gov.justica.cidadaoalerta;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class RecuperarSenhaActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recuperar_senha);
    }

    public void enviar(View v) {

        EditText t = (EditText) findViewById(R.id.editText7);
        TextView lbl = (TextView) findViewById(R.id.textView14);

        if (t.getText().toString().trim().equals("")){
            lbl.setVisibility(View.INVISIBLE);

            AlertDialog.Builder builder1 = new AlertDialog.Builder(this);
            builder1.setTitle("Recuperar Senha");
            builder1.setMessage("Informe o e-mail para envio do processo de recuperação de senha.");
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
