Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E832F04A9
	for <lists+linux-mips@lfdr.de>; Sun, 10 Jan 2021 02:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbhAJBJN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Jan 2021 20:09:13 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:56698 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbhAJBJN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Jan 2021 20:09:13 -0500
Date:   Sun, 10 Jan 2021 01:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1610240908; bh=9sBxWmzjqipIQOnoNEK/AoPt0kN5IhdKUZVARrJ77Yc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=fi2Mc/EUJ3toTJNPll1vN9enBP70B2Wgu2cGDFXDxATR9reAq1cSd5hXggOXZEXZB
         6WUp27TXd9F2WK/YhF7fIOKw+7Qplh4IAaRliMWKEK+vu25SMcdEykl/CoCEFBrTt0
         TNQmRXmjpDoNtSK0gq8Ti5h2pVySkFmJvJrE763NYus55AVbyMqfpkEi1bvewILT67
         pYyxORj5r2MBeL5dotQyXX2VclWsy5Lx9SqoOpZIgNiBMk/t0ytCJu8Rmbmmipc7dl
         jjt/jfxU96lNpPz+qELtvoafxeglh51b3u/F0SUcPhi3O9TcB3uEpGE3Kz69bTAIqh
         ZSOHRukoxdJ8g==
To:     Nick Desaulniers <ndesaulniers@google.com>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [BUG mips llvm] MIPS: malformed R_MIPS_{HI16,LO16} with LLVM
Message-ID: <20210110010811.1007005-1-alobakin@pm.me>
In-Reply-To: <20210109232854.954832-1-alobakin@pm.me>
References: <20210109171058.497636-1-alobakin@pm.me> <CAKwvOdmV2tj4Uyz1iDkqCj+snWPpnnAmxJyN+puL33EpMRPzUw@mail.gmail.com> <20210109191457.786517-1-alobakin@pm.me> <20210109232854.954832-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Lobakin <alobakin@pm.me>
Date: Sat, 09 Jan 2021 23:29:26 +0000

