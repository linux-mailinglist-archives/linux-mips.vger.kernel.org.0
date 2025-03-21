Return-Path: <linux-mips+bounces-8287-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89322A6C421
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E08D41B60299
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF79222FF5F;
	Fri, 21 Mar 2025 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="21xndHW3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sJMzmLxv"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD528E7;
	Fri, 21 Mar 2025 20:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742588808; cv=none; b=EsZ1Sm4c3w0ReClcMVwBWOY36iE/eDWXZO1eH62UOo3v0VJ0Q//UvCiNhfUCciOby3Vk7YlSlUQOCDAVE4Ermnii3LzjVWHP37cUph4Alw/Bq+xJIgLQEOKAm+Taeo7PI4Zwzkiq53fagdIBVNuPv7qCBeVxGquaTsR8QtXqMTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742588808; c=relaxed/simple;
	bh=L8lr8UsPQFnfufQPsezb/8uYUTFH5prsIv+lF77JZh0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F6uBk17nogtXeJtYEbFSGFsgWhFSQeIZiFBon6oQ6BZLyS9KqjRhhWgSPxMCEq+9f2oBrhS+DiwVEsQZP1O/V7iNWFir8Wu0X3we/xIFhfvMinBv2/f9FpcY2FJSmxvE/Ng4B2Ltk2nWhQCGwB8s1mbHcvncjzf0ZB5WBD4lNhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=21xndHW3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sJMzmLxv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742588804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FEIu8yfryHkU97YYl2d9ohjO3n9rDF6WKFZrFM8wbQw=;
	b=21xndHW3KzbKdjxO3wba9CN+I38jcbAoT5rbFu/vlxpxZgs5VZ4E6f+eRUUcYUdCri+I4P
	biZeEWB6BwCO7/Weg4FlHK3bm/fHp+iEIgbhEEsJIOFsgEqYgj+E9YOJjq3cd7xpBwuL+q
	mgps1dhd4njpYHlxBZAch31q+VSBntF97zMI05coI9L0uz7M9vCAIvKJnVLVzT5ozaIUpb
	7uko816jjaeFrAM6ANQRYl4EXIHejypwCZ+W5yXpLwkXgEE3HekFo0q37DR1qHF8kDXURC
	L0swJDJ7sgmwiRGianKF3hOCtMiawrEnmuvg5NSS6//Mt95gwee/3+yUxqhv/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742588804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FEIu8yfryHkU97YYl2d9ohjO3n9rDF6WKFZrFM8wbQw=;
	b=sJMzmLxv6SZKV3CXWnMuk205M9QxzVDMRebzxDgxnUThuydZdGCn5rL18XN48b7oMtHwoR
	GG+FZxLQE98c+7AQ==
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, Caleb James DeLisle <cjd@cjdns.fr>
Subject: Re: [PATCH v1 3/8] irqchip: Add EcoNet EN751221 INTC
In-Reply-To: <20250321134633.2155141-4-cjd@cjdns.fr>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-4-cjd@cjdns.fr>
Date: Fri, 21 Mar 2025 21:26:43 +0100
Message-ID: <87tt7m1664.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Caleb!

On Fri, Mar 21 2025 at 13:46, Caleb James DeLisle wrote:
> ---
> If CPU_MIPSR2_IRQ_EI / CPU_MIPSR2_IRQ_VI are enabled in the build, this
> device switches to sending all interrupts as vectored - which IRQ_MIPS_CPU
> is not prepared to handle. If anybody knows how to either disable this
> behavior, or handle vectored interrupts without ugly code that breaks
> cascading, please let me know and I will implement that and add
> MIPS_MT_SMP in a future patchset.

This must be addressed before this driver can be merged, but that's a
topic for the MIPS wizards and out of my area of expertise, except for
the obvious:

    For a start you can exclude this platform from being enabled in
    Kconfig when the EI/VI muck is enabled. That's what 'depends on' is
    for,

So this patch clearly should have been tagged with 'RFC'.

> +static const struct econet_intc {
> +	const struct irq_chip chip;
> +
> +	const struct irq_domain_ops domain_ops;
> +} econet_intc;

Please see
https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

Aside of the coding style issues, what's the actual value of this
struct? Is there anything which can't be done with:

static const struct irq_chip econet_chip = {
	.name	= ....
};

static const struct irq_domain_ops econet_domain_ops = {
	.xlate	= ....
};

Which avoids the above forward struct declaration completely and does
not need any forward declaration at all, neither for the chip nor for
the domain.

