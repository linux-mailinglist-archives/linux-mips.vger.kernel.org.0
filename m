Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7C024A38A
	for <lists+linux-mips@lfdr.de>; Wed, 19 Aug 2020 17:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgHSPwl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 11:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726570AbgHSPwj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Aug 2020 11:52:39 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB511C061757;
        Wed, 19 Aug 2020 08:52:39 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l2so22006947wrc.7;
        Wed, 19 Aug 2020 08:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KJTKTr/yOjn/9yr4+e/7MW30mb6YvlDnpFf7s6GIPyA=;
        b=lW2Kv8gVOlfI2PVTm/VT9hT4/AwO5y7KSCPERASL3gK1/cZZjvtHgwI2okCUx3R8af
         4MM4lbzQzkmFp/nzTnGXniL43ORWL7nV7xBVTOgUYa+8Ri172LhuRY0CJxx5J+3k/y8b
         hhI3fBQ4HwYu923sFVAE/HibhO67vaCDOUyyNh1tuzEwsxvN3EI3N3z2gMnVWw1U37VT
         bapEr2O4sirwtM6ja6LIW3Jn/fRbeXM8bC7UlvUdag+yaVlh663eM6p3w2eQFguLnbAl
         LDrVdGmvRE4YuFWbQKwhhU2s1HBAsbDwWB+WEP5CFcm1Z/2X6ze3WYIykNR4yOsQwivu
         viIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KJTKTr/yOjn/9yr4+e/7MW30mb6YvlDnpFf7s6GIPyA=;
        b=FulMRj8BXwptmCnDyc2S3+IAoU4y12f3MsyW+2JfKG8YdstNg4tmA1jzz9lV2kM1yb
         HFWQ5gb+SYLYouslwCOXHzN6UbHqmkWWcrWj1J8OK4syIVDxNGScdC+JjV54G9aH/DCB
         rksKk4eM/pQUPd7eDpeONGYM9UHBEYzF8dkG4+IMULF7Vz9JK7OHHWBdF8kxArNwliBt
         Skfq/1H4AWQfwWXtnz++3E+8cSpBsBINWRY5ejcdqSheJaCP4FT0cm81P/ZsKMo/XpBK
         g7AE1B3vSvMvPeIxJ8S1VfQ5kaT39DW6mvsgEaP1qRBm51P+aeL0lGmjXcHJ4OHQccl7
         b2CA==
X-Gm-Message-State: AOAM532MxEI/NAD8P9rR74e/VIvzi/FP2Pf7BLqccBpLqQwa7lbd3pw0
        x/r9g8SixpAWx1x+Zns6BMTdL4ovdZDjuA==
X-Google-Smtp-Source: ABdhPJxFqjkRRJquQartZ2qi6UsFcZloJlCdHe3LCz2qeBEMmtYPfnc3JA+FrslhNi9B+54WpqsReQ==
X-Received: by 2002:adf:a1c6:: with SMTP id v6mr25443691wrv.197.1597852358187;
        Wed, 19 Aug 2020 08:52:38 -0700 (PDT)
Received: from [192.168.1.28] (111.pool85-48-94.dynamic.orange.es. [85.48.94.111])
        by smtp.gmail.com with ESMTPSA id f124sm6010954wmf.7.2020.08.19.08.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 08:52:37 -0700 (PDT)
Date:   Wed, 19 Aug 2020 17:52:30 +0200
From:   Paul Cercueil <pcercuei@gmail.com>
Subject: Re: [PATCH v2 00/13] Convert Ingenic to a generic board v2
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Message-Id: <IRIBFQ.7ELP84BY1TIY@gmail.com>
In-Reply-To: <EYHBFQ.EKRXTON0GS3D1@crapouillou.net>
References: <20200812001510.460382-1-paul@crapouillou.net>
        <92dee3a6-9b1d-8fef-19b3-461bf8432f30@wanyeetech.com>
        <EYHBFQ.EKRXTON0GS3D1@crapouillou.net>
