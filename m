Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C182BD6D
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2019 04:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfE1CxB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 May 2019 22:53:01 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:45790 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727869AbfE1CxB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 May 2019 22:53:01 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3B7188365B;
        Tue, 28 May 2019 14:52:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1559011978;
        bh=3+zTeZq32FXUQN9OCVX/QI6nF7yirtMhmyYbWAZK9Zg=;
        h=From:To:CC:Subject:Date;
        b=wjyMgR316EAYhmPUwLY9r22vxLDVGITrbkLedug7rWpwajRXKvpUltbVjN92sNulY
         eOP6gtm6wNh0XIPb5QROXrtoZL4Q4W9AETsGrBsi95waQRX1NKpOxlyibINDT3BsZ3
         rUnN33Y7YJLG8cL5/t7sVi5058I3wR8NQ7O6GElhSOFLteRKyReweK50ft7+OHkp6m
         eVsK0WP2+Js3jbgoi7IMwf91pW/8INEXVeMEoWtelNQwoBcO3WDyAM3NNkeZKE0M73
         Anr+IDxJxrG9P4fdv8CGq3w2cvz+2NQH/c7ZE/WZHS2CQpv381p8GKaA1oynCrdqaI
         ZYRIuzOjec9Eg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5ceca28a0001>; Tue, 28 May 2019 14:52:58 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Tue, 28 May 2019 14:52:57 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Tue, 28 May 2019 14:52:57 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
Subject: MIPS r4k cache operations with SMP enabled
Thread-Topic: MIPS r4k cache operations with SMP enabled
Thread-Index: AQHVFQB0Z16/xM5TvUKYi9+2ojSGNw==
Date:   Tue, 28 May 2019 02:52:57 +0000
Message-ID: <d87063da1d104af8a040f5f25a588638@svr-chch-ex1.atlnz.lc>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,=0A=
=0A=
I'm trying to port a fairly old Broadcom integrated chip (BCM6818) to =0A=
the latest Linux kernel using the mips/bmips support.=0A=
=0A=
The chip has a BMIPS4355 core. This has two "thread processors" (cpu =0A=
cores) with separate I-caches but a shared D-cache.=0A=
=0A=
I've got things booting but I encounter the following BUG()=0A=
=0A=
BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1=
=0A=
caller is blast_dcache16+0x24/0x154=0A=
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.1.0-at1 #5=0A=
Stack : 00000036 8008d0d0 806a0000 807c0000 80754e10 0000000b 80754684 =0A=
8f831c8c=0A=
         80900000 8f828424 807986e7 8071348c 00000000 10008f00 8f831c30 =0A=
7fb69e2a=0A=
         00000000 00000000 80920000 00000056 00002335 00000000 807a0000 =0A=
00000000=0A=
         6d6d3a20 00000000 00000056 73776170 00000000 ffffffff 10008f01 =0A=
807c0000=0A=
         80790000 00002cc2 ffffffff 80900000 00000010 8f83198c 00000000 =0A=
80900000=0A=
         ...=0A=
Call Trace:=0A=
[<8001c208>] show_stack+0x30/0x100=0A=
[<8063282c>] dump_stack+0x9c/0xd0=0A=
[<802f1cec>] debug_smp_processor_id+0xfc/0x110=0A=
[<8002e274>] blast_dcache16+0x24/0x154=0A=
[<80122978>] map_vm_area+0x58/0x70=0A=
[<80123888>] __vmalloc_node_range+0x1fc/0x2b4=0A=
[<80123b54>] vmalloc+0x44/0x50=0A=
[<807d15d0>] jffs2_zlib_init+0x24/0x94=0A=
[<807d1354>] jffs2_compressors_init+0x10/0x30=0A=
[<807d151c>] init_jffs2_fs+0x68/0xf8=0A=
[<8001016c>] do_one_initcall+0x7c/0x1f0=0A=
[<807bee30>] kernel_init_freeable+0x17c/0x258=0A=
[<80650d1c>] kernel_init+0x10/0xf8=0A=
[<80015e6c>] ret_from_kernel_thread+0x14/0x1c=0A=
=0A=
In blast_dcache16 current_cpu_data is used which invokes =0A=
smp_processor_id() triggering the BUG(). I can fix this by sprinkling =0A=
preempt_disable/preempt_enable through arch/mips/mm/c-r4k.c but that =0A=
seems kind of wrong. Does anyone have any suggestion as to the right way =
=0A=
to avoid this BUG()?=0A=
=0A=
Thanks,=0A=
Chris=0A=
=0A=
=0A=
=0A=
