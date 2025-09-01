# WMO Codes

This specification defines a compact 5-bit encoding scheme for weather conditions, focused in typical climates of **Brazil** _(equatorial, tropical, and subtropical)_. Each code maps to a printable ASCII character (`'a'` to `'z'`), allowing use in systems without UTF-8 or eficient lookup tables using strings in dynamical language like lua. The format is optimized for minimalism, portability, and ease of integration in custom weather icon fonts or file names, while maintaining readability.

### Overview

* **Encoding Size**: 5 bits
* **ASCII Offset**: +97
* **Total Representations**: 24 weather codes / 2 Reserved UI Icons

### Weather interpretation codes

| #  | dec | hex  | ascii | hour  | weather type |
| -- | ---- | ---- | ----- | ----- | :---------- |
|  1 |  97  | 0x61 | a     | night | clear sky
|  2 |  98  | 0x62 | b     | day   | clear sky
|  3 |  99  | 0x63 | c     | night | drizzle
|  4 | 100  | 0x64 | d     | day   | drizzle
|  5 | 101  | 0x65 | e     | night | fog
|  6 | 102  | 0x66 | f     | day   | fog
|  7 | 103  | 0x67 | g     | night | thunderstorm
|  8 | 104  | 0x68 | h     | day   | thunderstorm
|  9 | 105  | 0x69 | i     | night | partly cloudy
| 10 | 106  | 0x6A | j     | day   | partly cloudy
| 11 | 107  | 0x6B | k     | night | partly cloudy with rain
| 12 | 108  | 0x6C | l     | day   | partly cloudy with rain
| 13 | 109  | 0x6D | m     | night | partly cloudy with lightning
| 14 | 110  | 0x6E | n     | day   | partly cloudy with lightning
| 15 | 111  | 0x6F | o     | night | partly cloudy with rain and lightning
| 16 | 112  | 0x70 | p     | day   | partly cloudy with rain and lightning
| 17 | 113  | 0x71 | q     |       | wind
| 18 | 114  | 0x72 | r     |       | overcast
| 19 | 115  | 0x73 | s     |       | snow or hail
| 20 | 116  | 0x74 | t     |       | overcast with rain
| 21 | 117  | 0x75 | u     |       | fog (dense)
| 22 | 118  | 0x76 | v     |       | overcast with lightning
| 23 | 119  | 0x77 | w     |       | thunderstorm (dense)
| 24 | 120  | 0x78 | x     |       | overcast with rain and lightning
| 25 | 121  | 0x79 | y     |       | thermometer (extra icon)
| 26 | 122  | 0x80 | z     |       | umbrella (extra icon)


### Bitfield Structure

```text
Bits: [Sky1][Sky2][Type1][Type2][Hour]
```

#### Encoding Function (C-style)

```c
uint8_t get_wmo_code(uint8_t sky, uint8_t type, uint8_t hour) {
  return 97 + (sky << 3) | (type << 1) | hour;
}
```

### Bitfield Breakdown

| Field | Bits | Values                                                    |
| ----- | ---- | --------------------------------------------------------- |
| Hour  | 1    | 0 = Day, 1 = Night                                        |
| Type  | 2    | 00 = None, 01 = Rain, 10 = Lightning, 11 = Rain+Lightning |
| Sky   | 2    | 00 = Clear, 01 = Few Clouds, 10 = Overcast, 11 = Unused   |

### Compound Weather Rules

Certain combinations are mapped to specific weather conditions:

| Sky      | Type             | Hour  | Resulting Condition |
| -------- | ---------------- | ----- | ------------------- |
| Clear    | Rain             | Any   | Drizzle             |
| Clear    | Lightning        | Any   | Fog                 |
| Clear    | Rain + Lightning | Any   | Thunderstorm        |
| Overcast | None             | Night | Wind                |
| Overcast | Rain             | Night | Snow or Hail        |
| Overcast | Lightning        | Night | Dense Fog           |
| Overcast | Rain + Lightning | Night | Severe Thunderstorm |
