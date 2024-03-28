Return-Path: <linux-mips+bounces-2353-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D10881C5F
	for <lists+linux-mips@lfdr.de>; Thu, 21 Mar 2024 07:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ACD22831E7
	for <lists+linux-mips@lfdr.de>; Thu, 21 Mar 2024 06:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68963A8D2;
	Thu, 21 Mar 2024 06:10:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6413A883C;
	Thu, 21 Mar 2024 06:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711001450; cv=none; b=pEWJagIQgau4py2USb+qxrHLTMpLiQmMVPtfRM08d/fAdZ+98Bn49nZ7lVDwxFIlGGwL74l092eFJYNuv4MvXmnof9mC4kCUnm+0TMHkiDURreUq8E4hPzOPm30zVk21s5ZW6K3219V159TV6ceDVZIJxNBQ/7zVua/M15v7nLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711001450; c=relaxed/simple;
	bh=BWWcpi+brZkeF3rkw6AbLiVrne4rOa+QZCgSvrlZ2GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5L2l+63EMoWlwegNi2QsCAHIthdfNqXbdpFAr/eCbmT57KT7Buk5lAURSzTWMuSI9HCbt7eKJGoYK2FDzjgCWvwmikspt2ykKpJ4KjTBpe0+2P+lnjVQFm6wLnmwP75++edvUtyasimrWW+/uEd5H7xSItsZjkWMTGA/rh9e/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.198])
	by gateway (Coremail) with SMTP id _____8DxdfFiz_tl5rIbAA--.793S3;
	Thu, 21 Mar 2024 14:10:42 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.109.198])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxvhNgz_tlrYZfAA--.65312S3;
	Thu, 21 Mar 2024 14:10:41 +0800 (CST)
Message-ID: <24131107-1e45-415a-b731-c1f97a231e22@loongson.cn>
Date: Thu, 21 Mar 2024 14:10:39 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] irqchip/loongson-pch-pic: Update interrupt
 registration policy
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, tglx@linutronix.de
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Baoqi Zhang <zhangbaoqi@loongson.cn>, Biao Dong <dongbiao@loongson.cn>,
 zhoubb.aaron@gmail.com
References: <20240316082141.26139-1-zhangtianyang@loongson.cn>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20240316082141.26139-1-zhangtianyang@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxvhNgz_tlrYZfAA--.65312S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKw1DJF1DXr47XF4DtFyUCFX_yoW3Ar48pF
	WUJ39xCFWUJr1jq3yxZw4UZryfZFyIvay09a1Sy34Iq3sFvrykGF1xur9rAa18JFWDZFsx
	Z398CryF9anrJFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

Hi Tianyang:

