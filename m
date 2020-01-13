Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C911389B8
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 04:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733103AbgAMD3j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 22:29:39 -0500
Received: from forward103j.mail.yandex.net ([5.45.198.246]:43328 "EHLO
        forward103j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733091AbgAMD3j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 22:29:39 -0500
Received: from mxback29g.mail.yandex.net (mxback29g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:329])
        by forward103j.mail.yandex.net (Yandex) with ESMTP id C97BC674102D;
        Mon, 13 Jan 2020 06:29:35 +0300 (MSK)
Received: from myt6-016ca1315a73.qloud-c.yandex.net (myt6-016ca1315a73.qloud-c.yandex.net [2a02:6b8:c12:4e0e:0:640:16c:a131])
        by mxback29g.mail.yandex.net (mxback/Yandex) with ESMTP id hpkNKU8PuF-TYOOR1Sc;
        Mon, 13 Jan 2020 06:29:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578886175;
        bh=VOgMDGdvTzv5y4W/TbHrKqKQQ6yp8jZMoFl2RcSABik=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=ogakWJEJZR8Jt2QzfMJKuKLr6Pif+C6CW/6nBlP32UKQCFl96FVTZQSEnuCAm3muc
         gODFB/lClBD4H5BUT+XzUVT8yZmg0Sk8LHC9D3SvyT8YseGUWXRhKMb54W6264/leE
         /0RoASXtCN6hTA4ArPSlwMt/1SEMGZd/zIem1JpU=
Authentication-Results: mxback29g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt6-016ca1315a73.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id yxSOjOv5nm-TXVigarp;
        Mon, 13 Jan 2020 06:29:33 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Mon, 13 Jan 2020 11:29:28 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAP5Nno5aBir+DSFTrcGfenuo1s+UTGr5LKU6YDNYREjwahnXKA@mail.gmail.com>
References: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com> <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com> <20200109212404.GA1750666@aurel32.net> <CAP5Nno4d4r+yaARLGYd==5wznOMXf1Ufc2P-DjsVc-FavxLvUw@mail.gmail.com> <783FE963-FE06-40FA-8F8B-980B912A9602@flygoat.com> <CAP5Nno5aBir+DSFTrcGfenuo1s+UTGr5LKU6YDNYREjwahnXKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: debian bootup hangs on qemu-system-mips64el
To:     Jun Sun <jsun@junsun.net>
CC:     qemu-discuss@nongnu.org, debian-mips@lists.debian.org,
        linux-mips@vger.kernel.org, lixing <13699171092@139.com>,
        Aurelien Jarno <aurelien@aurel32.net>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <6D105399-ECD4-49C1-B789-2334BB2B65AE@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B41=E6=9C=8813=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
0:35:18, Jun Sun <jsun@junsun=2Enet> =E5=86=99=E5=88=B0:
>Thanks, Jiaxun=2E  See more questions below=2E
>
>Jun
>
>On Sun, Jan 12, 2020 at 5:17 PM Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>wrote:
>>
>>
>>
>> =E4=BA=8E 2020=E5=B9=B41=E6=9C=8813=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=883:34:18, Jun Sun <jsun@junsun=2Enet> =E5=86=99=E5=88=B0:
>> >Are you sure QEMU/MIPS does not support SMP?  Below link written in
>> >2016 clearly shows something was working then=2E
>> >
>>
>>https://www=2Emips=2Ecom/blog/how-to-run-smp-linux-in-qemu-on-a-mips64-r=
elease-6-cpu/
>> >
>> >Also, as Lixing mentioned in our private exchange, there is SMP
>> >support for loongson=2E  Lixing, I assume loongson SMP support is
>> >already merged in QEMU repo, right?  Can you point out the relevant
>> >source code directories?
>> Hi Jun,
>>
>> As far as I known, Loongson is using there own SMP IPI implementation
>instead of MIPS MT One=2E
>> There QEMU implementation could be found here [1]=2E
>> QEMU have implemented MIPS MT ASE for SMP=2E
>>
>
>Do you know how to enable and run MIPS MT ASE in qemu?  For with CPU
>options?

I tried maxcpus=3D2 cpu=3D34kf for malta long ago and it was working=2E
But I'm not sure whether it still works now=2E


--=20
Jiaxun Yang
