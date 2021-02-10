Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC2231650C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 12:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhBJLU5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 06:20:57 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52499 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231327AbhBJLSh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 06:18:37 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 5D0835C0107;
        Wed, 10 Feb 2021 06:17:48 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Wed, 10 Feb 2021 06:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=0fdKeLd8QX+rSLuXLX+b0CYKjNLxAm1
        HABjyUxFi+3w=; b=r9wzb11hpbRv2mFi5VAl6HORCjqgJsPE4Ru29lO7HBJQvnn
        zUZaTDba9nAjH89ih7Iygzt8f356vDDvTKsfkn2z+/v3hM/RuHf0MgQu7a7pi5uc
        xfqbAB8rgHCbsV41mVIpmoU3kMY9vCxwOx9wd7CRIU4x/PUvSZJ8S1uPy2lh2WtM
        aFVzXcvEGLUocJ+oQfRU9jr4w6T/SmSDGR9xR3KG7msBeSZQ1+Y+QJTnIP2AGmOZ
        uT3OUzHNVOdge63eewEvEkOhMqXHahjAHKNHFqUs3tvRbV/Jo+idp5Jni41YX2KF
        22l+8iGpgp18IOxxHKQ7TAA/dfKYkgSWzHBGa2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0fdKeL
        d8QX+rSLuXLX+b0CYKjNLxAm1HABjyUxFi+3w=; b=FSha391jRNHCjkdYxY1mJ3
        9n10XowBVDosqEttfe1Fp50KH4AM2r1kGfFupyszMuO3eSBmJZ68I8hsy2S++GN2
        eM3o5MflHNb/55Khcqz1uGs49x0w1zZp+QlnWEM4u/iZoun9pOM9Lxf3AR5wSGk0
        nzG8KYdpfpIXdAi9D1ATjrWm5otuQn81YWjVsNZ6AEBGgyUkz07Xu2mteY5ix7XG
        1vr4wsAy2+5v7ap8yjhuQMJB690yx03txnngodWG4MJ9jm1cIgqqAdz3dJ5VRZiu
        KHrrDbKYlpTokoaJJC7wuw/a/YV1Py5QxSsSSNTvzsmkw+oZsEukxCV0G/FrCAhQ
        ==
X-ME-Sender: <xms:28AjYAeYCRn1CJieUAt8bL3nO5fDeM3fyF8UrgkD8hFrs_7zL_P85Q>
    <xme:28AjYCMhFsh4yL0B0HMA8tbi8FobYzlKb5vdbz-AmaFM6ICD8c_Rb3PkL1_LN-jQZ
    i_ueWxpqAytuX2WkwU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepkeelheethfehffdttdelieevfeeiheeuudeifeeugeeuieel
    iedtueejheehhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:28AjYBjm1fCTccv1x94xvBntvuThFZU7CrIBvnNWXAnHly6oB5zMxA>
    <xmx:28AjYF_0z-rIeqkeoiRsOvNp-UMVeTZg1RFSjLMxjJk11zec3u7kAg>
    <xmx:28AjYMsq8LVThNPaJAmVVCCaLMiaHckSKoEExwrOFKzCCxvIyOKlVw>
    <xmx:3MAjYB86JhDFUz-NXPSz5Hfo-Wwrg9v3uwuBoD71tyH4njtbj9yHkg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 10868130005D; Wed, 10 Feb 2021 06:17:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <dffca8b3-8850-4cf4-9e69-8f2544695199@www.fastmail.com>
In-Reply-To: <20210209093224.7085-6-zhangqing@loongson.cn>
References: <20210209093224.7085-1-zhangqing@loongson.cn>
 <20210209093224.7085-6-zhangqing@loongson.cn>
Date:   Wed, 10 Feb 2021 19:17:25 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Qing Zhang" <zhangqing@loongson.cn>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Marc Zyngier" <maz@kernel.org>,
        "Huacai Chen" <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        "Xingxing Su" <suxingxing@loongson.cn>
Subject: Re: [PATCH 5/6] irqchip/loongson-liointc: irqchip add 2.0 version.
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Tue, Feb 9, 2021, at 5:32 PM, Qing Zhang wrote:
> Add IO interrupt controller support for Loongson 2k1000, different
> from the 3a series is that 2K1000 has 64 interrupt sources, 0-31
> correspond to the device tree liointc0 device node, and the other
> correspond to liointc1 node.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> Signed-off-by: Xingxing Su <suxingxing@loongson.cn>

You should document dt binding changes.

Thanks

- Jiaxun

