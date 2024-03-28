Return-Path: <linux-mips+bounces-2355-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A399886A07
	for <lists+linux-mips@lfdr.de>; Fri, 22 Mar 2024 11:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE5F01C2014F
	for <lists+linux-mips@lfdr.de>; Fri, 22 Mar 2024 10:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8820C3B2BF;
	Fri, 22 Mar 2024 10:16:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441E138DDD;
	Fri, 22 Mar 2024 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711102574; cv=none; b=EdPgYXrVqvtnOOWfDBYc3P0fHE0WRo4pmsA0Rx98n1YkG2Lxs12NIPs1qW1ZeNi0hugGZOwK13z2nkO0lx24SLNta8xzMpKf9pAoEUSeqGEG9zozgjoRGBQjFD/8N39qhjC+FAJroUBWfB1bLBVtsugJ7EVA7J+Ig/A5jKZro4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711102574; c=relaxed/simple;
	bh=1TwGmh3YnzHwWCnmV0rktleeOSBDlBNOeg1ghcviBJk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Qcx8gxzTDhvA3cmL5JFS0NWG9LdJkkA/qrwpO9jfC5EJ0lnhas5ZsbZAV1JZWZ2EjmVNIO5Mwk/jp+bqr2FEEbq0BIK3oCfa1e8NX40zu3A98SgMaIWCWy/HuHRqwBYJaqMJaqrVtiCveZDTbUceD+PCna4FWoKIfOUqybVyLNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8BxOPBpWv1lN2scAA--.2446S3;
	Fri, 22 Mar 2024 18:16:09 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxTs1nWv1lluRhAA--.58343S3;
	Fri, 22 Mar 2024 18:16:08 +0800 (CST)
Subject: Re: [PATCH v2] irqchip/loongson-pch-pic: Update interrupt
 registration policy
To: Binbin Zhou <zhoubinbin@loongson.cn>, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, tglx@linutronix.de
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Baoqi Zhang <zhangbaoqi@loongson.cn>, Biao Dong <dongbiao@loongson.cn>,
 zhoubb.aaron@gmail.com
References: <20240316082141.26139-1-zhangtianyang@loongson.cn>
 <24131107-1e45-415a-b731-c1f97a231e22@loongson.cn>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <260541a1-f4c7-2f9b-7a20-9f9c0aea4fdd@loongson.cn>
Date: Fri, 22 Mar 2024 18:16:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <24131107-1e45-415a-b731-c1f97a231e22@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8AxTs1nWv1lluRhAA--.58343S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3urW5Kw1UZr4rCr47ur4fXrc_yoWDZryUpF
	WkJrW5AFWUJr1kJr18Jr1UAry3JF17X3WDKr48JFy7Jw47Zryjgr1UWr1qgr1UJr48Xr15
	Ar1UWr9rZr47JFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5xhLUUUUU=

Hi,Binbin

Thank you for pointing out the problems in this patch. We will adjust 
the scheme after the test

Thanks again

