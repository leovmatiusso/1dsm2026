from flask import Flask, request, redirect, render_template
import mysql.connector

app = Flask(__name__)

def get_conn():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="leovm",
        database="db_direcao"
    )

@app.route('/contato')
def contato():
    return render_template('contato.html')

@app.route('/salvar', methods=['POST'])
def salvar():
    nome     = request.form['nome']
    cpf      = request.form['cpf']
    email    = request.form['email']
    telefone = request.form['telefone']
    servico = request.form['servico']

    conn   = get_conn()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO preCadastro (nome, cpf, email, telefone, servico_desejado) VALUES (%s, %s, %s, %s, %s)",
        (nome, cpf, email, telefone, servico)
    )
    conn.commit()
    cursor.close()
    conn.close()

    return redirect('/contato?enviado=1')

if __name__ == '__main__':
    app.run(debug=True)