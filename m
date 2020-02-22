Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F41C1169113
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 18:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgBVRzZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 12:55:25 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17952 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726310AbgBVRzZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 22 Feb 2020 12:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582394088;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=YFad9zuR8StHw8egh96QPLS0XGUOUsUoNOQH4WGQF8Q=;
        b=HCxX1orIKgWPevpzyibr7jFT19ZptsX5dAzW649+vSBptMTLSi9aUtOYlrJhnVte
        zU+/eQUWw0NpCo4dqd351RzlsGcX7wLjOBoTOMFe9Mcd2eLoyJ4o08qUsbp6zPigNMZ
        AbPYKiZwonntsQlmbPUKk1J3UkGlwRCbJDwEnB8k=
Received: from Galaxy-Note9.202.net.flygoat.com (183.156.46.156 [183.156.46.156]) by mx.zoho.com.cn
        with SMTPS id 1582394085608759.8716354985457; Sun, 23 Feb 2020 01:54:45 +0800 (CST)
Date:   Sun, 23 Feb 2020 01:54:43 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1582387719.3.1@crapouillou.net>
References: <20200219191730.1277800-1-paulburton@kernel.org> <20200219191730.1277800-3-paulburton@kernel.org> <1582387719.3.1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <5CF20000-7E47-49B3-8B35-E13753AABBBD@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B42=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
2:08:39, Paul Cercueil <paul@crapouillou=2Enet> =E5=86=99=E5=88=B0:
>Hi,
>
>So I think Thomas is the best candidate to be maintainer, since he has=20
>both experience and free time ;)

So do I!

>
>I'm sort-of the maintainer for the Ingenic platform and drivers, if=20
>Jiaxun wants to do the same for Loongson hardware, that would make=20
>Thomas' job easier=2E Having three co-maintainers with equal rights would
>
>be a total mess=2E

Sure=2E I'm still going to take care Loongson code=2E
Probably we can help with reviewing MIPS common code too=2E

Thanks

>
>-Paul
>
>
>Le mer=2E, f=C3=A9vr=2E 19, 2020 at 11:17, Paul Burton <paulburton@kernel=
=2Eorg>=20
>a =C3=A9crit :
>> My time with MIPS the company has reached its end, and so at best
>I'll
>> have little time spend on maintaining arch/mips/=2E Reflect that in
>> MAINTAINERS by changing status to Odd Fixes=2E Hopefully this might
>spur
>> the involvement of someone with more time, but even if not it should
>> help serve to avoid unrealistic expectations=2E
>>=20
>> Signed-off-by: Paul Burton <paulburton@kernel=2Eorg>
>> ---
>>  MAINTAINERS | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index afa228ade18e=2E=2E67f05f6dbf77 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11120,7 +11120,7 @@ W:	http://www=2Elinux-mips=2Eorg/
>>  T:	git git://git=2Elinux-mips=2Eorg/pub/scm/ralf/linux=2Egit
>>  T:	git git://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/mips/linux=2E=
git
>>  Q:	http://patchwork=2Elinux-mips=2Eorg/project/linux-mips/list/
>> -S:	Supported
>> +S:	Odd Fixes
>>  F:	Documentation/devicetree/bindings/mips/
>>  F:	Documentation/mips/
>>  F:	arch/mips/

--=20
Jiaxun Yang
