Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27EFE107D44
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 07:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfKWGLv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Nov 2019 01:11:51 -0500
Received: from forward103o.mail.yandex.net ([37.140.190.177]:36964 "EHLO
        forward103o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725800AbfKWGLv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Nov 2019 01:11:51 -0500
Received: from mxback22g.mail.yandex.net (mxback22g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:322])
        by forward103o.mail.yandex.net (Yandex) with ESMTP id 07E3B5F80CB3;
        Sat, 23 Nov 2019 09:11:47 +0300 (MSK)
Received: from sas1-8413c76d2429.qloud-c.yandex.net (sas1-8413c76d2429.qloud-c.yandex.net [2a02:6b8:c08:2206:0:640:8413:c76d])
        by mxback22g.mail.yandex.net (mxback/Yandex) with ESMTP id GXRpki0ZYh-Bkh01pa3;
        Sat, 23 Nov 2019 09:11:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1574489506;
        bh=8H4akx4Ymj74OsTfX4s060voJAow7/ASdcIk608TvkA=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=TUvFt+7xzTExGDlG8L8sqDhyzE2Mg5aaivokwUUWfTMTloWyojYfaLKHf9aHZBQ1v
         MYGjgVzskBR8Pyo8BN7wpzE60B4W9vVMdhpbW3ZQhCYe39gPb+8wgvTSH9rDW6lOxE
         V5Iw8lVLJZdMRMIJ5Ieik/DrGrrCzdfsx6P94y2I=
Authentication-Results: mxback22g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas1-8413c76d2429.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id WHMbUqZSVo-BiVSh3mI;
        Sat, 23 Nov 2019 09:11:44 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Sat, 23 Nov 2019 14:11:32 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <EAC4F77C-88BE-47FA-83A5-5855A869425A@flygoat.com>
References: <1574335820-15188-1-git-send-email-chenhc@lemote.com> <20191122184731.l7ttfg4evgi4tvcp@lantea.localdomain> <EAC4F77C-88BE-47FA-83A5-5855A869425A@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: Make sure ebase address is in KSEG0
To:     Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>
CC:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <3C1D695B-09AA-4C2D-A94F-84DFC05C6F0C@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B411=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
1:08:38, Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom> =E5=86=99=E5=88=B0:
>
>
>=E4=BA=8E 2019=E5=B9=B411=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=882:47:31, Paul Burton <paulburton@kernel=2Eorg>
>=E5=86=99=E5=88=B0:
>>Hi Huacai,
>>
>>On Thu, Nov 21, 2019 at 07:30:20PM +0800, Huacai Chen wrote:
>>> Dynamically allocated ebase address above 0x20000000 can be
>triggered
>>> by some special physical memory layout, or just by a "big kernel +
>>big
>>> initrd + big swiotlb" configuration=2E
>>>=20
>>> For MIPS32, ebase address above 0x20000000 is unusable, for MIPS64
>it
>>> is usable but this case is warned=2E However, this warning is useless
>>> because it is unfixable in a specific system configuration=2E So we
>>just
>>> use CKSEG0 as a fallback=2E
>>
>>I'd prefer that we don't assume there's memory at physical address
>zero
>>- that property doesn't hold for all systems=2E
>>
>>How about the change I suggested previously over here:
>>
>>https://lore=2Ekernel=2Eorg/linux-mips/20191108191149=2Ebbq3h4xp4famsh2n=
@lantea=2Elocaldomain/
>>
>>Would that work for you?
>
>Hi Paul
>
>Our problem is, sometimes the ebase from firmware is totally a random
>address,=20
>even not inside the memory region=2E I'd prefer ignore address if it's
>not valid since the warning here can't deal with it=2E

I'm sorry=2E I was wrong=2E Please ignore the noise=2E

Thanks

>
>Thanks=2E
>>
>>Thanks,
>>    Paul
>>

--=20
Jiaxun Yang
