-- Banco de dados fictício de uma loja
CREATE DATABASE IF NOT EXISTS loja;
USE loja;

CREATE TABLE produtos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  preco DECIMAL(8,2) NOT NULL,
  estoque INT DEFAULT 0
);

CREATE TABLE vendas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  produto_id INT,
  quantidade INT NOT NULL,
  data_venda DATE,
  FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO produtos (nome, preco, estoque) VALUES
  ('Camiseta', 39.90, 50),
  ('Calça Jeans', 89.90, 30),
  ('Boné', 25.00, 20);

INSERT INTO vendas (produto_id, quantidade, data_venda) VALUES
  (1, 2, '2026-11-01'),
  (2, 1, '2026-11-02'),
  (1, 3, '2026-11-03');

-- Consultas
SELECT * FROM produtos ORDER BY preco DESC;
SELECT nome FROM produtos WHERE estoque < 25;
SELECT produtos.nome, vendas.quantidade, vendas.data_venda
  FROM vendas JOIN produtos ON vendas.produto_id = produtos.id;
SELECT produto_id, SUM(quantidade) AS total_vendido FROM vendas GROUP BY produto_id;

-- Alterar e excluir
UPDATE produtos SET preco = 44.90 WHERE nome = 'Camiseta';
DELETE FROM vendas WHERE id = 2;
