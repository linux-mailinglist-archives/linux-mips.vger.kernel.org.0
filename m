Return-Path: <linux-mips+bounces-8312-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0ABA6CDCA
	for <lists+linux-mips@lfdr.de>; Sun, 23 Mar 2025 04:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DDC53B921C
	for <lists+linux-mips@lfdr.de>; Sun, 23 Mar 2025 03:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DC21AF0BB;
	Sun, 23 Mar 2025 03:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Z85BnGC5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0203C17;
	Sun, 23 Mar 2025 03:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742699213; cv=none; b=IwjZbFgml1SyW2mWats8ttFw2Dwhom7RE+oBdaf7AmB1BpSpHACiiKXs1VifMaTF1AfQGvLieuIw3w0Q2TY9Veu/fKVDLce9LqJyo83MmVszAEAgXT1vdDuRovhwn8BqtOAdxQyBgXW+UMYWCWdmf3TT/5XHmYbni4nSk794gSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742699213; c=relaxed/simple;
	bh=JhIB323Iy8oRh6ltMfxnvtaHNZ01Z07O3c8rcIlp5hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqDQXJod5EQYSwzQ9CujaSALBNGlirGKakqhY8UuAtBF+NDPFiNRqWJOYD9uMTyFql+2YFZeEtSVEoc4cMg808ld79SZJca+KnEwBreT4MEnNfnH7vKA+DzBvHabDq0RfoJcFGKVf2oD93ghT2E/a8EAGjzWMex6A3T9jEWFVKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Z85BnGC5; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 352B22A8408;
	Sun, 23 Mar 2025 04:06:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742699202; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=XPPUF/akYfiVaHG87FM7tDRS63NPbDuRHGbZg93aZK8=;
	b=Z85BnGC5WNujHRhUPJ9SZHINQe8b1hwHVS/x/L0qdKbko1H85ekMqCDk6MJypNGfxCM96Q
	phsURLoj0AsvSluaIcjyLAm4fTag20InUbQZ5DokKXxcvWnK4UrdTcnFF9GaLFDdjHJZQ9
	P9O1aE+q+BMeCz5CwG//yGcnrMffRwLcZA/84O8lIRLquR9NR1HpooSyT25um/zQ3g5nTN
	GKhmMtnBVQmvWmhn0bkKpZ/x3YhkdNgZYv5znhvCzOSvE9Nwa3OhrTQbuVJ81V5STqahl2
	SzGRSfxRy9EY0isQGaWWQ8sM9TTMcvf03DRiJN0vMHt5ghQE6a84ZjXWX0ROPQ==
Message-ID: <7307e611-1cc6-425e-a066-478794878d8e@cjdns.fr>
Date: Sun, 23 Mar 2025 04:06:33 +0100
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
 <ce72abfe-e822-48d6-9fc7-3cf9faffdc76@cjdns.fr> <87bjtt1nod.ffs@tglx>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <87bjtt1nod.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

[snip]
>> Maybe my message was misleading everything has been tested and works correctly
>> on multiple SoCs because ECONET_SOC_EN751221 does not select EI/VI. Answering
>> this question will allow me to enable them, thus also getting
>> MIPS_MT_SMP.
> It does not select it, but it can be enabled independently or through
> some other magic config knob, right? And if it gets enabled, then it
> does not work, right?

Not really true on either point.

Firstly, it's not something you can select in the kernel menuconfig, it's
selected by the SoC or some core feature of the SoC (e.g. SMP_MT_MIPS).

Secondly it does work, it's just that it does what it says it does, and you
need to handle those vectored interrupts - no irqchip driver does this.

>> I could look at forbidding them in the driver, but I'm not sure that's
>> appropriate as this seems like more of an SoC issue than an INTC
>> issue. But I'll follow your guidance.
> What's not appropriate? If it does not work, then it's very appropriate
> to do
>
>     config ECONET
>            depends on !EI && !VI
>
> on the principle of least surprise, no?

I've spent quite a bit of time studying this, so with respect for your time,
let me try to give you a brief summary of what I know and why I
submitted this as I did:

