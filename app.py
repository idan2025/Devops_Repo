from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World, Built with Jenkinsfile"

if __name__ == "__main__":
    # Bind to all interfaces so Docker can map the port
    app.run(host="0.0.0.0", port=5000, debug=True)
