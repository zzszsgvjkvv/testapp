import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'listitme.dart';

class Category extends StatefulWidget {
  Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
 
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
     GlobalKey<FormState> keyform = GlobalKey();
  var select = countrcategor[0]['countr'];
  var serch;
 
  double higth = 4;
  final controler = PageController();
  valid(String val) {
    if (val.isEmpty) {
      return "  impty serch";
    } else {
      keyform.currentState!.save();
    }
  }
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 60,
            child: DropdownButton(
              value: select,
              items: countrcategor
                  .map((e) => DropdownMenuItem(
                        onTap: () {
                          print(
                            e['countr'],
                          );
                        },
                        value: e['countr'],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(e['countr']),
                            const SizedBox(
                              width: 10,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            //
                            Image.network(
                              e['image1'],
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  select = val;
                });
              },
            ),
          ),
          SizedBox(
            width: 400,
            height: higth * 0.2,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: controler,
              children: [
                ...sliderimage.map((e) => Padding(
                      padding: const EdgeInsets.only(left: 15, right: 5),
                      child: Image.network(
                        e['image'],
                        fit: BoxFit.fitWidth,
                      ),
                    ))
              ],
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              effect: const JumpingDotEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Color.fromARGB(255, 255, 42, 0)),
              count: 3,
              controller: controler,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: Form(
                key: keyform,
                child: TextFormField(
                  validator: (value) {
                    return valid(value!);
                  },
                  cursorColor: Color.fromARGB(255, 247, 105, 10),
                  onSaved: (value) {
                    serch = value;
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 123, 123, 123))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 53, 52, 51))),
                    errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 254, 34, 5))),

                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 60, 60, 60))),
                    disabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 21, 21, 21))),
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Color.fromARGB(255, 241, 112, 7),
                      ),
                      onPressed: () {
                        if (keyform.currentState!.validate()) {
                          print(serch);
                        } else {}
                      },
                    ),
                    hintText: "serch",
                    //suffix: Text()
                  ),
                )),
          ),
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          SizedBox(
            width: double.infinity,
            height: 0.05 * higth,
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 0.05 * higth,
                    child: const Text(
                      "all",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      ...city.map((e) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onDoubleTap: () {
                                setState(() {
                                  e['color'] =
                                      const Color.fromARGB(255, 135, 125, 120);
                                });
                              },
                              onTap: () {
                                setState(() {
                                  e['color'] = e['color'] ==
                                          const Color.fromARGB(
                                              255, 255, 100, 29)
                                      ? Colors.white
                                      : const Color.fromARGB(255, 255, 100, 29);
                                });
                              },
                              child: Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: e['color'],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  e['namcity'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 75, 75, 75)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        );
                      }).toList()
                    ]),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: higth - higth / 4,
            width: double.infinity,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5),
                itemCount: categorycity.length,
                //  physics:const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => ListView(
                      children: [
                        SizedBox(
                          child: Image.network(
                            categorycity[i]['image'],
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    )),
          )
        ],
      ),
    ));
  }
}
