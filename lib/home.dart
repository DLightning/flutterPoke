import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poke/pk_detail_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List pokedex = [];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  Color colorByType(index) {
    var type = pokedex[index]['type'][0];
    // const color = { "Grass" : Colors.greenAccent, "Fire" : Colors.redAccent, "Water" : Colors.blue,
    //  "Poison" : Colors.deepPurpleAccent,"Electric" : Colors.amber, "Rock" : Colors.grey,
    //  "Ground" : Colors.brown,"Psychic" : Colors.indigo, "Fighting" : Colors.orange,
    //  "Bug" : Colors.lightGreenAccent,"Ghost" : Colors.deepPurple, "Normal" : Colors.black26,
    // };
    var color = type == "Grass" ? const Color(0xFF9bcc50) : type == "Fire" ? const Color(0xFFfd7d24)
        : type == "Water" ? const Color(0xFF4592c4)
                : type == "Poison"
                    ? const Color(0xFFb97fc9)
                    : type == "Electric"
                        ? const Color(0xFFeed535)
                        : type == "Rock"
                            ? const Color(0xFFa38c21)
                            : type == "Ground"
                                ? const Color(0xFFab9842)
                                : type == "Psychic"
                                    ? const Color(0xFFf366b9)
                                    : type == "Fighting"
                                        ? const Color(0xFFd56723)
                                        : type == "Bug"
                                            ? const Color(0xFF729f3f)
                                            : type == "Ghost"
                                                ? const Color(0xFF7b62a3)
                                                : type == "Normal"
                                                    ? const Color(0xFFa4acaf)
                                                    : type == "Fairy"
                                                        ? const Color(
                                                            0xFFfdb9e9)
                                                        : type == "Steel"
                                                            ? const Color(
                                                                0xFF9eb7b8)
                                                            : type == "Ice"
                                                                ? const Color(
                                                                    0xFF51c4e7)
                                                                : type == "Dark"
                                                                    ? const Color(
                                                                        0xFF707070)
                                                                    : const Color(
                                                                        0xFFf16e57);
    return color;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'images/pokeball.png',
              width: 250,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Text(
              "Pokedex",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 1,
            width: width,
            child: Column(
              children: [
                // ignore: unnecessary_null_comparison
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                          ),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: pokedex.length,
                          itemBuilder: ((context, index) {
                            var type = pokedex[index]['type'][0];
                            var name = pokedex[index]['name'];
                            return InkWell(
                              onTap: (() {
                                //Navigate
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PokemonDetailScreen(
                                      heroTag: index,
                                      pokemonDetail: pokedex[index],
                                      color: colorByType(index),
                                    ),
                                  ),
                                );
                              }),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: SafeArea(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colorByType(index),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: -10,
                                          right: -10,
                                          child: Image.asset(
                                            'images/pokeball.png',
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Positioned(
                                          top: 20,
                                          left: 10,
                                          child: Text(
                                            name.toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 45,
                                          left: 20,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color: Colors.black26,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4,
                                                  bottom: 4),
                                              child: Text(
                                                type.toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: CachedNetworkImage(
                                            imageUrl: pokedex[index]['img'],
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body);
        pokedex = data['pokemon'];

        setState(() {});

        print(pokedex);
      }
    }).catchError((e) {
      print(e);
    });
  }
}
