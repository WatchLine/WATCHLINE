const http = require('http');
const fs = require('fs');
const url = require('url');
const path = require('path');
const mysql = require('mysql');

const dbConfig = {
  host: 'bd_watchline.mysql.dbaas.com.br',
  user: 'bd_watchline',
  password: 'WTLNtcc#23',
  database: 'bd_watchline',
};

const pool = mysql.createPool(dbConfig);

const server = http.createServer((req, res) => {
  const parsedUrl = url.parse(req.url, true);
  const pathname = parsedUrl.pathname;
  const method = req.method;

  if (pathname === '/api/salvarPerfil' && method === 'POST') {
    handleSaveProfile(req, res);
  } else if (pathname === '/api/obterPerfil' && method === 'GET') {
    handleGetProfile(req, res);
  } else {
    // Resposta para solicitações desconhecidas
    res.writeHead(404);
    res.end('404 Not Found');
  }
});

const handleSaveProfile = (req, res) => {
  let body = '';

  req.on('data', (chunk) => {
    body += chunk;
  });

  req.on('end', () => {
    const profileData = JSON.parse(body);

    const sql = 'INSERT INTO informacoes_perfil (name, email, age, location, bio, profileImage) VALUES (?, ?, ?, ?, ?, ?)';
    const values = [
      profileData.name,
      profileData.email,
      profileData.age,
      profileData.location,
      profileData.bio,
      profileData.profileImage,
    ];

    pool.query(sql, values, (err, result) => {
      if (err) {
        console.error('Erro ao salvar perfil:', err);
        res.writeHead(500);
        res.end('Erro interno do servidor ao salvar perfil');
      } else {
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ success: true, message: 'Perfil salvo com sucesso' }));
      }
    });
  });
};

const handleGetProfile = (req, res) => {
  const userId = parsedUrl.query.userId;

  if (!userId) {
    res.writeHead(400);
    res.end('Parâmetro userId ausente');
    return;
  }

  const sql = 'SELECT * FROM informacoes_perfil WHERE id = ?';

  pool.query(sql, [userId], (err, rows) => {
    if (err) {
      console.error('Erro ao obter perfil:', err);
      res.writeHead(500);
      res.end('Erro interno do servidor ao obter perfil');
    } else {
      if (rows.length > 0) {
        const userProfile = rows[0];
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify(userProfile));
      } else {
        res.writeHead(404);
        res.end('Perfil não encontrado');
      }
    }
  });
};

const port = process.env.PORT || 3000;

server.listen(port, () => {
  console.log(`Servidor iniciado em http://localhost:${port}`);
});