> From: Alexander Lobakin <alobakin@pm.me>
> Date: Sat, 09 Jan 2021 19:15:31 +0000
>
>> From: Nick Desaulniers <ndesaulniers@google.com>
>> Date: Sat, 9 Jan 2021 09:50:44 -0800
>>
>>> On Sat, Jan 9, 2021 at 9:11 AM Alexander Lobakin <alobakin@pm.me> wrote=
:
>>>>
>>>> Machine: MIPS32 R2 Big Endian (interAptiv (multi))
>>>>
>>>> While testing MIPS with LLVM, I found a weird and very rare bug with
>>>> MIPS relocs that LLVM emits into kernel modules. It happens on both
>>>> 11.0.0 and latest git snapshot and applies, as I can see, only to
>>>> references to static symbols.
>>>>
>>>> When the kernel loads the module, it allocates a space for every
>>>> section and then manually apply the relocations relative to the
>>>> new address.
>>>>
>>>> Let's say we have a function phy_probe() in drivers/net/phy/libphy.ko.
>>>> It's static and referenced only in phy_register_driver(), where it's
>>>> used to fill callback pointer in a structure.
>>>>
>>>> The real function address after module loading is 0xc06c1444, that
>>>> is observed in its ELF st_value field.
>>>> There are two relocs related to this usage in phy_register_driver():
>>>>
>>>> R_MIPS_HI16 refers to 0x3c010000
>>>> R_MIPS_LO16 refers to 0x24339444
>>>>
>>>> The address of .text is 0xc06b8000. So the destination is calculated
>>>> as follows:
>>>>
>>>> 0x00000000 from hi16;
>>>> 0xffff9444 from lo16 (sign extend as it's always treated as signed);
>>>> 0xc06b8000 from base.
>>>>
>>>> =3D 0xc06b1444. The value is lower than the real phy_probe() address
>>>> (0xc06c1444) by 0x10000 and is lower than the base address of
>>>> module's .text, so it's 100% incorrect.
>>>>
>>>> This results in:
>>>>
>>>> [    2.204022] CPU 3 Unable to handle kernel paging request at virtual
>>>> address c06b1444, epc =3D=3D c06b1444, ra =3D=3D 803f1090
>>>>
>>>> The correct instructions should be:
>>>>
>>>> R_MIPS_HI16 0x3c010001
>>>> R_MIPS_LO16 0x24339444
>>>>
>>>> so there'll be 0x00010000 from hi16.
>>>>
>>>> I tried to catch those bugs in arch/mips/kernel/module.c (by checking
>>>> if the destination is lower than the base address, which should never
>>>> happen), and seems like I have only 3 such places in libphy.ko (and
>>>> one in nf_tables.ko).
>>>> I don't think it should be handled somehow in mentioned source code
>>>> as it would look rather ugly and may break kernels build with GNU
>>>> stack, which seems to not produce such bad codes.
>>>>
>>>> If I should report this to any other resources, please let me know.
>>>> I chose clang-built-linux and LKML as it may not happen with userland
>>>> (didn't tried to catch).
>>>
>>> Thanks for the report.  Sounds like we may indeed be producing an
>>> incorrect relocation.  This is only seen for big endian triples?
>>
>> Unfortunately I don't have a LE board to play with, so can confirm
>> only Big Endian.
>>
>> (BTW, if someone can say if it's possible for MIPS (and how if it is)
>> to launch a LE kernel from BE-booted preloader and U-Boot, that would
>> be super cool)
>>
>>> Getting a way for us to deterministically reproduce would be a good
>>> first step.  Which config or configs beyond defconfig, and which
>>> relocations specifically are you observing this with?
>>
>> I use `make 32r2_defconfig` which combines several configs from
>> arch/mips/configs:
>>  - generic_defconfig;
>>  - generic/32r2.config;
>>  - generic/eb.config.
>>
>> Aside from that, I enable a bunch of my WIP drivers and the
>> Netfilter. On my setup, this bug is always present in libphy.ko,
>> so CONFIG_PHYLIB=3Dm (with all deps) should be enough.
>>
>> The three failed relocs belongs to this part of code: [0]
>>
>> llvm-readelf on them:
>>
>> Relocation section '.rel.text' at offset 0xbf60 contains 2281 entries:
>> [...]
>> 00005740  00029305 R_MIPS_HI16            00000000   .text
>> 00005744  00029306 R_MIPS_LO16            00000000   .text
>> 00005720  00029305 R_MIPS_HI16            00000000   .text
>> 00005748  00029306 R_MIPS_LO16            00000000   .text
>> 0000573c  00029305 R_MIPS_HI16            00000000   .text
>> 0000574c  00029306 R_MIPS_LO16            00000000   .text
>>
>> The first pair is the one from my first mail:
>> 0x3c010000 <-- should be 0x3c010001 to work properly
>> 0x24339444
>>
>> I'm planning to hunt for more now, will let you know.
>
> Unfortunately, R_MIPS_32 also suffers from that. And unlikely
> R_MIPS_{HI,LO}16, they can't be handled runtime as the values
> are pure random.
> I expanded arch/mips/kernel/module.c a bit, so it tries to find
> the actual symbol in .symtab after each applied relocation and
> print the detailed info. Here's an example from nf_defrag_ipv6
> loading:
>
> [  429.789793] nf_defrag_ipv6: final section addresses:
> [  429.795409] =3D090xc07214fc __ksymtab_gpl
> [  429.799574] =3D090xc0720000 .text
> [  429.802902] =3D090xc07216b0 .data
> [  429.806249] =3D090xc0721790 .bss
> [  429.809474] =3D090xc0721508 __ksymtab_strings
> [  429.813977] =3D090xc0728000 .init.text
> [  429.817781] =3D090xc07214c0 .exit.text
> [  429.821606] =3D090xc0721520 .rodata
> [  429.825120] =3D090xc0721578 .rodata.str1.1
> [  429.829322] =3D090xc0721638 .note.Linux
> [  429.833226] =3D090xc0721800 .gnu.linkonce.this_module
> [  429.838503] =3D090xc0721650 .MIPS.abiflags
> [  429.842702] =3D090xc0721668 .reginfo
> [  429.846326] =3D090xc0721680 .note.gnu.build-id
> [  429.851129] nf_defrag_ipv6: R_MIPS_32 [0x00000008]: 0xc07216b0 -> 0xc0=
7216b8 is broken
> [  429.860017] nf_defrag_ipv6: R_MIPS_32 [0x00000008]: 0xc07216b0 -> 0xc0=
7216b8 is broken
> [  429.868875] nf_defrag_ipv6: R_MIPS_32 [0x00000138]: 0xc0720000 -> 0xc0=
720138 is defrag6_net_exit
> [  429.878706] nf_defrag_ipv6: R_MIPS_32 [0x000012c8]: 0xc0720000 -> 0xc0=
7212c8 is nf_ct_net_init
> [  429.888335] nf_defrag_ipv6: R_MIPS_32 [0x0000142c]: 0xc0720000 -> 0xc0=
72142c is nf_ct_net_pre_exit
> [  429.898367] nf_defrag_ipv6: R_MIPS_32 [0x00001440]: 0xc0720000 -> 0xc0=
721440 is nf_ct_net_exit
> [  429.907994] nf_defrag_ipv6: R_MIPS_32 [0x00000057]: 0xc0721578 -> 0xc0=
7215cf is broken
> [  429.916872] nf_defrag_ipv6: R_MIPS_32 [0x00000000]: 0x80f297f0 -> 0x80=
f297f0 is proc_dointvec_jiffies
> [  429.927177] nf_defrag_ipv6: R_MIPS_32 [0x00000039]: 0xc0721578 -> 0xc0=
7215b1 is broken
> [  429.936044] nf_defrag_ipv6: R_MIPS_32 [0x00000000]: 0x80f29374 -> 0x80=
f29374 is proc_doulongvec_minmax
> [  429.946453] nf_defrag_ipv6: R_MIPS_32 [0x00000072]: 0xc0721578 -> 0xc0=
7215ea is broken
> [  429.955320] nf_defrag_ipv6: R_MIPS_32 [0x00000000]: 0x80f29374 -> 0x80=
f29374 is proc_doulongvec_minmax
> [  429.965737] nf_defrag_ipv6: R_MIPS_32 [0x000000a4]: 0xc0720000 -> 0xc0=
7200a4 is ipv6_defrag
> [  429.975094] nf_defrag_ipv6: R_MIPS_32 [0x000000a4]: 0xc0720000 -> 0xc0=
7200a4 is ipv6_defrag
> [  429.984431] nf_defrag_ipv6: R_MIPS_32 [0x0000106c]: 0xc0720000 -> 0xc0=
72106c is ip6frag_key_hashfn
> [  429.994470] nf_defrag_ipv6: R_MIPS_32 [0x00001090]: 0xc0720000 -> 0xc0=
721090 is ip6frag_obj_hashfn
> [  430.004486] nf_defrag_ipv6: R_MIPS_32 [0x000010b8]: 0xc0720000 -> 0xc0=
7210b8 is ip6frag_obj_cmpfn
> [  430.014425] nf_defrag_ipv6: R_MIPS_32 [0x00000000]: 0xc0720000 -> 0xc0=
720000 is nf_defrag_ipv6_enable
> [  430.024742] nf_defrag_ipv6: R_MIPS_32 [0x00000001]: 0xc0721508 -> 0xc0=
721509 is __kstrtab_nf_defrag_ipv6_enable
> [  430.036074] nf_defrag_ipv6: R_MIPS_32 [0x00000000]: 0xc0721508 -> 0xc0=
721508 is __kstrtabns_nf_defrag_ipv6_enable
> [  430.047561] nf_defrag_ipv6: R_MIPS_32 [0x00000000]: 0xc0728000 -> 0xc0=
728000 is init_module
> [  430.056930] nf_defrag_ipv6: R_MIPS_32 [0x00000000]: 0xc07214c0 -> 0xc0=
7214c0 is cleanup_module
>
> At least five symbols are broken and lead to nowhere: two from .data
> and three from .rodata. Values in square braces are initial references
> that can be observed via `nm -n` -- and for broken ones they really
> don't correspond to any symbols, mismatching the neighbours' addresses
> by 0x40-0x50.

Oops, my bad. I forgot that they can point to the middle of the struct
or array or what else. Nevermind, only the problem with R_MIPS_HI16 is
actual.

With the "add 0x10000 if can't find the symbol" workaround I'm now
able to run kernel and modules without any visible defects or issues.
Full list of detected and fixed relocs on my setup:

libphy: R_MIPS_HI16 [0x3c030000, 0x24639444]: .text -> 0xc06b1444 is broken
libphy: R_MIPS_HI16 [0x3c030000, 0x24639444]: .text -> 0xc06c1444 is phy_pr=
obe
libphy: R_MIPS_HI16 [0x3c020000, 0x2442970c]: .text -> 0xc06b170c is broken
libphy: R_MIPS_HI16 [0x3c020000, 0x2442970c]: .text -> 0xc06c170c is phy_re=
move
libphy: R_MIPS_HI16 [0x3c010000, 0x242197ac]: .text -> 0xc06b17ac is broken
libphy: R_MIPS_HI16 [0x3c010000, 0x242197ac]: .text -> 0xc06c17ac is phy_sh=
utdown
nf_tables: R_MIPS_HI16 [0x3c010001, 0x24218164]: .text -> 0xc07bc164 is bro=
ken
nf_tables: R_MIPS_HI16 [0x3c010001, 0x24218164]: .text -> 0xc07cc164 is nf_=
tables_dump_obj_done
nf_tables: R_MIPS_HI16 [0x3c010001, 0x243981bc]: .text -> 0xc07bc1bc is bro=
ken
nf_tables: R_MIPS_HI16 [0x3c010001, 0x243981bc]: .text -> 0xc07cc1bc is nft=
_flowtable_parse_hook
nf_tables: R_MIPS_HI16 [0x3c010001, 0x24398390]: .text -> 0xc07bc390 is bro=
ken
nf_tables: R_MIPS_HI16 [0x3c010001, 0x24398390]: .text -> 0xc07cc390 is nft=
_register_flowtable_net_hooks
nf_tables: R_MIPS_HI16 [0x3c010001, 0x243981bc]: .text -> 0xc07bc1bc is bro=
ken
nf_tables: R_MIPS_HI16 [0x3c010001, 0x243981bc]: .text -> 0xc07cc1bc is nft=
_flowtable_parse_hook
nf_tables: R_MIPS_HI16 [0x3c010001, 0x24398390]: .text -> 0xc07bc390 is bro=
ken
nf_tables: R_MIPS_HI16 [0x3c010001, 0x24398390]: .text -> 0xc07cc390 is nft=
_register_flowtable_net_hooks
nf_tables: R_MIPS_HI16 [0x3c010001, 0x2421866c]: .text -> 0xc07bc66c is bro=
ken
nf_tables: R_MIPS_HI16 [0x3c010001, 0x2421866c]: .text -> 0xc07cc66c is nf_=
tables_dump_flowtable
nf_tables: R_MIPS_HI16 [0x3c010001, 0x242185b4]: .text -> 0xc07bc5b4 is bro=
ken
nf_tables: R_MIPS_HI16 [0x3c010001, 0x242185b4]: .text -> 0xc07cc5b4 is nf_=
tables_dump_flowtable_start
nf_tables: R_MIPS_HI16 [0x3c010001, 0x243981bc]: .text -> 0xc07bc1bc is bro=
ken
nf_tables: R_MIPS_HI16 [0x3c010001, 0x243981bc]: .text -> 0xc07cc1bc is nft=
_flowtable_parse_hook
nf_tables: R_MIPS_HI16 [0x3c020002, 0x24428080]: .text -> 0xc07cc080 is bro=
ken
nf_tables: R_MIPS_HI16 [0x3c020002, 0x24428080]: .text -> 0xc07dc080 is nft=
_rbtree_gc
nf_conntrack: R_MIPS_HI16 [0x3c010000, 0x24258538]: .text -> 0xc077c538 is =
broken
nf_conntrack: R_MIPS_HI16 [0x3c010000, 0x24258538]: .text -> 0xc078c538 is =
nf_ct_expectation_timed_out

> So for now seems like it's really an LLVM problem and there can't be
> any simple workaround for it in the kernel.
>
>> [0] https://elixir.bootlin.com/linux/v5.11-rc2/source/drivers/net/phy/ph=
y_device.c#L2989
>>
>>> Thanks,
>>> ~Nick Desaulniers
>>
>> Thanks,
>> Al
>
> Al

Al

