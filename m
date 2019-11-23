Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB0D107CE7
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 06:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbfKWFJA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Nov 2019 00:09:00 -0500
Received: from forward104o.mail.yandex.net ([37.140.190.179]:58336 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbfKWFJA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Nov 2019 00:09:00 -0500
Received: from mxback5j.mail.yandex.net (mxback5j.mail.yandex.net [IPv6:2a02:6b8:0:1619::10e])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id 9C418940E5E;
        Sat, 23 Nov 2019 08:08:55 +0300 (MSK)
Received: from sas1-7b5908b5b69e.qloud-c.yandex.net (sas1-7b5908b5b69e.qloud-c.yandex.net [2a02:6b8:c14:3a0e:0:640:7b59:8b5])
        by mxback5j.mail.yandex.net (mxback/Yandex) with ESMTP id hFn2yTSaGX-8sOumeZE;
        Sat, 23 Nov 2019 08:08:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1574485735;
        bh=0jSCa/fJ2urWEpyscOR2qwlq3wkffGxD3I79QoQSKpQ=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=bDWOtwEbXb0MWm9yvnJBlu/p5qTqHkio13pIfq3Vi0n4zqTbHcOIlJ+DA5gUVwgxA
         SAkI3feJXOOtLPUaohaxQQA9SJWeIVyy2sNBC8nnP2RlXRCqWnlXsmUGq34DCOPS3Q
         Z73nAFaZLt7WN5K3x8Et8W+PSZCD2D4XpIaU+Oj0=
Authentication-Results: mxback5j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas1-7b5908b5b69e.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id dQSzukILUB-8qSSIdsl;
        Sat, 23 Nov 2019 08:08:53 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Sat, 23 Nov 2019 13:08:38 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20191122184731.l7ttfg4evgi4tvcp@lantea.localdomain>
References: <1574335820-15188-1-git-send-email-chenhc@lemote.com> <20191122184731.l7ttfg4evgi4tvcp@lantea.localdomain>
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
Message-ID: <EAC4F77C-88BE-47FA-83A5-5855A869425A@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B411=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
2:47:31, Paul Burton <paulburton@kernel=2Eorg> =E5=86=99=E5=88=B0:
>Hi Huacai,
>
>On Thu, Nov 21, 2019 at 07:30:20PM +0800, Huacai Chen wrote:
>> Dynamically allocated ebase address above 0x20000000 can be triggered
>> by some special physical memory layout, or just by a "big kernel +
>big
>> initrd + big swiotlb" configuration=2E
>>=20
>> For MIPS32, ebase address above 0x20000000 is unusable, for MIPS64 it
>> is usable but this case is warned=2E However, this warning is useless
>> because it is unfixable in a specific system configuration=2E So we
>just
>> use CKSEG0 as a fallback=2E
>
>I'd prefer that we don't assume there's memory at physical address zero
>- that property doesn't hold for all systems=2E
>
>How about the change I suggested previously over here:
>
>https://lore=2Ekernel=2Eorg/linux-mips/20191108191149=2Ebbq3h4xp4famsh2n@=
lantea=2Elocaldomain/
>
>Would that work for you?

Hi Paul

Our problem is, sometimes the ebase from firmware is totally a random addr=
ess,=20
even not inside the memory region=2E I'd prefer ignore address if it's not=
 valid since the warning here can't deal with it=2E

Thanks=2E
>
>Thanks,
>    Paul
>
--=20
Jiaxun Yang
