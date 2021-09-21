import 'package:flutter/material.dart';
import 'package:movies/service/api.dart';
import 'package:sizer/sizer.dart';

import 'constants.dart';
import 'models/detail_model.dart';
import 'movie_details_shorts.dart';

class MovieDetails extends StatefulWidget {
  String imdbId;
  String title;


  MovieDetails({required this.imdbId,required this.title});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: griKoy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: siyah,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 21.sp),
        ),
      ),
      body: FutureBuilder(
        future: api.getDetail("&i=${widget.imdbId}"
            ),
        builder: (BuildContext context,
            AsyncSnapshot<MovieDetail> snapshot) {
          if (snapshot.hasData) {
            MovieDetail? results = snapshot.data;

            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index){

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(
                      width: 61.w,
                      height: 45.h,
                      child: results!.poster != null ? Image.network(
                       results.poster,
                        fit: BoxFit.cover,
                      ):
                      Image.asset("assets/kk.jpg",fit: BoxFit.cover,),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "IMDB Rating",
                              style: TextStyle(color: Colors.white, fontSize: 10.sp),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14.sp,
                                  color: sari,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                results.imdbRating != null ?  Text(
                                  results.imdbRating,
                                  style: TextStyle(color: acikGri, fontSize: 10.sp),
                                ):
                                const Text("0"),
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "IMDB Votes",
                              style: TextStyle(color: Colors.white, fontSize: 10.sp),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            results.imdbVotes != null ?  Text(
                              results.imdbVotes,
                              style: TextStyle(color: acikGri, fontSize: 10.sp),
                            )
                            :Text("0"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Released",
                              style: TextStyle(color: Colors.white, fontSize: 10.sp),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            results.released != null ? Text(
                              results.released,
                              style: TextStyle(color: acikGri, fontSize: 10.sp),
                            )
                            : const Text("0"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Runtime",
                              style: TextStyle(color: Colors.white, fontSize: 10.sp),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            results.runtime != null ?  Text(
                              results.runtime,
                              style: TextStyle(color: acikGri, fontSize: 10.sp),
                            ):
                            Text("0"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 2.w,right: 3.w),
                      child: SizedBox(
                        height: 14.h,
                        child: Text(results.plot,
                            overflow: TextOverflow.clip,
                            style: TextStyle(color: acikGri, fontSize: 12.sp)),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    aboutWriters("Genre", results.genre ),

                    SizedBox(
                      height: 1.8.h,
                    ),
                   aboutWriters("Director",results.director ),

                    SizedBox(
                      height: 1.8.h,
                    ),
                    aboutWriters("Writer", results.writer),
                    SizedBox(
                      height: 1.8.h,
                    ),
                    aboutWriters("Actors",results.actors ),
                  ],
                );
              },
            );
          }
          if(snapshot.hasError)
          {
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
    );
  }
}
 /*
  SizedBox(
            height: 1.h,
          ),
          SizedBox(
            width: 62.w,
            height: 45.h,
            child: Image.asset(
              "assets/kk.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "IMDB Rating",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 14.sp,
                        color: sari,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "9.1",
                        style: TextStyle(color: acikGri, fontSize: 10.sp),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "IMDB Votes",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "192.789",
                    style: TextStyle(color: acikGri, fontSize: 10.sp),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "IMDB Votes",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "192.789",
                    style: TextStyle(color: acikGri, fontSize: 10.sp),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "IMDB Votes",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "192.789",
                    style: TextStyle(color: acikGri, fontSize: 10.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 2.w,right: 3.w),
            child: Text("After the devastating events of "
                "Avengers: Infinity War (2018),"
                " the universe is in ruins. With the help of remaining"
                " allies, the Avengers assemble once more in order"
                " to reverse Thanos' actions and restore balance"
                " to the universe.",style: TextStyle(color: acikGri, fontSize: 12.sp)),
          ),
          SizedBox(
            height: 2.h,
          ),
          aboutWriters("Genre","Action, Adventure, Drama"),

          SizedBox(
            height: 1.8.h,
          ),
          aboutWriters("Director","Anthony Russo, Joe Russo"),

          SizedBox(
            height: 1.8.h,
          ),
          aboutWriters("Writer","Christopher Markus, Stephen McFeely, Stan Lee"),
          SizedBox(
            height: 1.8.h,
          ),
          aboutWriters("Actors","Robert Downey Jr., Chris Evans, Mark Ruffalo"),
  */