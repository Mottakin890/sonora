import 'package:flutter/material.dart';
import 'package:sonora/domain/entities/media_entities.dart';
import 'package:sonora/domain/entities/playlist_entities.dart';

class MockData {
  // ── Search Mock Data ────────────────────────────────────────────────────────

  static const songs = [
    {
      'title': 'Do I Wanna Know?',
      'artist': 'Arctic Monkeys',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAIEHFE8_lgweJuxMVbJd6jvAlWUdyK6MiG6-MBDKMqVCatF1KqVr7SRizI1ArRrpbQHi4tjahNz3PMQnta9G3iLqUMzhws7VOPwiY7eSfW_qRczMCVJEASuOqgBceQzhdUcuUsuKbjKbWrvslS8Q_PLQyA8PHciyWamZIVVA2jIHpbYFOY0lCxFwFPsOR6fFecNHDZhqUfPMCpGgKMzjgAuzTyOlU1tVN8yrZDDORGEvx2TIfbenPDOyC8HyVrNRBnnddYDWp_gCc',
    },
    {
      'title': 'R U Mine?',
      'artist': 'Arctic Monkeys',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCR1-M36eKJGZk-e_azpGQ2y9A1kWR0qfbfbgltps6NA0jbuaOL7jnKVDvX6V7EyWwGJZyidxZh1ZJoGfu_QtDSsYTjO3PVX7sgBCLO8Asp70O6oJtORU-KoY-bcuM6aYQ-tq4s3KKPimrJhaWsnSP99mmInrJCr1ehYwjYZ3ANHkFsGn8InvMVl5NFilysMDCn4A_rsNi5AGDORuGcmHnH_Fz1DYweqky1tpTSd7Sm7SpBb3V4Wm1gRZjU3uNYwM2aQoMKqo17iTk',
    },
    {
      'title': 'Fluorescent Adolescent',
      'artist': 'Arctic Monkeys',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBjjJjPwVvqDNmt4nP8Br6dD3U-fs8ZtIeeqqHJstuemYXZtQ9TH9edo2Dn4_axHv8HyRW4pTjBphN3EpQGlO2T-5V1pwZZRLtopds5npTh67lb28iRpun06j6u1_D5NxVT6pK8p6Eey8FXuSwqQoWep9XkLkem55EacNMiSZddsE3eKnWOsXY66F9rmbTMRiyFAGXZliIudjaw5IQiiz6jRJOEkzaZ9nCBm4yYlsXWs-2EkhyhM2mixP5Gh5qpF8TPt4Ft9YKKObc',
    },
  ];

  static const artists = [
    {
      'name': 'The Strokes',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDEi3K5vt9aG7hG6pbEC4G3fU-y5qabuq5RSER6CNBtMxnmKFGFAf-hITj95reUYJMIFYnGsEpskmIAtp4KWH-WguKsxtOrmEBhkEki0GFcHQCBwpGR51vDrHP-5vRH4DaKDb9j4FRpsmPZ0KecxmvEybEkwADm_Sq3TJ2-iF9xTl9Gb8xbP1fQeJx6chEVQX-JdTqjTYk7ocwTEbdlLes08jHXHY5O2CTC933e4jKkVXSgoMJ3VPWQU9Gz9pY2Ortd5BEp6q9SKW8',
    },
    {
      'name': 'Tame Impala',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCFyJaStEovK59t8EI3ZGA0teojQq9iXmlMEGSU4WwJHNYgAabVIPd3jfxnaRUukOsjS7o0UIHDM2O99F80ceOLP9gK-tAeEABDmEWCqkhcVu-9fF-ZM7LzSo3x3zdKSpfqU_Cas690YEe6WtH9XK7gFZBjX_dqKNkCUlXf_-zgYVpyeQnqFrSSfmGh34D8tOax81iwUj4XZjtl3wpzZ9pipAM67L_JNO8KPJRNq201msEhJ4RgOf0OlhW5ovxg5emG_31jzydr3Y',
    },
    {
      'name': 'Cage The Elephant',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBC9XPAISFIr4MOPxH9kTQrpvYQwOJQZt251ySmJGB80RF42sfOk4Iu-vrETQXy_xXGI-L42SptuQVmh7EOaLabYRCI5I-BHBGwri-F_Qs13hhAybKr-JVBRuZJfqis3OuhvVUqucwslLI7g6Y_zgs0J9BVnvbyWr-P6TlUlcW22K4oY2pyofiVN4ec1Y8f038HR2Bp5KPg2lckmN4nz_Vk4bTz7tyZ7JuOOSH8bgd1E6yo-Q8vjYzja7T0CT3CoV9LgD3E3ivUa8E',
    },
    {
      'name': 'Radiohead',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBjtJoEXK1jFnUaUHvzV1wpkbju2Nn0yvyswv10CdK99XU35PUiedCkvJbvaoUSroTECTIdOExBuTFI64gBo1nE1DAq-giP7u-CKbAUxf_gtk9yaqBqSlxCIT7NOrbtBrE6xKsxgS-UuowJAB9GBfJzQvc7u0NRqbFniaBczBnjd9VovE0fCIFpySwRJew48oxfsyHszkM52MHM0Y1cNjDmH2VnoFw3FuVdd408k5657oZlNtsD2qPHzFH7YLKed8GzKkmpzHOC6yE',
    },
  ];

