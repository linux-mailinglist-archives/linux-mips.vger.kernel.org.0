Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29C7D13892F
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 02:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgAMBRM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 20:17:12 -0500
Received: from forward100j.mail.yandex.net ([5.45.198.240]:50719 "EHLO
        forward100j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730153AbgAMBRM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 20:17:12 -0500
Received: from mxback12g.mail.yandex.net (mxback12g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:91])
        by forward100j.mail.yandex.net (Yandex) with ESMTP id 7210450E0043;
        Mon, 13 Jan 2020 04:17:09 +0300 (MSK)
Received: from iva7-d5f903270d57.qloud-c.yandex.net (iva7-d5f903270d57.qloud-c.yandex.net [2a02:6b8:c0c:6e00:0:640:d5f9:327])
        by mxback12g.mail.yandex.net (mxback/Yandex) with ESMTP id e0Ubfx2vzA-H8R86rj1;
        Mon, 13 Jan 2020 04:17:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578878229;
        bh=FymXjjtfEHLJcK/GF3SPtAioYcCKCi7vE6wuMR/8xXE=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=dSCaVUOZ4hKqmvY54U3qQoNT346Ofuk8k2IvD5ogDDmZzC4hU5N9pBu/9OxIL7jMD
         m+1VTRba1/ANyerGmPNhCZrHYcvyxYzJSD5VO2cOWW1wqn5ZuI8eFDdAxgN3Ke8Iyz
         ywSueOgJIqMczvNXcY/RrKrPnfD9jnFcrpppVbBM=
Authentication-Results: mxback12g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by iva7-d5f903270d57.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id vgrPI8P7gp-H7WObKZ5;
        Mon, 13 Jan 2020 04:17:07 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Mon, 13 Jan 2020 09:17:01 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAP5Nno4d4r+yaARLGYd==5wznOMXf1Ufc2P-DjsVc-FavxLvUw@mail.gmail.com>
References: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com> <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com> <20200109212404.GA1750666@aurel32.net> <CAP5Nno4d4r+yaARLGYd==5wznOMXf1Ufc2P-DjsVc-FavxLvUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: debian bootup hangs on qemu-system-mips64el
To:     Jun Sun <jsun@junsun.net>, qemu-discuss@nongnu.org,
        debian-mips@lists.debian.org, linux-mips@vger.kernel.org
CC:     lixing <13699171092@139.com>, Aurelien Jarno <aurelien@aurel32.net>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <783FE963-FE06-40FA-8F8B-980B912A9602@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B41=E6=9C=8813=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=883=
:34:18, Jun Sun <jsun@junsun=2Enet> =E5=86=99=E5=88=B0:
>Are you sure QEMU/MIPS does not support SMP?  Below link written in
>2016 clearly shows something was working then=2E
>
>https://www=2Emips=2Ecom/blog/how-to-run-smp-linux-in-qemu-on-a-mips64-re=
lease-6-cpu/
>
>Also, as Lixing mentioned in our private exchange, there is SMP
>support for loongson=2E  Lixing, I assume loongson SMP support is
>already merged in QEMU repo, right?  Can you point out the relevant
>source code directories?
Hi Jun,

As far as I known, Loongson is using there own SMP IPI implementation inst=
ead of MIPS MT One=2E
There QEMU implementation could be found here [1]=2E
QEMU have implemented MIPS MT ASE for SMP=2E

Thanks
>
>Would love to get more pointers here!  Thanks!
>
>Jun
>
>On Thu, Jan 9, 2020 at 1:24 PM Aurelien Jarno <aurelien@aurel32=2Enet>
>wrote:
>>
>> On 2020-01-04 20:46, Jun Sun wrote:
>> > On Wed, Jan 1, 2020 at 6:50 PM Jun Sun <jsun@junsun=2Enet> wrote:
>> > >
>> > > Hi, all,
>> > >
>> > > Debian/mips64el runs well on qemu-system-mips64el until I turned
>on smp option with a number of 2 or higher=2E  See the error message
>below=2E  It usually hangs pretty early on=2E
>> > >
>>
>> QEMU/mips doesn't really support SMP=2E The -smp option used to be for
>> SMT, but I am not even sure it really worked=2E
>>
>> All that said, it's still a bug in QEMU to accept this option=2E
>>
>> --
>> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
>> aurelien@aurel32=2Enet                 http://www=2Eaurel32=2Enet

[1]: https://gitee=2Ecom/loongsonlab/qemu

--=20
Jiaxun Yang
