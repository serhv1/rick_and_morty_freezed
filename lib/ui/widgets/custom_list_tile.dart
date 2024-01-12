import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_find_freezed/data/models/character.dart';
import 'package:rick_and_morty_find_freezed/ui/widgets/character_status.dart';

class CustomListTile extends StatelessWidget {
  final Results results;

  const CustomListTile({
    super.key,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.0),
      child: Container(
        color: const Color.fromRGBO(86, 86, 86, 0.8),
        height: MediaQuery.of(context).size.height / 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: results.image,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 4.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: Text(
                      results.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  CharacterStatus(
                    liveState: results.status == 'Alive'
                        ? LiveState.alive
                        : results.status == 'Dead'
                            ? LiveState.dead
                            : LiveState.unknown,
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        // rows for species and gender

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            // species column
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Species: ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                results.species,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          // gender column
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender: ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                results.gender,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
