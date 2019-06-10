Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 738BE3AF94
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jun 2019 09:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387893AbfFJHXW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Jun 2019 03:23:22 -0400
Received: from mout.gmx.net ([212.227.15.15]:60465 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387868AbfFJHXW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 10 Jun 2019 03:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1560151401;
        bh=qiFDN+pTPY5P6QQQDib9b+UA88UjgfkMvRZCfjtfHQk=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=RhBu8YeefC8zRV9YQhix/XEuFaAHHW1t7pJaIMQtWKfpsnUzQJ5A5c7jEQJYTmR3j
         vdkQvZIDy2MaQo0m0MyapNDoAyhCY55zYIbFdl25motj093G3SvkeSpc93grjDloty
         8EGOx8QT9atvc6Q5NYdT74kg1Pu6yTBeXtTH1XjY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.38] ([31.18.251.131]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MF4eJ-1hKceQ0EjT-00GK54 for
 <linux-mips@vger.kernel.org>; Mon, 10 Jun 2019 09:23:21 +0200
To:     linux-mips@vger.kernel.org
From:   Oleksij Rempel <linux@rempel-privat.de>
Subject: [5.2-rc4] oops on r4k_flush_icache_range+0x10/0x18
Message-ID: <bbef2bbf-b544-bc9f-e8fd-f185829381ba@rempel-privat.de>
Date:   Mon, 10 Jun 2019 09:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sj7SvK8k1tci3UCF5mbtX0saVZ65NiC8tjPz+reBD8oKuR7ShVF
 b9avrjXZcPTve6/5PPyJK34LrJlfSKxlcpcRnNcetgWtfUtLfw64HYPd7h4SkJ51k5pQjbK
 DPa55tPmtxPEIW5L394kFqAKx19jYtDP+7shEr1SQV/2wWWw+o89CZj8/GCSBc+Yj94saQ7
 VziwRTHDzKQ/wqevD/Fvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S+O2MKqENpM=:LFLSsGQLM9UMNySZ+vna9K
 eG8/F1d7lYtd0iwO967mmziBZJQltCPF3hYo4WyUzbBZtD7KQyz8yX9h2PlWfFHC10NxbPRh0
 wI0Tl7g3ND1UOkgBdL+V1rvOJiI3bk0xwWOlvQE7vfNLhUdYBN2X5EHLiYKulC62JTdZjvwOU
 Zkorl22mqyFu6yzlXDRfFpxcxaJQwE0aMNrp8z5+kXWg3l3Gb3AnIYilKK4MZ8jO2u2hogSZp
 Etgosp4ZhOnhnZkcVd07MLTeI/osGIFsFpVxKw7eItorZv0qBcK8d59Tx26nQeC3C9EMCzbaV
 p6RhrZzmlp3DauDw70ytxAfvqGBBLej4lMUzcv3SgtdR9i+w4SaXrLN91S80Oe8hfmuMFHeLt
 sVX+nh/Xcsgw5F6V9ftOhXRbWSV5cbNO01HlJeElKym6or+aAX58PNNNGueeNpT5F03pxqKYB
 ofFKeMh70LJLpKmwCYz/YpD9GKFOnqr2L8O7LdBhZX5o7xJq7n+kUI5C1YhWvu6zSUS1On2A2
 HbyECHgSRT6tp13uzT2IerdypH62gxe9OSesFrBZvlCiBaRXUdLQlZK1KS6TwYzha5FQd5YmO
 eBcxXDupkjrt2nAljP1Y8VWoX0lQ9sIkDt0X8EvpD/I+o5z3VnE8Pp6vz8ckb33rjhXWnJVSi
 N8YanloNJQUh63aBfraI1p0ez3HrQZdc3t7JxmGfl4EWa+G+zH8B22hcPcOBGgspH01h4cMOG
 3zDlTA/gy//sCrwpy1v8ZZCqKdkkNIXLRgFffGtPJ7Hchs9tndaeutsFTHF+pjEsUUR3Vtkue
 mhf3X2raC2QYH6jxN65eJwx3EbvLples/sFU1eDfIPzJHzxDFYyCyrYQt1EtsNcKi4ih3QLy6
 2T3jZsKFr3ScsPrK7mmS7OBZdkM3umcmdpCKgS8ixtYJ1qiulikRfGMgKpHnagamv0MpvkhmA
 Jtu77K8VNXGHQdQCqLRkcUt9blevLvvq2VZXMHY4oD2lwfonRIKpH
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

I have a regression with kernel 5.2-rc4 on ath79 (atheros ar9331).
I would like to know, if it is some thing known, before i'll start investi=
gating it.


[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 1625=
6
                                                                          =
                      [0/1518]
[    0.000000] Kernel command line:   ip=3Ddhcp root=3D/dev/nfs
nfsroot=3D192.168.23.4:/home/ore/nfsroot/dpt-module,v3,tcp

[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 byte=
s)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes=
)
[    0.000000] Writing ErrCtl register=3D00000000
[    0.000000] Readback ErrCtl register=3D00000000
[    0.000000] Memory: 56376K/65536K available (5376K kernel code, 437K rw=
data, 1068K rodata, 1432K
init, 214K bss, 9160K reserved, 0K cma-reserved)
[    0.000000] random: get_random_u32 called from cache_random_seq_create+=
0x9c/0x170 with crng_init=3D0
[    0.000000] SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1, =
Nodes=3D1
[    0.000000] ftrace: allocating 18167 entries in 36 pages
[    0.000000] CPU 0 Unable to handle kernel paging request at virtual add=
ress 00000000, epc =3D=3D
00000000, ra =3D=3D 00000000

[    0.000000] Oops[#1]:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.2.0-rc4+ #308
[    0.000000] $ 0   : 00000000 8007e5fc 00000003 00000002
[    0.000000] $ 4   : 00000001 00000000 00000000 83c22470
[    0.000000] $ 8   : 00000000 00000000 00000000 00000000
[    0.000000] $12   : 806afe04 00000000 00000001 00000000
[    0.000000] $16   : 800adc0c 800adc00 00000000 00000000
[    0.000000] $20   : 00000000 0000048e 00000000 806c0000
[    0.000000] $24   : 00000003 800619e4
[    0.000000] $28   : 806ae000 806afe10 808b0000 00000000
[    0.000000] Hi    : 00000000
[    0.000000] Lo    : 00000000
[    0.000000] epc   : 00000000 0x0
[    0.000000] ra    : 00000000 0x0
[    0.000000] Status: 10000002 KERNEL EXL
[    0.000000] Cause : 10800008 (ExcCode 02)
[    0.000000] BadVA : 00000000
[    0.000000] PrId  : 00019374 (MIPS 24Kc)
[    0.000000] Modules linked in:
[    0.000000] Process swapper (pid: 0, threadinfo=3D(ptrval), task=3D(ptr=
val), tls=3D00000000)
[    0.000000] Stack : 00000002 8007e784 806ca284 00000000 800adc0c 000000=
00 80070eb0 8007108c
[    0.000000]         83c03c00 801ab7d8 83c03b80 00000000 00000000 83c03b=
80 00000000 801109cc
[    0.000000]         00000001 80880000 80880000 800c1318 00000000 ffffff=
ff 806b0000 806b0000
[    0.000000]         83c22470 0000048e 8075eb00 807706dc 806b0000 807531=
58 806b0000 80755209
[    0.000000]         00000001 80880000 80880000 80726cc8 ffffffff 000046=
f7 00000024 00000003
[    0.000000]         ...
[    0.000000] Call Trace:
[    0.000000]
[    0.000000] [<8007e784>] r4k_flush_icache_range+0x10/0x18
[    0.000000] [<800adc0c>] preempt_count_sub+0x10/0xe4
[    0.000000] [<80070eb0>] ftrace_caller+0x0/0x54
[    0.000000] [<8007108c>] ftrace_make_nop+0x8c/0x94
[    0.000000] [<801ab7d8>] __get_free_pages+0x2c/0x60
[    0.000000] [<801109cc>] ftrace_process_locs+0x364/0x3ec
[    0.000000] [<800c1318>] vprintk_default+0x34/0x40
[    0.000000] [<80726cc8>] ftrace_init+0xb8/0x138
[    0.000000] [<8071ac98>] start_kernel+0x290/0x584
[    0.000000] [<8071a368>] unknown_bootoption+0x0/0x270
[    0.000000]
[    0.000000] Code: (Bad address in epc)
[    0.000000]
[    0.000000] ---[ end trace 64e6fa591c4a277c ]---
[    0.000000] Kernel panic - not syncing: Fatal exception
[    0.000000] Rebooting in

=2D-
Regards,
Oleksij
