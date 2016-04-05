package br.gov.justica.cidadaoalerta.convenios;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RadioGroup;
import android.widget.SimpleAdapter;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.gov.justica.cidadaoalerta.R;

public class DetalhesActivity extends FragmentActivity {

    private static final String ITEM = "ITEM";
    private static final String SUB = "SUB";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detalhes);

        final String[] fromMapKey = new String[] {ITEM, SUB};
        final int[] toLayoutId = new int[] {android.R.id.text1, android.R.id.text2};

        ListAdapter adapter = new SimpleAdapter(this, Collections.unmodifiableList(createDetalhes()), android.R.layout.two_line_list_item, fromMapKey, toLayoutId);

        ListView lv = (ListView) findViewById(R.id.listView);
        lv.setAdapter(adapter);

        final RadioGroup group = (RadioGroup)findViewById(R.id.tipo);
        group.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup group, int id) {
            if(id == R.id.radioButton) {
                createList(createDetalhes());
            } else if(id==R.id.radioButton2) {
                createList(createComentarios());
            }
        }});
    }

    private void createList(List<Map<String, String>>  items) {

        final String[] fromMapKey = new String[] {ITEM, SUB};
        final int[] toLayoutId = new int[] {android.R.id.text1, android.R.id.text2};

        ListAdapter adapter = new SimpleAdapter(this, Collections.unmodifiableList(items), android.R.layout.two_line_list_item, fromMapKey, toLayoutId);

        ListView lv = (ListView) findViewById(R.id.listView);
        lv.setAdapter(adapter);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);

        getMenuInflater().inflate(R.menu.menu_detalhes, menu);

        return (true);
    }

    @Override
    public boolean onMenuItemSelected(int panel, MenuItem item) {

        switch (item.getItemId()) {
            case R.id.item1:
                Intent empenho = new Intent(this, Empenho.class);
                startActivity(empenho);
                break;
            case R.id.item2:
                Intent execucao = new Intent(this, ExecucaoFinanceiraActivity.class);
                startActivity(execucao);
                break;

        }

        return (true);
    }


    private List<Map<String, String>> createDetalhes() {

        List<Map<String, String>> detalhes = new ArrayList<Map<String, String>>();

        Map<String, String> item = new HashMap<>();
        item.put(ITEM, "Número Convênio");
        item.put(SUB, "700026");
        detalhes.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Proponente");
        item.put(SUB, "PROMOÇÃO E PARTICIPAÇÃO EM EVENTOS TURISTICOS NACIONAIS E INTERNACIONAIS - EMENDAS");
        detalhes.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "UF Proponente");
        item.put(SUB, "DF");
        detalhes.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Cidade Proponente");
        item.put(SUB, "Brasília");
        detalhes.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Data Inclusão Proposta");
        item.put(SUB, "29/08/2009");
        detalhes.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Situação");
        item.put(SUB, "Proposta/Plano de Trabalho Aprovados");
        detalhes.add(Collections.unmodifiableMap(item));

        return detalhes;
    }

    private List<Map<String, String>> createComentarios() {

        List<Map<String, String>> detalhes = new ArrayList<Map<String, String>>();

        Map<String, String> item = new HashMap<>();
        item.put(ITEM, "Renato Guarato");
        item.put(SUB, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        detalhes.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "João da Silva");
        item.put(SUB, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.");
        detalhes.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Maria Eduarda");
        item.put(SUB, "orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.");
        detalhes.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Renato Guarato");
        item.put(SUB, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
        detalhes.add(Collections.unmodifiableMap(item));

        return detalhes;
    }

}
