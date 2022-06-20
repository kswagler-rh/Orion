rule APT_Gallium_PingPull_Jun_2022_1 : gallium pingPull RAT
{
   meta:
        description = "Detect the PingPull RAT used by the Gallium group"
        author = "Arkbird_SOLG"
        reference = "https://unit42.paloaltonetworks.com/pingpull-gallium/"
        date = "2022-06-15"
        hash1 = "b4aabfb8f0327370ce80970c357b84782eaf0aabfc70f5e7340746f25252d541"
        hash2 = "8b664300fff1238d6c741ac17294d714098c5653c3ef992907fc498655ff7c20"
        hash3 = "de14f22c88e552b61c62ab28d27a617fb8c0737350ca7c631de5680850282761"
        hash4 = "f86ebeb6b3c7f12ae98fe278df707d9ebdc17b19be0c773309f9af599243d0a3"
        hash5 = "fc2147ddd8613f08dd833b6966891de9e5309587a61e4b35408d56f43e72697e"
        tlp = "White"
        adversary = "gallium"
   strings: 
        $s1 = { 48 8b 05 [2] 01 00 48 33 c4 48 89 85 [2] 00 00 [0-1] 33 ?? 48 8d [2-5] b9 02 02 00 ( 00 [3-7] 24 [1-4] ff | 00 45 8b e6 41 8b f6 ff ) 15 [2] 00 00 48 8d 8d [2] 00 00 33 d2 41 b8 04 01 00 00 [5] 00 00 e8 [2] 00 00 48 8d [2-3] 48 8d 8d [2] 00 00 c7 [2-3] 04 01 00 00 ff 15 [2] 00 00 48 8d 8d [2] 00 00 c7 44 24 40 7f 00 00 01 8b 7c 24 40 ff 15 [2] 00 00 48 85 c0 74 09 48 8b 40 18 48 8b 08 8b 39 8b cf ff 15 [2] 00 00 48 8d 8d [2] 00 00 33 d2 41 b8 04 01 00 00 }
        $s2 = { 33 d2 44 8d 42 68 48 8d 8c 24 ?? 00 00 00 e8 [2] 00 00 33 d2 48 89 94 24 ?? 00 00 00 48 89 94 24 ?? 00 00 00 48 89 94 24 ?? 00 00 00 48 8d 8c 24 ?? 00 00 00 ff 15 [2] 01 00 c7 84 24 ?? 00 00 00 68 00 00 00 66 44 89 bc 24 ?? 01 00 00 c7 84 24 ?? 01 00 00 01 01 00 00 48 8b [3-5] 48 89 84 24 30 01 00 00 48 [0-15] 89 84 24 ?? 01 00 00 ba 04 01 00 00 48 8d 8c 24 [2] 00 00 ff 15 [2] 01 00 }
        $s3 = { 48 8b 0d [2] 01 00 ff 15 [3] 00 83 cb ff 8b fe 41 bd 5c 00 00 00 85 ff 74 05 83 ff 02 75 4b 83 fb 01 75 46 b9 b8 0b 00 00 ff 15 [3] 00 33 d2 48 8b 0d [2] 01 00 ff 15 [3] 00 48 8b 0d [2] 01 00 ff 15 [3] 00 89 1d [2] 01 00 48 8d 15 [2] 01 00 48 8b 0d [2] 01 00 ff 15 [3] 00 e9 f5 03 00 00 83 ff 01 74 05 83 ff 02 75 29 85 db 75 25 8b fe c7 05 [2] 01 00 04 00 00 00 48 8d 15 [2] 01 00 48 8b 0d [2] 01 00 ff 15 [3] 00 e9 b2 03 00 00 85 ff 0f 85 aa 03 00 00 83 fb 02 75 4c b9 b8 0b 00 00 ff 15 [3] 00 33 d2 48 8b 0d [2] 01 00 ff 15 [3] 00 48 8b 0d [2] 01 00 ff 15 [3] 00 c7 05 [2] 01 00 07 00 00 00 48 8d 15 [2] 01 00 48 8b 0d [2] 01 00 ff 15 [3] 00 8b fb e9 59 03 00 00 83 fb 03 74 09 83 fb ff 0f 85 4b 03 00 00 48 89 74 24 68 48 89 74 24 60 ff 15 [3] 00 48 8b c8 4c 8d 44 24 68 ba ff 01 0f 00 ff 15 [3] 00 85 c0 0f 84 20 03 00 00 48 8d 44 24 60 48 89 44 24 28 c7 44 24 20 01 00 00 00 41 b9 01 00 00 00 45 33 c0 ba ff 01 0f 00 48 }
        $s4 = { 33 c0 48 83 c9 ff [0-3] f2 ae 0f b7 05 [2] 01 00 66 89 47 ff 0f b6 05 [2] 01 00 88 47 01 ff 15 [2] 01 00 [0-2] 44 8b d8 0f 1f [1-4] 00 41 0f a3 ?? 73 3a [0-4] 33 c0 b1 41 [0-3] 02 ?? 66 c7 44 24 ?? 3a 00 4c 8d 44 24 ?? 88 4c 24 ?? 48 83 c9 ff 88 44 24 ?? f2 ae 33 ?? 0f 1f [1-2] 00 41 0f b6 04 ?? 48 ff ?? 88 44 ?? fe 84 c0 75 }
    condition: 
        uint16(0) == 0x5A4D and filesize > 50KB and all of them  
}
