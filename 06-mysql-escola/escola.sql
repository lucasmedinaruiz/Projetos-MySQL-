-- Banco de dados fictício de uma escola
CREATE DATABASE IF NOT EXISTS escola;
USE escola;

CREATE TABLE cursos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL
);

CREATE TABLE alunos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(80) NOT NULL,
  idade INT,
  curso_id INT,
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

INSERT INTO cursos (nome) VALUES ('Informática'), ('Administração');

INSERT INTO alunos (nome, idade, curso_id) VALUES
  ('Ana Lima', 17, 1),
  ('Bruno Costa', 18, 1),
  ('Carla Dias', 16, 2);

-- Consultas
SELECT * FROM alunos;
SELECT nome FROM alunos WHERE idade >= 18;
SELECT alunos.nome, cursos.nome AS curso
  FROM alunos JOIN cursos ON alunos.curso_id = cursos.id;
SELECT curso_id, COUNT(*) AS total FROM alunos GROUP BY curso_id;

-- Alterar e excluir
UPDATE alunos SET idade = 19 WHERE nome = 'Bruno Costa';
DELETE FROM alunos WHERE nome = 'Carla Dias';
