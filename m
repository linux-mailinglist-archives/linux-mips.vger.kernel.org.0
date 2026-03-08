Return-Path: <linux-mips+bounces-13410-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBIqBPVJrWkv1AEAu9opvQ
	(envelope-from <linux-mips+bounces-13410-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 08 Mar 2026 11:05:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C350722F46D
	for <lists+linux-mips@lfdr.de>; Sun, 08 Mar 2026 11:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A546A30068D8
	for <lists+linux-mips@lfdr.de>; Sun,  8 Mar 2026 10:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCAE36CDFA;
	Sun,  8 Mar 2026 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+Cnyi2J"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B37A313E10;
	Sun,  8 Mar 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772964335; cv=none; b=AupgW7lbWQ6KBtNMd/wnsfJuLyrs1/hR/PvSE4rWRFYGrZhWAh9CcIswuRA1wbav8uBdNCX4EBhn6wEnERsb59rXuicxcy2YA+LP7We9vd1HpzVbhxhJxGvUPslu6yyIGy16mqn7JhIMCmmZ/KNVSqwENOKyzFEmf2t+ITVBVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772964335; c=relaxed/simple;
	bh=Xz0WAimiw69MUDVftaaBOxgwbGiOR05HC5RyG8iQnGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E5UKOeN98p4Cig9OavV0F80LMKdTgnnePfdHpGOeroAlugiRT8J4QwXT0fLaaecenNUdHG0eVNlIzOqajEkhMKG26WMdN+mTBbeD/l8whaDx2TBn4OWtiZehbDbBwnYj0da/omwOfQOiFYH1yYES4XgViMmu7WBWQTd1QVeJERc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+Cnyi2J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0208DC116C6;
	Sun,  8 Mar 2026 10:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772964334;
	bh=Xz0WAimiw69MUDVftaaBOxgwbGiOR05HC5RyG8iQnGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M+Cnyi2JPN32ViN1ElLtfAYiQe8n4Tw9ps3EXm1n34NTRyGWuPzeRfG7DwoFehIpq
	 wN4EDJmEC6A5xXfP0yPAxRW3rrSi4Pvk17pNPxJzUX0iiR9k+y2Ue9GiYc0NJic4yY
	 H9Nb2xFGZfuoaOKo0iPxjxgWCCkPMtoN4arj1z19bs6fFkZnTfrsOlqRH/bg0s/El7
	 b/hL6x+gr0cISrCYkNIkvHP8zwh1In7ytoR9YOhAQ12eIHQILWaIMPQRhI+nXPYO/z
	 NLqn/8fkFHWwDMmbRo7D5jdv3lnbkpd4YzWy8nQSLXnLuxDIwpr0g6gLQHRwO3X90G
	 5f+VjZkljDeJg==
From: Thomas Gleixner <tglx@kernel.org>
To: Jiri Wiesner <jwiesner@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, John Stultz <jstultz@google.com>, Waiman Long
 <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 x86@kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Daniel J
 Blueman <daniel@quora.org>, Scott Hamilton <scott.hamilton@eviden.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
In-Reply-To: <aZ87wpdHJ5vajYoL@incl>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org> <aZ87wpdHJ5vajYoL@incl>
Date: Sun, 08 Mar 2026 11:05:31 +0100
Message-ID: <87y0k21vro.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: C350722F46D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13410-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,quora.org,eviden.com,gmx.de,alpha.franken.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.619];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Feb 25 2026 at 19:13, Jiri Wiesner wrote:
> On Sat, Jan 24, 2026 at 12:18:01AM +0100, Thomas Gleixner wrote:
>> To address this and bring back sanity to the watchdog, rewrite the code
>> completely with a different approach:
>> 
>>   1) Restrict the validation against a reference clocksource to the boot
>>      CPU, which is usually the CPU/Socket closest to the legacy block which
>>      contains the reference source (HPET/ACPI-PM timer).
>
> The UEFI picks the boot CPU so the kernel does not have control over
> that. On the other hand, I think the CPU that is connected to the
> southbridge chip (by DMI or PCIe) will be selected in the majority of
> UEFI implementations.

