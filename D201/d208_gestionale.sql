/*
tipo_prodotto
 tipo_prodotto vc50 /nn /unique
 gruppo vc50 /nn

prodotto
  prodotto vc50 /nn /unique
  tipo_prodotto_id /nn
  prezzo acquisto num /nn
  prezzo vendita num /nn

cliente
  cliente vc50 /nn /unique
  zona vc10 /nn

fornitore
  fornitore vc50 /nn /unique
  zona vc50 /nn

acquisto
  data d /nn
  fornitore_id /nn
  prodotto_id /nn
  quantita num /nn

vendita
  data d /nn
  cliente_id  /nn
  prodotto_id /nn
  quantita num /nn


# settings = { prefix: "D208", ondelete: "RESTRICT", drop: true }
*/