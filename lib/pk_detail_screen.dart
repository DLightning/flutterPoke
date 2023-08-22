import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final heroTag;
  final pokemonDetail;
  final Color? color;

  const PokemonDetailScreen(
      {Key? key, this.heroTag, this.pokemonDetail, this.color})
      : super(key: key);

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.pokemonDetail);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 1,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Positioned(
              top: 70,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    "#" + widget.pokemonDetail['num'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              )),
          Positioned(
            top: 110,
            left: 22,
            child: Text(
              widget.pokemonDetail['name'],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.black.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.pokemonDetail['type'].join(', '),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.18,
            right: -30,
            child: Image.asset('images/pokeball.png',
                height: 200, fit: BoxFit.fitHeight),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.2,
                            child: const Text(
                              "Name",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                            child: Icon(
                              Icons.arrow_forward,
                              color: widget.color,
                            ),
                          ),
                          SizedBox(
                            // width: width * 0.2,
                            child: Text(
                              widget.pokemonDetail['name'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.2,
                            child: const Text(
                              "Height",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                            child: Icon(
                              Icons.arrow_forward,
                              color: widget.color,
                            ),
                          ),
                          SizedBox(
                            // width: width * 0.2,
                            child: Text(
                              widget.pokemonDetail['height'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.2,
                            child: const Text(
                              "Weight",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                            child: Icon(
                              Icons.arrow_forward,
                              color: widget.color,
                            ),
                          ),
                          SizedBox(
                            // width: width * 0.2,
                            child: Text(
                              widget.pokemonDetail['weight'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.2,
                            child: const Text(
                              "Spawn Time",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                            child: Icon(
                              Icons.arrow_forward,
                              color: widget.color,
                            ),
                          ),
                          SizedBox(
                            // width: width * 0.2,
                            child: Text(
                              widget.pokemonDetail['spawn_time'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.2,
                            child: const Text(
                              "Weakness",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                            child: Icon(
                              Icons.arrow_forward,
                              color: widget.color,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                            child: Text(
                              widget.pokemonDetail['weaknesses'].join(", "),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.2,
                            child: const Text(
                              "Next Evolution",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                            child: Icon(
                              Icons.arrow_forward,
                              color: widget.color,
                            ),
                          ),
                          widget.pokemonDetail['next_evolution'] != null
                              ? SizedBox(
                                  height: 20,
                                  width: width * 0.4,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget
                                          .pokemonDetail['next_evolution']
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            widget.pokemonDetail[
                                                    'next_evolution'][index]
                                                ['name'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              : const Text(
                                  'Maxed Out',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.2,
                            child: const Text(
                              "Prev Evolution",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                            child: Icon(
                              Icons.arrow_forward,
                              color: widget.color,
                            ),
                          ),
                          widget.pokemonDetail['prev_evolution'] != null
                              ? SizedBox(
                                  height: 20,
                                  width: width * 0.3,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget
                                          .pokemonDetail['prev_evolution']
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            widget.pokemonDetail[
                                                    'prev_evolution'][index]
                                                ['name'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              : const Text(
                                  'Just Hatched',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * 0.2),
            left: (width / 2) - 100,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                  imageUrl: widget.pokemonDetail['img'],
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
