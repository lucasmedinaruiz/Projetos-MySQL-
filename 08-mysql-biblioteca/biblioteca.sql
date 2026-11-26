-- Banco de dados fictício de uma biblioteca
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE livros (
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(80),
  disponivel BOOLEAN DEFAULT TRUE
);

CREATE TABLE leitores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(80) NOT NULL
);

CREATE TABLE emprestimos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  livro_id INT,
  leitor_id INT,
  data_emprestimo DATE,
  FOREIGN KEY (livro_id) REFERENCES livros(id),
  FOREIGN KEY (leitor_id) REFERENCES leitores(id)
);

INSERT INTO livros (titulo, autor) VALUES
  ('Dom Casmurro', 'Machado de Assis'),
  ('O Cortiço', 'Aluísio Azevedo'),
  ('Capitães da Areia', 'Jorge Amado');

INSERT INTO leitores (nome) VALUES ('Marcos'), ('Julia');

INSERT INTO emprestimos (livro_id, leitor_id, data_emprestimo) VALUES (1, 1, '2026-11-10');
UPDATE livros SET disponivel = FALSE WHERE id = 1;

-- Consultas
SELECT * FROM livros WHERE disponivel = TRUE;
SELECT leitores.nome, livros.titulo, emprestimos.data_emprestimo
  FROM emprestimos
  JOIN leitores ON emprestimos.leitor_id = leitores.id
  JOIN livros ON emprestimos.livro_id = livros.id;

-- Devolução
DELETE FROM emprestimos WHERE livro_id = 1;
UPDATE livros SET disponivel = TRUE WHERE id = 1;
