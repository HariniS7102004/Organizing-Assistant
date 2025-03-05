from flask import Flask, request, jsonify, send_file
from PIL import Image
import os

app = Flask(__name__)

UPLOAD_FOLDER = 'uploads'
OUTPUT_FOLDER = 'outputs'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)
os.makedirs(OUTPUT_FOLDER, exist_ok=True)

# Initialize the RoomTransformer (assuming the class is defined in room_transformer.py)
from design_model import RoomTransformer
transformer = RoomTransformer()

@app.route('/')
def home():
    return "Room Transformer API is running!"

@app.route('/transform', methods=['POST'])
def transform_room():
    if 'image' not in request.files:
        return jsonify({"error": "No image file provided"}), 400

    image_file = request.files['image']
    theme = request.form.get('theme', 'modern')

    if image_file.filename == '':
        return jsonify({"error": "No selected file"}), 400

    # Save the uploaded image
    input_path = os.path.join(UPLOAD_FOLDER, image_file.filename)
    image_file.save(input_path)

    # Set the output image path
    output_path = os.path.join(OUTPUT_FOLDER, 'transformed_' + image_file.filename)

    try:
        # Transform the room
        output_image = transformer.transform_room(input_path, theme, output_path)
        
        # Return the transformed image
        return send_file(output_path, mimetype='image/png')
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/visualize', methods=['POST'])
def visualize():
    if 'image' not in request.files:
        return jsonify({"error": "No image file provided"}), 400

    image_file = request.files['image']
    theme = request.form.get('theme', 'modern')

    if image_file.filename == '':
        return jsonify({"error": "No selected file"}), 400

    input_path = os.path.join(UPLOAD_FOLDER, image_file.filename)
    output_path = os.path.join(OUTPUT_FOLDER, 'transformed_' + image_file.filename)
    image_file.save(input_path)

    try:
        # Detect objects and transform the room
        detected_objects = transformer.detect_objects(Image.open(input_path))
        transformer.transform_room(input_path, theme, output_path)

        # Visualize results
        transformer.visualize_results(input_path, output_path, detected_objects)

        return send_file('comparison_3_2.png', mimetype='image/png')
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == '__main__':
    #app.run(debug=True)
    app.run(host='0.0.0.0', port=5000, debug=True)

# Save this as app.py and run it with: python app.py
# Access the API at: http://localhost:5000

# Happy coding! 🚀