在 2024/3/21 下午2:10, Binbin Zhou 写道:
> Hi Tianyang:
>
> On 2024/3/16 16:21, Tianyang Zhang wrote:
>> From: Baoqi Zhang <zhangbaoqi@loongson.cn>
>>
>> This patch remove the fixed mapping between the 7A interrupt source
>> and the HT interrupt vector, and replaced it with a dynamically
>> allocated approach.
>>
>> We introduce a mapping table in struct pch_pic, where each interrupt
>> source will allocate an index as a 'hwirq' from the table in the order
>> of application and set table value as interrupt source number. This 
>> hwirq
>> will be configured as its vector in the HT interrupt controller. For an
>> interrupt source, the validity period of the obtained hwirq will last 
>> until
>> the system reset
>>
>> This will be more conducive to fully utilizing existing vectors to
>> support more devices
>>
>> Signed-off-by: Baoqi Zhang <zhangbaoqi@loongson.cn>
>> Signed-off-by: Biao Dong <dongbiao@loongson.cn>
>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>> ---
>>   drivers/irqchip/irq-loongson-pch-pic.c | 77 ++++++++++++++++++++------
>>   1 file changed, 59 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-loongson-pch-pic.c 
>> b/drivers/irqchip/irq-loongson-pch-pic.c
>> index 63db8e2172e0..f17187641154 100644
>> --- a/drivers/irqchip/irq-loongson-pch-pic.c
>> +++ b/drivers/irqchip/irq-loongson-pch-pic.c
>> @@ -33,7 +33,7 @@
>>   #define PIC_COUNT        (PIC_COUNT_PER_REG * PIC_REG_COUNT)
>>   #define PIC_REG_IDX(irq_id)    ((irq_id) / PIC_COUNT_PER_REG)
>>   #define PIC_REG_BIT(irq_id)    ((irq_id) % PIC_COUNT_PER_REG)
>> -
>> +#define PIC_UNDEF_VECTOR    255
>>   static int nr_pics;
>>     struct pch_pic {
>> @@ -46,12 +46,19 @@ struct pch_pic {
>>       u32            saved_vec_en[PIC_REG_COUNT];
>>       u32            saved_vec_pol[PIC_REG_COUNT];
>>       u32            saved_vec_edge[PIC_REG_COUNT];
>> +    u8            table[PIC_COUNT];
>> +    int            inuse;
>>   };
>>     static struct pch_pic *pch_pic_priv[MAX_IO_PICS];
>>     struct fwnode_handle *pch_pic_handle[MAX_IO_PICS];
>>   +static inline u8 hwirq_to_bit(struct pch_pic *priv, int hirq)
>> +{
>> +    return priv->table[hirq];
>> +}
>> +
>>   static void pch_pic_bitset(struct pch_pic *priv, int offset, int bit)
>>   {
>>       u32 reg;
>> @@ -80,45 +87,47 @@ static void pch_pic_mask_irq(struct irq_data *d)
>>   {
>>       struct pch_pic *priv = irq_data_get_irq_chip_data(d);
>>   -    pch_pic_bitset(priv, PCH_PIC_MASK, d->hwirq);
>> +    pch_pic_bitset(priv, PCH_PIC_MASK, hwirq_to_bit(priv, d->hwirq));
>>       irq_chip_mask_parent(d);
>>   }
>>     static void pch_pic_unmask_irq(struct irq_data *d)
>>   {
>>       struct pch_pic *priv = irq_data_get_irq_chip_data(d);
>> +    int bit = hwirq_to_bit(priv, d->hwirq);
>>   -    writel(BIT(PIC_REG_BIT(d->hwirq)),
>> -            priv->base + PCH_PIC_CLR + PIC_REG_IDX(d->hwirq) * 4);
>> +    writel(BIT(PIC_REG_BIT(bit)),
>> +            priv->base + PCH_PIC_CLR + PIC_REG_IDX(bit) * 4);
>>         irq_chip_unmask_parent(d);
>> -    pch_pic_bitclr(priv, PCH_PIC_MASK, d->hwirq);
>> +    pch_pic_bitclr(priv, PCH_PIC_MASK, bit);
>>   }
>>     static int pch_pic_set_type(struct irq_data *d, unsigned int type)
>>   {
>>       struct pch_pic *priv = irq_data_get_irq_chip_data(d);
>> +    int bit = hwirq_to_bit(priv, d->hwirq);
>>       int ret = 0;
>>         switch (type) {
>>       case IRQ_TYPE_EDGE_RISING:
>> -        pch_pic_bitset(priv, PCH_PIC_EDGE, d->hwirq);
>> -        pch_pic_bitclr(priv, PCH_PIC_POL, d->hwirq);
>> +        pch_pic_bitset(priv, PCH_PIC_EDGE, bit);
>> +        pch_pic_bitclr(priv, PCH_PIC_POL, bit);
>>           irq_set_handler_locked(d, handle_edge_irq);
>>           break;
>>       case IRQ_TYPE_EDGE_FALLING:
>> -        pch_pic_bitset(priv, PCH_PIC_EDGE, d->hwirq);
>> -        pch_pic_bitset(priv, PCH_PIC_POL, d->hwirq);
>> +        pch_pic_bitset(priv, PCH_PIC_EDGE, bit);
>> +        pch_pic_bitset(priv, PCH_PIC_POL, bit);
>>           irq_set_handler_locked(d, handle_edge_irq);
>>           break;
>>       case IRQ_TYPE_LEVEL_HIGH:
>> -        pch_pic_bitclr(priv, PCH_PIC_EDGE, d->hwirq);
>> -        pch_pic_bitclr(priv, PCH_PIC_POL, d->hwirq);
>> +        pch_pic_bitclr(priv, PCH_PIC_EDGE, bit);
>> +        pch_pic_bitclr(priv, PCH_PIC_POL, bit);
>>           irq_set_handler_locked(d, handle_level_irq);
>>           break;
>>       case IRQ_TYPE_LEVEL_LOW:
>> -        pch_pic_bitclr(priv, PCH_PIC_EDGE, d->hwirq);
>> -        pch_pic_bitset(priv, PCH_PIC_POL, d->hwirq);
>> +        pch_pic_bitclr(priv, PCH_PIC_EDGE, bit);
>> +        pch_pic_bitset(priv, PCH_PIC_POL, bit);
>>           irq_set_handler_locked(d, handle_level_irq);
>>           break;
>>       default:
>> @@ -133,11 +142,12 @@ static void pch_pic_ack_irq(struct irq_data *d)
>>   {
>>       unsigned int reg;
>>       struct pch_pic *priv = irq_data_get_irq_chip_data(d);
>> +    int bit = hwirq_to_bit(priv, d->hwirq);
>>   -    reg = readl(priv->base + PCH_PIC_EDGE + PIC_REG_IDX(d->hwirq) 
>> * 4);
>> -    if (reg & BIT(PIC_REG_BIT(d->hwirq))) {
>> -        writel(BIT(PIC_REG_BIT(d->hwirq)),
>> -            priv->base + PCH_PIC_CLR + PIC_REG_IDX(d->hwirq) * 4);
>> +    reg = readl(priv->base + PCH_PIC_EDGE + PIC_REG_IDX(bit) * 4);
>> +    if (reg & BIT(PIC_REG_BIT(bit))) {
>> +        writel(BIT(PIC_REG_BIT(bit)),
>> +            priv->base + PCH_PIC_CLR + PIC_REG_IDX(bit) * 4);
>>       }
>>       irq_chip_ack_parent(d);
>>   }
>> @@ -159,6 +169,8 @@ static int pch_pic_domain_translate(struct 
>> irq_domain *d,
>>   {
>>       struct pch_pic *priv = d->host_data;
>>       struct device_node *of_node = to_of_node(fwspec->fwnode);
>> +    unsigned long flags;
>> +    int i;
>>         if (of_node) {
>>           if (fwspec->param_count < 2)
>> @@ -171,6 +183,27 @@ static int pch_pic_domain_translate(struct 
>> irq_domain *d,
>>               return -EINVAL;
>>             *hwirq = fwspec->param[0] - priv->gsi_base;
>> +
>> +        raw_spin_lock_irqsave(&priv->pic_lock, flags);
>> +        /* Check pic-table to confirm if the hwirq has been assigned */
>> +        for (i = 0; i < priv->inuse; i++) {
>> +            if (priv->table[i] == *hwirq) {
>> +                *hwirq = i;
>> +                break;
>> +            }
>> +        }
>> +        if (i == priv->inuse) {
>> +            /* Assign a new hwirq in pic-table */
>> +            if (priv->inuse >= PIC_COUNT) {
>> +                pr_err("pch-pic domain has no free vectors\n");
>> + raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
>> +                return -EINVAL;
>> +            }
>> +            priv->table[priv->inuse] = *hwirq;
>> +            *hwirq = priv->inuse++;
>> +        }
>> +        raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
>> +
>
> The patch fails the test on LS2K2000+FDT and does not boot the system 
> properly.
>
> The reason the test fails is that this part of the priv->table[] 
> initialization is needed for FDT as well, so I think it needs to be 
> put after the whole judgment, at the end of the function.
>
>
> Thanks.
>
> Binbin
>
>>           if (fwspec->param_count > 1)
>>               *type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
>>           else
>> @@ -194,6 +227,9 @@ static int pch_pic_alloc(struct irq_domain 
>> *domain, unsigned int virq,
>>       if (err)
>>           return err;
>>   +    /* Write vector ID */
>> +    writeb(priv->ht_vec_base + hwirq, priv->base + 
>> PCH_INT_HTVEC(hwirq_to_bit(priv, hwirq)));
>> +
>>       parent_fwspec.fwnode = domain->parent->fwnode;
>>       parent_fwspec.param_count = 1;
>>       parent_fwspec.param[0] = hwirq + priv->ht_vec_base;
>> @@ -222,7 +258,7 @@ static void pch_pic_reset(struct pch_pic *priv)
>>         for (i = 0; i < PIC_COUNT; i++) {
>>           /* Write vector ID */
>> -        writeb(priv->ht_vec_base + i, priv->base + PCH_INT_HTVEC(i));
>> +        writeb(priv->ht_vec_base + i, priv->base + 
>> PCH_INT_HTVEC(hwirq_to_bit(priv, i)));
>>           /* Hardcode route to HT0 Lo */
>>           writeb(1, priv->base + PCH_INT_ROUTE(i));
>>       }
>> @@ -284,6 +320,7 @@ static int pch_pic_init(phys_addr_t addr, 
>> unsigned long size, int vec_base,
>>               u32 gsi_base)
>>   {
>>       struct pch_pic *priv;
>> +    int i;
>>         priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>>       if (!priv)
>> @@ -294,6 +331,10 @@ static int pch_pic_init(phys_addr_t addr, 
>> unsigned long size, int vec_base,
>>       if (!priv->base)
>>           goto free_priv;
>>   +    priv->inuse = 0;
>> +    for (i = 0; i < PIC_COUNT; i++)
>> +        priv->table[i] = PIC_UNDEF_VECTOR;
>> +
>>       priv->ht_vec_base = vec_base;
>>       priv->vec_count = ((readq(priv->base) >> 48) & 0xff) + 1;
>>       priv->gsi_base = gsi_base;
>>


