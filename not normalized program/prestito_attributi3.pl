% Definizione degli attributi e dei valori possibili
a(gender, [male, female, nil]). % Genere del richiedente (Male, Female, NIL)
a(married, [yes, no, nil]).     % Stato civile (Yes, No, NIL)
a(dependents, [0, 1, 2, 3, nil]). % Numero di dipendenti a carico (0, 1, 2, 3, NIL)
a(self_employed, [yes, no, nil]).
a(applicantincome, [150, 210, 416, 645, 674, 1000, 1025, 1299, 1378, 1442, 1500, 1538, 1600, 1625, 1668, 1759, 1782, 1800, 1809, 1811, 1820, 1828, 1830, 1836, 1853, 1863, 1875, 1880, 1907, 1916, 1926, 1928, 1958, 1963, 1977, 1993, 2000, 2014, 2031, 2045, 2058, 2060, 2071, 2083, 2130, 2132, 2137, 2138, 2149, 2165, 2167, 2178, 2192, 2213, 2214, 2221, 2237, 2239, 2253, 2275, 2281, 2297, 2301, 2309, 2330, 2333, 2346, 2366, 2378, 2383, 2395, 2400, 2423, 2425, 2435, 2439, 2454, 2473, 2479, 2483, 2484, 2491, 2492, 2499, 2500, 2507, 2510, 2526, 2550, 2577, 2583, 2600, 2609, 2620, 2625, 2645, 2647, 2653, 2661, 2666, 2667, 2679, 2698, 2699, 2708, 2717, 2718, 2720, 2726, 2750, 2755, 2764, 2768, 2769, 2785, 2787, 2799, 2833, 2873, 2875, 2876, 2882, 2889, 2894, 2895, 2900, 2917, 2920, 2927, 2929, 2935, 2947, 2957, 2958, 2965, 2971, 2980, 2987, 2995, 3000, 3010, 3013, 3015, 3017, 3029, 3033, 3036, 3052, 3062, 3069, 3073, 3074, 3075, 3083, 3086, 3087, 3089, 3095, 3100, 3103, 3125, 3153, 3155, 3158, 3159, 3166, 3167, 3173, 3180, 3182, 3189, 3200, 3208, 3229, 3232, 3237, 3244, 3246, 3250, 3254, 3273, 3276, 3283, 3315, 3316, 3326, 3333, 3340, 3357, 3358, 3365, 3366, 3399, 3400, 3406, 3410, 3416, 3417, 3418, 3427, 3430, 3450, 3459, 3463, 3466, 3481, 3497, 3500, 3510, 3522, 3523, 3539, 3541, 3547, 3572, 3583, 3588, 3593, 3596, 3597, 3598, 3600, 3601, 3617, 3620, 3625, 3652, 3660, 3667, 3675, 3676, 3691, 3692, 3704, 3707, 3708, 3716, 3717, 3727, 3748, 3750, 3762, 3775, 3800, 3812, 3813, 3814, 3816, 3833, 3846, 3850, 3858, 3859, 3865, 3867, 3875, 3887, 3900, 3902, 3917, 3927, 3941, 3948, 3975, 3987, 3988, 3992, 3993, 4000, 4006, 4009, 4050, 4053, 4095, 4100, 4106, 4124, 4133, 4160, 4166, 4167, 4180, 4188, 4191, 4200, 4226, 4230, 4281, 4283, 4288, 4300, 4301, 4310, 4333, 4342, 4344, 4350, 4354, 4384, 4400, 4408, 4416, 4467, 4547, 4554, 4566, 4583, 4600, 4606, 4608, 4616, 4625, 4652, 4666, 4680, 4683, 4691, 4692, 4695, 4707, 4708, 4723, 4735, 4750, 4755, 4758, 4817, 4843, 4860, 4865, 4885, 4887, 4895, 4917, 4923, 4931, 4945, 4950, 5000, 5042, 5050, 5116, 5124, 5166, 5167, 5185, 5191, 5250, 5266, 5285, 5316, 5333, 5391, 5417, 5468, 5488, 5500, 5503, 5516, 5532, 5568, 5649, 5667, 5677, 5695, 5703, 5708, 5726, 5746, 5780, 5800, 5815, 5818, 5819, 5821, 5829, 5849, 5923, 5935, 5941, 5955, 6000, 6033, 6045, 6050, 6065, 6080, 6083, 6096, 6125, 6133, 6216, 6250, 6256, 6277, 6283, 6325, 6333, 6383, 6400, 6406, 6417, 6500, 6540, 6608, 6633, 6700, 6782, 6783, 6822, 6875, 6950, 7085, 7100, 7142, 7167, 7200, 7250, 7333, 7441, 7451, 7578, 7583, 7660, 7667, 7740, 7787, 7901, 7933, 7948, 8000, 8072, 8080, 8300, 8333, 8334, 8566, 8624, 8666, 8750, 8799, 9083, 9166, 9167, 9323, 9328, 9357, 9504, 9508, 9538, 9560, 9703, 9833, 9963, 10000, 10047, 10139, 10408, 10416, 10513, 10750, 10833, 11000, 11146, 11250, 11417, 11500, 11757, 12000, 12500, 12841, 12876, 13262, 13650, 14583, 14683, 14866, 14880, 14999, 15000, 15759, 16120, 16250, 16525, 16666, 16667, 16692, 17263, 17500, 18165, 18333, 19484, 19730, 20166, 20233, 20667, 20833, 23803, 33846, 37719, 39147, 39999, 51763, 63337, 81000, nil]). % Reddito richiedente
a(coapplicantincome, [0, 16.12000084, 189, 240, 242, 461, 484, 505, 536, 663, 688, 700, 736, 754, 800, 830, 913, 923, 983, 985.7999878, 997, 1000, 1010, 1014, 1030, 1032, 1040, 1041, 1083, 1086, 1125, 1126, 1131, 1167, 1210, 1213, 1229, 1250, 1255, 1260, 1280, 1287, 1300, 1302, 1330, 1376, 1387, 1398, 1400, 1411, 1417, 1424, 1425, 1430, 1447, 1451, 1456, 1459, 1483, 1500, 1508, 1516, 1522, 1526, 1542, 1560, 1587, 1590, 1591, 1600, 1603, 1619, 1625, 1632, 1640, 1644, 1664, 1666, 1667, 1668, 1695, 1700, 1710, 1717, 1719, 1733, 1742, 1750, 1769, 1774, 1775, 1779, 1783, 1793, 1800, 1803, 1811, 1820, 1833, 1840, 1842, 1843, 1851, 1857, 1863, 1868, 1872, 1875, 1881, 1911, 1915, 1917, 1929, 1950, 1964, 1983, 1987, 1993, 2000, 2004, 2014, 2016, 2033, 2034, 2035, 2042, 2054, 2064, 2067, 2079, 2083, 2087, 2100, 2115, 2118, 2134, 2138, 2142, 2157, 2160, 2166, 2167, 2168, 2188, 2200, 2209, 2210, 2223, 2232, 2250, 2253, 2254, 2275, 2283, 2302, 2306, 2330, 2333, 2336, 2340, 2358, 2365, 2375, 2383, 2400, 2405, 2416, 2417, 2426, 2436, 2451, 2458, 2466, 2500, 2504, 2524, 2531, 2541, 2569, 2583, 2598, 2667, 2669, 2739, 2773, 2785, 2791, 2792, 2816, 2840, 2845, 2857, 2859, 2900, 2917, 2925, 2934, 2985, 3000, 3013, 3021, 3022, 3033, 3053, 3066, 3136, 3150, 3166, 3167, 3230, 3237, 3250, 3263, 3274, 3300, 3333, 3334, 3369, 3416, 3428, 3440, 3447, 3449, 3500, 3541, 3583, 3600, 3666, 3667, 3683, 3750, 3796, 3800, 3806, 3850, 3890, 3906, 4000, 4083, 4114, 4167, 4196, 4232, 4250, 4266, 4300, 4301, 4333, 4416, 4417, 4486, 4490, 4583, 4595, 4600, 4648, 4750, 4983, 4996, 5000, 5063, 5064, 5266, 5296, 5302, 5500, 5624, 5625, 5654, 5701, 6250, 6666, 6667, 7101, 7166, 7210, 7250, 7750, 7873, 8106, 8333, 8980, 10968, 11300, 20000, 33837, 41667, nil]). % Reddito co-richiedente
a(loanamount, [9, 17, 25, 26, 30, 35, 36, 40, 42, 44, 45, 46, 47, 48, 50, 53, 54, 55, 56, 58, 59, 60, 61, 62, 63, 65, 66, 67, 70, 71, 72, 73, 74, 75, 76, 78, 80, 81, 83, 84, 85, 86, 87, 88, 89, 90, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 164, 165, 166, 167, 168, 170, 172, 173, 175, 176, 178, 180, 181, 182, 184, 185, 186, 187, 188, 190, 191, 192, 194, 196, 200, 201, 205, 207, 208, 209, 210, 211, 214, 216, 218, 225, 228, 230, 234, 236, 239, 240, 242, 243, 244, 246, 250, 253, 255, 258, 259, 260, 265, 267, 275, 279, 280, 286, 290, 292, 296, 300, 304, 308, 311, 312, 315, 320, 324, 330, 349, 350, 360, 370, 376, 380, 400, 405, 436, 480, 490, 495, 496, 500, 570, 600, 650, 700, nil]). % Importo del prestito
a(loan_amount_term, [12, 36, 60, 84, 120, 180, 240, 300, 360, 480, nil]). % Durata prestito
a(credit_history, [0, 1, nil]). % Storico creditizio (0 = Negativo, 1 = Positivo, NIL)
a(property_area, [urban, semiurban, rural]). % Area della proprietà
% a(loanstatus, [y, n]). Stato del prestito (Y = Approvato, N =
% Rifiutato)



