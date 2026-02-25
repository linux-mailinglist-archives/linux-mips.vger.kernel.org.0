Return-Path: <linux-mips+bounces-13230-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPWdF/A7n2kiZgQAu9opvQ
	(envelope-from <linux-mips+bounces-13230-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 19:14:08 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0447419C181
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 19:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 754FE3006B29
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 18:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126302EC08C;
	Wed, 25 Feb 2026 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U3Y20bWI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WdNjKPeC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U3Y20bWI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WdNjKPeC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB8A2EB840
	for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 18:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043207; cv=none; b=p55kywI5oHTg/ucGu8Wb5ECjsBS5gZdtplYdcetormykgZUiiIEZxNgCJb2FRzyCSInqqT75Ck/lYDxVQwDSdFX0heeMEO3LOROsnZjxjXC8kd295TEQiSVfEqE9JrvSUIPY5SPQMVMKcsJP76OLJWyQPBxkheUA7JLED+RfZcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043207; c=relaxed/simple;
	bh=8gwsOKvZCZr4AnLJiHOdDxfp2Mk1ISF2ATfebWluiKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUFk/ejjPTJdUbcBWysAi514FrKl/Xl7w5s8eGf1uCuDx9+A548cnGnpr64XpFv+8MIcXLzVpTpxLTnDnWzYsQ3vDAuwGsqqbKdtzSwOO7Jpm3ROdl8nR85S9c9XICG6NtXLWUxoThXoXOpCZOiSTC711Mjl0352TBKb8u7wm/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U3Y20bWI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WdNjKPeC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U3Y20bWI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WdNjKPeC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B3D3A5C045;
	Wed, 25 Feb 2026 18:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772043203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Jr1Q5Rt21I0E0/1ANKqGzthnx1BQydBzGuDuzYU4A4=;
	b=U3Y20bWIrgJx3Iur0fuiZHHX8sPjfMQpIeNMCec6JsHPgrKwnkCRxGR9A9JPgIlSBHCCiO
	tVKVkA5T8riMnxhxGaWhVUOAXGj9MXpMJEo4mfO7oJK1f7FPQ8KM5S+isLOV3FQNGWEQuF
	YHbrEYawQNpFvBAgFq2QZdn9scIH2No=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772043203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Jr1Q5Rt21I0E0/1ANKqGzthnx1BQydBzGuDuzYU4A4=;
	b=WdNjKPeCpp/tbrW4oQj/1VAH2iY8uDqCIJyEhv/mD7z7LRr2Ih2Q8ALq+iV7IH7XGbulUH
	D+KyarO/mdAof9Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=U3Y20bWI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WdNjKPeC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772043203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Jr1Q5Rt21I0E0/1ANKqGzthnx1BQydBzGuDuzYU4A4=;
	b=U3Y20bWIrgJx3Iur0fuiZHHX8sPjfMQpIeNMCec6JsHPgrKwnkCRxGR9A9JPgIlSBHCCiO
	tVKVkA5T8riMnxhxGaWhVUOAXGj9MXpMJEo4mfO7oJK1f7FPQ8KM5S+isLOV3FQNGWEQuF
	YHbrEYawQNpFvBAgFq2QZdn9scIH2No=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772043203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Jr1Q5Rt21I0E0/1ANKqGzthnx1BQydBzGuDuzYU4A4=;
	b=WdNjKPeCpp/tbrW4oQj/1VAH2iY8uDqCIJyEhv/mD7z7LRr2Ih2Q8ALq+iV7IH7XGbulUH
	D+KyarO/mdAof9Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FECB3EA65;
	Wed, 25 Feb 2026 18:13:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8EEbI8M7n2maQwAAD6G6ig
	(envelope-from <jwiesner@suse.de>); Wed, 25 Feb 2026 18:13:23 +0000
Received: by incl.suse.cz (Postfix, from userid 1000)
	id 06AF6FA967; Wed, 25 Feb 2026 19:13:23 +0100 (CET)
Date: Wed, 25 Feb 2026 19:13:22 +0100
From: Jiri Wiesner <jwiesner@suse.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	John Stultz <jstultz@google.com>, Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Daniel J Blueman <daniel@quora.org>,
	Scott Hamilton <scott.hamilton@eviden.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
Message-ID: <aZ87wpdHJ5vajYoL@incl>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123231521.926490888@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13230-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,quora.org,eviden.com,gmx.de,alpha.franken.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jwiesner@suse.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0447419C181
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 12:18:01AM +0100, Thomas Gleixner wrote:
> To address this and bring back sanity to the watchdog, rewrite the code
> completely with a different approach:
> 
>   1) Restrict the validation against a reference clocksource to the boot
>      CPU, which is usually the CPU/Socket closest to the legacy block which
>      contains the reference source (HPET/ACPI-PM timer).

