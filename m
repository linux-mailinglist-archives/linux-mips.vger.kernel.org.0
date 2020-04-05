Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 388BD19ECC5
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 18:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbgDEQyH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Apr 2020 12:54:07 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17894 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726780AbgDEQyH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Apr 2020 12:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586105613;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=zHEN/jVViDwhN/xS47rLkq7lWrl+CjuvEXt5Z0Hb3w8=;
        b=SlSKdlzVn+A57bLZRDrxzpQE/KOoZZzDMxxLmcE4zDiO+TRF2EFjFaSPVJg4ZXDO
        rlRX+wk4JybOWYybG3bBg+nm7WG9zjlgtU4Dlr2k04D+Bsb64gR3PyQnhmSsGqditxi
        l02eMTvoqYYF1CDJ2LOUjE9GlXgRfSNsx37LBvd4=
Received: from [10.233.233.252] (115.193.87.168 [115.193.87.168]) by mx.zoho.com.cn
        with SMTPS id 1586105610504458.5867584432443; Mon, 6 Apr 2020 00:53:30 +0800 (CST)
Date:   Mon, 06 Apr 2020 00:53:26 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <alpine.LFD.2.21.2004051738000.4156324@eddie.linux-mips.org>
References: <20200405082451.694910-1-jiaxun.yang@flygoat.com> <alpine.LFD.2.21.2004051738000.4156324@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: malta: Set load address for 32bit kernel correctly
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
CC:     linux-mips@vger.kernel.org, Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <96C9B1A0-2F89-4650-B0A4-6A6242A2AA0A@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=886=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=8812=
:47:29, "Maciej W=2E Rozycki" <macro@linux-mips=2Eorg> =E5=86=99=E5=88=B0:
>On Sun, 5 Apr 2020, Jiaxun Yang wrote:
>
>> LLD failed to link vmlinux with 64bit load address for 32bit ELF
>> while bfd will strip 64bit address into 32bit silently=2E
>> To fix LLD build, we should supply a 32bit load address for 32bit
>> kernel=2E
>[=2E=2E=2E]
>> diff --git a/arch/mips/mti-malta/Platform
>b/arch/mips/mti-malta/Platform
>> index 2cc72c9b38e3=2E=2Ef9b49cba1764 100644
>> --- a/arch/mips/mti-malta/Platform
>> +++ b/arch/mips/mti-malta/Platform
>> @@ -6,6 +6,10 @@ cflags-$(CONFIG_MIPS_MALTA)	+=3D
>-I$(srctree)/arch/mips/include/asm/mach-malta
>>  ifdef CONFIG_KVM_GUEST
>>      load-$(CONFIG_MIPS_MALTA)	+=3D 0x0000000040100000
>>  else
>> +ifdef CONFIG_64BIT
>>      load-$(CONFIG_MIPS_MALTA)	+=3D 0xffffffff80100000
>> +else
>> +    load-$(CONFIG_MIPS_MALTA)	+=3D 0x80100000
>
> Given the description above I think it should be done uniformly and=20
>automatically across all platforms by trimming the address supplied
>with=20
>$(load-y) to low 8 digits in a single place, that is at the place where
>
>the variable is consumed=2E  This will reduce clutter across Makefile=20
>fragments, avoid inconsistencies and extra work to handle individual=20
>platforms as the problem is triggered over and over again, and limit
>the=20
>risk of mistakes=2E

I was intended to do like this but failed to find a proper way=2E

Makefile isn't designed for any kind of calculation=2E
And shell variables are 64-bit signed so it can't hold such a huge variabl=
e=2E

Just wish somebody can give me a way to do like:

ifndef CONFIG_64BIT
load-y =3D $(load-y) & 0xffffffff
endif

In makefiles=2E

Thanks=2E
>
>Some error checking might be doable for verifying that the 64-bit
>address=20
>truncated is a sign-extended 32-bit value, but that perhaps would be an
>
>overkill as certainly any 64-bit system that sets the load address to
>be=20
>outside the sign-extended 32-bit address range does not support a
>!64BIT=20
>configuration anyway=2E
>
>  Maciej

--=20
Jiaxun Yang
