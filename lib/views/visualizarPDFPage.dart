import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';


class VisualizarPDFPage extends StatelessWidget {

  final String _caminhoPDF;
  const VisualizarPDFPage(this._caminhoPDF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ler Livro'),
      ),
      body: PdfViewer.asset(_caminhoPDF, params: PdfViewerParams(enableTextSelection: true,scrollByMouseWheel: 0.8,scrollByArrowKey: 50) ,)
    );
  }
}