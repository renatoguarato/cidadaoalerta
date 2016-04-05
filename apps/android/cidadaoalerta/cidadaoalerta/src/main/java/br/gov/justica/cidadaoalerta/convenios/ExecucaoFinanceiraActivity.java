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

public class ExecucaoFinanceiraActivity extends Activity {

    private static final String ITEM = "ITEM";
    private static final String SUB = "SUB";

    List<Map<String, String>> execucao;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_execucao_financeira);

        execucao = new ArrayList<Map<String, String>>();

        Map<String, String> item = new HashMap<>();
        item.put(ITEM, "Data: 08/12/2008");
        item.put(SUB, "Valor: R$ 347.926,32");
        execucao.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Data: 22/12/2008");
        item.put(SUB, "Valor: 402.314,00");
        execucao.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Data: 09/12/2008");
        item.put(SUB, "Valor: R$ 1.509.987,99");
        execucao.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Data: 10/11/2008");
        item.put(SUB, "Valor: R$ 11.124,80");
        execucao.add(Collections.unmodifiableMap(item));

        final String[] fromMapKey = new String[] {ITEM, SUB};
        final int[] toLayoutId = new int[] {android.R.id.text1, android.R.id.text2};

        ListAdapter adapter = new SimpleAdapter(this, Collections.unmodifiableList(execucao), android.R.layout.two_line_list_item, fromMapKey, toLayoutId);

        ListView lv = (ListView) findViewById(R.id.listView);
        lv.setAdapter(adapter);
        lv.setOnItemClickListener(clickItem());
    }

    public AdapterView.OnItemClickListener clickItem() {

        return new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Intent detalhes = new Intent(getApplicationContext(), ExecucaoFinanceiraDetalheActivity.class);
                startActivity(detalhes);
            }
        };
    }
}
