import os
from flask import Flask, request, redirect, render_template
import mysql.connector
from dotenv import load_dotenv
 
load_dotenv()
 
app = Flask(__name__, static_folder='static', template_folder='templates')
 
 
def get_conn():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", "db_direcao")
    )
 
 
@app.route('/')
def index():
    return render_template('index.html')
 
 
@app.route('/painel')
def painel():
    conn   = get_conn()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM preCadastro ORDER BY id DESC")
    cadastros = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('painel.html', cadastros=cadastros)
 
 
@app.route('/contato')
def contato():
    enviado = request.args.get('enviado', 0)
    return render_template('contato.html', enviado=enviado)
 
 
@app.route('/salvar', methods=['POST'])
def salvar():
    nome     = request.form['nome']
    cpf      = request.form['cpf']
    email    = request.form['email']
    telefone = request.form['telefone']
    servico  = request.form['servico']
 
    try:
        conn   = get_conn()
        cursor = conn.cursor()
        cursor.execute(
            """INSERT INTO preCadastro (nome, cpf, email, telefone, servico_desejado)
               VALUES (%s, %s, %s, %s, %s)""",
            (nome, cpf, email, telefone, servico)
        )
        conn.commit()
    except mysql.connector.IntegrityError:
        return redirect('/contato?erro=cpf_duplicado')
    finally:
        cursor.close()
        conn.close()
 
    return redirect('/contato?enviado=1')
 
 
if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)
