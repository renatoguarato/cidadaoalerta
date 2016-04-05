package br.gov.justica.cidadaoalerta;

import android.app.ActionBar;
import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

public class TransparenciaActivity extends FragmentActivity {

    private String[] transparencia;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_transparencia);

        transparencia = new String[]{"Recursos registrados (mensais): R$ 17.230.389.176.818,80",
                "Quantidade de informações resgistradas: 2.110.034.573",
                "Dados atualizados em: 7 de Março de 2016",
                "Recursos envolvidos: 14.002.041.307.201,60",
                "Quantidade de informações registradas: 97.807",
                "Dados atualizados em: 28 de Fevereiro de 2016",
                "Recursos envolvidos: R$ 1.117.827.701.503,73",
                "Quantidade de informações registradas: 468.893",
                "Dados atualizados em: 8 de Março de 2016 (CEIS e CNEP) e 1 de Março de 2016 (servidores punidos)",
                "Quantidade de informações registradas CEIS: 12.229",
                "Quantidade de informações registradas CNEP: 1",
                "Quantidade de informações registradas: 3.568 (servidores punidos)",
                "Dados atualizados em: 31 de Janeiro de 2016 (servidores) e 1 de Março de 2016 (servidores punidos)",
                "Quantidade de informações registradas: 1.173.179 (servidores)",
                "Quantidade de informações registradas: 3.568 (servidores punidos)",
                "Dados atualizados em: 7 de Março de 2016",
                "Quantidade de informações registradas: 3.100",
                "Dados atualizados em: 2 de Fevereiro de 2016",
                "Quantidade de informações registradas: 2.865"};

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, transparencia);

        ListView lv = (ListView) findViewById(R.id.listView);
        lv.setAdapter(adapter);
        lv.setOnItemClickListener(clickItem());
    }

    public AdapterView.OnItemClickListener clickItem() {

        return new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

            }
        };
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
            case R.id.item2:
                Intent convenios = new Intent(this, ConveniosActivity.class);
                startActivity(convenios);
                break;
            case R.id.item3:
                Intent ajustes = new Intent(this, AjustesActivity.class);
                startActivity(ajustes);
                break;

        }

        return (true);
    }
}
