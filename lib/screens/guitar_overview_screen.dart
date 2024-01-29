import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/guitar_provider.dart';

import '../widgets/guitar_card.dart';

class GuitarOverviewScreen extends StatefulWidget {
  const GuitarOverviewScreen({Key? key}) : super(key: key);

  @override
  State<GuitarOverviewScreen> createState() => _GuitarOverviewScreenState();
}

class _GuitarOverviewScreenState extends State<GuitarOverviewScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<GuitarProvider>(context)
          .fetchAndSetProducts()
          .then((_) {})
          .catchError((err) {
        print(err);
      }).whenComplete(() {
        _init = false;
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         title: Text("Hactiv8 Music Shop"),
//       ),
//       body: Consumer<GuitarProvider>(
//         builder: (ctx, guitar, ch) {
//           final guitarDatas = guitar.guitars;
//           return _isLoading
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView(
//                   children: guitarDatas
//                       .map(
//                         (guitar) => GuitarCard(
//                           key: ValueKey(guitar.id),
//                           brand: guitar.brand,
//                           type: guitar.type,
//                           price: guitar.price,
//                           desc: guitar.desc,
//                           imgUrl: guitar.imgUrl,
//                         ),
//                       )
//                       .toList(),
//                 );
//         },
//       ),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Hactiv8 Music Shop"),
      ),
      body: FutureBuilder(
        future: Provider.of<GuitarProvider>(context, listen: false)
            .fetchAndSetProducts(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<GuitarProvider>(
              builder: (ctx, guitar, ch) {
                final guitarDatas = guitar.guitars;
                return ListView(
                  children: guitarDatas
                      .map(
                        (guitar) => GuitarCard(
                          key: ValueKey(guitar.id),
                          brand: guitar.brand,
                          type: guitar.type,
                          price: guitar.price,
                          desc: guitar.desc,
                          imgUrl: guitar.imgUrl,
                        ),
                      )
                      .toList(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
