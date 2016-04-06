package br.gov.justica.cidadaoalerta;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

public class AjustesActivity extends FragmentActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ajustes);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);

        getMenuInflater().inflate(R.menu.menu, menu);

        return (true);
    }

    @Override
    public boolean onMenuItemSelected(int panel, MenuItem item) {

        switch (item.getItemId()) {
            case R.id.item1:
                Intent transparencia = new Intent(this, TransparenciaActivity.class);
                startActivity(transparencia);
                break;
            case R.id.item2:
                Intent convenios = new Intent(this, ConveniosActivity.class);
                startActivity(convenios);
                break;

        }

        return (true);
    }

    public void login(View v) {

        Intent login = new Intent(this, LoginActivity.class);
        startActivity(login);
    }

    public void dados(View v) {

        Intent dados = new Intent(this, DadosActivity.class);
        startActivity(dados);
    }
}
