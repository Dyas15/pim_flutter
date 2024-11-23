import 'package:flutter/material.dart';

List<Card> construirGridCards(List<dynamic> produtos) {
  return produtos.map((produto) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: produto['IMAGEM'] != null
                ? Image.network(
                    produto['IMAGEM'] + '?cache_buster=${DateTime.now().millisecondsSinceEpoch}',
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                          child: Icon(Icons.error));
                    },
                  )
                : Image.asset('images/logo_pequena.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  produto['NOME_PRODUTO'] ?? 'Nome indisponível',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "R\$${produto['PRECO_UNITARIO'] ?? 'Sem preço'}/Kg",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }).toList();
}
