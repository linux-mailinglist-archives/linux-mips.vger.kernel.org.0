Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1C2192AAF
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 15:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbgCYOCd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 10:02:33 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17883 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727277AbgCYOCd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 10:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585144813;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=0hHXYnYNII7mGIm2v16HLCOx2cRmye6GqMXRKnA3vJ4=;
        b=WOFm42Ii8iI5DgSbTfMU0gu/xED5H4wiX54RudmowAC78CYQPQ5o1GZtJf3nwEyz
        gkMlXcUGQt8mUgaP6Is47OSX8AjDkJ5neJX/tl23ESVnL/tCbdfpK2/yq8+SjjkyFyF
        w5apgFY4ihRNYr/4w0T0lFM5YfdHHO0EZEqKtm5I=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by mx.zoho.com.cn
        with SMTPS id 1585144812520696.7889863442692; Wed, 25 Mar 2020 22:00:12 +0800 (CST)
Date:   Wed, 25 Mar 2020 21:59:59 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <5eb9ce9ea665ee32da40779f00fc9b37@kernel.org>
References: <20200325035537.156911-1-jiaxun.yang@flygoat.com> <20200325035537.156911-7-jiaxun.yang@flygoat.com> <20200325123742.GA9911@alpha.franken.de> <a69f727d37daac6e20ac08de022245b1@kernel.org> <C4892878-8463-448D-897B-5F2C56F5A340@flygoat.com> <5eb9ce9ea665ee32da40779f00fc9b37@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 06/11] irqchip: mips-cpu: Convert to simple domain
To:     Marc Zyngier <maz@kernel.org>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
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
Message-ID: <4BB367D3-B8AD-47B6-ACC2-30752137BC1B@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=889=
:57:49, Marc Zyngier <maz@kernel=2Eorg> =E5=86=99=E5=88=B0:
>On 2020-03-25 13:07, Jiaxun Yang wrote:
>> =E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=889:00:01, Marc Zyngier <maz@kernel=2Eorg> =E5=86=99=E5=88=B0:
>>> On 2020-03-25 12:37, Thomas Bogendoerfer wrote:
>>>> On Wed, Mar 25, 2020 at 11:54:59AM +0800, Jiaxun Yang wrote:
>>>>> The old code is using legacy domain to setup irq_domain for CPU
>>>>> interrupts
>>>>> which requires irq_desc to be preallocated=2E
>>>>>=20
>>>>> However, when MIPS_CPU_IRQ_BASE >=3D 16, irq_desc for CPU IRQs may
>end
>>>=20
>>>>> up
>>>>> unallocated and lead to incorrect behavior=2E
>>>>>=20
>>>>> Thus we convert the legacy domain to simple domain which can
>>> allocate
>>>>> irq_desc during initialization=2E
>>>>>=20
>>>>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>>>>> Co-developed-by: Huacai Chen <chenhc@lemote=2Ecom>
>>>>> Signed-off-by: Huacai Chen <chenhc@lemote=2Ecom>
>>>>> Reviewed-by: Marc Zyngier <maz@kernel=2Eorg>
>>>>> ---
>>>>>  drivers/irqchip/irq-mips-cpu=2Ec | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>=20
>>>>> diff --git a/drivers/irqchip/irq-mips-cpu=2Ec
>>>>> b/drivers/irqchip/irq-mips-cpu=2Ec
>>>>> index 95d4fd8f7a96=2E=2Ec3cf7fa76424 100644
>>>>> --- a/drivers/irqchip/irq-mips-cpu=2Ec
>>>>> +++ b/drivers/irqchip/irq-mips-cpu=2Ec
>>>>> @@ -251,7 +251,7 @@ static void __init __mips_cpu_irq_init(struct
>>>>> device_node *of_node)
>>>>>  	clear_c0_status(ST0_IM);
>>>>>  	clear_c0_cause(CAUSEF_IP);
>>>>>=20
>>>>> -	irq_domain =3D irq_domain_add_legacy(of_node, 8,
>MIPS_CPU_IRQ_BASE,
>>> 0,
>>>>> +	irq_domain =3D irq_domain_add_simple(of_node, 8,
>MIPS_CPU_IRQ_BASE,
>>>>>  					   &mips_cpu_intc_irq_domain_ops,
>>>>>  					   NULL);
>>>>=20
>>>> this breaks at least IP30 and guess it will break every platform
>>> where
>>>> MIPS_CPU_IRQ_BASE =3D=3D 0=2E add_legacy will always do
>>>> irq_domain_associate_many(),
>>>> while add_simple doesn't do it, if first_irq =3D=3D 0=2E
>>>>=20
>>>> Marc, what is the reason not doing it all the time ? What's the
>>> correct
>>>> way here to work with irq_domain_add_simple() in this case ?
>>>=20
>>> On a fully DT-ified platform, using non-legacy irqdomains, virtual
>>> interrupts
>>> are allocated as a "random" number, depending on the order of
>>> allocation,
>>> and on demand=2E
>>>=20
>>> The first_irq hack in irq_domain_add_simple() is just a way to still
>>> allocate
>>> descriptors upfront (and I wish we could drop it=2E=2E=2E)=2E
>>>=20
>>> If you have legacy code that "knows" about the relationship between
>>> Linux's
>>> virtual interrupt and the hwirq (that is only meaningful to the
>>> interrupt
>>> controller), you're screwed, and need to stick to the legacy=20
>>> irqdomain=2E
>>>=20
>>> It feels like the MIPS code is squarely in the latter case, so I
>guess
>>> this
>>> patch is probably the wrong thing to do for this architecture=2E
>>=20
>> So probably we can use legacy domain when  MIPS IRQ BASE is in the
>> range of legacy IRQ
>> and switch to simple domain when it's not in that range?
>
>No, see below=2E
>
>> Here in Loongson systems IRQ 0-15 is occupied by I8259 so I did this=20
>> hack=2E
>
>Well, if you have to consider which Linux IRQ gets assigned,
>then your platform is definitely not ready for non-legacy
>irqdomains=2E Just stick to legacy for now until you have removed
>all the code that knows the hwirq mapping=2E

Thanks=2E

So I have to allocate irq_desc here in driver manually?


>
>         M=2E

--=20
Jiaxun Yang
