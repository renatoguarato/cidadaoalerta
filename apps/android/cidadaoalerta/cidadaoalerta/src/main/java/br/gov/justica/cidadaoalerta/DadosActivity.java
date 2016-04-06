package br.gov.justica.cidadaoalerta;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;

public class DadosActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dados);
    }

    public void transparencia(View v) {

        Intent i2=new Intent(Intent.ACTION_VIEW, Uri.parse("http://transparencia.gov.br/"));
        startActivity(i2);
    }

    public void convenios(View v) {

        Intent i2=new Intent(Intent.ACTION_VIEW, Uri.parse("https://portal.convenios.gov.br/pagina-inicial"));
        startActivity(i2);
    }
}
