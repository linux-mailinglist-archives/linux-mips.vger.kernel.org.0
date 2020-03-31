Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C40198B21
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 06:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgCaEVo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 00:21:44 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17983 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725809AbgCaEVo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 31 Mar 2020 00:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585628478;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=bT7rXjvoHMOFCMr3Su++NGNORylpvyEgwGAQykaU+Ik=;
        b=JOlysKBDeALyWOFC1VELta1YeAqqnBgp+RsP0MtIsFPuUuM8ceEyo8nab2pqdxlF
        R1m6pKQsBjYK6OkcQop57tM70dmysJ+5bgH/r8xlP/ONVmfm40eLRJvNDCMJrFfGYKU
        D3C+2ki3tU9HTf9uRAKJMcDvWvmYXExb8nuzUMBY=
Received: from [10.233.233.252] (183.156.33.130 [183.156.33.130]) by mx.zoho.com.cn
        with SMTPS id 1585628476562765.1152687312807; Tue, 31 Mar 2020 12:21:16 +0800 (CST)
Date:   Tue, 31 Mar 2020 12:21:10 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <8b7b3b19-d5e2-befb-e781-7be53d2cbd54@loongson.cn>
References: <1585557531-18849-1-git-send-email-maobibo@loongson.cn> <53CC90A0-3926-4642-91D4-F4F265F6AE90@flygoat.com> <778df899-4dc4-c2be-5b7b-79c16223b0fb@loongson.cn> <1712ea7ba9a.dad1f80a33831.4741900511750683483@flygoat.com> <8b7b3b19-d5e2-befb-e781-7be53d2cbd54@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 02/39] MIPS: loongson64: Add header files path prefix
To:     maobibo <maobibo@loongson.cn>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <3200DF9C-25CE-4563-B9EC-F81B375E4028@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8831=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
1:53:41, maobibo <maobibo@loongson=2Ecn> =E5=86=99=E5=88=B0:
>
>
>On 03/31/2020 11:34 AM, Jiaxun Yang wrote:
>>=20
>>=20
>> --
>> Jiaxun Yang
>>=20
>>  ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E4=B8=80, 2020-03-30 18:00:19 maobib=
o <maobibo@loongson=2Ecn> =E6=92=B0=E5=86=99
>----
>>  >=20
>>  >=20
>>  > On 03/30/2020 04:55 PM, Jiaxun Yang wrote:
>>  > >=20
>>  > >=20
>>  > > =E4=BA=8E 2020=E5=B9=B43=E6=9C=8830=E6=97=A5 GMT+08:00 =E4=B8=8B=
=E5=8D=884:38:51, bibo mao <maobibo@loongson=2Ecn>
>=E5=86=99=E5=88=B0:
>>  > >> Remove header files from arch/mips/include/asm/mach-loongson64
>>  > >> to arch/mips/loongson64/include/mach
>>  > >>
>>  > >> Signed-off-by: bibo mao <maobibo@loongson=2Ecn>
>>  > >=20
>>  > > Hi Bibo,
>>  > >=20
>>  > > Thanks for your patch=2E
>>  > >=20
>>  > > What's your intention?
>>  > > Did you meet any problem about headers?
>>  > >=20
>>  >=20
>>  > Hi Jiaxun,
>>  >=20
>>  > When I add irqchip support for mips kvm, file virt/kvm/irqchip=2Ec
>>  > requires local header file arch/mips/kvm/irq=2Eh, it fails to
>compile=2E
>>  > Since there is file with the same name located at:
>>  >   arch/mips/include/asm/mach-generic/irq=2Eh
>>  >   arch/mips/include/asm/mach-loongson64/irq=2Eh
>>  >=20
>>  > The compiler fails to choose the correct header file irq=2Eh,
>>=20
>> You'd better rename kvm's irq=2Eh in this case=2E
>why should we rename kvm's irq=2Eh?  It works on other arches like
>x86/aarch/powerpc, it does not work on mips platform=2E Just because
>these
>header files are not used with path prefix on mips system, it brings
>out
>such problem=2E
>
>Today if we modify generic kvm code, it maybe brings out problem with
>other modules tommorrow=2E Else we declare that these files can be
>defined
>locally on all modules:
>  cpu-feature-overrides=2Eh  floppy=2Eh  ide=2Eh  ioremap=2Eh  irq=2Eh
>  kernel-entry-init=2Eh  kmalloc=2Eh  mangle-port=2Eh  mc146818rtc=2Eh

It sounds reasonable=2E
But I just don't want to rush into this kind of tree wide
"scrub" unless the problem is urgent=2E

For your problem, a simple workaround might be fine=2E

And there might be some reference to these mach headers in other subsystem=
s=2E

Please examine them extremely carefully and do compile test with
all yes config for all the platforms=2E

Thomas said he is going to drop some platform support in this cycle,
so you can do less work after that=2E

I'll miss these header hacks anyway=2E

Thanks=2E

>
>regard
>bibo,mao
>
>>=20
>>  >=20
>>  > regards
>>  > bibo,mao
>>  >=20
--=20
Jiaxun Yang
