Return-Path: <linux-mips+bounces-7214-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3059FEFAA
	for <lists+linux-mips@lfdr.de>; Tue, 31 Dec 2024 14:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D8C7162390
	for <lists+linux-mips@lfdr.de>; Tue, 31 Dec 2024 13:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B815199E8B;
	Tue, 31 Dec 2024 13:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="bttlB3/N"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767E619CCFC;
	Tue, 31 Dec 2024 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.182.66.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651139; cv=none; b=esCNZD8QFDb6M+36R6w//ejNHLnYP4EWJ0PrV5Qa8QwH+XKBosBjM+JOJiYThr1lJyxilce49HRrtVp3QUFtZr4EYhcNlYsh4RzwNoirvPy+CZjp++D8B0FuA7DntJOR6EBmhgsKLRajoeY2GfVZM6LdPQKwftjK36Ea5JqEyDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651139; c=relaxed/simple;
	bh=IkkJvaTLyIZr8QENhx78gFFbkRbYIJ+6lBZTqSgB8GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVICPCuFhJNGKOheFQJF66DoD4G9zpu0TVN6CLNlKyUnopLLkzaPlj49BCP09nNPkhf0S8FKVVISgNrnOSDOVMsRygj+w1Gi4p5x/YKD55MVKjFIsF5FLoLr7qSfIj/ykv4b3eMYbAxhlEEVu/iXhCqAuVKNmM0ovX5S2zpq3Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=bttlB3/N; arc=none smtp.client-ip=217.182.66.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id 06D1A3EC5E;
	Tue, 31 Dec 2024 14:18:49 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 64ACA40093;
	Tue, 31 Dec 2024 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1735651128; bh=IkkJvaTLyIZr8QENhx78gFFbkRbYIJ+6lBZTqSgB8GA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bttlB3/N7LEyLf26e6+ucA/MGeABBYZ3XpqybijKnVQ3XqJSio+Wd5Nhn322wrVjW
	 LzQRJ+2Y6Cb/aWGlAmP+an392KElud/XRqTJsx60LaFQ0stleefuTHKeydCJUYYCNI
	 bnwg12DVuD+uLb7GVR5Ap9OyQ1UnOmCP8iXUKH70=
Received: from [198.18.0.1] (unknown [203.175.14.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 7AE5F42634;
	Tue, 31 Dec 2024 13:18:44 +0000 (UTC)
Message-ID: <ad0733fa-7164-4db8-a490-763230188a12@aosc.io>
Date: Tue, 31 Dec 2024 21:18:33 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] irqchip/loongson-eiointc: Route interrupt parsed
 from bios table
To: Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241213035026.1643517-1-maobibo@loongson.cn>
 <20241213035026.1643517-2-maobibo@loongson.cn>
 <CAAhV-H6D0Hf55d9Y+iMCTQyVyfiMVYUBREoX7LbHNxtG9Xcb+g@mail.gmail.com>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <CAAhV-H6D0Hf55d9Y+iMCTQyVyfiMVYUBREoX7LbHNxtG9Xcb+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.22 / 10.00];
	BAYES_HAM(-0.12)[66.67%];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[maobibo.loongson.cn:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 64ACA40093

Hi Huacai and Bibo,

在 2024/12/31 21:06, Huacai Chen 写道:
> Hi, Bibo,
> 
> This patch is correct in theory, but since we use a hard-coded method
> in the first place, there may be buggy BIOS, especially for
> multi-bridge machines. So I hope someone can help me to test as many
> machines as possible, and then give feedback to this mail.
> 

Happy to offer testing on as many LoongArch devices as I can. I have the 
following personal/work devices:

- Loongson XA61200
- ASUS XC-LS3A6M
- THTF ChaoRui L860-T2
- Lenovo Kaitian M540z (booting via old-world firmware compatibility)
- 4-way Loongson 3C5000L server (at work)

I will report back with my test results this week.

Best Regards,
Mingcong Bai

> 
> Huacai
> 
> On Fri, Dec 13, 2024 at 11:50 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> Interrupt controller eiointc routes irq to cpu interface IP0 - IP7,
>> now it is hard-coded that eiointc routes irq to CPU started from IP1,
>> however with function irq_create_mapping() parameter parent hwirq
>> uses irq parsed from ACPI or DTS table.
>>
>> Routed interrupt pin need be the consistent with parent hwirq.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   drivers/irqchip/irq-loongson-eiointc.c | 19 ++++++++++++++++---
>>   1 file changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
>> index bb79e19dfb59..72979f9f0e05 100644
>> --- a/drivers/irqchip/irq-loongson-eiointc.c
>> +++ b/drivers/irqchip/irq-loongson-eiointc.c
>> @@ -68,6 +68,7 @@ struct eiointc_priv {
>>          struct fwnode_handle    *domain_handle;
>>          struct irq_domain       *eiointc_domain;
>>          int                     flags;
>> +       irq_hw_number_t         parent_hwirq;
>>   };
>>
>>   static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
>> @@ -211,7 +212,12 @@ static int eiointc_router_init(unsigned int cpu)
>>                  }
>>
>>                  for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
>> -                       bit = BIT(1 + index); /* Route to IP[1 + index] */
>> +                       /*
>> +                        * Route to interrupt pin, relative offset used here
>> +                        * Offset 0 means routing to IP0 and so on
>> +                        * Every 32 vector routing to one interrupt pin
>> +                        */
>> +                       bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);
>>                          data = bit | (bit << 8) | (bit << 16) | (bit << 24);
>>                          iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
>>                  }
>> @@ -495,7 +501,7 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
>>
>>          priv->vec_count = VEC_COUNT;
>>          priv->node = acpi_eiointc->node;
>> -
>> +       priv->parent_hwirq = acpi_eiointc->cascade;
>>          parent_irq = irq_create_mapping(parent, acpi_eiointc->cascade);
>>
>>          ret = eiointc_init(priv, parent_irq, acpi_eiointc->node_map);
>> @@ -529,6 +535,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
>>   {
>>          int parent_irq, ret;
>>          struct eiointc_priv *priv;
>> +       struct irq_data *irq_data;
>>
>>          priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>>          if (!priv)
>> @@ -544,6 +551,12 @@ static int __init eiointc_of_init(struct device_node *of_node,
>>          if (ret < 0)
>>                  goto out_free_priv;
>>
>> +       irq_data = irq_get_irq_data(parent_irq);
>> +       if (!irq_data) {
>> +               ret = -ENODEV;
>> +               goto out_free_priv;
>> +       }
>> +
>>          /*
>>           * In particular, the number of devices supported by the LS2K0500
>>           * extended I/O interrupt vector is 128.
>> @@ -555,7 +568,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
>>
>>          priv->node = 0;
>>          priv->domain_handle = of_node_to_fwnode(of_node);
>> -
>> +       priv->parent_hwirq = irqd_to_hwirq(irq_data);
>>          ret = eiointc_init(priv, parent_irq, 0);
>>          if (ret < 0)
>>                  goto out_free_priv;
>> --
>> 2.39.3
>>
> 


