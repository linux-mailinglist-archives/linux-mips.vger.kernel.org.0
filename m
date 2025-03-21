Return-Path: <linux-mips+bounces-8302-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2326DA6C5D6
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 23:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EB163AD173
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 22:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609831F3BB7;
	Fri, 21 Mar 2025 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="VG0XXhE9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E71F0E32;
	Fri, 21 Mar 2025 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742595624; cv=none; b=n2AJCDh4LwVE/4aBPKAUO+CdAQ6N+YQi/bq7rd2L6kspzAPIkT6ohPinn0B0QzQbLKmCEAPlQXPIH1TrRl5cOpsGXgtlQX/fXf5OFXTB9ZyZHeTcBwV6aVwU8HiRhV60xzhKQZn+cGZmsgpEJGeSWZUDkZIEMVFGc2k7PwZGkm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742595624; c=relaxed/simple;
	bh=cERLG2SsMOlLY8vbrFIcc/8oHjWKiOk7u8Vpb9yfte0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hi0xGH2bBYc6YLQChQc8P1HZeViGFooPl5Ry+6GdXvWbi4kzCyt6L1rkGQ5eqYI5dhzu3WDHrby8VolJsE6Vca2ovkZ4g8aBnow4Eu6feNNwME4m/4sBNZuz6aXiLWPuxij16szaSx0fIDjhqcZjz7IfEeuDxOe1mJAydiO5m0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=VG0XXhE9; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DB1A297811;
	Fri, 21 Mar 2025 23:20:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742595619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pLbJTC+Y5RBA9GZMvfRLdRvPlXV6lwZfciYMqHP1vww=;
	b=VG0XXhE9ZL7X7Vs996QCBcVkApJbsCbWNO/gXVnfvKhI3Jw+eMlWF5lYsM8DtvUXiLa/l9
	Ckxak02IJvno8CA05TFWuEsUzSoUSFDlY2Dvlm5NWlF5R4/MO/5XHDNuvXhR++Wx8Ja2PQ
	Cz+IeXhv/8g89T25gb6+wz3Hqgh1jCm2YRpVSVXPETJFtjuSq+weNs7mGntH2JgK7i+Taf
	HZlCH+QkWDcagt3XquexhsBOMyyTMW9o+SlFqKANNavYmlKTl0ayUOCnDQj6Fda+53PILI
	3p39dxBNM+939XsTw1z8Piq9/70y6D8YiAf/4R5OJOQYaO2Jy8ULgOU62XFzbg==
Message-ID: <ce72abfe-e822-48d6-9fc7-3cf9faffdc76@cjdns.fr>
Date: Fri, 21 Mar 2025 23:20:15 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v1 3/8] irqchip: Add EcoNet EN751221 INTC
To: Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-4-cjd@cjdns.fr> <87tt7m1664.ffs@tglx>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <87tt7m1664.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Thank you for this review.

On 21/03/2025 21:26, Thomas Gleixner wrote:
> Caleb!
>
> On Fri, Mar 21 2025 at 13:46, Caleb James DeLisle wrote:
>> ---
>> If CPU_MIPSR2_IRQ_EI / CPU_MIPSR2_IRQ_VI are enabled in the build, this
>> device switches to sending all interrupts as vectored - which IRQ_MIPS_CPU
>> is not prepared to handle. If anybody knows how to either disable this
>> behavior, or handle vectored interrupts without ugly code that breaks
>> cascading, please let me know and I will implement that and add
>> MIPS_MT_SMP in a future patchset.
> This must be addressed before this driver can be merged, but that's a
> topic for the MIPS wizards and out of my area of expertise, except for
> the obvious:
>
>      For a start you can exclude this platform from being enabled in
>      Kconfig when the EI/VI muck is enabled. That's what 'depends on' is
>      for,


Maybe my message was misleading everything has been tested and works correctly
on multiple SoCs because ECONET_SOC_EN751221 does not select EI/VI. Answering
this question will allow me to enable them, thus also getting MIPS_MT_SMP.

I could look at forbidding them in the driver, but I'm not sure that's appropriate as this
seems like more of an SoC issue than an INTC issue. But I'll follow your guidance.


>
> So this patch clearly should have been tagged with 'RFC'.

Given the patchset works correctly in testing, does this comment stand?

