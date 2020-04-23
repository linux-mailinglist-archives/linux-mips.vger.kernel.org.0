Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F011B5456
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 07:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgDWFoR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 01:44:17 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17876 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725854AbgDWFoQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Apr 2020 01:44:16 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1587620578; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=WEXPfoDkTWR/J9oQ9Jcu7q/a/EFKCDDKjQO2CAHp2ijGoscDdlo4HyceiMs/n8zMB8/PyX3CFPQhD0dhwlAMta1YuthFxuys8tCAVPSxLiThRHeZrNgUdQrqb0fjrHP/m6RSUyLwuSo60uQLNKaqMejC5AOOMEInULT2bvzITAo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1587620578; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=p0Hue82OArHegP34/EQC99f2PxSUyGy0fvP1kcei0ek=; 
        b=Lqh3ZFfPQNHk+KReY/uCf6LxTjL1w/abhWPo7X+YAx4gZ7d7GdyYgBPPQrbjRE5oopJe0PaHPWFllMrx7utrTHEYfaiBmh+TJLsnABmCJjEa/RgNrR+RndKhHs6JjmC/rp+MpgqE32A0BXqWdhuRz869SpvjWMX9xw24/E19FrM=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1587620578;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=p0Hue82OArHegP34/EQC99f2PxSUyGy0fvP1kcei0ek=;
        b=O7+gDV4+us94bD1eMWGrcE2y8xlgPk4WYi+XXKNEK4r6a30aHvXJ5TsQzXVS1ez9
        GGg94lSbvV4EKhj+hPewIDkylwxf2o8dCXaiUZuVUXmXWj/KqIV6nf8vMZy2a3519N5
        AD3tg2QdF4MfiUOeo4+mz7/YfJMjQD0Y4U9bJo18=
Received: from [127.0.0.1] (122.235.213.3 [122.235.213.3]) by mx.zoho.com.cn
        with SMTPS id 1587620575832526.5212172311194; Thu, 23 Apr 2020 13:42:55 +0800 (CST)
Date:   Thu, 23 Apr 2020 13:42:52 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
CC:     linux-mips@vger.kernel.org, clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jouni Hogander <jouni.hogander@unikie.com>,
        Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] MIPS: Truncate link address into 32bit for 32bit kernel
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <alpine.LFD.2.21.2004230036480.851719@eddie.linux-mips.org>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com> <20200422143258.1250960-1-jiaxun.yang@flygoat.com> <alpine.LFD.2.21.2004230036480.851719@eddie.linux-mips.org>
Message-ID: <B307BFAC-9973-4444-B69A-40B054210E84@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=888=
:10:12, "Maciej W=2E Rozycki" <macro@linux-mips=2Eorg> =E5=86=99=E5=88=B0:
>On Wed, 22 Apr 2020, Jiaxun Yang wrote:
>
>> Reviewed-by: Maciej W=2E Rozycki <macro@linux-mips=2Eorg>
>
> Hmm, that was for an earlier version of the patch, and reviews obviously=
=20
>do not automatically carry over to subsequent versions, as it cannot be=
=20
>claimed that they are as good in the reviewer's eyes as the actual versio=
n=20
>reviewed was=2E
>
>> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
>> index e1c44aed8156=2E=2E68c0f22fefc0 100644
>> --- a/arch/mips/Makefile
>> +++ b/arch/mips/Makefile
>> @@ -288,12 +288,23 @@ ifdef CONFIG_64BIT
>>    endif
>>  endif
>> =20
>> +# When linking a 32-bit executable the LLVM linker cannot cope with a
>> +# 32-bit load address that has been sign-extended to 64 bits=2E  Simpl=
y
>> +# remove the upper 32 bits then, as it is safe to do so with other
>> +# linkers=2E
>> +ifdef CONFIG_64BIT
>> +	load-ld			=3D $(load-y)
>> +else
>> +	load-ld			=3D $(subst 0xffffffff,0x,$(load-y))
>> +endif
>> +
>>  KBUILD_AFLAGS	+=3D $(cflags-y)
>>  KBUILD_CFLAGS	+=3D $(cflags-y)
>> -KBUILD_CPPFLAGS +=3D -DVMLINUX_LOAD_ADDRESS=3D$(load-y)
>> +KBUILD_CPPFLAGS +=3D -DVMLINUX_LOAD_ADDRESS=3D$(load-y) -DVMLINUX_LINK=
_ADDRESS=3D$(load-ld)
>>  KBUILD_CPPFLAGS +=3D -DDATAOFFSET=3D$(if $(dataoffset-y),$(dataoffset-=
y),0)
>> =20
>>  bootvars-y	=3D VMLINUX_LOAD_ADDRESS=3D$(load-y) \
>> +		  VMLINUX_LINK_ADDRESS=3D$(load-ld) \
>>  		  VMLINUX_ENTRY_ADDRESS=3D$(entry-y) \
>>  		  PLATFORM=3D"$(platform-y)" \
>>  		  ITS_INPUTS=3D"$(its-y)"
>
> Hmm, to be honest I find the nomenclature confusing: VMLINUX_LOAD_ADDRES=
S=20
>and VMLINUX_LINK_ADDRESS sound like synonyms to me and also look very=20
>similar, so I expect people will be confused and scratch their heads in=
=20
>the future=2E  Due to the obscurity of the problem I think there is littl=
e=20
>room for manoeuvre here really, but how about using LINKER_LOAD_ADDRESS=
=20
>for the new variable?
>
> Alternatively, have you made any attempt to verify if actually replacing=
=20
>the setting for VMLINUX_LOAD_ADDRESS would be safe?  Glancing over its us=
e=20
>there do not appear to be many places=2E

Limited experiments showed it should be fine=2E=2E=2E

But MIPS kernel has some design I'm not really familiar with like SYM32 fo=
r
64-bit kernel and special address space design for Trap-and-emul KVM=2E

I'm not 100 sure it's safe so I didn't do so=2E

>
>  Maciej

--=20
Jiaxun Yang
