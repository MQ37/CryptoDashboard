from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def dashboard():
    with open("pairs.txt", "r") as f:
        pairs = f.readlines()
    pairs = map(lambda x: x.strip(), pairs)
    return render_template('dashboard.html', pairs=pairs)

if __name__ == "__main__":
    app.run(debug=True)
