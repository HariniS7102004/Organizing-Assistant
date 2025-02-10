// import 'package:flutter/material.dart';
// import 'dart:math';

// class InputLayout extends StatefulWidget {
//   const InputLayout({super.key});

//   @override
//   InputLayoutState createState() => InputLayoutState();
// }

// class InputLayoutState extends State<InputLayout> {
//   List<Offset?> points = []; // Stores drawn lines
//   List<ShapeData> shapes = []; // Stores placed shapes
//   String selectedShape = 'Rectangle'; // Default selected shape

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Mini MS Paint")),
//       body: Stack(
//         children: [
//           // Drawing canvas
//           GestureDetector(
//             onPanUpdate: (details) {
//               setState(() {
//                 points.add(details.localPosition); // Capture drawing points
//               });
//             },
//             onPanEnd: (_) {
//               points.add(null); // End the current line
//             },
//             child: CustomPaint(
//               size: Size.infinite,
//               painter: LayoutPainter(points),
//             ),
//           ),

//           // Draggable Shapes
//           Positioned(
//             bottom: 20,
//             left: 20,
//             child: Row(
//               children: ['Rectangle', 'Circle', 'Triangle'].map((shape) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedShape = shape;
//                     });
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: selectedShape == shape ? Colors.blue : Colors.grey,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Text(shape, style: const TextStyle(color: Colors.white)),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),

//           // Draggable and resizable shapes
//           ...shapes.map((shape) {
//             return Positioned(
//               left: shape.position.dx,
//               top: shape.position.dy,
//               child: GestureDetector(
//                 // onPanUpdate: (details) {
//                 //   setState(() {
//                 //     shape.position += details.delta; // Move shape
//                 //   });
//                 // },
//                 onScaleUpdate: (details) {
//                   setState(() {
//                     shape.size *= details.scale.clamp(0.5, 2.0); // Resize shape
//                   });
//                 },
//                 child: CustomPaint(
//                   size: Size(shape.size, shape.size),
//                   painter: ShapePainter(shape.type),
//                 ),
//               ),
//             );
//           }),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             shapes.add(ShapeData(
//               type: selectedShape,
//               position: const Offset(100, 100),
//               size: 50.0,
//             ));
//           });
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// // Custom painter for freehand drawing
// class LayoutPainter extends CustomPainter {
//   final List<Offset?> points;
//   LayoutPainter(this.points);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 5.0;

//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 1] != null) {
//         canvas.drawLine(points[i]!, points[i + 1]!, paint);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

// // Custom painter for drawing shapes
// class ShapePainter extends CustomPainter {
//   final String type;
//   ShapePainter(this.type);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = Colors.red;
    
//     switch (type) {
//       case 'Rectangle':
//         canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
//         break;
//       case 'Circle':
//         canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);
//         break;
//       case 'Triangle':
//         Path path = Path();
//         path.moveTo(size.width / 2, 0);
//         path.lineTo(size.width, size.height);
//         path.lineTo(0, size.height);
//         path.close();
//         canvas.drawPath(path, paint);
//         break;
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

// // Data model for shapes
// class ShapeData {
//   String type;
//   Offset position;
//   double size;

//   ShapeData({required this.type, required this.position, required this.size});
// }

//resizing not working
import 'package:flutter/material.dart';

class InputLayout extends StatefulWidget {
  const InputLayout({super.key});

  @override
  InputLayoutState createState() => InputLayoutState();
}

class InputLayoutState extends State<InputLayout> {
  List<Offset?> points = [];
  List<ShapeData> shapes = [];
  String selectedShape = 'Rectangle';
  int? selectedShapeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mini MS Paint")),
      body: Stack(
        children: [
          // Drawing Canvas
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                points.add(details.localPosition);
              });
            },
            onPanEnd: (_) {
              points.add(null);
            },
            child: CustomPaint(
              size: Size.infinite,
              painter: LayoutPainter(points),
            ),
          ),

          // Shape Selector
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: ['Rectangle', 'Circle', 'Triangle'].map((shape) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedShape = shape;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedShape == shape ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(shape, style: const TextStyle(color: Colors.white)),
                  ),
                );
              }).toList(),
            ),
          ),

          // Draggable & Resizable Shapes
          ...shapes.asMap().entries.map((entry) {
            int index = entry.key;
            ShapeData shape = entry.value;

            return Positioned(
              left: shape.position.dx,
              top: shape.position.dy,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedShapeIndex = index; // Select shape
                  });
                },
                onScaleStart: (details) {
                  if (selectedShapeIndex == index) {
                    shape.initialScale = shape.scale;
                  }
                },
                onScaleUpdate: (details) {
                  if (selectedShapeIndex == index) {
                    setState(() {
                      shape.scale = (shape.initialScale * details.scale).clamp(0.5, 3.0);
                      shape.position += details.focalPointDelta; // Move shape
                    });
                  }
                },
                child: Transform.scale(
                  scale: shape.scale,
                  child: CustomPaint(
                    size: const Size(60, 60),
                    painter: ShapePainter(shape.type, isSelected: selectedShapeIndex == index),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            shapes.add(ShapeData(
              type: selectedShape,
              position: const Offset(100, 100),
              scale: 1.0,
            ));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Drawing Freehand Lines
class LayoutPainter extends CustomPainter {
  final List<Offset?> points;
  LayoutPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// Drawing Shapes (Outlined)
class ShapePainter extends CustomPainter {
  final String type;
  final bool isSelected;
  ShapePainter(this.type, {required this.isSelected});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isSelected ? Colors.green : Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke; // Outline only

    switch (type) {
      case 'Rectangle':
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
        break;
      case 'Circle':
        canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);
        break;
      case 'Triangle':
        Path path = Path();
        path.moveTo(size.width / 2, 0);
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height);
        path.close();
        canvas.drawPath(path, paint);
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// Shape Model
class ShapeData {
  String type;
  Offset position;
  double scale;
  double initialScale;

  ShapeData({required this.type, required this.position, required this.scale})
      : initialScale = scale;
}
