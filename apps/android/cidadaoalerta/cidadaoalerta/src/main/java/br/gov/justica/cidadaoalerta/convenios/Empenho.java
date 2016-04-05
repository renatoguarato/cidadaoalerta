package br.gov.justica.cidadaoalerta.convenios;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.gov.justica.cidadaoalerta.R;

public class Empenho extends Activity {

    private static final String ITEM = "ITEM";
    private static final String SUB = "SUB";

    List<Map<String, String>> empenhos;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_empenho);

        empenhos = new ArrayList<Map<String, String>>();

        Map<String, String> item = new HashMap<>();
        item.put(ITEM, "Número: 2008NE800004");
        item.put(SUB, "Valor: R$ 666.666,67");
        empenhos.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Número: 2008NE800005");
        item.put(SUB, "Valor: R$ 235.000,00");
        empenhos.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Número: 2008NE800006");
        item.put(SUB, "Valor: R$ 7.540.451,18");
        empenhos.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Número: 2008NE800009");
        item.put(SUB, "Valor: R$ 2.301.592,83");
        empenhos.add(Collections.unmodifiableMap(item));

        final String[] fromMapKey = new String[] {ITEM, SUB};
        final int[] toLayoutId = new int[] {android.R.id.text1, android.R.id.text2};

        ListAdapter adapter = new SimpleAdapter(this, Collections.unmodifiableList(empenhos), android.R.layout.two_line_list_item, fromMapKey, toLayoutId);

        ListView lv = (ListView) findViewById(R.id.listView);
        lv.setAdapter(adapter);
        lv.setOnItemClickListener(clickItem());
    }

    public AdapterView.OnItemClickListener clickItem() {

        return new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Intent detalhes = new Intent(getApplicationContext(), EmpenhoDetalheActivity.class);
                startActivity(detalhes);
            }
        };
    }
}
