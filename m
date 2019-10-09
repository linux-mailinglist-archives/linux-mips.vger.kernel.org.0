Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57572D050E
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 03:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729860AbfJIBLN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Oct 2019 21:11:13 -0400
Received: from forward101o.mail.yandex.net ([37.140.190.181]:36965 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729601AbfJIBLN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Oct 2019 21:11:13 -0400
Received: from mxback2o.mail.yandex.net (mxback2o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::1c])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id 418453C0274D;
        Wed,  9 Oct 2019 04:11:09 +0300 (MSK)
Received: from myt3-372f9bf9bd7d.qloud-c.yandex.net (myt3-372f9bf9bd7d.qloud-c.yandex.net [2a02:6b8:c12:70e:0:640:372f:9bf9])
        by mxback2o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id GOJ9p1Ukyj-B82SBH1C;
        Wed, 09 Oct 2019 04:11:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1570583469;
        bh=ZxU90MEbwzd2N7tO9n9t79Pw777n3v1kkBdh8q3G+5s=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=fixhHmuYKLk59PbO0fYNF5+hLPa7mUwTyUiTg4Imxh2TQ8oSp5zcAFColauhy61TV
         pH3BkvAlubgQ2qW8KKv6V3WCVlkGF7TZ8XA/8/+Nw/77hFixjqvazaDlM1PBknx3JI
         rPo5uweyjFfT/rBJMamnNwrMzst9rvuxhhK9J7hU=
Authentication-Results: mxback2o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt3-372f9bf9bd7d.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id nKpj1jBLCZ-B6rOIo01;
        Wed, 09 Oct 2019 04:11:07 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Wed, 09 Oct 2019 09:10:57 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20191008180025.dtp2ingi6xgc5udu@pburton-laptop>
References: <1569073828-13019-1-git-send-email-chenhc@lemote.com> <MWHPR2201MB1277326D98BD1BFE0A5263BDC19B0@MWHPR2201MB1277.namprd22.prod.outlook.com> <CAAhV-H5Lt8N5PQLXO7-VQbOkrWD3eRZC2sOKPcBb3LmK9GN-BQ@mail.gmail.com> <20191008180025.dtp2ingi6xgc5udu@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 1/3] MIPS: Loongson: Add CFUCFG&CSR support
To:     Paul Burton <paul.burton@mips.com>, Huacai Chen <chenhc@lemote.com>
CC:     Paul Burton <pburton@wavecomp.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <47416C00-69B1-4F85-902F-A770F25DD4C8@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B410=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=882=
:00:26, Paul Burton <paul=2Eburton@mips=2Ecom> =E5=86=99=E5=88=B0:
>Hi Huacai,
>
>[Quote munged to fix top posting]
>
>On Tue, Oct 08, 2019 at 03:09:27PM +0800, Huacai Chen wrote:
>> Hi, Paul,
>>=20
>> On Tue, Oct 8, 2019 at 1:51 AM Paul Burton <paul=2Eburton@mips=2Ecom>
>wrote:
>> >
>> > Hello,
>> >
>> > Huacai Chen wrote:
>> > > Loongson-3A R4+ (Loongson-3A4000 and newer) has CPUCFG (CPU
>config) and
>> > > CSR (Control and Status Register) extensions=2E This patch add
>read/write
>> > > functionalities for them=2E
>> >
>> > Series applied to mips-next=2E
>> >
>> > > MIPS: Loongson: Add CFUCFG&CSR support
>> > >   commit 6a6f9b7dafd5
>> > >   https://git=2Ekernel=2Eorg/mips/c/6a6f9b7dafd5
>> > >
>> > >   Signed-off-by: Huacai Chen <chenhc@lemote=2Ecom>
>> > >   Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> > >   Signed-off-by: Paul Burton <paul=2Eburton@mips=2Ecom>
>> > >
>> > > MIPS: Loongson: Add Loongson-3A R4 basic support
>> > >   commit 7507445b1993
>> > >   https://git=2Ekernel=2Eorg/mips/c/7507445b1993
>> > >
>> > >   Signed-off-by: Huacai Chen <chenhc@lemote=2Ecom>
>> > >   Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> > >   Signed-off-by: Paul Burton <paul=2Eburton@mips=2Ecom>
>> > >
>> > > MIPS: Loongson-3: Add CSR IPI support
>> > >   commit ffe59ee36aaa
>> > >   https://git=2Ekernel=2Eorg/mips/c/ffe59ee36aaa
>> > >
>> > >   Signed-off-by: Huacai Chen <chenhc@lemote=2Ecom>
>> > >   Signed-off-by: Paul Burton <paul=2Eburton@mips=2Ecom>
>> >
>> > Thanks,
>> >     Paul
>> >
>> > [ This message was auto-generated; if you believe anything is
>incorrect
>> >   then please email paul=2Eburton@mips=2Ecom to report it=2E ]
>>=20
>> I found that there is a typo in the title, please change CFUCFG to
>> CPUCFG, thanks=2E
>>
>> Huacai
>
>It's too late for that - the email you replied to was telling you that
>the patches have already been applied to mips-next, and I'm not going
>to
>rewrite the mips-next branch for something so minor=2E
Hi Paul,

I think it is worthy to fix this by rewriting mips-next tree=2E As it have=
n't PR to upward next tree and this typo may lead to confusion in future wh=
en reviewing git log=2E
>
>Thanks,
>    Paul

--=20
Jiaxun Yang
