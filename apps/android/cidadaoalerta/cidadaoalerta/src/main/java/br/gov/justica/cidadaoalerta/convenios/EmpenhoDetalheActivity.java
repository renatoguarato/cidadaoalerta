package br.gov.justica.cidadaoalerta.convenios;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.gov.justica.cidadaoalerta.R;

public class EmpenhoDetalheActivity extends Activity {

    private static final String ITEM = "ITEM";
    private static final String SUB = "SUB";

    List<Map<String, String>> empenhos;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_empenho_detalhe);

        empenhos = new ArrayList<Map<String, String>>();

        Map<String, String> item = new HashMap<>();
        item.put(ITEM, "Número Empenho");
        item.put(SUB, "2008NE800004");
        empenhos.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Situação");
        item.put(SUB, "Registrado SIAFI");
        empenhos.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Tipo de Nota");
        item.put(SUB, "Empenho Original");
        empenhos.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Valor");
        item.put(SUB, "R$ 2.301.592,83");
        empenhos.add(Collections.unmodifiableMap(item));

        final String[] fromMapKey = new String[] {ITEM, SUB};
        final int[] toLayoutId = new int[] {android.R.id.text1, android.R.id.text2};

        ListAdapter adapter = new SimpleAdapter(this, Collections.unmodifiableList(empenhos), android.R.layout.two_line_list_item, fromMapKey, toLayoutId);

        ListView lv = (ListView) findViewById(R.id.listView);
        lv.setAdapter(adapter);
    }
}
