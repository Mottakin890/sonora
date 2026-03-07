import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/presentation/search/bloc/search_event.dart';
import 'package:sonora/presentation/search/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<LoadSearchData>(_onLoadSearchData);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<RemoveRecentSearch>(_onRemoveRecentSearch);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onLoadSearchData(LoadSearchData event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.loading));
    
    await Future<void>.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
      status: SearchStatus.success,
      recentSearches: [
        {
          'name': 'The Weeknd',
          'type': 'Artist',
          'imageUrl':
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAMMgpcB0KkSyFgQ-ski8rPbhH0m2QTdZIT4P688jT73_qZkt1MJ7mA57ZKB0jUlrqeU5HmCgCTOqNWCRe31LwzD3Ebnx-Hf0wPGJBrF5Bir461JsLOy7w-x3BZuFcvpIim-m7_o6_nqK4xNA_tt-BR0WhERxZX0EVcEWF3bt4-u3rxOg0cY3c3vbjCqVaEgw0tDMAToAtSMk9gocqMwmL73lVbj-AuCyi3fgp0B1ANNOdBEvj0wf3OshsiTQRB6nROGdFsCbuZ6Fw'
        },
        {
          'name': 'Arctic Monkeys',
          'type': 'Artist',
          'imageUrl':
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAxterQG-lersYnjKGUu-bBbUANivHUGXQJgD2q1-Uw29nPFklEIVxUlpSaU_Hr0zZFpk1Z34QFQ_TCpb6QA0sRWjkrartNGSUvh-OyqeHvFnGnYgGDsE6X4EXwcHHnldKZQOxI2V77k26tS0KRZ8p-6sIAwAu67SCNt7qUCSHbB2WOJEJK4ERMLmdaI0BegVAK6EOydQ6dNdtovQX_yt119JLNf0BUWTWHmG0k0CNTFtmM8_J5NELaUJLxynmk1rC90DvPThpBl_4'
        },
      ],
      categories: [
        {
          'name': 'Podcasts',
          'color1': '#8B5CF6',
          'color2': '#6D28D9',
          'imageUrl':
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDjS88Vc0IyISUY4l4_rzwBrA5HLoUGm-GdHpuF-A3yLYeoD4d0jifqUL6rgdegbZYq5IEXk_UAKNmCjoHarJk_tm-YRs9BU0_fLzIKwYzA5SrUbdDuiRmXhL6_nV3yMF2mOY4kSalYzSsDjyiT0iEk3iFkJpUYwtrMDIYIRAkB-R2KYRoPk_jEJUyXqRvRKwvW2OpTforXcW37rvhD44QImG65eSV0mhj4YSC9U4-wN0iJ4itKqANT0U2vLdj7vAaTxPaQaej2uqI'
        },
        {
          'name': 'Pop',
          'color1': '#EC4899',
          'color2': '#BE185D',
          'imageUrl':
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAQiAoij-qGK9pVjkGq8AUp7kazwbIESTrZJDjYVwmh9yLZ3eRsUbIhUGND8e2BJo2XHko0aHOx5zRsmlfcpP5LA985qC5HSbTPdHvdapyBVF37E59UtTZPKI1rVybT_D7xtIhr9kJXgtWKFCs8PP7FfcFvMlBsdV_uPP6FA1yF6rKPXnBXlYp91EfvuTy2BQ8qwLWeiAz2iO1BM_mT986zN2N2nXvZ3hcpxHBaV4l1QyrOzGfdOoZYMvkPpZeVA-pvH9hs8pl-rlE'
        },
        {
          'name': 'Hip-Hop',
          'color1': '#F59E0B',
          'color2': '#B45309',
          'imageUrl':
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBo6mUcvlGCUqk00y897truSn9DEnIkcuz1mk2HnTZPIX8eyq9L3yT9ze7Bsr-rJRTrs73ESqm0Dwpcrr60zENkpdlXJUG9NMuXwzHEtf4FqZDEuW4ORhxxvgdWZfUBjS55Cw2v74AOluxGlm348lT0O0u_PGAtocYdb51kw9iv4Qh5w1Uh3dE1MojfdBFoMXqlU8ZfoFKozyF8Xh3Kl5y8HJ0iqJoWoBEb2pEbO9r447IOOvUrxESwhj0D6FYAXWgnl3EoVyuXoF0'
        },
        {
          'name': 'Rock',
          'color1': '#EF4444',
          'color2': '#B91C1C',
          'imageUrl':
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBjNSPnbb-GjFSzzezx-wcfhuqWl7phlhEeXdvGZxrMWTsGvdfJMxNAjQeJAI_NkNrL6Jw10Lbxq8nvXf2IGhIAm-7toX7H2WoFy_E-3V9aqbsvfubDSc0xnHbGl-FpHKWeSZqjACegSl6BNeMsUkr6M3O_G6cfCoAWvhCQTW21bNR1ETu4l814JU5pTZWK84YRc-hLnt-D1eG3e0LZ7ka91xewzCDKNwxf_QnHmRYLiImclFj1YKjYkAXk87-a4KknQrVDMrpdH68'
        },
        {
          'name': 'Electronic',
          'color1': '#06B6D4',
          'color2': '#0E7490',
          'imageUrl':
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBsK65SC92lcG7A33vcmTzCjm4Nf0zwzqK91Y2pzqH8FJfrlltCency7hKhFlWaj_jimncMyRMC4EA-AxXsLcgrLSXPDaZbPGf6M5sYdaRMtgfAV9S0njBA2mE-y7FfU-QzYP6YyorLyH7cI34Vf-18g0BI1M6KNbJyB_uP5nub7Ix_zPlw9S9977-wsAdZLg0yz0I1Yk0BlL1HcuUln3S77jW7hbXTPhNbOBNWzLdIvmJeBanM6EeUm2WEYcysTjVHEloFGrKxGSs'
        },
        {
          'name': 'Country',
          'color1': '#84CC16',
          'color2': '#4D7C0F',
          'imageUrl':
              'https://lh3.googleusercontent.com/aida-public/AB6AXuArFsZWrs0b-F_CyxWGKB40GVVLOiW9qXodBv-CIMu49cy9693Y15tWOW3hrCgFAzUPK3pUh71oFLd8uE0_PYF0kLXeGfl7arAa29wERbRn_kGxJADipsqLtTrExx9y5Tb2kd9IejlWkSJs44bSxD3bszK_nhgo5tvWJGx7SjbVh7P5apNnLBBgVWTtN7AWo2KRl8yopcZcZ737_z0Iq9B3QWaybflbibcjtxXfOU2S4CkcwTMFP3ks1swhZ2ceD16JugfpM0i4REk'
        },
      ],
    ));
  }

  void _onSearchQueryChanged(
      SearchQueryChanged event, Emitter<SearchState> emit) {
    emit(state.copyWith(query: event.query));
  }

  void _onRemoveRecentSearch(
      RemoveRecentSearch event, Emitter<SearchState> emit) {
    final updatedList = List<Map<String, String>>.from(state.recentSearches);
    if (event.index >= 0 && event.index < updatedList.length) {
      updatedList.removeAt(event.index);
      emit(state.copyWith(recentSearches: updatedList));
    }
  }

  void _onClearSearch(ClearSearch event, Emitter<SearchState> emit) {
    emit(state.copyWith(query: ''));
  }
}