X-Mailer: geary/3.36.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer. 19 ao=C3=BBt 2020 =C3=A0 17:35, Paul Cercueil <paul@crapouillou.net=
> a=20
=C3=A9crit :
> Hi Zhou,
>=20
> Le mer. 19 ao=C3=BBt 2020 =C3=A0 22:12, Zhou Yanjie=20
> <zhouyanjie@wanyeetech.com> a =C3=A9crit :
>> Hi Paul,
>>=20
>> I have some good news and some bad news.
>>=20
>> Good news is:
>>=20
>> I tested this series of patches on CU1000-Neo & CU1830-Neo, and it=20
>> =7Fcan boot normally and log in to  debian normally.
>>=20
>> Bad news is:
>>=20
>> 1. Because we dropped arch/mips/jz4740/setup.c, so it did not return=20
>> =7FMACH_INGENIC_XXXX correctly, which caused the correction of the L2=20
>> =7Fcache probe in arch/mips/mm/sc-mips.c to fail, causing JZ4770/X1000=20
>> =7Fto detect the L2 cache capacity incorrect.
>=20
> It's properly detected here on JZ4770. The detection code was just=20
> moved to arch/mips/generic/board-ingenic.c.
>=20
>> 2. When I did some heavy work (compiled docker source code after=20
>> =7Flogging in with ssh), the following message appeared:
>=20
> Chances are that these messages are related. Stuff like that tends to=20
> appear in -rc1 and get fixed afterwards.

I meant are *NOT* related :)

-Paul

