Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2337D1928DF
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 13:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgCYMuv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 08:50:51 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17851 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726820AbgCYMuu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 08:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585140544;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=vqy9KgzyVYxmnrqFQc0i1Zu/TD9bYgtnU+TgEsbMRRo=;
        b=VWDVw0jlewF6cYs4orJtnyyrFP4lXEoBwc3qWxgWugL6Qbe5rnNu8cQYlvTuA4Zs
        GIStJDBaX9M0K3uYMcklLmRX8voyqvSfdxxSmwBsIWhTsTS9QXzABA4xO2dslNYWMvu
        Jtk1j1/vyJijL2Sv/5B5q8zNdjNl5Pum0UfJ3N88=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by mx.zoho.com.cn
        with SMTPS id 1585140543288901.7885813665146; Wed, 25 Mar 2020 20:49:03 +0800 (CST)
Date:   Wed, 25 Mar 2020 20:48:55 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20200325123742.GA9911@alpha.franken.de>
References: <20200325035537.156911-1-jiaxun.yang@flygoat.com> <20200325035537.156911-7-jiaxun.yang@flygoat.com> <20200325123742.GA9911@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 06/11] irqchip: mips-cpu: Convert to simple domain
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Marc Zyngier <maz@kernel.org>,
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
Message-ID: <DC9062E8-42E3-4139-99F9-157DEAF5DB7B@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888=
:37:42, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=88=
=B0:
>On Wed, Mar 25, 2020 at 11:54:59AM +0800, Jiaxun Yang wrote:
>> The old code is using legacy domain to setup irq_domain for CPU
>interrupts
>> which requires irq_desc to be preallocated=2E
>>=20
>> However, when MIPS_CPU_IRQ_BASE >=3D 16, irq_desc for CPU IRQs may end
>up
>> unallocated and lead to incorrect behavior=2E
>>=20
>> Thus we convert the legacy domain to simple domain which can allocate
>> irq_desc during initialization=2E
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> Co-developed-by: Huacai Chen <chenhc@lemote=2Ecom>
>> Signed-off-by: Huacai Chen <chenhc@lemote=2Ecom>
>> Reviewed-by: Marc Zyngier <maz@kernel=2Eorg>
>> ---
>>  drivers/irqchip/irq-mips-cpu=2Ec | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/irqchip/irq-mips-cpu=2Ec
>b/drivers/irqchip/irq-mips-cpu=2Ec
>> index 95d4fd8f7a96=2E=2Ec3cf7fa76424 100644
>> --- a/drivers/irqchip/irq-mips-cpu=2Ec
>> +++ b/drivers/irqchip/irq-mips-cpu=2Ec
>> @@ -251,7 +251,7 @@ static void __init __mips_cpu_irq_init(struct
>device_node *of_node)
>>  	clear_c0_status(ST0_IM);
>>  	clear_c0_cause(CAUSEF_IP);
>> =20
>> -	irq_domain =3D irq_domain_add_legacy(of_node, 8, MIPS_CPU_IRQ_BASE,
>0,
>> +	irq_domain =3D irq_domain_add_simple(of_node, 8, MIPS_CPU_IRQ_BASE,
>>  					   &mips_cpu_intc_irq_domain_ops,
>>  					   NULL);
>
>this breaks at least IP30 and guess it will break every platform where
>MIPS_CPU_IRQ_BASE =3D=3D 0=2E add_legacy will always do
>irq_domain_associate_many(),
>while add_simple doesn't do it, if first_irq =3D=3D 0=2E
>
>Marc, what is the reason not doing it all the time ? What's the correct
>way here to work with irq_domain_add_simple() in this case ?
=20
I guess there is a inconsistent about whether IRQ 0 is a valid IRQ=2E

In many places we consider IRQ 0 is invalid but here it should be valid=2E

Thanks=2E


>
>Thomas=2E

--=20
Jiaxun Yang
