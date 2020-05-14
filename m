Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8AA1D33BB
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 16:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgENO5l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 10:57:41 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17487 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726190AbgENO5k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 10:57:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589468209; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=gftQjbdQojut+cX7D/FPBmu3yrOl9r9WlZPQk2vOvrspkOgjMbXF9/PVcq7IpefhrxEKYC26x6pd8dyjeMDKR1GLv9lO5HWolCvwWLqJRQokeB3EzKi5lQomgEr9gXS8Z/EfwvtPEeLQKipbPKBgPpNL0xrjW3HJdB0q43vugNk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1589468209; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=i1t4P3K5ife9rV/3ypaH1jmnZh6OgsHEjYzX/h6irIM=; 
        b=P62hsvqK2cNOclj1YFS1xRls73V0QBCyVGZ49HRx9sUbnVHl5mDb7Hda8TPV54Ua9U2WRbxJXg537cvkPuLpdIXhAR9FqMXUWDvr4WhBukvnBMEAOYHZahiNmKstQ4OWv+F6/BE6RAhAWpe00hq8BHmHpDgV26etJEWmwBhC+PY=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589468208;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=i1t4P3K5ife9rV/3ypaH1jmnZh6OgsHEjYzX/h6irIM=;
        b=PvT+ctOKdkbg5YWiu1U22emoHK1rbw+QDPeVFjs3YAu0u4o4qu0t/GdNER4WAQrK
        +WMLtq3oVu1x+xt1q55n5jD5CX5adWLPCWhtSF0lGGO08EIKr36Hw45ScZf6EMA/iCa
        jcWzJsrNYFN1mA5xygtibUxY2knBPcBUlLcRfXag=
Received: from [127.0.0.1] (114.85.159.159 [114.85.159.159]) by mx.zoho.com.cn
        with SMTPS id 1589468205035404.44405853513547; Thu, 14 May 2020 22:56:45 +0800 (CST)
Date:   Thu, 14 May 2020 22:56:41 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        john.garry@huawei.com
Subject: Re: [PATCH RESEND v3 2/3] MIPS: Introduce PCI_IO_VMMAP
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <20200514142149.GA14003@alpha.franken.de>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com> <20200508114438.3092215-1-jiaxun.yang@flygoat.com> <20200508114438.3092215-2-jiaxun.yang@flygoat.com> <20200508161102.GA23094@alpha.franken.de> <18B84249-7CA1-411E-B595-6E215D8C9C34@flygoat.com> <20200508165235.GA24425@alpha.franken.de> <928CB1C1-9852-4CEA-8B3E-E5EAB23E4A0B@flygoat.com> <20200514142149.GA14003@alpha.franken.de>
Message-ID: <8107C949-5CBE-48D3-837F-E0AFB9C58B77@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8814=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:21:49, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=
=88=B0:
>On Sat, May 09, 2020 at 01:09:07AM +0800, Jiaxun Yang wrote:
>>=20
>>=20
>> =E4=BA=8E 2020=E5=B9=B45=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=8812:52:35, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=
=E5=88=B0:
>> >On Sat, May 09, 2020 at 12:22:25AM +0800, Jiaxun Yang wrote:
>> >>=20
>> >>=20
>> >> =E4=BA=8E 2020=E5=B9=B45=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=
=8D=8812:11:02, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=
=99=E5=88=B0:
>> >> >On Fri, May 08, 2020 at 07:44:37PM +0800, Jiaxun Yang wrote:
>> >> >> Define PCI_IOBASE for MIPS at the strat of kernel mapping segment=
=2E
>> >> >> That would allow virt address of I/O ports to be dynamicly mapped=
=2E
>> >> >> So we'll be able to combine multiple MMIO ranges into I/O ports
>> >> >> and thus we can take advantage of logic_pio mechanism=2E
>> >> >
>> >> >What is the advantage ?
>> >> >
>> >> >From my point of view this will be slower because of TLB faults for
>> >> >PCI IO space accesses=2E
>> >>=20
>> >> Advantage is we can use logic_pio to manage multiple I/O Port ranges=
=2E
>> >
>> >and what exactly does this buy us ? I looked at lib/logic_pio=2Ec and
>> >there didn't appear anything in my mind other than yet another
>> >interface for doing the same thing=2E=2E=2E
>>=20
>> With Logic_PIO subsystem, each I/O region will be registered
>> in logic_pio and being mapped in TLB, that means I/O regions can l
>> be sparsely layouted in MMIO=2E
>
>this isn't an advantage=2E You will get TLB miss exceptions, which you
>don't get when using XPHYS addresses, which the current code does=2E
>IMHO it you make more sense to use normal iomap/iounmap functions
>in logic_pio=2Ec=2E With that you would get TLB less access for memory
>mapped PCI IO regions=2E
>
>> And device drivers are accessing in*/out* functions via ioport allocate=
d by
>> logic_pio instead of the physical I/O ports=2E
>
>your current patches don't select INDIRECT_PIO, so you are still
>using the MIPS access methods just via the mapping from logic_pio=2E This
>works as long as you are using already mapped ranges=2E This is at least
>inconsistent=2E

Not exactly=2E I'm emulating the behaviour of Aarch64's PCI ioport handlin=
g=2E

And the mapping will done by pci_remap_iospace when adding resources
to PCI bridge=2E
PCI subsystem will ensure all the ioports they used is mapped so there won=
't be any inconsistent=2E
Except some legacy driver need to be converted=2E

Yeah, I was confused by logic_pio at very start and holded the same opinio=
n
with you that it's totally misuse of MMIO ioports until John Garry
kindly explained [1] to me what it exactly did=2E

>
>If you really want to ignore the TLB miss problem, please drop
>patch 1 and 2 and use something like
>
>#define PCI_IOBASE	_AC(0xc000000000000000, UL)
>#define PCI_IOSIZE	SZ_16SM
>#define MAP_BASE	(PCI_IOBASE + PCI_IOSIZE)
>
>in arch/mips/include/asm/mach-loongson64/spaces=2Eh
>
>That should do the trick without moving stuff around and it will
>keep it out of the normal MIPS stuff=2E

I do believe that similar to Aarch64 world, device with multiple PCIe
host bridge and sparsely layouted MMIO IOport range will appear very soon=
=2E

So I'm creating a general method for MIPS=2E
If that's inappropriate for you
I'll make it as Loongson only=2E

Thanks=2E

>
>Thomas=2E
>
[1]: https://lkml=2Eorg/lkml/2020/2/20/1207
--=20
Jiaxun Yang