  // ── Home Mock Data ──────────────────────────────────────────────────────────

  static const homeRecentlyPlayed = [
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

  static const madeForYou = [
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

  static const jumpBackIn = [
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

  static const recentlyPlayedSection = [
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

  static const homeFilters = ['All', 'Music', 'Artist', 'Playlist'];

  static const recentSearches = [
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
  ];

  static const categories = [
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
  ];

  static const libraryFilters = ['Playlists', 'Artists', 'Albums', 'Podcasts'];

  static const List<Map<String, Object>> libraryItems = [
    {
      'title': 'Liked Songs',
      'subtitle': 'Playlist • 1,234 songs',
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1681738768250-66c19c8d283c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'isPinned': true,
      'isLikedSongs': true,
    },
    {
      'title': 'Discover Weekly',
      'subtitle': 'Playlist • Recently updated',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD_6mKFlkbWW7C94uhoTGpVuoRXbnGQtSo8nbUSDCbNXKBH-hHU_HWuMTNS2b0YHz5Vgs4K6bqhvKc-cRmmSjo5Aat4UOIHJ0Nc13GBTH2DQogBJBAD1_UUar-cZw7hMjAMKfMYMkjH_aJtaLZYsyfMSSaiuIV5drxbnuj2mazuKRb1SlCrH1eUhaXheoRkPEPMROPbn4B4TOMXcFLoxmmWeC9HKbHoVNeRC5IOaXf3hiAD0NaCuLUnxOD5WvCpeI0p9tjvSN-_jPg',
    },
    {
      'title': 'Arctic Monkeys',
      'subtitle': 'Artist',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAKfxcp7rOUgM8IeATpTtV7MfLmAex6CISj9LBuiJvWottjieRMltgdFeoUIW0jjJlOBcgZhkbNGI5p_KV5d8_-7oUB8-cAtrbWB4RLFYoysXwaeFmL-E0OL7ZOMHAr92WW8doYDhpId9hKcrISDYCuga99ID9trFi3bTNf2VfAOp-P0e7fcy5aPOWAVjWBB2poqCkIXhd-MFl028RZS95PHQubfQSI59rHhECun1hP_ngmh4L9bp57cCjhbF3M0Ks--JebprmVm3o',
      'isCircle': true,
    },
    {
      'title': 'Chill Lofi Beats',
      'subtitle': 'Playlist • 450 songs • Recently updated',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAyRilURG76ItrrBgTZvDKgGqxhHtc-eA0NjZSeQKFtYOHlDvV_flFbntFquj2JgT3t3KXYnO6HvSuASr25kGEqNvFvAdr8zY08fJlyANq0qbQOzB6eTYnp22ZSr5s_Bn6GPg_pJO1Hh6IWcQ23WOjbkZNQVHRIM_PvLFE7u06RRXQYDqepu-jD-yrxc1o5M6s9l5Xo3eaIk6JcPJuP68g7e1_fD6fISpyeOIvvAF3RqQ1dedyNEr-v5KccYidqwHqSDEPFeoRZTas',
    },
    {
      'title': 'Radiohead',
      'subtitle': 'Artist',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuATa0dxb9b_vEoKmvQyn9XL6NK4umQNK_oa9F72Adz28jJB2tvUXZq4D2NxERXP5T7ZWNPq7WSNun-mtSlHqbvxpAos3vCjy27FmvHIy0xgmpQYJyxlk1IEbqixuqKNkwQ6-8Oi3wipunYKRPv_v19YfwexAwO9wqRq7N0oznRbD7JYRGSaliilLilJ2LY3tuKr96hWytC3BslQfluiHsEBimhiAeOZOikVMnjnXGoKSbWvGll7bu2c0fpxeZBx0Pw14aVDDNp4Y0Q',
      'isCircle': true,
    },
    {
      'title': 'Techno Essentials',
      'subtitle': 'Playlist • Spotify',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBOFM7vo9khGBRB2laL0chtGd3GJMdKYWk_pUhCK_AMXpMr9f85aPV4JVcfrWidT65mHuFxdMrvkCrBwHyt778xYq_9ZutdbHzoMsx0FvuHKt66eT2tsOntVVwd1AjzHr51q837Sn6cVJbxBCOzfhgvZQh65CUV-NV1CIB21vR3ltPDUnC_TaC9n9JMl09FvcSoDBF7vl88_a5OD0I9O08HkQSZp3Tjv1fUiaycZvGQzWLrfSQAV_juQIEe_gYmnxEXRBvs3Crcal0',
    },
    {
      'title': 'The Daily',
      'subtitle': 'Podcast • The New York Times',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAB_4l4Kree0PyaclHP9WIDyoO4fntmf5s-C6bIUlQwIozBHjzQMvRto25rvOXng8vOBRV1wkSWNYjdYKwu-Oob_u5FbJ73cTkuCyDhXVBb6nsAllsZhKwCjESb2hT4kvYZjt28kWJISxLt4MlWYF-LO0BSz12me1cPtR8Fq_mVCIBrtNSgNMILLHqxJjQOlhi9mEzAwi5f3nbNsdaiBbF_0l8pbrBvSyhl_y3gzIavo29JnBC3FM9Ae1J_WaK3u-TspRZUDTyAl-g',
    },
    {
      'title': 'The Strokes',
      'subtitle': 'Artist',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAvR2-JNHk5YiTWz_4GfBr2qb569amYTl9Y8bUNxlXL0ChX61jlrdX08WR_QXRk2M3XpSf99ejPN8iEIi0pFFW2OkbmFtP5e2iOTGbQIACSDyTe7iavYtjOMqRBE3VZKvZAWWy8hCtGSvLScTem553VJjqpawx6smrdh65nsZaiOL0fYJu2zkwcqNLn3LKDMwj2VfGJ53tULa-JJpO9lqpHfWIb3yd4aE6q06Z90A2rMMrPm5r_1cKALE0_3SPSv-IvbYpNzW4ttPI',
    },
  ];

  static final List<Map<String, dynamic>> settingsSections = [
    {
      'title': 'Data Saver',
      'items': [
        {
          'title': 'Data Saver',
          'subtitle': 'Sets video quality to low and hides canvas',
          'type': 'toggle',
          'key': 'data_saver',
        },
      ],
    },
    {
      'title': 'Audio Quality',
      'items': [
        {
          'title': 'WiFi streaming',
          'value': 'High',
          'type': 'navigation',
        },
        {
          'title': 'Cellular streaming',
          'value': 'High',
          'type': 'navigation',
        },
        {
          'title': 'Stream quality',
          'value': 'High',
          'type': 'navigation',
        },
      ],
    },
    {
      'title': 'General',
      'items': [
        {
          'title': 'Audio Normalization',
          'subtitle': 'Make all songs and podcasts play at the same level',
          'type': 'toggle',
          'key': 'audio_normalization',
        },
        {
          'title': 'Mono Audio',
          'subtitle': 'Makes the left and right speakers play the same audio',
          'type': 'toggle',
          'key': 'mono_audio',
        },
        {
          'title': 'Navigation',
          'icon': Icons.explore_outlined,
          'type': 'navigation',
        },
        {
          'title': 'Notifications',
          'icon': Icons.notifications_outlined,
          'type': 'navigation',
        },
      ],
    },
    {
      'title': 'Storage',
      'items': [
        {
          'type': 'storage',
        },
      ],
    },
    {
      'title': 'About',
      'items': [
        {
          'title': 'Version',
          'subtitle': '8.8.48.523',
          'type': 'info',
        },
        {
          'title': 'Terms and Conditions',
          'type': 'navigation',
        },
      ],
    },
  ];
}
