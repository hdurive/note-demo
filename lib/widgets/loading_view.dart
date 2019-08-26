import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notish/shared_state/loading.dart';
import 'package:provider/provider.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CnLoading>(
      builder: (context, loading, _) {
        if (loading.isLoading) {
          return Container(
              color: Colors.black.withOpacity(0.5),
              child: SpinKitWave(
                color: Colors.red,
                size: 30,
              ));
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}