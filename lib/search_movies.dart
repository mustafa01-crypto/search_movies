import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:movies/list_tile_image.dart';
import 'package:movies/service/api.dart';
import 'package:sizer/sizer.dart';

import 'models/search_model.dart';
import 'movie_details.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({Key? key}) : super(key: key);

  @override
  _SearchMoviesState createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  Api api = Api();

  TextEditingController t1 = TextEditingController();
  final key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sari,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: sari,
        title: Text(
          "FİLMLER",
          style: TextStyle(color: Colors.white, fontSize: 24.sp),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: key,
              child: Container(
                height: 42,
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  //border: Border.all(color: Colors.black26),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: t1,
                  autofocus: false,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.search, color: Colors.black),
                    suffixIcon: t1.text.isNotEmpty
                        ? GestureDetector(
                            child: const Icon(Icons.close, color: Colors.black),
                            onTap: () {
                              t1.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    hintText: "Movie name",
                    hintStyle: const TextStyle(color: Colors.black54),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (val) {
                    setState(() {
                      TextSelection previousSelection = t1.selection;
                      t1.text = val;
                      t1.selection = previousSelection;
                    });
                  },
                ),
              ),
            ),
            t1.text.isEmpty
                ? const Text("Dizi ya da film adı giriniz")
                : Expanded(
                    child: FutureBuilder(
                      future: api.getMovies("s=${t1.text}"),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<SearchMap>> snapshot) {
                        if (snapshot.hasData) {
                          List<SearchMap>? results = snapshot.data;
                          return ListView.builder(
                            itemCount: results!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 2.w, right: 4.w, bottom: 2.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MovieDetails(
                                              title: results[index].title!,
                                                imdbId:
                                                    results[index].imdbId!)));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: siyah,
                                    ),
                                    child: ListTile(
                                      leading:   leadingImage(
                                          results[index].poster != null ?
                                          results[index].poster.toString() : "https://www.google.com/url?sa=i&url=https%3A%2F%2Ftr.wikipedia.org%2Fwiki%2FKurtlar_Vadisi_(dizi)&psig=AOvVaw1CIm8ppCa8ILMrlzfwnJDl&ust=1632340818256000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKC6vcjtkPMCFQAAAAAdAAAAABAD") ,
                                      title: titleText(
                                          results[index].title.toString()),
                                      subtitle: subTitleRow(
                                          results[index].year.toString(),
                                          results[index].type.toString()),
                                      trailing: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 40.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }

                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

/*
 SizedBox(
              height: 4.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 2.w,right: 4.w,bottom: 3.h),
              child: Container(
                decoration: BoxDecoration(
                  color: siyah,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(45),
                    bottomRight: Radius.circular(45)
                  )
                ),
                child: ListTile(
                  leading: leadingImage("assets/gf.jpg"),
                  title: titleText("GODFATHER"),
                  subtitle: subTitleRow("9.9"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,size: 40.sp,color: Colors.white,
                  ),
                ),
              ),
            ),
 */
