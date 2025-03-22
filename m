Return-Path: <linux-mips+bounces-8308-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEFEA6C843
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 09:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E19F463607
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 08:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A829A1922C0;
	Sat, 22 Mar 2025 08:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xXcqbj0X";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bOx4GZyd"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BFE35947;
	Sat, 22 Mar 2025 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742631654; cv=none; b=n2vPBJ+qJX8Pl+paDEoKpUh4liTsGVVngG5lB1UYvS22WIBzyCtN7iPpIYqjYJCkC2DNtA8D7s7RFLcIsE8x8nH/LN4SoM+K0/Ec0HTSSrDDBk+oHdwid6cH5bUXfQaeXgDsUuXmJx6hJdZpURBvDQNHObaYQhoqIJ1Mk5yZwqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742631654; c=relaxed/simple;
	bh=ljM+15jZBa7WIlkLmPXRJVAaKt3T1zsiNAikYNJyo18=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pPsrTzJkIhTomxz8lCGr6fi86Rx4zcjEqf+09Cj0DZKh7dPjf/XRgt09DfUKrrZOWgx5wO19PhIomlY2Ijo0Ib/P/bMNPYnqr4I3pD8nGXNlH50m8PTmxw3M1CwCfTwlMo++4l1HXWxsa9XSYASGGbbv0oHF12/tLE1V+QX0pXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xXcqbj0X; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bOx4GZyd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742631651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vX3BOi74PvX4kfihHfQZdKLL1ZfIRDEjSR1PAGGmBW4=;
	b=xXcqbj0XtAiz0HyXaDtJdq2je/svPI4E6gTOkJECRi3tvMEunyczYg4vcOoAduxyKdAL3R
	CRjOXQIi0YC2adq1ntSA91m64PVf+YGGP1sPJSCxkKCDg4/GTs1NKXfmziDUGNA+DSFDVI
	Q1A1icZWBbmSzuqbBLTqBJnl5e73vkGKz6p8fLbONfwazaUl0Tpc6mPgeHLQBls9YWdnwN
	aul+z6HtTFgeQzfmOXBmC/w1r9rp1j7eFbhQuNastzXtqvHwMf5i4hwDGLPtOD0aMikJHs
	uL48n/wL76EXEFT9M4YsJPGexC38M8jpTHnUCh0+3jbMs69cMshJgLLczUY/gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742631651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vX3BOi74PvX4kfihHfQZdKLL1ZfIRDEjSR1PAGGmBW4=;
	b=bOx4GZydX5giUKAbKX8dkzpgMLXku6/jPtR04RVYDuzvyCKHwCw8ad8WoISPuc3DFZYESE
	zzCjy4C6mAhP2jBg==
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu
Subject: Re: [PATCH v1 3/8] irqchip: Add EcoNet EN751221 INTC
In-Reply-To: <ce72abfe-e822-48d6-9fc7-3cf9faffdc76@cjdns.fr>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-4-cjd@cjdns.fr> <87tt7m1664.ffs@tglx>
 <ce72abfe-e822-48d6-9fc7-3cf9faffdc76@cjdns.fr>
Date: Sat, 22 Mar 2025 09:20:50 +0100
Message-ID: <87bjtt1nod.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Mar 21 2025 at 23:20, Caleb James DeLisle wrote:
> On 21/03/2025 21:26, Thomas Gleixner wrote:
>> Caleb!
>>
>> On Fri, Mar 21 2025 at 13:46, Caleb James DeLisle wrote:
>>> ---
>>> If CPU_MIPSR2_IRQ_EI / CPU_MIPSR2_IRQ_VI are enabled in the build, this
>>> device switches to sending all interrupts as vectored - which IRQ_MIPS_CPU
>>> is not prepared to handle. If anybody knows how to either disable this
>>> behavior, or handle vectored interrupts without ugly code that breaks
>>> cascading, please let me know and I will implement that and add
>>> MIPS_MT_SMP in a future patchset.
>> This must be addressed before this driver can be merged, but that's a
>> topic for the MIPS wizards and out of my area of expertise, except for
>> the obvious:
>>
>>      For a start you can exclude this platform from being enabled in
>>      Kconfig when the EI/VI muck is enabled. That's what 'depends on' is
>>      for,
>
> Maybe my message was misleading everything has been tested and works correctly
> on multiple SoCs because ECONET_SOC_EN751221 does not select EI/VI. Answering
> this question will allow me to enable them, thus also getting
> MIPS_MT_SMP.

It does not select it, but it can be enabled independently or through
some other magic config knob, right? And if it gets enabled, then it
does not work, right?

> I could look at forbidding them in the driver, but I'm not sure that's
> appropriate as this seems like more of an SoC issue than an INTC
> issue. But I'll follow your guidance.

What's not appropriate? If it does not work, then it's very appropriate
to do

   config ECONET
          depends on !EI && !VI

on the principle of least surprise, no?

>> So this patch clearly should have been tagged with 'RFC'.
>
> Given the patchset works correctly in testing, does this comment
> stand?

Until the EI/VI issue is resolved so that it either works or cannot
happen.

>>> +static int econet_intc_map(struct irq_domain *d, u32 irq, irq_hw_number_t hwirq)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (hwirq >= INTC_IRQ_COUNT) {
>>> +		pr_err("%s: hwirq %lu out of range\n", __func__, hwirq);
>>> +		return -EINVAL;
>>> +	} else if (econet_intc_rai.shadow_interrupts[hwirq] == INTC_IS_SHADOW) {
>>> +		pr_err("%s: can't map hwirq %lu, it is a shadow interrupt\n",
>>> +		       __func__, hwirq);
>> No newline
> If I understand correctly, you prefer:
> .....interrupt\n", __func__, hwirq);
> for a 96 char line?

You have 100 characters in drivers/irqchip/

>>> +	.domain_ops = {
>>> +		.xlate = irq_domain_xlate_onecell,
>>> +		.map = econet_intc_map,
>> See documention.
> I suppose this is tab alignment, but I will in any case make a point
> of reading it all carefully.

Yes. The aligned tabular view is way simpler to read and parse. Reading
is based on pattern recognition. Irregular patterns disturb the reading
flow, which means the focus is shifted from understanding to decoding
the irregular pattern.

> In case of any doubt, I wasn't trying to sneak bad code past you.

I did not assume malice here at all.

Thanks,

        tglx

