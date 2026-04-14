Return-Path: <linux-mips+bounces-14144-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNx6ClxA3mlvpwkAu9opvQ
	(envelope-from <linux-mips+bounces-14144-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 15:25:48 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 770273FA766
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 15:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04A393077E37
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 13:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582E83E63BD;
	Tue, 14 Apr 2026 13:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="uwnIeVz6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6A334EF08;
	Tue, 14 Apr 2026 13:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172862; cv=none; b=QOCXZZPGQO7F9CNMT1fOmTUDk+p7tm9gmW37Z7K2PAqX8k7SThYXJA+Fb1SI2MnxK1DvDTOkcJ8pcjzaHE0UMwpiPYorUhcSpv4Z9rsOpdX2/klpeqVDYUnarivSN7fs78BqcHHf9nf79RwzlzuhL+dgw68C1bkoIsY/cZ3//6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172862; c=relaxed/simple;
	bh=KulEK4ktrgCxdd7ZWegyzMToGM+EwGNqHtC9Q9nj3FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jf4BQLw7ti8sIK4AV39DLZvFqh1dK/NUnfykhG2mHCUdXYY85zesn4zc0L5pn78xLRMW5PiTodDUBDnXy9C1wosa+aliYkCFirviolo7oad/bcLNJb+1ylZcj70jX8dmE84ph6m5D+ubf8QScgUJuwaDBm+D3z2qLEyImzQ8h8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=uwnIeVz6; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB332BC40B;
	Tue, 14 Apr 2026 15:20:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1776172856; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=H7mUsOECUhydStxxRxfrNrlvEqDZbSKzFY1iOhCfn5I=;
	b=uwnIeVz6+BtDsIgUPAzfdfMaJ7i817YD+bMYZIaP2OlvBWIqEfeACy7NkPzAqFmK88AOY3
	CqBEKb8anVpOqBiY50CHedToPeviWsYKZG2FvqVq3ZiH7xwvjcbojCQApvlO1U7vGGUen3
	Zd6iteCkHvBef+9732RORZLN0skkSQkfsr+g5BxczN1taYZWeIeQkDY3imSL/cbvpERJx+
	c+zzr+1YDudrQ4q12FiO0jf+drTwed9PEObmSJfI5hesVlWNgR9y3Jh4pcpMgZj9uowPwR
	bizKs2YmZtXn9JAvMcV356XCZWAS4KiHpvIHpyxzODc7TYAztvqIWmkC8iN65A==
Message-ID: <04bce292-00c0-4669-964d-c94bd7179bb5@cjdns.fr>
Date: Tue, 14 Apr 2026 15:20:51 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 2/2] clocksource: timer-econet-en751221: fix IRQ ack
 storm on interrupt handler
To: kpursoty@proton.me,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "naseefkm@gmail.com" <naseefkm@gmail.com>
References: <cAKrsEu2h3qUcucFHNb4TH61fInUPSG1Z6gefgAecIzRCGrhzAflYboWuY7ANYSLaGoEbH6_ypWsmMGv9IituYBbiWoR9y6Ux29IBA7ozCM=@proton.me>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <cAKrsEu2h3qUcucFHNb4TH61fInUPSG1Z6gefgAecIzRCGrhzAflYboWuY7ANYSLaGoEbH6_ypWsmMGv9IituYBbiWoR9y6Ux29IBA7ozCM=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14144-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,alpha.franken.de,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email]
X-Rspamd-Queue-Id: 770273FA766
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 13/04/2026 18:04, kpursoty@proton.me wrote:
> The interrupt handler acked by writing the current count back to compare:
>
>    iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
>
> Since the interrupt fires when count >= compare, and the counter advances
> past the written value before the MMIO write reaches the peripheral, the
> condition re-asserts on the same bus cycle. This causes a tight IRQ storm
> on CPU0, stalling boot at T=62s (measured: boot never progresses past
> clockevents registration).
>
> The EcoNet GPL kernel (arch/mips/econet/time2.c, cputmr_timer_ack()) acks
> by writing the *next* deadline, which puts count < compare and clears the
> pending condition. Write U32_MAX (unreachable before set_next_event()
> programs the real deadline), consistent with cevt_dev_init() which also
> writes U32_MAX to park the compare register at init.
>
> Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
> Signed-off-by: Kervin Pursoty <kpursoty@proton.me>

I don't understand the subsystem well enough to know if this is correct, 
but it boots on EN751221.

Tested-by: Caleb James DeLisle <cjd@cjdns.fr>

> ---
>   drivers/clocksource/timer-econet-en751221.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -68,6 +68,10 @@ static irqreturn_t cevt_interrupt(int irq, void *dev_id)
>   	if (!cevt_is_pending(cpu))
>   		return IRQ_NONE;
>
> -	iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
> +	/*
> +	 * Ack: write a future value so count < compare, clearing the pending
> +	 * condition. set_next_event() will program the real deadline.
> +	 */
> +	iowrite32(U32_MAX, reg_compare(cpu));
>   	dev->event_handler(dev);
>   	return IRQ_HANDLED;
>   }
>

