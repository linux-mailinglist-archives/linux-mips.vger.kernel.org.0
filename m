Return-Path: <linux-mips+bounces-7215-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 862A19FF560
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 01:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 867953A1CF6
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 00:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF68C10F1;
	Thu,  2 Jan 2025 00:59:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689423D68;
	Thu,  2 Jan 2025 00:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735779576; cv=none; b=AZbdSphIumEn68Ux4QZml8fLGw8+ndjoENRaewffbcJOLx333VOuyw2/cNAcEEJzyzAFUd4FjBoCBmhOtCLxAoMBcm+apql3lhEv0mY2qOJFJw7VguTJaIqO+c0cCNSWgWmdOmV36fpTNT+y62ZBN157MpXCOnHcqh+SSlBRcPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735779576; c=relaxed/simple;
	bh=oMjQ11p5zgxu++328GpzlrnxnHSrPvcUwM0JSkibINw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=tY2OFjZRIe8ZQnHxhmuUL3+7sBiOnBKuukTWlHxpPBq/BJJgkPcyz1NBIy3t4OX5ip0bav3Myk/lsSY30ovPlZFB8/+R/YMSGJ5YaKeIP6WVf1g+L3F5wqz8Fp41ve0BekodoJXYXAha4mmFJy+PDW0hJp5576QW0t52Xc29+5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxUa_q5HVn_h1dAA--.52513S3;
	Thu, 02 Jan 2025 08:59:22 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMDxrcXp5HVnbPUQAA--.17542S3;
	Thu, 02 Jan 2025 08:59:22 +0800 (CST)
Subject: Re: [PATCH v3 2/2] irqchip/loongson-eiointc: Add multiple interrupt
 pin routing support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241213035026.1643517-1-maobibo@loongson.cn>
 <20241213035026.1643517-3-maobibo@loongson.cn>
 <CAAhV-H6htCgwBztdyAWjrdUUzWp_6A9g+hbMyC_cdgydJN-Qzw@mail.gmail.com>
From: bibo mao <maobibo@loongson.cn>
Message-ID: <1d684371-76e0-fd73-1cd5-340e25a1ae0a@loongson.cn>
Date: Thu, 2 Jan 2025 08:58:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6htCgwBztdyAWjrdUUzWp_6A9g+hbMyC_cdgydJN-Qzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxrcXp5HVnbPUQAA--.17542S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gr1xZr1UWw4xWrWxGF1DCFX_yoWxKFWUpF
	W0kF98JFW5tryjg3saqF4DtF1Sywn8XrWjka1fGayxJ3Z0kw1kGFsYkFyY9w12kr48AF1a
	vF4Yyw1Uu3W5C3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==



On 2024/12/31 下午9:07, Huacai Chen wrote:
> Hi, Bibo,
> 
> Do you have some performance data? It is not worth making the driver
> so complicated if there is no significant improvement.
There will be 6-8% improvement with netperf UDP_RR option on 10G 
etherther device in internal test.

Will publish the performance data when irqchip in kernel is merged in 
qemu side, so others can reproduce it.