The UEFI picks the boot CPU so the kernel does not have control over that. On the other hand, I think the CPU that is connected to the southbridge chip (by DMI or PCIe) will be selected in the majority of UEFI implementations. Even if the boot CPU had to use the inter-processor link the readout latency should often pass the 50 microsecond threshold. This is a histogram of the hpet-tsc-hpet readout latency (in nanoseconds) as measured by the old clocksource watchdog (reads carried out from all CPUs on the machine):

wd_delay Duration Distribution
wd_delay Duration Average:  7822 +-  9413 (min 2875, max 77916)
        Range      Count
    0 -  5000       2766 (73.10%)
 5000 - 10000        383 (10.12%)
20000 - 25000        402 (10.62%)
25000 - 30000         94 ( 2.48%)
30000 - 35000         49 ( 1.29%)
35000 - 40000         35 ( 0.92%)
40000 - 45000         21 ( 0.55%)
45000 - 50000         14 ( 0.37%)
50000 - 55000          7 ( 0.18%)
55000 - 60000          3 ( 0.08%)
60000 - 65000          4 ( 0.11%)
65000 - 70000          2 ( 0.05%)
70000 - 75000          1 ( 0.03%)
75000 - 80000          3 ( 0.08%)
Total count: 3,784

The machine has 8 NUMA nodes with 960x Intel Xeon Platinum 8490H. The machine was running:
stress-ng -t 30m --cpu 480 --switch 520
It definitely does not represent effect of any arbitrary workload on the inter-processor link but it is a data point.

There is one issue: What if the reference clocksource itself experiences time skew? I have seen a case like this with the sgi_rtc clocksource. I created a debugging kernel with the HPET as a second watchdog (not affecting the decisions by the watchdog) and got this result:
> clocksource: timekeeping watchdog on CPU118: Marking clocksource 'tsc' as unstable because the skew is too large:
> clocksource: 'sgi_rtc' wd_nsec: 511302794 wd_now: 1cb50e4c4b wd_last: 1ca7097111 mask: ffffffffffffff
> clocksource: 'hpet' wd2_nsec: 512005960 wd2_now: 65892719 wd2_last: 64c5d684 mask: ffffffff
> clocksource: 'tsc' cs_nsec: 512006458 cs_now: 86b5982cb1 cs_last: 867581bbab mask: ffffffffffffffff
> clocksource: 'tsc' skewed 703664 ns (0 ms) over watchdog 'sgi_rtc' interval of 511302794 ns (511 ms)
> clocksource: 'tsc' is current clocksource.
> tsc: Marking TSC unstable due to clocksource watchdog
> clocksource: Checking clocksource tsc synchronization from CPU 610 to CPUs 0-609,611-767.
> clocksource: Switched to clocksource sgi_rtc

The intervals measured by the TSC and the HPET match very well; the sgi_rtc is off. Even the new implementation of the clocksource watchdog would be susceptible to the reference clocksource experiencing time skew. I think the clocksource watchdog needs to make the assumption that the reference clocksource is right, and the onus should be on hardware developers to make sure the reference clocksource is accurate. In reality, one has to resort to disabling the reference clocksource experiencing time skew or, at least, decreasing the rating of that clocksource.

> +static bool watchdog_check_freq(struct clocksource *cs, bool reset_pending)
> +{
> +		/*
> +		 * Calculate and validate the skew against the allowed PPM
> +		 * value of the maximum delta plus the watchdog readout
> +		 * time.
> +		 */
> +		if (abs(wd_delta - cs_delta) < (max_delta >> ppm_shift) + wd_seq)
> +			return true;

Making the threshold proportional to the length of the interval resolves the issue with the (previously) fixed threshold and the interval being stretched on account of the timer running later than when it was meant to expire.

> +static void watchdog_check_result(struct clocksource *cs)
>  {
> -	struct clocksource *cs;
> +	switch (watchdog_data.result) {
> +	case WD_SUCCESS:
> +		clocksource_tick_stable(cs);
> +		clocksource_enable_highres(cs);
> +		return;
>  
> -	list_for_each_entry(cs, &watchdog_list, wd_list)
> +	case WD_FREQ_TIMEOUT:
> +		watchdog_print_freq_timeout(cs);
> +		/* Try again later and invalidate the reference timestamps. */
>  		cs->flags &= ~CLOCK_SOURCE_WATCHDOG;
> -}
> +		return;

I like that the new clocksource watchdog is far less punishing. A clocksource may be marked unstable only when the readout latency is below 50 us (and there is time skew or unsynchronized CPU sockets). There is no need for skipping watchdog checks to mitigate the clocksource being marked unstable on account of quite possibly unrelated readout latency, SMIs or vCPU preemption.

-- 
Jiri Wiesner
SUSE Labs