>
>> +static const struct econet_intc {
>> +	const struct irq_chip chip;
>> +
>> +	const struct irq_domain_ops domain_ops;
>> +} econet_intc;
> Please see
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

Thank you, I've been reading a lot of documentation but did not find that one.

>
> Aside of the coding style issues, what's the actual value of this
> struct? Is there anything which can't be done with:
>
> static const struct irq_chip econet_chip = {
> 	.name	= ....
> };
>
> static const struct irq_domain_ops econet_domain_ops = {
> 	.xlate	= ....
> };
>
> Which avoids the above forward struct declaration completely and does
> not need any forward declaration at all, neither for the chip nor for
> the domain.

My normal instinct lead me to minimize symbols on the top level scope and I
didn't realize I was doing it and should check what is typical in kernel code.
Will refactor.

>
>> +static struct {
>> +	void __iomem *membase;
>> +	u8 shadow_interrupts[INTC_IRQ_COUNT];
>> +} econet_intc_rai __ro_after_init;
>> +
>> +static DEFINE_RAW_SPINLOCK(irq_lock);
>> +
>> +static void econet_wreg(u32 reg, u32 val, u32 mask)
>> +{
>> +	unsigned long flags;
>> +	u32 v;
>> +
>> +	raw_spin_lock_irqsave(&irq_lock, flags);
> Please use
>
>         guard(raw_spinlock)(&irq_lock);
>
> You don't need irqsave when invoked from mask/unmask as the caller
> guarantees to have interrupts disabled. Then you only need to disable
> interrupts across the invocation from mask_all().
Thank you very much, I would not have thought of this.
>
>> +
>> +	v = ioread32(econet_intc_rai.membase + reg);
>> +	v &= ~mask;
>> +	v |= val & mask;
>> +	iowrite32(v, econet_intc_rai.membase + reg);
>> +
>> +	raw_spin_unlock_irqrestore(&irq_lock, flags);
>> +}
>> +
>> +static void econet_chmask(u32 hwirq, bool unmask)
>> +{
>> +	u32 reg;
>> +	u32 mask;
>> +	u32 bit;
>> +	u8 shadow;
> Search the same document for local variables.
Ok
>
>> +	shadow = econet_intc_rai.shadow_interrupts[hwirq];
>> +	if (WARN_ON_ONCE(shadow == INTC_IS_SHADOW))
>> +		return;
>> +	else if (shadow < INTC_NO_SHADOW && smp_processor_id() > 0)
>> +		hwirq = shadow;
> This is completely undocumented voodoo. Please add comments which
> explain this properly.

Sure thing, I often write and then remove comments because I don't want to be
judged for over-explaining. In fact, I love explaining.

>
>> +	if (hwirq >= 32) {
>> +		reg = REG_MASK1;
>> +		mask = BIT(hwirq - 32);
>> +	} else {
>> +		reg = REG_MASK0;
>> +		mask = BIT(hwirq);
>> +	}
>> +	bit = (unmask) ? mask : 0;
>> +	econet_wreg(reg, bit, mask);
>          econet_wreg(reg, unmask ? mask : 0, mask);
Ok
>
>> +}
>> +
>> +static void econet_intc_mask(struct irq_data *d)
>> +{
>> +	econet_chmask(d->hwirq, false);
>> +}
>> +
>> +static void econet_intc_unmask(struct irq_data *d)
>> +{
>> +	econet_chmask(d->hwirq, true);
>> +}
>> +
>> +static void econet_mask_all(void)
>> +{
> with a
>
>       guard(irq)();
>
> added here you spare the irqsave in the write function.
Ok, thanks.
>
>> +static void econet_intc_from_parent(struct irq_desc *desc)
>> +{
>> +	struct irq_chip *chip = irq_desc_get_chip(desc);
>> +	struct irq_domain *domain;
>> +	u32 pending0;
>> +	u32 pending1;
>> +
>> +	chained_irq_enter(chip, desc);
>> +
>> +	pending0 = ioread32(econet_intc_rai.membase + REG_PENDING0);
>> +	pending1 = ioread32(econet_intc_rai.membase + REG_PENDING1);
>> +
>> +	if (unlikely(!(pending0 | pending1))) {
>> +		spurious_interrupt();
>> +		goto out;
>> +	}
>> +
>> +	domain = irq_desc_get_handler_data(desc);
>> +
>> +	econet_intc_handle_pending(domain, pending0, 0);
>> +	econet_intc_handle_pending(domain, pending1, 32);
> 	if (likely(pending0 | pending1) {
>               domain = ...
>               ...
>          } else {
>               spurious_interrupt();
>          }
>
> Makes the goto go away _and_ sets the focus on the likely path and not
> on the visual clutter of the unlikely one.
Indeed, will fix.
>
>> +static int econet_intc_map(struct irq_domain *d, u32 irq, irq_hw_number_t hwirq)
>> +{
>> +	int ret;
>> +
>> +	if (hwirq >= INTC_IRQ_COUNT) {
>> +		pr_err("%s: hwirq %lu out of range\n", __func__, hwirq);
>> +		return -EINVAL;
>> +	} else if (econet_intc_rai.shadow_interrupts[hwirq] == INTC_IS_SHADOW) {
>> +		pr_err("%s: can't map hwirq %lu, it is a shadow interrupt\n",
>> +		       __func__, hwirq);
> No newline
If I understand correctly, you prefer:
.....interrupt\n", __func__, hwirq);
for a 96 char line?
>
>> +		return -EINVAL;
>> +	}
> Please put a newline here for readability instead.
Sure thing
>
>> +	if (econet_intc_rai.shadow_interrupts[hwirq] != INTC_NO_SHADOW) {
> This INTC_IS_SHADOW and INTC_NO_SHADOW logic is beyond confusing without
> comments. Three month down the road you will ask yourself what the hell
> this means.
I'll add comments and also try to make the code a little more self-evident in v2.
>
>> +		irq_set_chip_and_handler(
>> +			irq, &econet_intc.chip, handle_percpu_devid_irq);
> This line break is unreadable. See documentation.
>
> If at all this wants to be:
>
> 		irq_set_chip_and_handler(irq, &econet_intc.chip,
>                                           handle_percpu_devid_irq);
>
> But this fits nicely within 100 characters, so get rid of it completely.
My apologies. It was my intention, but instincts are sneaky and for some reason
checkpatch didn't catch it.
>
>> +		ret = irq_set_percpu_devid(irq);
> And please add a comment which explains why this magic shadow thing maps
> to percpu devid interrupts.
Sure thing
>
>> +		if (ret) {
>> +			pr_warn("%s: Failed irq_set_percpu_devid for %u: %d\n",
>> +				d->name, irq, ret);
>> +		}
>> +	} else {
>> +		irq_set_chip_and_handler(
>> +			irq, &econet_intc.chip, handle_level_irq);
> Same here.
Ok.
>
>> +	}
>> +	irq_set_chip_data(irq, NULL);
>> +	return 0;
>> +}
>> +
>> +static const struct econet_intc econet_intc = {
>> +	.chip = {
>> +		.name		= "en751221-intc",
>> +		.irq_unmask	= econet_intc_unmask,
>> +		.irq_mask	= econet_intc_mask,
>> +		.irq_mask_ack	= econet_intc_mask,
>> +	},
>> +	.domain_ops = {
>> +		.xlate = irq_domain_xlate_onecell,
>> +		.map = econet_intc_map,
> See documention.
I suppose this is tab alignment, but I will in any case make a point
of reading it all carefully.
>
>> +	},
>> +};
>> +
>> +static int __init get_shadow_interrupts(struct device_node *node)
>> +{
>> +	const char *field = "econet,shadow-interrupts";
>> +	int n_shadow_interrupts;
>> +	u32 *shadow_interrupts;
>> +
>> +	n_shadow_interrupts = of_property_count_u32_elems(node, field);
>> +	memset(econet_intc_rai.shadow_interrupts, INTC_NO_SHADOW,
>> +	       sizeof(econet_intc_rai.shadow_interrupts));
>> +	if (n_shadow_interrupts <= 0) {
>> +		return 0;
>> +	} else if (n_shadow_interrupts % 2) {
>> +		pr_err("%pOF: %s count is odd, ignoring\n", node, field);
>> +		return 0;
>> +	}
>> +	shadow_interrupts = kmalloc_array(n_shadow_interrupts, sizeof(u32),
>> +					  GFP_KERNEL);
> 	u32 *shadow_interrupts __free(kfree) =
>          	kmalloc_array(n_shadow_interrupts, sizeof(u32), GFP_KERNEL);
>
> Then the return paths don't have to care about this allocation at all.
Very nice, thank you.
>
>> +	if (!shadow_interrupts)
>> +		return -ENOMEM;
>> +	if (of_property_read_u32_array(node, field,
>> +				       shadow_interrupts, n_shadow_interrupts)
>> +	) {
> Your random choices of coding style and lack of visual seperation by
> empty newlines really make this hard to digest.
Apologies, will restructure.
>
>> +		pr_err("%pOF: Failed to read %s\n", node, field);
>> +		kfree(shadow_interrupts);
>> +		return -EINVAL;
>> +	}
> The __free() above will reduce this to
>
> 	if (of_property_read_u32_array(node, field, shadow_interrupts, n_shadow_interrupts)) {
> 		pr_err("%pOF: Failed to read %s\n", node, field);
>                  return -EINVAL;
> 	}
>
> and removes the kfree() at the end of the function.
Yes, I wasn't aware of __free() until now. Generally I love this type of thing
and use them wherever possible.
>
>> +	for (int i = 0; i < n_shadow_interrupts; i += 2) {
>> +		u32 shadow = shadow_interrupts[i + 1];
>> +		u32 target = shadow_interrupts[i];
>> +
>> +		if (shadow > INTC_IRQ_COUNT) {
>> +			pr_err("%pOF: %s[%d] shadow(%d) out of range\n",
>> +			       node, field, i, shadow);
> No line break.
Ok
>
>> +			continue;
>> +		}
> Newline
Ok (I will check for tightly packed if statements and fix all)
>
>> +		if (target >= INTC_IRQ_COUNT) {
>> +			pr_err("%pOF: %s[%d] target(%d) out of range\n",
>> +			       node, field, i + 1, target);
> No line break.
Ok
>
>> +			continue;
>> +		}
>> +		econet_intc_rai.shadow_interrupts[target] = shadow;
>> +		econet_intc_rai.shadow_interrupts[shadow] = INTC_IS_SHADOW;
> What the heck does any of this mean? This whole shadow magic is
> hideously incomprehensible. It's amazing that this whole file does not
> contain a single line of comment.
>
> Aside of that how is any of this sanity checked, i.e. so that there are
> no existing entries overwritten? I assume this blindly relies on the
> device tree being correct. Fine, but then please document it.
I had a nice comment on the oddities of these "shadow interrupts" which I
then moved into the DT binding and removed from the source. I'll happily
add it back and more.

As I said, I actually like explaining, I perhaps erroneously tried to match the
terseness of other kernel drivers.
>
>> +	}
>> +	kfree(shadow_interrupts);
>> +	return 0;
>> +}
>> +
>> +static int __init econet_intc_of_init(struct device_node *node, struct device_node *parent)
>> +{
>> +	int ret;
>> +	int irq;
>> +	struct resource res;
>> +	struct irq_domain *domain;
> Sigh.
Ok I see, reverse fir tree order.
>
>> +
>> +	domain = irq_domain_add_linear(
>> +		node, INTC_IRQ_COUNT,
>> +		&econet_intc.domain_ops, NULL);
> Finally my eyes bleed and my mental code pattern matching engine threw a
> garbage-overload exception.
>
> Seriously. Consistent coding style _and_ comments explaining the
> non-obvious parts of the code are not optional.
>
> You want me and others to review your code, so please have the courtesy
> to provide it in a digestable form.
>
> That spares us to point out the obvious, which can be looked up in
> documentation, and the frustration of staring at incomprehensible
> undocumented logic. And it spares you the frustration of getting your
> submission ripped into bits and pieces.

In case of any doubt, I wasn't trying to sneak bad code past you. I read a lot of
documentation, though clearly not enough / the right stuff.
When I sent this, I didn't know what was left that could be improved.


I'm going to read the documentation you linked, then re-read all of this patchset
with your comments in mind, and hopefully come back with something much
better. Lastly, I very much appreciate your taking the time.

Thanks,
Caleb

>
> Thanks,
>
>          tglx
>
>

