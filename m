Return-Path: <linux-mips+bounces-5174-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC64196378C
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 03:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EFAA285B76
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 01:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC83134D1;
	Thu, 29 Aug 2024 01:16:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0C94C62;
	Thu, 29 Aug 2024 01:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724894174; cv=none; b=TbsrRn3MKGlP4nS1O/9aLI3WKyicDgQVK6gLEalKjLezCi+sJuhVto7MQsbf73Bm3b6Ukc+wIPWv+eHn8SG55ui0skl7TuKT0RU/8vKA3MOI2xEPb3layGPfNwfAWnC0pnIB+Oljp7ErHDQeLqbM4pYL6YvER2QgBft5dSJKiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724894174; c=relaxed/simple;
	bh=Yl3jprZvOrk15IBj+m4V20ifNWGPILknOIKdQ8lCNfU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pKjuzkLXtyAyT3PJLBCt3syzbgY4Uk+YbDRL5E55IO7ufAegrb9VLNoRgnTalno5l6HfYe+N1Q+bT059I9GV2PJvtD/IrSjzcC3axUCyIDdW9Du7EXIzwlYj5J1BRLOkO2efR351Jf9dFt/yDfgiy0SYsKJkFtpTUQIeqYiszvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxOJrQy89m1FcjAA--.33977S3;
	Thu, 29 Aug 2024 09:16:00 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMDxmWbOy89mfg4mAA--.4212S3;
	Thu, 29 Aug 2024 09:15:58 +0800 (CST)
Subject: Re: [RFC v2 2/2] irqchip/loongson-eiointc: Add multiple interrupt pin
 routing support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20240828070603.3518753-1-maobibo@loongson.cn>
 <20240828070603.3518753-3-maobibo@loongson.cn>
 <CAAhV-H6+GYjbJbZjKUVvHJ7sTnRhMqBOun149OqO8WEL7xF8Aw@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <819bb7b2-cbbf-ea47-7bae-3a0902d48096@loongson.cn>
Date: Thu, 29 Aug 2024 09:15:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6+GYjbJbZjKUVvHJ7sTnRhMqBOun149OqO8WEL7xF8Aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxmWbOy89mfg4mAA--.4212S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3WFWrtF15Ar13GFWruFWrtFc_yoWxur4kpF
	W0kF98tFW5JFyUWr9Iqa1DtF1Syrn8XrWjkan3Gayxta1qkw1kGF4rAa4YkwnFkr48Ar4a
	vF4Yyw1Uu3Z8C3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==