> ---
>  drivers/irqchip/irq-loongson-liointc.c | 55 +++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-loongson-liointc.c 
> b/drivers/irqchip/irq-loongson-liointc.c
> index 9ed1bc473663..496e73bde597 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -20,6 +20,7 @@
>  
>  #define LIOINTC_CHIP_IRQ	32
>  #define LIOINTC_NUM_PARENT 4
> +#define LIOINTC_NUM_CORES	4
>  
>  #define LIOINTC_INTC_CHIP_START	0x20
>  
> @@ -42,6 +43,7 @@ struct liointc_handler_data {
>  struct liointc_priv {
>  	struct irq_chip_generic		*gc;
>  	struct liointc_handler_data	handler[LIOINTC_NUM_PARENT];
> +	void __iomem			*core_isr[LIOINTC_NUM_CORES];
>  	u8				map_cache[LIOINTC_CHIP_IRQ];
>  	bool				has_lpc_irq_errata;
>  };
> @@ -51,11 +53,12 @@ static void liointc_chained_handle_irq(struct 
> irq_desc *desc)
>  	struct liointc_handler_data *handler = 
> irq_desc_get_handler_data(desc);
>  	struct irq_chip *chip = irq_desc_get_chip(desc);
>  	struct irq_chip_generic *gc = handler->priv->gc;
> +	int core = get_ebase_cpunum() % LIOINTC_NUM_CORES;
>  	u32 pending;
>  
>  	chained_irq_enter(chip, desc);
>  
> -	pending = readl(gc->reg_base + LIOINTC_REG_INTC_STATUS);
> +	pending = readl(handler->priv->core_isr[core]);
>  
>  	if (!pending) {
>  		/* Always blame LPC IRQ if we have that bug */
> @@ -141,6 +144,15 @@ static void liointc_resume(struct irq_chip_generic *gc)
>  }
>  
>  static const char * const parent_names[] = {"int0", "int1", "int2", "int3"};
> +static const char * const core_reg_names[] = {"isr0", "isr1", "isr2", "isr3"};
> +
> +static void __iomem *liointc_get_reg_byname(struct device_node *node,
> +						const char *name)
> +{
> +	int index = of_property_match_string(node, "reg-names", name);
> +
> +	return of_iomap(node, index);
> +}
>  
>  int __init liointc_of_init(struct device_node *node,
>  				struct device_node *parent)
> @@ -159,10 +171,28 @@ int __init liointc_of_init(struct device_node *node,
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	base = of_iomap(node, 0);
> -	if (!base) {
> -		err = -ENODEV;
> -		goto out_free_priv;
> +	if (of_device_is_compatible(node, "loongson,liointc-2.0")) {
> +		base = liointc_get_reg_byname(node, "main");
> +		if (!base) {
> +			err = -ENODEV;
> +			goto out_free_priv;
> +		}
> +		for (i = 0; i < LIOINTC_NUM_CORES; i++) {
> +			priv->core_isr[i] =
> +				liointc_get_reg_byname(node, core_reg_names[i]);
> +		}
> +		if (!priv->core_isr[0]) {
> +			err = -ENODEV;
> +			goto out_iounmap_base;
> +		}
> +	} else {
> +		base = of_iomap(node, 0);
> +		if (!base) {
> +			err = -ENODEV;
> +			goto out_free_priv;
> +		}
> +		for (i = 0; i < LIOINTC_NUM_CORES; i++)
> +			priv->core_isr[i] = base + LIOINTC_REG_INTC_STATUS;
>  	}
>  
>  	for (i = 0; i < LIOINTC_NUM_PARENT; i++) {
> @@ -172,7 +202,7 @@ int __init liointc_of_init(struct device_node *node,
>  	}
>  	if (!have_parent) {
>  		err = -ENODEV;
> -		goto out_iounmap;
> +		goto out_iounmap_isr;
>  	}
>  
>  	sz = of_property_read_variable_u32_array(node,
> @@ -183,7 +213,7 @@ int __init liointc_of_init(struct device_node *node,
>  	if (sz < 4) {
>  		pr_err("loongson-liointc: No parent_int_map\n");
>  		err = -ENODEV;
> -		goto out_iounmap;
> +		goto out_iounmap_isr;
>  	}
>  
>  	for (i = 0; i < LIOINTC_NUM_PARENT; i++)
> @@ -195,7 +225,7 @@ int __init liointc_of_init(struct device_node *node,
>  	if (!domain) {
>  		pr_err("loongson-liointc: cannot add IRQ domain\n");
>  		err = -EINVAL;
> -		goto out_iounmap;
> +		goto out_iounmap_isr;
>  	}
>  
>  	err = irq_alloc_domain_generic_chips(domain, 32, 1,
> @@ -260,7 +290,13 @@ int __init liointc_of_init(struct device_node *node,
>  
>  out_free_domain:
>  	irq_domain_remove(domain);
> -out_iounmap:
> +out_iounmap_isr:
> +	for (i = 0; i < LIOINTC_NUM_CORES; i++) {
> +		if (!priv->core_isr[i])
> +			continue;
> +		iounmap(priv->core_isr[i]);
> +	}
> +out_iounmap_base:
>  	iounmap(base);
>  out_free_priv:
>  	kfree(priv);
> @@ -270,3 +306,4 @@ int __init liointc_of_init(struct device_node *node,
>  
>  IRQCHIP_DECLARE(loongson_liointc_1_0, "loongson,liointc-1.0", 
> liointc_of_init);
>  IRQCHIP_DECLARE(loongson_liointc_1_0a, "loongson,liointc-1.0a", 
> liointc_of_init);
> +IRQCHIP_DECLARE(loongson_liointc_2_0, "loongson,liointc-2.0", 
> liointc_of_init);
> -- 
> 2.20.1
> 
>

-- 
- Jiaxun