On 2024/3/16 16:21, Tianyang Zhang wrote:
> From: Baoqi Zhang <zhangbaoqi@loongson.cn>
>
> This patch remove the fixed mapping between the 7A interrupt source
> and the HT interrupt vector, and replaced it with a dynamically
> allocated approach.
>
> We introduce a mapping table in struct pch_pic, where each interrupt
> source will allocate an index as a 'hwirq' from the table in the order
> of application and set table value as interrupt source number. This hwirq
> will be configured as its vector in the HT interrupt controller. For an
> interrupt source, the validity period of the obtained hwirq will last until
> the system reset
>
> This will be more conducive to fully utilizing existing vectors to
> support more devices
>
> Signed-off-by: Baoqi Zhang <zhangbaoqi@loongson.cn>
> Signed-off-by: Biao Dong <dongbiao@loongson.cn>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>   drivers/irqchip/irq-loongson-pch-pic.c | 77 ++++++++++++++++++++------
>   1 file changed, 59 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
> index 63db8e2172e0..f17187641154 100644
> --- a/drivers/irqchip/irq-loongson-pch-pic.c
> +++ b/drivers/irqchip/irq-loongson-pch-pic.c
> @@ -33,7 +33,7 @@
>   #define PIC_COUNT		(PIC_COUNT_PER_REG * PIC_REG_COUNT)
>   #define PIC_REG_IDX(irq_id)	((irq_id) / PIC_COUNT_PER_REG)
>   #define PIC_REG_BIT(irq_id)	((irq_id) % PIC_COUNT_PER_REG)
> -
> +#define PIC_UNDEF_VECTOR	255
>   static int nr_pics;
>   
>   struct pch_pic {
> @@ -46,12 +46,19 @@ struct pch_pic {
>   	u32			saved_vec_en[PIC_REG_COUNT];
>   	u32			saved_vec_pol[PIC_REG_COUNT];
>   	u32			saved_vec_edge[PIC_REG_COUNT];
> +	u8			table[PIC_COUNT];
> +	int			inuse;
>   };
>   
>   static struct pch_pic *pch_pic_priv[MAX_IO_PICS];
>   
>   struct fwnode_handle *pch_pic_handle[MAX_IO_PICS];
>   
> +static inline u8 hwirq_to_bit(struct pch_pic *priv, int hirq)
> +{
> +	return priv->table[hirq];
> +}
> +
>   static void pch_pic_bitset(struct pch_pic *priv, int offset, int bit)
>   {
>   	u32 reg;
> @@ -80,45 +87,47 @@ static void pch_pic_mask_irq(struct irq_data *d)
>   {
>   	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
>   
> -	pch_pic_bitset(priv, PCH_PIC_MASK, d->hwirq);
> +	pch_pic_bitset(priv, PCH_PIC_MASK, hwirq_to_bit(priv, d->hwirq));
>   	irq_chip_mask_parent(d);
>   }
>   
>   static void pch_pic_unmask_irq(struct irq_data *d)
>   {
>   	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
> +	int bit = hwirq_to_bit(priv, d->hwirq);
>   
> -	writel(BIT(PIC_REG_BIT(d->hwirq)),
> -			priv->base + PCH_PIC_CLR + PIC_REG_IDX(d->hwirq) * 4);
> +	writel(BIT(PIC_REG_BIT(bit)),
> +			priv->base + PCH_PIC_CLR + PIC_REG_IDX(bit) * 4);
>   
>   	irq_chip_unmask_parent(d);
> -	pch_pic_bitclr(priv, PCH_PIC_MASK, d->hwirq);
> +	pch_pic_bitclr(priv, PCH_PIC_MASK, bit);
>   }
>   
>   static int pch_pic_set_type(struct irq_data *d, unsigned int type)
>   {
>   	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
> +	int bit = hwirq_to_bit(priv, d->hwirq);
>   	int ret = 0;
>   
>   	switch (type) {
>   	case IRQ_TYPE_EDGE_RISING:
> -		pch_pic_bitset(priv, PCH_PIC_EDGE, d->hwirq);
> -		pch_pic_bitclr(priv, PCH_PIC_POL, d->hwirq);
> +		pch_pic_bitset(priv, PCH_PIC_EDGE, bit);
> +		pch_pic_bitclr(priv, PCH_PIC_POL, bit);
>   		irq_set_handler_locked(d, handle_edge_irq);
>   		break;
>   	case IRQ_TYPE_EDGE_FALLING:
> -		pch_pic_bitset(priv, PCH_PIC_EDGE, d->hwirq);
> -		pch_pic_bitset(priv, PCH_PIC_POL, d->hwirq);
> +		pch_pic_bitset(priv, PCH_PIC_EDGE, bit);
> +		pch_pic_bitset(priv, PCH_PIC_POL, bit);
>   		irq_set_handler_locked(d, handle_edge_irq);
>   		break;
>   	case IRQ_TYPE_LEVEL_HIGH:
> -		pch_pic_bitclr(priv, PCH_PIC_EDGE, d->hwirq);
> -		pch_pic_bitclr(priv, PCH_PIC_POL, d->hwirq);
> +		pch_pic_bitclr(priv, PCH_PIC_EDGE, bit);
> +		pch_pic_bitclr(priv, PCH_PIC_POL, bit);
>   		irq_set_handler_locked(d, handle_level_irq);
>   		break;
>   	case IRQ_TYPE_LEVEL_LOW:
> -		pch_pic_bitclr(priv, PCH_PIC_EDGE, d->hwirq);
> -		pch_pic_bitset(priv, PCH_PIC_POL, d->hwirq);
> +		pch_pic_bitclr(priv, PCH_PIC_EDGE, bit);
> +		pch_pic_bitset(priv, PCH_PIC_POL, bit);
>   		irq_set_handler_locked(d, handle_level_irq);
>   		break;
>   	default:
> @@ -133,11 +142,12 @@ static void pch_pic_ack_irq(struct irq_data *d)
>   {
>   	unsigned int reg;
>   	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
> +	int bit = hwirq_to_bit(priv, d->hwirq);
>   
> -	reg = readl(priv->base + PCH_PIC_EDGE + PIC_REG_IDX(d->hwirq) * 4);
> -	if (reg & BIT(PIC_REG_BIT(d->hwirq))) {
> -		writel(BIT(PIC_REG_BIT(d->hwirq)),
> -			priv->base + PCH_PIC_CLR + PIC_REG_IDX(d->hwirq) * 4);
> +	reg = readl(priv->base + PCH_PIC_EDGE + PIC_REG_IDX(bit) * 4);
> +	if (reg & BIT(PIC_REG_BIT(bit))) {
> +		writel(BIT(PIC_REG_BIT(bit)),
> +			priv->base + PCH_PIC_CLR + PIC_REG_IDX(bit) * 4);
>   	}
>   	irq_chip_ack_parent(d);
>   }
> @@ -159,6 +169,8 @@ static int pch_pic_domain_translate(struct irq_domain *d,
>   {
>   	struct pch_pic *priv = d->host_data;
>   	struct device_node *of_node = to_of_node(fwspec->fwnode);
> +	unsigned long flags;
> +	int i;
>   
>   	if (of_node) {
>   		if (fwspec->param_count < 2)
> @@ -171,6 +183,27 @@ static int pch_pic_domain_translate(struct irq_domain *d,
>   			return -EINVAL;
>   
>   		*hwirq = fwspec->param[0] - priv->gsi_base;
> +
> +		raw_spin_lock_irqsave(&priv->pic_lock, flags);
> +		/* Check pic-table to confirm if the hwirq has been assigned */
> +		for (i = 0; i < priv->inuse; i++) {
> +			if (priv->table[i] == *hwirq) {
> +				*hwirq = i;
> +				break;
> +			}
> +		}
> +		if (i == priv->inuse) {
> +			/* Assign a new hwirq in pic-table */
> +			if (priv->inuse >= PIC_COUNT) {
> +				pr_err("pch-pic domain has no free vectors\n");
> +				raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
> +				return -EINVAL;
> +			}
> +			priv->table[priv->inuse] = *hwirq;
> +			*hwirq = priv->inuse++;
> +		}
> +		raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
> +

The patch fails the test on LS2K2000+FDT and does not boot the system 
properly.

The reason the test fails is that this part of the priv->table[] 
initialization is needed for FDT as well, so I think it needs to be put 
after the whole judgment, at the end of the function.


Thanks.

Binbin

>   		if (fwspec->param_count > 1)
>   			*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
>   		else
> @@ -194,6 +227,9 @@ static int pch_pic_alloc(struct irq_domain *domain, unsigned int virq,
>   	if (err)
>   		return err;
>   
> +	/* Write vector ID */
> +	writeb(priv->ht_vec_base + hwirq, priv->base + PCH_INT_HTVEC(hwirq_to_bit(priv, hwirq)));
> +
>   	parent_fwspec.fwnode = domain->parent->fwnode;
>   	parent_fwspec.param_count = 1;
>   	parent_fwspec.param[0] = hwirq + priv->ht_vec_base;
> @@ -222,7 +258,7 @@ static void pch_pic_reset(struct pch_pic *priv)
>   
>   	for (i = 0; i < PIC_COUNT; i++) {
>   		/* Write vector ID */
> -		writeb(priv->ht_vec_base + i, priv->base + PCH_INT_HTVEC(i));
> +		writeb(priv->ht_vec_base + i, priv->base + PCH_INT_HTVEC(hwirq_to_bit(priv, i)));
>   		/* Hardcode route to HT0 Lo */
>   		writeb(1, priv->base + PCH_INT_ROUTE(i));
>   	}
> @@ -284,6 +320,7 @@ static int pch_pic_init(phys_addr_t addr, unsigned long size, int vec_base,
>   			u32 gsi_base)
>   {
>   	struct pch_pic *priv;
> +	int i;
>   
>   	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -294,6 +331,10 @@ static int pch_pic_init(phys_addr_t addr, unsigned long size, int vec_base,
>   	if (!priv->base)
>   		goto free_priv;
>   
> +	priv->inuse = 0;
> +	for (i = 0; i < PIC_COUNT; i++)
> +		priv->table[i] = PIC_UNDEF_VECTOR;
> +
>   	priv->ht_vec_base = vec_base;
>   	priv->vec_count = ((readq(priv->base) >> 48) & 0xff) + 1;
>   	priv->gsi_base = gsi_base;
>


