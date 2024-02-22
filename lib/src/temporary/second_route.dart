class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Column(
        children: [
          FlashCard(
              frontWidget: Align(
                alignment: Alignment.center,
                child: Text(
                    // textAlign: TextAlign.center,
                    'front'),
              ),
              backWidget: Align(
                alignment: Alignment.center,
                child: Text('back'),
              )),
          Align(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}