>=20
> Cheers,
> -Paul
>=20
>> message1:
>>=20
>> [ 4694.290776] warn_alloc: 25 callbacks suppressed
>> [ 4694.290791] containerd-shim: page allocation failure: order:4,=20
>> =7Fmode:0x40cc0(GFP_KERNEL|__GFP_COMP), nodemask=3D(null)
>> [ 4694.315266] CPU: 0 PID: 19817 Comm: containerd-shim Not tainted=20
>> =7F5.8.0-00013-g192f2fd7b678 #15
>> [ 4694.317993] Stack : 80ae0000 80a50000 80860000 809b8fb0 809e4a30=20
>> =7F850dfcb4 00000000 ffffffff
>> [ 4694.320818]         80a50000 80a576c7 809c4374 00004d69 80ad348c=20
>> =7F00000001 850dfc58 7750292a
>> [ 4694.322695]         00000000 00000000 809c4374 ffff00fe 850dffe0=20
>> =7F00001400 00000199 00000000
>> [ 4694.325083]         ffffffff 866f7600 80a50000 878bd778 80a50000=20
>> =7F80000000 809c2b50 00000000
>> [ 4694.326957]         00040cc0 00000000 000001d2 00000000 80a53220=20
>> =7F7750292a 0000a098 80ad0000
>> [ 4694.327750]         ...
>> [ 4694.340943] Call Trace:
>> [ 4694.341181] [<8001ae08>] show_stack+0x6c/0x12c
>> [ 4694.355233] [<800f64b0>] warn_alloc+0xa8/0x130
>> [ 4694.361283] [<800f6dfc>] __alloc_pages_nodemask+0x8a4/0x8d8
>> [ 4694.362839] [<80103110>] ____cache_alloc+0x324/0x8fc
>> [ 4694.367439] [<801038e4>] __kmalloc+0x78/0xd8
>> [ 4694.376798] [<80195b28>] proc_sys_call_handler+0xf4/0x1d8
>> [ 4694.377229] [<80195c44>] proc_sys_read+0x14/0x20
>> [ 4694.384090] [<80116274>] vfs_read+0xac/0x108
>> [ 4694.385654] [<801165d4>] ksys_read+0x80/0xe0
>> [ 4694.395277] [<8001ec8c>] syscall_common+0x34/0x58
>> [ 4694.394544] Mem-Info:
>> [ 4694.396828] active_anon:661 inactive_anon:942 isolated_anon:0
>> [ 4694.396828]  active_file:10515 inactive_file:9667 isolated_file:0
>> [ 4694.396828]  unevictable:0 dirty:2003 writeback:0
>> [ 4694.396828]  slab_reclaimable:1609 slab_unreclaimable:3103
>> [ 4694.396828]  mapped:2182 shmem:156 pagetables:207 bounce:0
>> [ 4694.396828]  free:1635 free_pcp:7 free_cma:0
>> [ 4694.405770] Node 0 active_anon:2644kB inactive_anon:3768kB=20
>> =7Factive_file:42060kB inactive_file:38668kB unevictable:0kB=20
>> =7Fisolated(anon):0kB isolated(file):0kB mapped:8728kB dirty:8048kB=20
>> =7Fwriteback:0kB shmem:624kB writeback_tmp:0kB all_unreclaimable? no
>> [ 4694.408349] Normal free:6484kB min:1376kB low:1720kB high:2064kB=20
>> =7Freserved_highatomic:0KB active_anon:2644kB inactive_anon:3768kB=20
>> =7Factive_file:42064kB inactive_file:38724kB unevictable:0kB=20
>> =7Fwritepending:8060kB present:131072kB managed:118804kB mlocked:0kB=20
>> =7Fkernel_stack:584kB pagetables:828kB bounce:0kB free_pcp:32kB=20
>> =7Flocal_pcp:32kB free_cma:0kB
>> [ 4694.409607] lowmem_reserve[]: 0 0 0
>> [ 4694.410382] Normal: 117*4kB (UM) 406*8kB (UM) 149*16kB (UME)=20
>> =7F12*32kB (UME) 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB=20
>> =7F0*4096kB =3D 6484kB
>> [ 4694.418673] 20618 total pagecache pages
>> [ 4694.423125] 226 pages in swap cache
>> [ 4694.423912] Swap cache stats: add 535090, delete 534864, find=20
>> =7F234586/366812
>> [ 4694.431304] Free swap  =3D 774396kB
>> [ 4694.431900] Total swap =3D 786428kB
>> [ 4694.432480] 32768 pages RAM
>> [ 4694.432537] 0 pages HighMem/MovableOnly
>> [ 4694.441338] 3067 pages reserved
>> [ 4694.441770] 0 pages cma reserved
>>=20
>> ---------------------------------------------------------
>>=20
>> message2:
>>=20
>> [ 4426.473667] warn_alloc: 27 callbacks suppressed
>> [ 4426.473681] kswapd0: page allocation failure: order:0,=20
>> =7Fmode:0xa20(GFP_ATOMIC), nodemask=3D(null)
>> [ 4426.475946] CPU: 0 PID: 439 Comm: kswapd0 Not tainted=20
>> =7F5.8.0-00013-g192f2fd7b678 #15
>> [ 4426.478136] Stack : 80ae0000 80a50000 80860000 809b8fb0 809e4a30=20
>> =7F87c0dccc 00000000 ffffffff
>> [ 4426.478301]         80a50000 80a576c7 809c4374 000001b7 80ad348c=20
>> =7F00000001 87c0dc70 b7c290ba
>> [ 4426.478464]         00000000 00000000 809c4374 00000000 0000000f=20
>> =7F00000000 0000019f 00000000
>> [ 4426.478626]         bff4ffd7 1c5e5f3c 80ae0000 31672d33 80a50000=20
>> =7F00000000 809c2b50 00000000
>> [ 4426.478787]         00000a20 00000000 00000000 00000000 00000002=20
>> =7F804d392c 00000000 80ad0000
>> [ 4426.478940]         ...
>> [ 4426.481390] Call Trace:
>> [ 4426.483842] [<8001ae08>] show_stack+0x6c/0x12c
>> [ 4426.485555] [<800f64b0>] warn_alloc+0xa8/0x130
>> [ 4426.487275] [<800f6dfc>] __alloc_pages_nodemask+0x8a4/0x8d8
>> [ 4426.487382] [<800f6f80>] page_frag_alloc+0x74/0x144
>> [ 4426.489534] [<805fc1a4>] __napi_alloc_skb+0x88/0x118
>> [ 4426.491769] [<8052ed8c>] stmmac_napi_poll_rx+0x434/0xa94
>> [ 4426.494354] [<80613eb0>] net_rx_action+0x11c/0x310
>> [ 4426.496414] [<807ecd0c>] __do_softirq+0x10c/0x258
>> [ 4426.498395] [<800320c0>] __irq_exit_rcu+0x68/0xbc
>> [ 4426.500365] [<80032324>] irq_exit+0x10/0x1c
>> [ 4426.501844] [<804876b4>] plat_irq_dispatch+0x8c/0xb8
>> [ 4426.504076] [<800154f8>] handle_int+0x138/0x144
>> [ 4426.505883] [<8005280c>] arch_local_irq_enable+0x4/0xc
>> [ 4426.508289] Mem-Info:
>> [ 4426.510576] active_anon:770 inactive_anon:1763 isolated_anon:0
>> [ 4426.510576]  active_file:5581 inactive_file:15166 isolated_file:0
>> [ 4426.510576]  unevictable:0 dirty:1262 writeback:880
>> [ 4426.510576]  slab_reclaimable:1187 slab_unreclaimable:3016
>> [ 4426.510576]  mapped:3478 shmem:315 pagetables:186 bounce:0
>> [ 4426.510576]  free:453 free_pcp:16 free_cma:0
>> [ 4426.512469] Node 0 active_anon:3080kB inactive_anon:7052kB=20
>> =7Factive_file:22324kB inactive_file:60664kB unevictable:0kB=20
>> =7Fisolated(anon):0kB isolated(file):0kB mapped:13912kB dirty:5048kB=20
>> =7Fwriteback:3520kB shmem:1260kB writeback_tmp:0kB all_unreclaimable?=20
>> no
>> [ 4426.512938] Normal free:1812kB min:5472kB low:5816kB high:6160kB=20
>> =7Freserved_highatomic:0KB active_anon:3080kB inactive_anon:7052kB=20
>> =7Factive_file:22324kB inactive_file:60664kB unevictable:0kB=20
>> =7Fwritepending:8568kB present:131072kB managed:118804kB mlocked:0kB=20
>> =7Fkernel_stack:544kB pagetables:744kB bounce:0kB free_pcp:64kB=20
>> =7Flocal_pcp:64kB free_cma:0kB
>> [ 4426.515643] lowmem_reserve[]: 0 0 0
>> [ 4426.516400] Normal: 11*4kB (U) 59*8kB (UE) 75*16kB (U) 3*32kB (U)=20
>> =7F0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 1812kB
>> [ 4426.517399] 21378 total pagecache pages
>> [ 4426.518507] 306 pages in swap cache
>> [ 4426.519259] Swap cache stats: add 533859, delete 533553, find=20
>> =7F134676/266712
>> [ 4426.520752] Free swap  =3D 777212kB
>> [ 4426.521331] Total swap =3D 786428kB
>> [ 4426.521911] 32768 pages RAM
>> [ 4426.521973] 0 pages HighMem/MovableOnly
>> [ 4426.523072] 3067 pages reserved
>> [ 4426.523474] 0 pages cma reserved
>>=20
>> ---------------------------------------------------------
>>=20
>> message3:
>>=20
>> [  292.077309] CPU 0 Unable to handle kernel paging request at=20
>> =7Fvirtual address 00000104, epc =3D=3D 801e7f30, ra =3D=3D 801e7f24
>> [  292.087904] Oops[#1]:
>> [  292.090169] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted=20
>> =7F5.9.0-rc1-00016-g8d1e63c37d0d-dirty #1
>> [  292.098768] Workqueue: events cache_reap
>> [  292.102675] $ 0   : 00000000 00000001 808f3bf4 00000122
>> [  292.107887] $ 4   : 808f3bf8 00000100 0000003c 87c02080
>> [  292.113099] $ 8   : 87c01000 8581e301 00000001 00000000
>> [  292.118311] $12   : 87c3dc7c 0000000a 810021c4 00000100
>> [  292.123523] $16   : 85855600 8100218c 86284600 80790000
>> [  292.128735] $20   : 0000003c 00000000 8100219c fffffffe
>> [  292.133946] $24   : 00000122 87c02090
>> [  292.139158] $28   : 87c3c000 87c3dc48 807b0000 801e7f24
>> [  292.144371] Hi    : 00000000
>> [  292.147237] Lo    : 000c6bf4
>> [  292.150109] epc   : 801e7f30 free_block+0x68/0x198
>> [  292.154887] ra    : 801e7f24 free_block+0x5c/0x198
>> [  292.159660] Status: 10001402 KERNEL EXL
>> [  292.163569] Cause : 4080800c (ExcCode 03)
>> [  292.167563] BadVA : 00000104
>> [  292.170430] PrId  : 00d00100 (Ingenic XBurst)
>> [  292.174776] Process kworker/0:0 (pid: 5, threadinfo=3D50ecb211,=20
>> =7Ftask=3Da81ea849, tls=3D00000000)
>> [  292.183016] Stack : 87c2e020 87c50cd0 8079e358 00000000 87c01000=20
>> =7F801e8b14 87c50cd0 87c2e050
>> [  292.191353]         87c50cd0 8014930c 87c3dc7c 87c50ca0 807a0000=20
>> =7F87c3dc7c 87c3dc7c 018070a3
>> [  292.199689]         80790000 86284600 801e8618 00000000 00000100=20
>> =7F00000122 00000000 8100219c
>> [  292.208025]         fffffffe 801e8544 00000003 00000000 00000000=20
>> =7F87c3dce0 808f3bf4 00000000
>> [  292.216361]         87c01000 801e8618 87c06300 00000000 00000000=20
>> =7F87c3dce0 87c01000 85855a80
>> [  292.224697]         ...
>> [  292.227132] Call Trace:
>> [  292.229569] [<801e7f30>] free_block+0x68/0x198
>> [  292.234003] [<801e8b14>] ___cache_free+0x1f8/0x2e8
>> [  292.238781] [<801e8544>] kfree+0x48/0x6c
>> [  292.242693] [<801e8618>] kmem_freepages+0xb0/0x124
>> [  292.247471] [<801e86e0>] slab_destroy+0x48/0x7c
>> [  292.251989] [<801e8778>] slabs_destroy+0x64/0x94
>> [  292.256593] [<801e8b4c>] ___cache_free+0x230/0x2e8
>> [  292.261372] [<801e8544>] kfree+0x48/0x6c
>> [  292.265283] [<801e8618>] kmem_freepages+0xb0/0x124
>> [  292.270062] [<801e86e0>] slab_destroy+0x48/0x7c
>> [  292.274580] [<801e8778>] slabs_destroy+0x64/0x94
>> [  292.279185] [<801e8d90>]=20
>> drain_array.isra.59.constprop.61+0xb4/0xdc
>> [  292.285437] [<801e8f84>] cache_reap+0x64/0x120
>> [  292.289869] [<80137204>] process_one_work+0x1b8/0x25c
>> [  292.294907] [<80137588>] worker_thread+0x294/0x3c4
>> [  292.299684] [<8013cfe0>] kthread+0x148/0x150
>> [  292.303941] [<8010506c>] ret_from_kernel_thread+0x14/0x1c
>> [  292.309324] Code: 8c430008  8c450004  24440004 <aca30004>=20
>> ac650000 =7F 8c430014  ac4f0004  ac580008  8d0a0014
>> [  292.319053]
>> [  292.320591] ---[ end trace 2a1f2afba7a08ca1 ]---
>> [  292.325197] Kernel panic - not syncing: Fatal exception
>> [  292.330409] Rebooting in 10 seconds..
>>=20
>> these three kinds of message appear at random. Sometimes they will=20
>> =7Fappear at the beginning of the compilation, and sometimes they will=20
>> =7Fappear after tens of minutes of compilation.
>>=20
>> Thanks and best regards!
>>=20
>> =E5=9C=A8 2020/8/12 =E4=B8=8A=E5=8D=888:14, Paul Cercueil =E5=86=99=E9=
=81=93:
>>> Hi,
>>>=20
>>> Changes since V1:
>>>=20
>>> - the get_system_type() now will simply return the "system_type"
>>>    variable if non-NULL, and the various boards can set this pointer
>>>    should they want to set a custom value. The .get_system_type
>>>    callback that v1 added to the struct mips_machine is gone.
>>>=20
>>> - the board-ingenic.c has been modified accordingly.
>>>=20
>>> - patch [06/13] is new, it makes sure that the kernel's command=20
>>> line =7F=7Fis
>>>    initialized properly and includes the parameters passed by the
>>>    bootloader.
>>>=20
>>> - the cu1830-neo board defconfig has now been regenerated in patch
>>>    [12/13].
>>>=20
>>> Cheers,
>>> -Paul
>>>=20
>>> Paul Cercueil (13):
>>>    MIPS: cpu-probe: Set Ingenic's writecombine to _CACHE_CACHABLE_WA
>>>    MIPS: cpu-probe: Mark XBurst CPU as having vtagged caches
>>>    MIPS: cpu-probe: ingenic: Fix broken BUG_ON
>>>    MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
>>>    MIPS: generic: Allow boards to set system type
>>>    MIPS: generic: Init command line with fw_init_cmdline()
>>>    MIPS: generic: Support booting with built-in or appended DTB
>>>    MIPS: generic: Add support for zboot
>>>    MIPS: generic: Increase NR_IRQS to 256
>>>    MIPS: generic: Add support for Ingenic SoCs
>>>    MIPS: jz4740: Drop folder
>>>    MIPS: configs: Regenerate configs of Ingenic boards
>>>    MAINTAINERS: Update paths to Ingenic platform code
>>>=20
>>>   MAINTAINERS                                   |   4 +-
>>>   arch/mips/Kbuild.platforms                    |   1 -
>>>   arch/mips/Kconfig                             |  43 ++++--
>>>   arch/mips/configs/ci20_defconfig              |   4 +-
>>>   arch/mips/configs/cu1000-neo_defconfig        |  16 +-
>>>   arch/mips/configs/cu1830-neo_defconfig        |  15 +-
>>>   arch/mips/configs/gcw0_defconfig              |   2 +-
>>>   arch/mips/configs/qi_lb60_defconfig           |   5 +-
>>>   arch/mips/configs/rs90_defconfig              |   4 +-
>>>   arch/mips/generic/Kconfig                     |   8 +-
>>>   arch/mips/generic/Makefile                    |   1 +
>>>   arch/mips/generic/Platform                    |   1 +
>>>   arch/mips/generic/board-ingenic.c             | 108 +++++++++++++
>>>   arch/mips/generic/init.c                      |  11 +-
>>>   arch/mips/generic/proc.c                      |   5 +
>>>   arch/mips/include/asm/mach-generic/irq.h      |   2 +-
>>>   .../asm/mach-jz4740/cpu-feature-overrides.h   |  50 ------
>>>   arch/mips/include/asm/mach-jz4740/irq.h       |  13 --
>>>   arch/mips/include/asm/pgtable-bits.h          |   5 -
>>>   arch/mips/{jz4740 =3D> ingenic}/Kconfig         |  16 +-
>>>   arch/mips/jz4740/Makefile                     |   9 --
>>>   arch/mips/jz4740/Platform                     |   3 -
>>>   arch/mips/jz4740/setup.c                      | 145=20
>>> =7F=7F------------------
>>>   arch/mips/kernel/cpu-probe.c                  |   8 +-
>>>   24 files changed, 186 insertions(+), 293 deletions(-)
>>>   create mode 100644 arch/mips/generic/board-ingenic.c
>>>   delete mode 100644=20
>>> =7F=7Farch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h
>>>   delete mode 100644 arch/mips/include/asm/mach-jz4740/irq.h
>>>   rename arch/mips/{jz4740 =3D> ingenic}/Kconfig (91%)
>>>   delete mode 100644 arch/mips/jz4740/Makefile
>>>   delete mode 100644 arch/mips/jz4740/Platform
>>>   delete mode 100644 arch/mips/jz4740/setup.c
>>>=20
>=20