On 2024/8/28 下午9:56, Huacai Chen wrote:
> Hi, Bibo,
> 
> On Wed, Aug 28, 2024 at 3:06 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> Eiointc interrupt controller support 256 interrupt vectors at most,
>> and irq handler gets interrupt status from base register group
>> EIOINTC_REG_ISR plus specific offset. It needs to read register group
>> EIOINTC_REG_ISR four times to get all 256 interrupt vectors status.
>>
>> Eiointc registers including EIOINTC_REG_ISR is software emulated for
>> VMs, there will be VM-exits when accessing eiointc registers. Here one
>> method is introduced so that eiointc interrupt controller can route
>> to different cpu interrupt pins for every 64 interrupt vectors. So
>> irq handler needs read only relative 64 interrupt vector, it  reduces
>> VM-exits.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   drivers/irqchip/irq-loongson-eiointc.c | 72 ++++++++++++++++++++++----
>>   1 file changed, 63 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
>> index e9ec63d85ee8..c6bcb6625e6d 100644
>> --- a/drivers/irqchip/irq-loongson-eiointc.c
>> +++ b/drivers/irqchip/irq-loongson-eiointc.c
>> @@ -30,11 +30,20 @@
>>   #define VEC_REG_IDX(irq_id)    ((irq_id) / VEC_COUNT_PER_REG)
>>   #define VEC_REG_BIT(irq_id)     ((irq_id) % VEC_COUNT_PER_REG)
>>   #define EIOINTC_ALL_ENABLE     0xffffffff
>> +#define EIOINTC_ROUTE_MULTIPLE_IP      BIT(0)
>>
>>   #define MAX_EIO_NODES          (NR_CPUS / CORES_PER_EIO_NODE)
>>
>>   static int nr_pics;
>>
>> +struct eiointc_priv;
>> +struct eiointc_ip_route {
>> +       struct eiointc_priv     *priv;
>> +       /* Routed destination IP offset */
>> +       int                     start;
>> +       int                     end;
>> +};
>> +
>>   struct eiointc_priv {
>>          u32                     node;
>>          u32                     vec_count;
>> @@ -43,6 +52,8 @@ struct eiointc_priv {
>>          struct fwnode_handle    *domain_handle;
>>          struct irq_domain       *eiointc_domain;
>>          int                     parent_hwirq;
>> +       int                     flags;
>> +       struct eiointc_ip_route route_info[4];
>>   };
>>
>>   static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
>> @@ -145,12 +156,20 @@ static int eiointc_router_init(unsigned int cpu)
>>          uint32_t data;
>>          uint32_t node = cpu_to_eio_node(cpu);
>>          int index = eiointc_index(node);
>> +       int hwirq, mask;
>>
>>          if (index < 0) {
>>                  pr_err("Error: invalid nodemap!\n");
>>                  return -1;
>>          }
>>
>> +       /* Enable cpu interrupt pin routed from eiointc */
>> +       hwirq = eiointc_priv[index]->parent_hwirq;
>> +       mask = BIT(hwirq);
>> +       if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MULTIPLE_IP)
>> +               mask |= BIT(hwirq + 1) | BIT(hwirq + 2) | BIT(hwirq + 3);
>> +       set_csr_ecfg(mask);
>> +
>>          if ((cpu_logical_map(cpu) % CORES_PER_EIO_NODE) == 0) {
>>                  eiointc_enable();
>>
>> @@ -161,12 +180,23 @@ static int eiointc_router_init(unsigned int cpu)
>>
>>                  for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
>>                          /*
>> -                        * Route to interrupt pin, using offset minus INT_HWI0
>> -                        * Offset 0 means IP0 and so on
>> -                        * Every 32 vector routing to one interrupt pin
>> +                        * Route to interrupt pin, minus INT_HWI0 as offset
>> +                        * Offset 0 means IP0 and so on, every 32 vector
>> +                        * routing to one interrupt pin
>> +                        *
>> +                        * If flags is set with EIOINTC_ROUTE_MULTIPLE_IP,
>> +                        * every 64 vector routes to different consecutive
>> +                        * IPs, otherwise all vector routes to the same IP
>>                           */
>> -                       bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);
>> -                       data = bit | (bit << 8) | (bit << 16) | (bit << 24);
>> +                       if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MULTIPLE_IP) {
>> +                               bit = BIT(hwirq++ - INT_HWI0);
>> +                               data = bit | (bit << 8);
>> +                               bit = BIT(hwirq++ - INT_HWI0);
>> +                               data |= (bit << 16) | (bit << 24);
>> +                       } else  {
>> +                               bit = BIT(hwirq - INT_HWI0);
>> +                               data = bit | (bit << 8) | (bit << 16) | (bit << 24);
>> +                       }
>>                          iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
>>                  }
>>
>> @@ -197,11 +227,18 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
>>          u64 pending;
>>          bool handled = false;
>>          struct irq_chip *chip = irq_desc_get_chip(desc);
>> -       struct eiointc_priv *priv = irq_desc_get_handler_data(desc);
>> +       struct eiointc_ip_route *info = irq_desc_get_handler_data(desc);
>>
>>          chained_irq_enter(chip, desc);
>>
>> -       for (i = 0; i < eiointc_priv[0]->vec_count / VEC_COUNT_PER_REG; i++) {
>> +       /*
>> +        * If EIOINTC_ROUTE_MULTIPLE_IP is set, every 64 interrupt vectors in
>> +        * eiointc interrupt controller routes to different cpu interrupt pins
>> +        *
>> +        * Every cpu interrupt pin has its own irq handler, it is ok to
>> +        * read ISR for these 64 interrupt vectors rather than all vectors
>> +        */
>> +       for (i = info->start; i < info->end; i++) {
>>                  pending = iocsr_read64(EIOINTC_REG_ISR + (i << 3));
>>
>>                  /* Skip handling if pending bitmap is zero */
>> @@ -214,7 +251,7 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
>>                          int bit = __ffs(pending);
>>                          int irq = bit + VEC_COUNT_PER_REG * i;
>>
>> -                       generic_handle_domain_irq(priv->eiointc_domain, irq);
>> +                       generic_handle_domain_irq(info->priv->eiointc_domain, irq);
>>                          pending &= ~BIT(bit);
>>                          handled = true;
>>                  }
>> @@ -397,8 +434,25 @@ static int __init eiointc_init(struct eiointc_priv *priv, int parent_irq,
>>          }
>>
>>          eiointc_priv[nr_pics++] = priv;
>> +       if (cpu_has_hypervisor) {
>> +               priv->parent_hwirq = INT_HWI0;
>> +               for (i = 0; i < priv->vec_count / VEC_COUNT_PER_REG; i++) {
>> +                       priv->route_info[i].start  = priv->parent_hwirq - INT_HWI0 + i;
>> +                       priv->route_info[i].end    = priv->route_info[i].start + 1;
>> +                       priv->route_info[i].priv   = priv;
>> +                       parent_irq = get_percpu_irq(priv->parent_hwirq + i);
>> +                       irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch,
>> +                                                               &priv->route_info[i]);
>> +               }
>> +               priv->flags |= EIOINTC_ROUTE_MULTIPLE_IP;
> Can real machines also use EIOINTC_ROUTE_MULTIPLE_IP?
In theory it is possible on real machine also. Now there are potential 
problems which needs more code modification.

1. On real machine, liointc uses one or two IPs, 
EIOINTC_ROUTE_MULTIPLE_IP requires four IPs. eiointc uses bitmap IP map 
method now, only IP0-IP3 can be used.

2. For multiple eiointc support, instead IP0-IP3 can be used for 
multiple eiointc support since IPs is per-cpu.

On the other hand, what is the benefit doing such thing on real machine, 
we need cost about accessing iocsr register on real machine, there is 
such data from my side.

Regards
Bibo Mao
> 
> Huacai
> 
>> +       } else {
>> +               priv->route_info[0].start  = 0;
>> +               priv->route_info[0].end    = priv->vec_count / VEC_COUNT_PER_REG;
>> +               priv->route_info[0].priv   = priv;
>> +               irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch,
>> +                                                       &priv->route_info[0]);
>> +       }
>>          eiointc_router_init(0);
>> -       irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
>>
>>          if (nr_pics == 1) {
>>                  register_syscore_ops(&eiointc_syscore_ops);
>> --
>> 2.39.3
>>


