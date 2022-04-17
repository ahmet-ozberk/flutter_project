import 'package:flutter/material.dart';
import 'package:flutter_project/component/appBar.dart';
import 'package:flutter_project/riverpod/riverpod_management.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class ProductDetail extends ConsumerStatefulWidget {
  String image;
  String title;
  ProductDetail({required this.image, required this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  @override
  void initState() {
    ref.read(productRiverpod).products.clear();
    ref.read(productRiverpod).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var read = ref.read(productRiverpod);
    var watch = ref.watch(productRiverpod);
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        isBack: true,
        isExit: false,
      ),
      body: ListView(
        children: [
          Hero(
            tag: widget.image,
            child: Image.network(
              widget.image,
              width: double.infinity,
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: 10.allP,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: watch.products.length,
            itemBuilder: (context, index) {
              var item = watch.products[index];
              return Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: 20.allBR,
                ),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: 20.allBR,
                    image: DecorationImage(
                        image: NetworkImage(item.image), fit: BoxFit.fill),
                  ),
                  child: GrockGlassMorphism(
                    blur: 5,
                    opacity: 0.1,
                    color: Colors.black,
                    borderRadius: 20,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            item.description,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
