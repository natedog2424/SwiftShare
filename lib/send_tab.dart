import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_share/countdown.dart';
import 'models/app_state_model.dart';

class SendTab extends StatelessWidget {
  const SendTab({super.key});

  String _getHeading(SendTabState state) {
    switch (state) {
      case SendTabState.idle:
        return 'Send';
      case SendTabState.requestingSession:
        return 'Requesting Session';
      case SendTabState.awatingFiles:
        return 'Awaiting Files';
      case SendTabState.uploadingFiles:
        return 'Uploading Files';
      case SendTabState.complete:
        return 'Complete';
      case SendTabState.expired:
        return 'Expired';
      case SendTabState.error:
        return 'Error';
    }
  }

  String _percentage(double value) {
    return '${(value * 100).toStringAsFixed(0)}%';
  }

  @override
  Widget build(BuildContext context) {
    AppStateModel model = Provider.of<AppStateModel>(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            (model.sendFileSession.id == '')
                ? _getHeading(model.sendTabState)
                : model.sendFileSession.id,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          if (model.sendFileSession.id != '')
            CountdownTimer(model.sendFileSession.expires,
                message: "Expires in: "),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: model.sendFileSession.files
                  .map((file) => ListTile(
                        title: Text(file.name),
                        subtitle: Text('${file.progress}/${file.size} bytes'),
                        trailing: Text(_percentage(file.progress / file.size)),
                      ))
                  .toList(),
            ),
          ),
          FloatingActionButton.extended(
            label: const Text('Upload Files'),
            onPressed: () {
              model.uploadFiles(context);
            },
            icon: const Icon(Icons.add_rounded),
          )
        ],
      ),
    );
  }
}