> +static struct {
> +	void __iomem *membase;
> +	u8 shadow_interrupts[INTC_IRQ_COUNT];
> +} econet_intc_rai __ro_after_init;
> +
> +static DEFINE_RAW_SPINLOCK(irq_lock);
> +
> +static void econet_wreg(u32 reg, u32 val, u32 mask)
> +{
> +	unsigned long flags;
> +	u32 v;
> +
> +	raw_spin_lock_irqsave(&irq_lock, flags);

Please use

       guard(raw_spinlock)(&irq_lock);

You don't need irqsave when invoked from mask/unmask as the caller
guarantees to have interrupts disabled. Then you only need to disable
interrupts across the invocation from mask_all().

> +
> +	v = ioread32(econet_intc_rai.membase + reg);
> +	v &= ~mask;
> +	v |= val & mask;
> +	iowrite32(v, econet_intc_rai.membase + reg);
> +
> +	raw_spin_unlock_irqrestore(&irq_lock, flags);
> +}
> +
> +static void econet_chmask(u32 hwirq, bool unmask)
> +{
> +	u32 reg;
> +	u32 mask;
> +	u32 bit;
> +	u8 shadow;

Search the same document for local variables.

> +	shadow = econet_intc_rai.shadow_interrupts[hwirq];
> +	if (WARN_ON_ONCE(shadow == INTC_IS_SHADOW))
> +		return;
> +	else if (shadow < INTC_NO_SHADOW && smp_processor_id() > 0)
> +		hwirq = shadow;

This is completely undocumented voodoo. Please add comments which
explain this properly.

> +	if (hwirq >= 32) {
> +		reg = REG_MASK1;
> +		mask = BIT(hwirq - 32);
> +	} else {
> +		reg = REG_MASK0;
> +		mask = BIT(hwirq);
> +	}
> +	bit = (unmask) ? mask : 0;
> +	econet_wreg(reg, bit, mask);

        econet_wreg(reg, unmask ? mask : 0, mask);

> +}
> +
> +static void econet_intc_mask(struct irq_data *d)
> +{
> +	econet_chmask(d->hwirq, false);
> +}
> +
> +static void econet_intc_unmask(struct irq_data *d)
> +{
> +	econet_chmask(d->hwirq, true);
> +}
> +
> +static void econet_mask_all(void)
> +{

with a

     guard(irq)();

added here you spare the irqsave in the write function.

> +static void econet_intc_from_parent(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	struct irq_domain *domain;
> +	u32 pending0;
> +	u32 pending1;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	pending0 = ioread32(econet_intc_rai.membase + REG_PENDING0);
> +	pending1 = ioread32(econet_intc_rai.membase + REG_PENDING1);
> +
> +	if (unlikely(!(pending0 | pending1))) {
> +		spurious_interrupt();
> +		goto out;
> +	}
> +
> +	domain = irq_desc_get_handler_data(desc);
> +
> +	econet_intc_handle_pending(domain, pending0, 0);
> +	econet_intc_handle_pending(domain, pending1, 32);

	if (likely(pending0 | pending1) {
             domain = ...
             ...
        } else {
             spurious_interrupt();
        }

Makes the goto go away _and_ sets the focus on the likely path and not
on the visual clutter of the unlikely one.

> +static int econet_intc_map(struct irq_domain *d, u32 irq, irq_hw_number_t hwirq)
> +{
> +	int ret;
> +
> +	if (hwirq >= INTC_IRQ_COUNT) {
> +		pr_err("%s: hwirq %lu out of range\n", __func__, hwirq);
> +		return -EINVAL;
> +	} else if (econet_intc_rai.shadow_interrupts[hwirq] == INTC_IS_SHADOW) {
> +		pr_err("%s: can't map hwirq %lu, it is a shadow interrupt\n",
> +		       __func__, hwirq);

No newline

> +		return -EINVAL;
> +	}

Please put a newline here for readability instead.

> +	if (econet_intc_rai.shadow_interrupts[hwirq] != INTC_NO_SHADOW) {

This INTC_IS_SHADOW and INTC_NO_SHADOW logic is beyond confusing without
comments. Three month down the road you will ask yourself what the hell
this means.

> +		irq_set_chip_and_handler(
> +			irq, &econet_intc.chip, handle_percpu_devid_irq);

This line break is unreadable. See documentation.

If at all this wants to be:

		irq_set_chip_and_handler(irq, &econet_intc.chip,
                                         handle_percpu_devid_irq);

But this fits nicely within 100 characters, so get rid of it completely.

> +		ret = irq_set_percpu_devid(irq);

And please add a comment which explains why this magic shadow thing maps
to percpu devid interrupts.

> +		if (ret) {
> +			pr_warn("%s: Failed irq_set_percpu_devid for %u: %d\n",
> +				d->name, irq, ret);
> +		}
> +	} else {
> +		irq_set_chip_and_handler(
> +			irq, &econet_intc.chip, handle_level_irq);

Same here.

> +	}
> +	irq_set_chip_data(irq, NULL);
> +	return 0;
> +}
> +
> +static const struct econet_intc econet_intc = {
> +	.chip = {
> +		.name		= "en751221-intc",
> +		.irq_unmask	= econet_intc_unmask,
> +		.irq_mask	= econet_intc_mask,
> +		.irq_mask_ack	= econet_intc_mask,
> +	},
> +	.domain_ops = {
> +		.xlate = irq_domain_xlate_onecell,
> +		.map = econet_intc_map,

See documention.

> +	},
> +};
> +
> +static int __init get_shadow_interrupts(struct device_node *node)
> +{
> +	const char *field = "econet,shadow-interrupts";
> +	int n_shadow_interrupts;
> +	u32 *shadow_interrupts;
> +
> +	n_shadow_interrupts = of_property_count_u32_elems(node, field);
> +	memset(econet_intc_rai.shadow_interrupts, INTC_NO_SHADOW,
> +	       sizeof(econet_intc_rai.shadow_interrupts));
> +	if (n_shadow_interrupts <= 0) {
> +		return 0;
> +	} else if (n_shadow_interrupts % 2) {
> +		pr_err("%pOF: %s count is odd, ignoring\n", node, field);
> +		return 0;
> +	}
> +	shadow_interrupts = kmalloc_array(n_shadow_interrupts, sizeof(u32),
> +					  GFP_KERNEL);

	u32 *shadow_interrupts __free(kfree) =
        	kmalloc_array(n_shadow_interrupts, sizeof(u32), GFP_KERNEL);                                  

Then the return paths don't have to care about this allocation at all.

> +	if (!shadow_interrupts)
> +		return -ENOMEM;
> +	if (of_property_read_u32_array(node, field,
> +				       shadow_interrupts, n_shadow_interrupts)
> +	) {

Your random choices of coding style and lack of visual seperation by
empty newlines really make this hard to digest.

> +		pr_err("%pOF: Failed to read %s\n", node, field);
> +		kfree(shadow_interrupts);
> +		return -EINVAL;
> +	}

The __free() above will reduce this to

	if (of_property_read_u32_array(node, field, shadow_interrupts, n_shadow_interrupts)) {
		pr_err("%pOF: Failed to read %s\n", node, field);
                return -EINVAL;
	}

and removes the kfree() at the end of the function.

> +	for (int i = 0; i < n_shadow_interrupts; i += 2) {
> +		u32 shadow = shadow_interrupts[i + 1];
> +		u32 target = shadow_interrupts[i];
> +
> +		if (shadow > INTC_IRQ_COUNT) {
> +			pr_err("%pOF: %s[%d] shadow(%d) out of range\n",
> +			       node, field, i, shadow);

No line break.

> +			continue;
> +		}

Newline

> +		if (target >= INTC_IRQ_COUNT) {
> +			pr_err("%pOF: %s[%d] target(%d) out of range\n",
> +			       node, field, i + 1, target);

No line break.

> +			continue;
> +		}
> +		econet_intc_rai.shadow_interrupts[target] = shadow;
> +		econet_intc_rai.shadow_interrupts[shadow] = INTC_IS_SHADOW;

What the heck does any of this mean? This whole shadow magic is
hideously incomprehensible. It's amazing that this whole file does not
contain a single line of comment.

Aside of that how is any of this sanity checked, i.e. so that there are
no existing entries overwritten? I assume this blindly relies on the
device tree being correct. Fine, but then please document it.

> +	}
> +	kfree(shadow_interrupts);
> +	return 0;
> +}
> +
> +static int __init econet_intc_of_init(struct device_node *node, struct device_node *parent)
> +{
> +	int ret;
> +	int irq;
> +	struct resource res;
> +	struct irq_domain *domain;

Sigh.

> +
> +	domain = irq_domain_add_linear(
> +		node, INTC_IRQ_COUNT,
> +		&econet_intc.domain_ops, NULL);

Finally my eyes bleed and my mental code pattern matching engine threw a
garbage-overload exception.

Seriously. Consistent coding style _and_ comments explaining the
non-obvious parts of the code are not optional.

You want me and others to review your code, so please have the courtesy
to provide it in a digestable form.

That spares us to point out the obvious, which can be looked up in
documentation, and the frustration of staring at incomprehensible
undocumented logic. And it spares you the frustration of getting your
submission ripped into bits and pieces.

Thanks,

        tglx



