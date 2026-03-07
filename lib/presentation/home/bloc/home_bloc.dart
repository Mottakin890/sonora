import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/domain/entities/playlist_entities.dart';
import 'package:sonora/presentation/home/bloc/home_event.dart';
import 'package:sonora/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<PlaylistEntities> _allRecentlyPlayed = [];
  final List<MediaEntities> _allMadeForYou = [];
  final List<MediaEntities> _allJumpBackIn = [];
  final List<MediaEntities> _allRecentlyPlayedSection = [];

  HomeBloc() : super(const HomeState()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<HomeFilterChanged>(_onFilterChanged);
  }

  void _onFilterChanged(HomeFilterChanged event, Emitter<HomeState> emit) {
    if (event.filter == state.selectedFilter) return;

    final filterLower = event.filter.toLowerCase();
    
    List<MediaEntities> filterMedia(List<MediaEntities> source) {
      if (filterLower == 'all') return source;
      return source.where((e) {
        final sub = e.subtitle.toLowerCase();
        if (filterLower == 'music') {
          return true;
        }
        return sub.contains(filterLower) || e.title.toLowerCase().contains(filterLower);
      }).toList();
    }

    emit(state.copyWith(
      selectedFilter: event.filter,
      madeForYou: filterMedia(_allMadeForYou),
      jumpBackIn: filterMedia(_allJumpBackIn),
      recentlyPlayedSection: filterMedia(_allRecentlyPlayedSection),
    ));
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      await Future<dynamic>.delayed(const Duration(seconds: 1));

      const recentlyPlayed = [
        PlaylistEntities(
          'Daily Mix 1',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAThr-wkDYWm5tSiqN-fnVepWrp0LGnV7yOvikaAaUfru8ry1S_KK-9jnUNWx1bDxfjDLnbdF5jWzpk6px3X48l8wSj7unoAi0QN9jjKHru6t3RKqDnKoOM1RvmvCdvy2TwnLvkeFqYHUHshGt7yfZsih5pkIBqdBJzPd6Savy05BcY9XvIpeX0y1xMIJS-2mfFITKx8JAg8Jxv__H58K5jFDB3f3VVX-SK9R4asppidAwST0RRm5TU7s6_xLBIIVipmPN_rn7KqoE',
        ),
        PlaylistEntities(
          'Liked Songs',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCu5uCyDQKizx0Ptn5Il-NPRz4SB0H4FFBP34fHS5A54Ec5uvXbX1Kc8y4T_OyZmzQjqFVBms_phPS878krJBHKPHlRvsc4dGjjDzzo0cikJsG44AHQSAk1TPRYP1fbDhZwoSq8S7W8UmUMdQ8ls6wdOhwTkXLUyjZqX3ObV3_YY9ld7HalT4YrhU4im-m-uPtKBffnK5BOb8KQsWAysU2ybje2D3lWWiFwePbqz_-3Jlou5NJkOMPEyFjCs515r1z6298Q5vT3eWg',
        ),
        PlaylistEntities(
          'Discover Weekly',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBkiw0dSPTyKfN32nNUKYTYRqPkWT1L9EXRFSHj02cgVGrSOvgYdjkXa9y4gyk2vWgP1O_WZnwi90y2mxAowHNQhQjBLyhtBftp9Bv84BExQoXijEx8FMQ10VRj_wABVjqjBB3WCdGKzMzq_2wHg9ubEp1YGH7y7aMjEFFbfyqOkLs5QuUUraPCFk5rK4dATr7bHU3FOR4XKQ0P47Go8wXAj8TsWMumgTXGhiURfmnE-yaXRF_HtpaAm9u0qZDTYvbL5yY1e9anaZQ',
        ),
        PlaylistEntities(
          'Lofi Hip Hop',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBH66_FuKDZd4vBV--R_pvI8JgJhQToIPEDYoN1oLf1KfZ4O6SM5vzLbOD4ZQy2E0iQwt-hdT-6uV7w7VtWqUVQsvk8VSc8u_ftM4sem4eSqectrqurD_bpDd4u0VyxelGzE-_WDd36T-O1OGzkliL1lKawsL5G-bE-TZFT6BbC5E9I6To_AuUi7WYNotjkLYe3bqkI-_EcinRZayWRLMLw8oR5R3QW-GCvklUhrsRVWYZaPDMNCIXBFaeIkdLAO3dMuJTSwOiqj14',
        ),
        PlaylistEntities(
          'Chill Vibes',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuC7Sd63uye6Rp6FiPSB7NQzP0cj85_cYAB1Sv5D1VAQSSzWy9OkHRcqEWKJkX896rLX9dHpojBF4BawOJjZbZFx8iTBsq3rcpnxQy1sPzhoNooxNLYheQmfH4gVpbB-0ZEUzja2vTq1s6sn85AS_5XaYuqBfZB1t5guf2xd7Lrq5j1HIbtBiJYWgU9FzfRROgs1gdbhlDP5LuuMi56GufOc_MQsJUTvqxdKwp9H2fFyrnB5uj36AJ1L0zVcIbz8ySfJDudwbeMIbys',
        ),
        PlaylistEntities(
          'Top Hits',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDiX7__KP59noSQ3AJQXjeFPNfcxGgyy0Zmfhr3zgA5QSfUeG7Xvqyd3yH3SrZQ37Ay-AtJrpn2gog_Cp0t-AlsUDUQmmalxD6Snf-RV4297Rosi9MMQW1nLShZPeLQufLzZxXuAM1DrbEsmlgafxPoVsemnYapcSH5dwNO_jiRFdhfURBRJtVascRDPeNY7MbpGJ6NMW66JhhBooMBbfad6OiZzk6XjY-IkBgFFKfuJdCHL8YW8LCSEzh-regAe0Qj0vaj5ZlZ8WQ',
        ),
      ];

      const madeForYou = [
        MediaEntities(
          'Jazz Vibes',
          'Based on your recent listening',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBJ1m0aW3ehVqi5uB8d6KwVoGmV6GueHYFJzENBopoEkpIdqBTQ8a47bWK6sOYJwIDuYyvffcZrmuOiozRSzOvj3I_qewKO-jKujALmuHvuGZPftA-V6J2CNK3fmZ-fg5Uf_jlEK_SlXcid-gbQ2iSFl_08thUTP0A83m2RXuGE2kdLOmhmV31f7AzV7sSUJJpefssqbaGc-BAC2Gc-c43bJE2Fym6xFk82HBh6xDWXGqBzpDjL7HRjR8z6oGv3KxGtTJlynMITT4s',
        ),
        MediaEntities(
          'Indie Essentials',
          'New releases for you',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCHOQqxwbYATC735IjqWyARCcYG5k3lFb1M_Nfl16zRDH0esrRa7e0CW5vYnGONwPYRknz3orKsXYvPza1WUlheRixp2JwzdmdBmtN3HhuqR0AVQ169bqeP9ZkcWuIQ68kXK2d7wda2sU3iFVf75Q66GDNEEjd2MX2WV3j1b8r41P6nhn4WXN-8SHMzAe3Kkq_-FfCChktnjn2tPUeOkS329zP1NXbnDGf9v8BkayI5qFzPSMhPgPIEKa-qqWFU5Ud_hK_Mds-lhq4',
        ),
        MediaEntities(
          'Night Drive',
          'Curated techno beats',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB__fQEnEEEJzIJ5j9tTw-HC8-OrgdIcPAJdsQ5cCJkHH0ArZeJLxvV4H696LnftHwMjCK2Ku288-OwVMqChLjq82zmdJrTO5F4hFcdK_khSrmy5GBOUfHBjvcwhUepvqonvsK1ZT2zRwYsLrRUo4u_O5MxjEJqmZvuDj_qMexpRwDPRbL1wgCmMMcJXqtUC4KN52Kxxlj9ZzoadTTrWz2ZrasMcSzjAyGC1jxUeCcnJ9gZGTcuFg_uUFXnuP6e256cj4p-lyry_Tk',
        ),
        MediaEntities(
          'Acoustic Morning',
          'Start your day right',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCmexK_yBMl5-88VeZUQFupEEBXxs-CWkmAaRBdtA45j4VrCXkFcmho2g8mSn0c3boP03AhsDORIoOWtZ4XQ2l-XNAUhBycWYACFpM5fJ7t-iIPFp-WIhC-CXFNoqxw_GwnWCulYYBWFyJzKL2tWWeakJr1DtzuII0-Et7J1N6XIPZUR3MkAn23trQwAHNz9qCQHvafKCngvdrZUS5N8YB1pkSaWBaLROjCDdbWKsEbQLNGwidxRlWp31LfPqj-D_CQHKXP7tT1QHo',
        ),
      ];

      const jumpBackIn = [
        MediaEntities(
          'Luna Sol',
          'Artist',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAajGUYoysdUjYyk_DalT-7cW4jDp2-9FPWJL9Xp7-JQi2Is4OjGxJs2UnPtQW3rsDFFiNUY0JtbJ25BqFkGC4Rw8VI-x8_vNTeCmq6yTN180SQf8vUHQYdIHbu9sUfXocR81U6MB2y30xZjb3kPF8T1blTNyMcs72kHFsXqhQuwozDbmf1tdGd_ZvHntr0l5mFSHG0iQ1-ikDuYshGlS5Oox--ebWpB_hy5HMrXypI_e4WfYrvdWpa_fgBsV0Hh6_dBw8F_-P8xhY',
          isCircle: true,
        ),
        MediaEntities(
          'Echoes of Gold',
          'Album • Retro Waves',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDKXelrVi-arhAk9yw--Z2uyMVctI1fqxeKB-oHkFLwbbZeyshwMkVqjv300TQnWytpmftAhS-zg5Dyuf0YPdqFlNUwSqg29LPoNB7w8pVwiQq0cdLgluJbQHTAPI2_nOGUKiYe7RA9uNz4orX49ioW5plTkevOtD45vCgqgjUHNuTYEsrK--vI_EUSRGu3KVSL66sacjIXfnF92dW47jUWalfWv_2im-9IvbN3d52ML7Kn3wFOuW9WKFOTo5JuE7EzkjQhioe7Sbk',
        ),
        MediaEntities(
          'The Nomad',
          'Artist',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAwqYaFNyqi43csgR32GltkuEPHnFLR5StZnQrO4WRgEpTqToodzdMeSVbyagEkwZjRXTQ_C8eVIPnsumYf5SpRwu2wrVSVyDiGnOKrwC1nXDYblmdqAuQHbcEGTB4lLXtoTdgr_o2-ZrEGxN96Z7DUen_gJ2EWxoS0Ur6rTfJmsIVh_1aITPWNKSIMeButQ3N6q2-kPgknocNYterAme-yd8DvgsM4k-2Qra80tJjIIbZd6XW1hEiAUqPOgr1xcTpTK7ZC4bbc7RQ',
          isCircle: true,
        ),
      ];

      const recentlyPlayedSection = [
        MediaEntities(
          'Morning Coffee',
          'Playlist',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCHOQqxwbYATC735IjqWyARCcYG5k3lFb1M_Nfl16zRDH0esrRa7e0CW5vYnGONwPYRknz3orKsXYvPza1WUlheRixp2JwzdmdBmtN3HhuqR0AVQ169bqeP9ZkcWuIQ68kXK2d7wda2sU3iFVf75Q66GDNEEjd2MX2WV3j1b8r41P6nhn4WXN-8SHMzAe3Kkq_-FfCChktnjn2tPUeOkS329zP1NXbnDGf9v8BkayI5qFzPSMhPgPIEKa-qqWFU5Ud_hK_Mds-lhq4',
        ),
        MediaEntities(
          'Deep Focus',
          'Album • Various Artists',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB__fQEnEEEJzIJ5j9tTw-HC8-OrgdIcPAJdsQ5cCJkHH0ArZeJLxvV4H696LnftHwMjCK2Ku288-OwVMqChLjq82zmdJrTO5F4hFcdK_khSrmy5GBOUfHBjvcwhUepvqonvsK1ZT2zRwYsLrRUo4u_O5MxjEJqmZvuDj_qMexpRwDPRbL1wgCmMMcJXqtUC4KN52Kxxlj9ZzoadTTrWz2ZrasMcSzjAyGC1jxUeCcnJ9gZGTcuFg_uUFXnuP6e256cj4p-lyry_Tk',
        ),
        MediaEntities(
          'Jazz After Hours',
          'Playlist',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBJ1m0aW3ehVqi5uB8d6KwVoGmV6GueHYFJzENBopoEkpIdqBTQ8a47bWK6sOYJwIDuYyvffcZrmuOiozRSzOvj3I_qewKO-jKujALmuHvuGZPftA-V6J2CNK3fmZ-fg5Uf_jlEK_SlXcid-gbQ2iSFl_08thUTP0A83m2RXuGE2kdLOmhmV31f7AzV7sSUJJpefssqbaGc-BAC2Gc-c43bJE2Fym6xFk82HBh6xDWXGqBzpDjL7HRjR8z6oGv3KxGtTJlynMITT4s',
        ),
      ];

      _allRecentlyPlayed.clear();
      _allRecentlyPlayed.addAll(recentlyPlayed);
      _allMadeForYou.clear();
      _allMadeForYou.addAll(madeForYou);
      _allJumpBackIn.clear();
      _allJumpBackIn.addAll(jumpBackIn);
      _allRecentlyPlayedSection.clear();
      _allRecentlyPlayedSection.addAll(recentlyPlayedSection);

      // Call the filter logic to properly set the initially filtered items based on current selected filter (usually 'All')
      final filterLower = state.selectedFilter.toLowerCase();
      List<MediaEntities> filterMedia(List<MediaEntities> source) {
        if (filterLower == 'all') return source;
        return source.where((e) {
          if (filterLower == 'music') return true;
          return e.subtitle.toLowerCase().contains(filterLower) || e.title.toLowerCase().contains(filterLower);
        }).toList();
      }

      emit(
        state.copyWith(
          status: HomeStatus.success,
          recentlyPlayed: _allRecentlyPlayed,
          madeForYou: filterMedia(_allMadeForYou),
          jumpBackIn: filterMedia(_allJumpBackIn),
          recentlyPlayedSection: filterMedia(_allRecentlyPlayedSection),
        ),
      );
    } on Exception {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
