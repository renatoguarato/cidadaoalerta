package br.gov.justica.cidadaoalerta.convenios;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.gov.justica.cidadaoalerta.R;

public class BuscarActivity extends Activity {

    private static final String ITEM = "ITEM";
    private static final String SUB = "SUB";

    List<Map<String, String>> convenios;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_buscar);

        convenios = new ArrayList<Map<String, String>>();

        Map<String, String> item = new HashMap<>();
        item.put(ITEM, "PROMOÇÃO E PARTICIPAÇÃO EM EVENTOS TURISTICOS NACIONAIS E INTERNACIONAIS - EMENDAS");
        item.put(SUB, "Comentários: 3");
        convenios.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "0152 - Sistema Nacional de Atendimento Socioeducativo ao Adolescente em Conflito com a Lei - Pró-Sinase - CONVÊNIOS");
        item.put(SUB, "Comentários: 0");
        convenios.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "0152 - Aquisição de Alimentos Provenientes da Agricultura Familiar");
        item.put(SUB, "Comentários: 1000");
        convenios.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Turismo Social no Brasil: Uma Viagem de Inclusão - Convênios");
        item.put(SUB, "Comentários: 1");
        convenios.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "PROMOÇÃO E PARTICIPAÇÃO EM EVENTOS TURISTICOS NACIONAIS E INTERNACIONAIS - PROGRAMAÇÃO");
        item.put(SUB, "Comentários: 5");
        convenios.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "1008 -  Inclusão Digital / Ação Observatório Nacional de Inclusão Digital");
        item.put(SUB, "Comentários: 1");
        convenios.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "1025 - Promoção da Sustentabilidade de Espaços Sub-Regionais - PROMESO - Ação 04.845.1025.005E.0210 - Apoio a Projetos de Desenvolvimento Sustentável Local Integrado - em Subregiões - No Estado do Piauí");
        item.put(SUB, "Comentários: 100");
        convenios.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Programa de Apoio a Núcleos de Excelência - PRONEX");
        item.put(SUB, "Comentários: 9");
        convenios.add(Collections.unmodifiableMap(item));

        final String[] fromMapKey = new String[] {ITEM, SUB};
        final int[] toLayoutId = new int[] {android.R.id.text1, android.R.id.text2};

        ListAdapter adapter = new SimpleAdapter(this, Collections.unmodifiableList(convenios), android.R.layout.two_line_list_item, fromMapKey, toLayoutId);

        ListView lv = (ListView) findViewById(R.id.listView);
        lv.setAdapter(adapter);
        lv.setOnItemClickListener(clickItem());

    }

    public AdapterView.OnItemClickListener clickItem() {

        return new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Intent detalhes = new Intent(getApplicationContext(), DetalhesActivity.class);
                startActivity(detalhes);
            }
        };
    }
}
