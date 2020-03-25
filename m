Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 131F5192DC7
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 17:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgCYQEo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 12:04:44 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17805 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725812AbgCYQEo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 12:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585152166;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=CRLfE2jz7muXeJ6qeLvUrod4IRB84jHCPnWRdiwg/sA=;
        b=SSYChqb1m1zrASxa3+5zJjrUtMKnv9+6kTT50o212WoZGJBKE+2duup3tWenPe99
        EGwtRDYOrgwoJ8RtPYjwvnjMdGG7AM1H2zWyeo1d9z99Rt1kbP2qdd/KPHatUNPgUy0
        d706UjL0F/enoxNjBmfFPAbALumoy1HCfJEvY/mE=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by mx.zoho.com.cn
        with SMTPS id 1585152161181504.9058622774445; Thu, 26 Mar 2020 00:02:41 +0800 (CST)
Date:   Thu, 26 Mar 2020 00:02:28 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20200325154600.GA14923@alpha.franken.de>
References: <20200325035537.156911-7-jiaxun.yang@flygoat.com> <20200325123742.GA9911@alpha.franken.de> <a69f727d37daac6e20ac08de022245b1@kernel.org> <C4892878-8463-448D-897B-5F2C56F5A340@flygoat.com> <5eb9ce9ea665ee32da40779f00fc9b37@kernel.org> <4BB367D3-B8AD-47B6-ACC2-30752137BC1B@flygoat.com> <c4520c4b0b0eaaba5fdbaebfce7b4460@kernel.org> <39CF835E-D1D9-4B52-ABDC-BDB17B650936@flygoat.com> <20200325150437.GA14217@alpha.franken.de> <777D8DAA-F462-4E8D-9012-C114DE6D56DE@flygoat.com> <20200325154600.GA14923@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 06/11] irqchip: mips-cpu: Convert to simple domain
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <8F2B64C3-A887-4D4B-ABEA-4BE3D30F4632@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
1:46:00, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=
=88=B0:
>On Wed, Mar 25, 2020 at 11:09:10PM +0800, Jiaxun Yang wrote:
>>=20
>>=20
>> =E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=8811:04:37, Thomas Bogendoerfer
><tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=88=B0:
>> >On Wed, Mar 25, 2020 at 10:31:21PM +0800, Jiaxun Yang wrote:
>> >>=20
>> >>=20
>> >> =E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=8810:15:16, Marc Zyngier <maz@kernel=2Eorg>
>=E5=86=99=E5=88=B0:
>> >> >On 2020-03-25 13:59, Jiaxun Yang wrote:
>> >> >
>> >> >[=2E=2E=2E]
>> >> >
>> >> >>>> So probably we can use legacy domain when  MIPS IRQ BASE is
>in
>> >the
>> >> >>>> range of legacy IRQ
>> >> >>>> and switch to simple domain when it's not in that range?
>> >> >>>=20
>> >> >>> No, see below=2E
>> >> >>>=20
>> >> >>>> Here in Loongson systems IRQ 0-15 is occupied by I8259 so I
>did
>> >> >this
>> >> >>>> hack=2E
>> >> >>>=20
>> >> >>> Well, if you have to consider which Linux IRQ gets assigned,
>> >> >>> then your platform is definitely not ready for non-legacy
>> >> >>> irqdomains=2E Just stick to legacy for now until you have
>removed
>> >> >>> all the code that knows the hwirq mapping=2E
>> >> >>=20
>> >> >> Thanks=2E
>> >> >>=20
>> >> >> So I have to allocate irq_desc here in driver manually?
>> >> >
>> >> >No, you are probably better off just dropping this patch, as MIPS
>> >> >doesn't seem to be ready for a wholesale switch to virtual
>> >interrupts=2E
>> >>=20
>> >> It can't work without this patch=2E
>> >>=20
>> >> Legacy domain require IRQ number within 0-15=20
>> >> however it's already occupied by i8259 or "HTPIC" driver=2E
>> >
>> >what's the problem here ? AFAIK there could be more than one
>> >legacy domain, at least that's what at least IP22/SNI in MIPS world=20
>> >are doing=2E
>>=20
>> MIPS_IRQ_BASE must be higher than 15, otherwise it will conflict with
>i8259=2E
>
>I still don't get it=2E
>
>We have following in arch/mips/include/asm/mach-generic/irq=2Eh:
>
>#ifndef MIPS_CPU_IRQ_BASE
>#ifdef CONFIG_I8259
>#define MIPS_CPU_IRQ_BASE 16
>#else
>#define MIPS_CPU_IRQ_BASE 0
>#endif /* CONFIG_I8259 */
>#endif
>
>So every legacy platform with i8259 has MIPS_CPU_IRQ_BASE =3D 16=2E
>
>> However we have only preallocated irq_desc for 0-15=2E
>> And legacy domain require irq_desc being preallocated=2E
>
>maybe I'm too fast by judging the irq code, but without
>CONFIG_SPARSE_IRQ
>the whole irq_desc is pre-allocated=2E

Sorry=2E You're right=2E
I found the problem is CONFIG_SPARSE_IRQ is accidentally enabled in my con=
fig due to another out-of-tree patch
during my initial test and I always consider it as a problem=2E

So we can drop this patch safely for now=2E
But just need to consider how to deal with it when we want to enable SPARS=
E_IRQ=2E

Thanks=2E

>
>Thomas=2E

--=20
Jiaxun Yang