Regards
Bibo Mao
> 
> 
> Huacai
> 
> On Fri, Dec 13, 2024 at 11:50 AM Bibo Mao <maobibo@loongson.cn> wrote:
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
>> irq handler knows interrupt pin information and reads specific
>> EIOINTC_REG_ISR register. And there is only once EIOINTC_REG_ISR register
>> access rather than four loop times, it  reduces VM-exit times.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   drivers/irqchip/irq-loongson-eiointc.c | 81 +++++++++++++++++++++++---
>>   1 file changed, 74 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
>> index 72979f9f0e05..e504a5d3f0b1 100644
>> --- a/drivers/irqchip/irq-loongson-eiointc.c
>> +++ b/drivers/irqchip/irq-loongson-eiointc.c
>> @@ -46,6 +46,7 @@
>>   #define EIOINTC_ALL_ENABLE_VEC_MASK(vector)    (EIOINTC_ALL_ENABLE & ~BIT(vector & 0x1f))
>>   #define EIOINTC_REG_ENABLE_VEC(vector)         (EIOINTC_REG_ENABLE + ((vector >> 5) << 2))
>>   #define EIOINTC_USE_CPU_ENCODE                 BIT(0)
>> +#define EIOINTC_ROUTE_MULT_IP                  BIT(1)
>>
>>   #define MAX_EIO_NODES          (NR_CPUS / CORES_PER_EIO_NODE)
>>
>> @@ -59,6 +60,13 @@
>>   #define EIOINTC_REG_ROUTE_VEC_MASK(vector)     (0xff << EIOINTC_REG_ROUTE_VEC_SHIFT(vector))
>>
>>   static int nr_pics;
>> +struct eiointc_priv;
>> +typedef struct eiointc_ip_route {
>> +       struct eiointc_priv     *priv;
>> +       /* Offset Routed destination IP */
>> +       int                     start;
>> +       int                     end;
>> +} eiointc_ip_route;
>>
>>   struct eiointc_priv {
>>          u32                     node;
>> @@ -69,6 +77,7 @@ struct eiointc_priv {
>>          struct irq_domain       *eiointc_domain;
>>          int                     flags;
>>          irq_hw_number_t         parent_hwirq;
>> +       eiointc_ip_route        route_info[VEC_REG_COUNT];
>>   };
>>
>>   static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
>> @@ -189,6 +198,7 @@ static int eiointc_router_init(unsigned int cpu)
>>   {
>>          int i, bit, cores, index, node;
>>          unsigned int data;
>> +       int hwirq, mask;
>>
>>          node = cpu_to_eio_node(cpu);
>>          index = eiointc_index(node);
>> @@ -198,6 +208,13 @@ static int eiointc_router_init(unsigned int cpu)
>>                  return -EINVAL;
>>          }
>>
>> +       /* Enable cpu interrupt pin from eiointc */
>> +       hwirq = eiointc_priv[index]->parent_hwirq;
>> +       mask = BIT(hwirq);
>> +       if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MULT_IP)
>> +               mask |= BIT(hwirq + 1) | BIT(hwirq + 2) | BIT(hwirq + 3);
>> +       set_csr_ecfg(mask);
>> +
>>          if (!(eiointc_priv[index]->flags & EIOINTC_USE_CPU_ENCODE))
>>                  cores = CORES_PER_EIO_NODE;
>>          else
>> @@ -215,10 +232,28 @@ static int eiointc_router_init(unsigned int cpu)
>>                          /*
>>                           * Route to interrupt pin, relative offset used here
>>                           * Offset 0 means routing to IP0 and so on
>> -                        * Every 32 vector routing to one interrupt pin
>> +                        *
>> +                        * If flags is set with EIOINTC_ROUTE_MULT_IP,
>> +                        * every 64 vector routes to different consecutive
>> +                        * IPs, otherwise all vector routes to the same IP
>>                           */
>> -                       bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);
>> -                       data = bit | (bit << 8) | (bit << 16) | (bit << 24);
>> +                       if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MULT_IP) {
>> +                               /* The first 64 vectors route to hwirq */
>> +                               bit = BIT(hwirq++ - INT_HWI0);
>> +                               data = bit | (bit << 8);
>> +
>> +                               /* The second 64 vectors route to hwirq + 1 */
>> +                               bit = BIT(hwirq++ - INT_HWI0);
>> +                               data |= (bit << 16) | (bit << 24);
>> +
>> +                               /*
>> +                                * Route to hwirq + 2/hwirq + 3 separately
>> +                                * in next loop
>> +                                */
>> +                       } else  {
>> +                               bit = BIT(hwirq - INT_HWI0);
>> +                               data = bit | (bit << 8) | (bit << 16) | (bit << 24);
>> +                       }
>>                          iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
>>                  }
>>
>> @@ -251,11 +286,18 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
>>          u64 pending;
>>          bool handled = false;
>>          struct irq_chip *chip = irq_desc_get_chip(desc);
>> -       struct eiointc_priv *priv = irq_desc_get_handler_data(desc);
>> +       eiointc_ip_route *info = irq_desc_get_handler_data(desc);
>>
>>          chained_irq_enter(chip, desc);
>>
>> -       for (i = 0; i < eiointc_priv[0]->vec_count / VEC_COUNT_PER_REG; i++) {
>> +       /*
>> +        * If EIOINTC_ROUTE_MULT_IP is set, every 64 interrupt vectors in
>> +        * eiointc interrupt controller routes to different cpu interrupt pins
>> +        *
>> +        * Every cpu interrupt pin has its own irq handler, it is ok to
>> +        * read ISR for these 64 interrupt vectors rather than all vectors
>> +        */
>> +       for (i = info->start; i < info->end; i++) {
>>                  pending = iocsr_read64(EIOINTC_REG_ISR + (i << 3));
>>
>>                  /* Skip handling if pending bitmap is zero */
>> @@ -268,7 +310,7 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
>>                          int bit = __ffs(pending);
>>                          int irq = bit + VEC_COUNT_PER_REG * i;
>>
>> -                       generic_handle_domain_irq(priv->eiointc_domain, irq);
>> +                       generic_handle_domain_irq(info->priv->eiointc_domain, irq);
>>                          pending &= ~BIT(bit);
>>                          handled = true;
>>                  }
>> @@ -468,8 +510,33 @@ static int __init eiointc_init(struct eiointc_priv *priv, int parent_irq,
>>          }
>>
>>          eiointc_priv[nr_pics++] = priv;
>> +       /*
>> +        * Only the first eiointc device on VM supports routing to
>> +        * different Interrupt Pins. The later eiointc devices use
>> +        * generic method if there are multiple eiointc devices in future
>> +        */
>> +       if (cpu_has_hypervisor && (nr_pics == 1)) {
>> +               priv->flags |= EIOINTC_ROUTE_MULT_IP;
>> +               priv->parent_hwirq = INT_HWI0;
>> +       }
>> +
>> +       if (priv->flags & EIOINTC_ROUTE_MULT_IP) {
>> +               for (i = 0; i < priv->vec_count / VEC_COUNT_PER_REG; i++) {
>> +                       priv->route_info[i].start  = priv->parent_hwirq - INT_HWI0 + i;
>> +                       priv->route_info[i].end    = priv->route_info[i].start + 1;
>> +                       priv->route_info[i].priv   = priv;
>> +                       parent_irq = get_percpu_irq(priv->parent_hwirq + i);
>> +                       irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch,
>> +                                       &priv->route_info[i]);
>> +               }
>> +       } else {
>> +               priv->route_info[0].start  = 0;
>> +               priv->route_info[0].end    = priv->vec_count / VEC_COUNT_PER_REG;
>> +               priv->route_info[0].priv   = priv;
>> +               irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch,
>> +                               &priv->route_info[0]);
>> +       }
>>          eiointc_router_init(0);
>> -       irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
>>
>>          if (nr_pics == 1) {
>>                  register_syscore_ops(&eiointc_syscore_ops);
>> --
>> 2.39.3
>>
>>