Picking a remote node CPU would be insane, but yes BIOSes are insane by
definition.

> There is one issue: What if the reference clocksource itself
> experiences time skew? I have seen a case like this with the sgi_rtc
> clocksource. I created a debugging kernel with the HPET as a second
> watchdog (not affecting the decisions by the watchdog) and got this
> result:

>> clocksource: timekeeping watchdog on CPU118: Marking clocksource 'tsc' as unstable because the skew is too large:
>> clocksource: 'sgi_rtc' wd_nsec: 511302794 wd_now: 1cb50e4c4b wd_last: 1ca7097111 mask: ffffffffffffff
>> clocksource: 'hpet' wd2_nsec: 512005960 wd2_now: 65892719 wd2_last: 64c5d684 mask: ffffffff
>> clocksource: 'tsc' cs_nsec: 512006458 cs_now: 86b5982cb1 cs_last: 867581bbab mask: ffffffffffffffff
>> clocksource: 'tsc' skewed 703664 ns (0 ms) over watchdog 'sgi_rtc' interval of 511302794 ns (511 ms)
>> clocksource: 'tsc' is current clocksource.
>> tsc: Marking TSC unstable due to clocksource watchdog
>> clocksource: Checking clocksource tsc synchronization from CPU 610 to CPUs 0-609,611-767.
>> clocksource: Switched to clocksource sgi_rtc
>
> The intervals measured by the TSC and the HPET match very well; the
> sgi_rtc is off. Even the new implementation of the clocksource
> watchdog would be susceptible to the reference clocksource
> experiencing time skew. I think the clocksource watchdog needs to make
> the assumption that the reference clocksource is right, and the onus
> should be on hardware developers to make sure the reference
> clocksource is accurate. In reality, one has to resort to disabling
> the reference clocksource experiencing time skew or, at least,
> decreasing the rating of that clocksource.

Yes, we have to make the assumption that the watchdog clocksource is
actually stable and accurate. If the sgi_rtc is un-reliable, then it
should be rated down. AFAICT it is per blade and I have no idea how
synchronized it is accross blades.

>> +static bool watchdog_check_freq(struct clocksource *cs, bool reset_pending)
>> +{
>> +		/*
>> +		 * Calculate and validate the skew against the allowed PPM
>> +		 * value of the maximum delta plus the watchdog readout
>> +		 * time.
>> +		 */
>> +		if (abs(wd_delta - cs_delta) < (max_delta >> ppm_shift) + wd_seq)
>> +			return true;
>
> Making the threshold proportional to the length of the interval
> resolves the issue with the (previously) fixed threshold and the
> interval being stretched on account of the timer running later than
> when it was meant to expire.

Indeed.

>> +static void watchdog_check_result(struct clocksource *cs)
>>  {
>> -	struct clocksource *cs;
>> +	switch (watchdog_data.result) {
>> +	case WD_SUCCESS:
>> +		clocksource_tick_stable(cs);
>> +		clocksource_enable_highres(cs);
>> +		return;
>>  
>> -	list_for_each_entry(cs, &watchdog_list, wd_list)
>> +	case WD_FREQ_TIMEOUT:
>> +		watchdog_print_freq_timeout(cs);
>> +		/* Try again later and invalidate the reference timestamps. */
>>  		cs->flags &= ~CLOCK_SOURCE_WATCHDOG;
>> -}
>> +		return;

> I like that the new clocksource watchdog is far less punishing. A
> clocksource may be marked unstable only when the readout latency is
> below 50 us (and there is time skew or unsynchronized CPU
> sockets). There is no need for skipping watchdog checks to mitigate
> the clocksource being marked unstable on account of quite possibly
> unrelated readout latency, SMIs or vCPU preemption.

That was the design goal of that rewrite. Glad you like it.

Thanks,

        tglx

