package br.gov.justica.cidadaoalerta;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import br.gov.justica.cidadaoalerta.convenios.BuscarActivity;

public class ConveniosActivity extends FragmentActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_convenios);
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
            case R.id.item3:
                Intent ajustes = new Intent(this, AjustesActivity.class);
                startActivity(ajustes);
                break;

        }

        return (true);
    }

    public void buscarClick(View v) {

        Intent buscar = new Intent(this, BuscarActivity.class);
        startActivity(buscar);

    }
}
