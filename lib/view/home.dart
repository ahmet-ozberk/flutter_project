import 'package:flutter/material.dart';
import 'package:flutter_project/component/appBar.dart';
import 'package:flutter_project/riverpod/riverpod_management.dart';
import 'package:flutter_project/view/product_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var read = ref.read(homeRiverpod);
    var watch = ref.watch(homeRiverpod);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Anasayfa",
        isExit: true,
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: watch.categories.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          padding: [15, 15, 15, 30].paddingLTRB,
          itemBuilder: (context, index) {
            var item = watch.categories[index];
            return Hero(
              tag: item.image,
              child: GrockContainer(
                onTap: () => Grock.to(ProductDetail(
                  image: item.image,
                  title: item.title,
                  list: item.items,
                )),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: 20.allBR,
                  image: DecorationImage(
                    image: NetworkImage(item.image),
                    fit: BoxFit.fill,
                    opacity: 0.9,
                    colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.9),
                      BlendMode.modulate,
                    ),
                  ),
                ),
                child: Center(
                  child: GrockGlassMorphism(
                    blur: 20,
                    opacity: 0.1,
                    color: Colors.black,
                    borderRadius: 20,
                    child: Container(
                      padding: [15, 5].horizontalAndVerticalP,
                      child: Text(
                        item.title,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
