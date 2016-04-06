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

public class ExecucaoFinanceiraDetalheActivity extends Activity {

    private static final String ITEM = "ITEM";
    private static final String SUB = "SUB";

    List<Map<String, String>> execucao;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_execucao_financeira_detalhe);

        execucao = new ArrayList<Map<String, String>>();

        Map<String, String> item = new HashMap<>();
        item.put(ITEM, "Número Proposta");
        item.put(SUB, "1591");
        execucao.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Modalidade");
        item.put(SUB, "Prestação de Contas em Análise");
        execucao.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Órgão Superior");
        item.put(SUB, "MINISTERIO DO DESENV. SOCIAL E COMBATE A FOME");
        execucao.add(Collections.unmodifiableMap(item));

        item = new HashMap<>();
        item.put(ITEM, "Valor");
        item.put(SUB, "R$ 347.926,32");
        execucao.add(Collections.unmodifiableMap(item));

        final String[] fromMapKey = new String[] {ITEM, SUB};
        final int[] toLayoutId = new int[] {android.R.id.text1, android.R.id.text2};

        ListAdapter adapter = new SimpleAdapter(this, Collections.unmodifiableList(execucao), android.R.layout.two_line_list_item, fromMapKey, toLayoutId);

        ListView lv = (ListView) findViewById(R.id.listView);
        lv.setAdapter(adapter);
    }
}