1. EI/VI is supported by the intc but it's really a feature of MIPS32r2.
In MIPS32r2, the CPU<->intc wire interface allows the CPU to send its
interrupts to the intc, and then allows the intc to fire any of of up to
64 interrupts back to the CPU.

2. When enabled, the CPU's internal intc sends its 7 interrupts to the
external intc who prioritizes them, renumbers them, and sends them
back along with their own.

3. When they come back, the CPU tries to be helpful by dispatching to an
offset within a vector table depending on the interrupt number.

4. The real problem with this is IRQ_MIPS_CPU no longer gets its 7
interrupts because they've been renumbered.

5. MIPS 1004Kc uses a standard intc (IRQ_GIC), and they solved this by
not really using the feature. Despite having 64 lines, they only send on
one and they make the driver poll to find out what's pending. I believe
they also return the CPU's 7 interrupts without renumbering.

6. But in 34Kc world there is no standard intc, and AFAICT many (most?)
of them fully use the EI/VI feature.

7. If you don't set EI/VI, the processor goes into / stays in legacy mode,
so it doesn't send anything to the intc, and everything the intc sends to
it is converted to a hit on line 2 - so as long as the intc has some
kind of pending register, chaining works.

8. But without EI/VI you can't have MT_SMP so you only get one thread.

9. In every 34Kc SoC I've found in Linux or OpenWRT, EI/VI is
conspicuously missing (with one exception). Clearly they had a
compelling reason for doing it, and I *think* that reason is because
they all faced the same issue as me and solved it the same way.

10. The exception is irq-realtek-rtl, which via an out-of-tree patch[1]
was able to enable EI/VI and I have no idea what they're doing, but it
appears that their intc hardware is participating, like with GIC.

11. I did implement an EI/VI dispatcher myself and had it working with
SMP, but I shelved because it's complex and it's not tightly coupled to
the intc driver itself so I concluded that it should be a separate
component that works with any intc. The complexity comes from the
fact that you need to either route the software interrupts back to
IRQ_MIPS_CPU's domain and fix the renumbering, or else implement
your own IPI subsystem.


So it's my belief that what I'm doing here is standard for 34Kc.

The reason I asked the question in the beginning was because I wanted
to check my assumptions and know if there's any way I can get SMP
without writing this dispatcher.


>>> So this patch clearly should have been tagged with 'RFC'.
>> Given the patchset works correctly in testing, does this comment
>> stand?
> Until the EI/VI issue is resolved so that it either works or cannot
> happen.

All said, if "depends on !EI && !VI" makes you happy then I'm OK to add it.

Just what I'm afraid of is being asked to find an authoritative answer to my
question before merging, because if nobody decides to jump in with one
then this could just be blocked indefinitely.


Thanks,

Caleb


[1]: 
https://github.com/openwrt/openwrt/blob/main/target/linux/realtek/patches-6.6/314-irqchip-irq-realtek-rtl-add-VPE-support.patch

>>>> +static int econet_intc_map(struct irq_domain *d, u32 irq, irq_hw_number_t hwirq)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	if (hwirq >= INTC_IRQ_COUNT) {
>>>> +		pr_err("%s: hwirq %lu out of range\n", __func__, hwirq);
>>>> +		return -EINVAL;
>>>> +	} else if (econet_intc_rai.shadow_interrupts[hwirq] == INTC_IS_SHADOW) {
>>>> +		pr_err("%s: can't map hwirq %lu, it is a shadow interrupt\n",
>>>> +		       __func__, hwirq);
>>> No newline
>> If I understand correctly, you prefer:
>> .....interrupt\n", __func__, hwirq);
>> for a 96 char line?
> You have 100 characters in drivers/irqchip/
>
>>>> +	.domain_ops = {
>>>> +		.xlate = irq_domain_xlate_onecell,
>>>> +		.map = econet_intc_map,
>>> See documention.
>> I suppose this is tab alignment, but I will in any case make a point
>> of reading it all carefully.
> Yes. The aligned tabular view is way simpler to read and parse. Reading
> is based on pattern recognition. Irregular patterns disturb the reading
> flow, which means the focus is shifted from understanding to decoding
> the irregular pattern.
>
>> In case of any doubt, I wasn't trying to sneak bad code past you.
> I did not assume malice here at all.
>
> Thanks,
>
>          tglx

