Return-Path: <linux-mips+bounces-13088-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fZgJBw5IgGmr5gIAu9opvQ
	(envelope-from <linux-mips+bounces-13088-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 07:45:34 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BEFC8EBA
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 07:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8C6C3003EDD
	for <lists+linux-mips@lfdr.de>; Mon,  2 Feb 2026 06:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262E15477E;
	Mon,  2 Feb 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="SXIDpO//"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF287309EEE
	for <linux-mips@vger.kernel.org>; Mon,  2 Feb 2026 06:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014731; cv=pass; b=DYNJQXIYUiJKxfBrHPCyOnUrPa0CBR4tWmoDPrdM0O9H7xUfzpGmg5H86/kC8R3br2maOuLeZpnT3PmP+ev/v0A+unxyPDoYQk2EBP9e2MsGQJUele9zI2wx0AcwrCm+CW90MTbGrig8kY2tL0h0oSRmRzbTrXJ8xftO1GDx7VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014731; c=relaxed/simple;
	bh=M0One+f0ksXgSVh4NMgUc96YJh39MoB/brUxs7CTQCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3Ax4NbqpgRqRxYLQRGaRKxJTeVr4MkXOPJ2AeDkZq+8ZkvlIWpEQzk/ddpUq3G+j10Yie8HSN8GRWS4zZ8imUFWcgyDqnUwnSmLlzETbO6pMdZmo7O9G4X/+2Fv65Ej14/091FH9fGBoylWmly/ci6Hj8cH/eZa8zDeFev1P9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=SXIDpO//; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-352e2156450so1908243a91.3
        for <linux-mips@vger.kernel.org>; Sun, 01 Feb 2026 22:45:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770014729; cv=none;
        d=google.com; s=arc-20240605;
        b=CfxuwCbKe2iLbUpGW6m7JS5isEqaudpysgExkA9cguj6kDWb5x6qyLpwx7X/SF3jva
         or775SV/AuOyv6eXEnMEHy9VNdDkQM6SKZwRc9Vb79gtmkJ7asmzAlbuhYEXCPI7s8/c
         LdBWcsF/Ou7iR7bTd33F+yyXP0IioReq0JvugOk63Q/imR/Qwy39OYxxPskceViyG4fb
         n4clYgnQC99iFULmuh1dkZnYzM7HLmMa0j5rMDOxZZHNwXzmRX7I3B25zzJrUagFI1i9
         A29Hts6Zx4038FAUZltExhXKryfZiRShw/AVU3tfE5oaZnXX5s0X3Z6Q3A09ZtLxXl1K
         Db/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xqCc9lm6oEQgjEbk7Ev8tHP5ppIT6grBO9XxI0k1xuc=;
        fh=qOwaeQrfqNR4XUb9m/QELlxQxXDD6QRpAywPqqlWnBc=;
        b=NWht+0C8qTg0dYLlBPWUM/uBvNhrtQl5rtBl/RR8VwxIUrNHgqDnIbyO6QXWVRLTy3
         bXZVC78NDhugNag5KbwdculFXKCwIB6YWqrkMMj7QA0iycD2f3k2xmOiSvfIY6/7c16O
         i9Z0RV8covP8RlIzs054FrOFHClaOvMH6AUCTa8J57GRpN3VSTIk//n0974ITKe1mRrx
         luWlgYHiy73clnNEzhRtHP4ySd9cnoSZHV0chp/vokUR8OQ7W7D6mQvjWohnYWS+Wsg8
         +saj9DQH7ettyb5Bk0/Yy3IVBzogwuZOuduVBZ5SXzOksAKBQfT0NdOPktD/o3aGJ1wA
         YEqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1770014729; x=1770619529; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xqCc9lm6oEQgjEbk7Ev8tHP5ppIT6grBO9XxI0k1xuc=;
        b=SXIDpO//U89M/n74eFJC58g7KlRK+4OcfWjnNCBMb1wOgyjkiTgz5A4fQjZwEFyDhn
         UFnsgYyWwusEv/vVfhXFlkc4tGFaJaZcrCg70cNFolvu8kPKuAUyoJyx5HY78Ac/V0Yf
         8BAuWwQu/6aMmyqXv1Ctrs+3eieeKRBsX2Z4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014729; x=1770619529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqCc9lm6oEQgjEbk7Ev8tHP5ppIT6grBO9XxI0k1xuc=;
        b=ArFm2SrOmt0zspZjG0ZDzt56DzD/9H3QNdppwwSiA1q8voaJmzY/1I/MeqsbOaO3F+
         gVHPt29XUXFEaZ9of3GSDGUMSS4jHwq7K3ju7y/pdgU+z88b9NkMTSz3KeyM8tQqA0W0
         PjBQoDVTraGXj3H4smaqyjT2SrsuPMEtdBECI6IIElWomKnFNaO8ummQiiUkVjyfSkgh
         5Wm55NMDBistpljSNYid16FMRoq2UCOR/3xmhdTq/vpowCs10nMYjenTBmXilNiRoFcZ
         Zf7vmKRvfshBDLkbtqSwPoba9qlyoBNwRf3g3lSADBz1XxXhjJHXBWY1oxwftbWRicyb
         +BLw==
X-Forwarded-Encrypted: i=1; AJvYcCVJWriEqRATPQ9TkI3jxGupZRwjgcXhCDYqGemFzVCW5vQl92NV2pUrjsybC8615fhIyEHbb9l4ApdM@vger.kernel.org
X-Gm-Message-State: AOJu0YzmIN9zKSTl6mQhOiRMxOfgT3rfzcBhdNWQVhpTI8S9tHtW9LIQ
	uUUlLOxENPijLR4FwFfj4ul456Xz7QTmoebbAfICSmihT8oVqDRv9uz+r8PekBxWJS5pi4l+zQm
	T9oCzVmy0L1s24YkFi3ifl+0vP45UArIgU4KIFujGgQ==
X-Gm-Gg: AZuq6aLiqEPs4tpCC4NPs9ZnJRnlnry8uB3Ni3WnsSX6nqBO8tnnRuawJkH9gHV+H8n
	U2w9qpRcPZjeNsUM69JH88nUnFrq1YJpx1mp8PgC543Uwjzh9qK3WcnZAFwyQxpmtTxL5ecjr7G
	c1oMMozUYUDyPVCspv9bafmAV7AmlgKmVQsAMzApJMJ1VyuL0py552Qsp31/kYLwXdduzTxdgU7
	NL11Qedylki3HNuP7j2gJ45vkMJaltrEQR3N8pFhYBkNCqUv4DAGbYpi2qrFer8ujqstubjxrk9
	HisPNAh+MOkoowfX5S9lHPBLH8JmD5qhTGU/o+IblIbSfQD+utnVznx4xTnNL++RPlQs1GYdJGm
	HszVZW8BmwFi8zzNzDONRQx2TxAh0Wkio0JZBHH6TnzqkCmxyLQuHxmUS6zrPy/NAkCAOV0N0A+
	AzcAHT6NxLyibSH6+kKZGlzgi1o2ohjvEsm4o=
X-Received: by 2002:a17:90b:3a47:b0:34c:cb3c:f544 with SMTP id
 98e67ed59e1d1-3543b321237mr9934890a91.14.1770014729046; Sun, 01 Feb 2026
 22:45:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123230651.688818373@kernel.org> <20260123231521.926490888@kernel.org>
In-Reply-To: <20260123231521.926490888@kernel.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Mon, 2 Feb 2026 14:45:17 +0800
X-Gm-Features: AZwV_QgL45dE-xQAe4-3bA1NRisbqCOgt24W0Ww2hyenEOvTnYL9MVfHPqTBj1I
Message-ID: <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	John Stultz <jstultz@google.com>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner <jwiesner@suse.de>, 
	Scott Hamilton <scott.hamilton@eviden.com>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13088-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,eviden.com,gmx.de,alpha.franken.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 63BEFC8EBA
X-Rspamd-Action: no action

Great work Thomas!

On Sat, 24 Jan 2026 at 07:18, Thomas Gleixner <tglx@kernel.org> wrote:
>
> The clocksource watchdog code has over time reached the state of an
> unpenetrable maze of duct tape and staples [..]
...
>   1) Restrict the validation against a reference clocksource to the boot
>      CPU, which is usually the CPU/Socket closest to the legacy block which
>      contains the reference source (HPET/ACPI-PM timer). Validate that the
>      reference readout is within a bound latency so that the actual
>      comparison against the TSC stays within 500ppm as long as the clocks
>      are stable.

On my 1920 thread BullSequana SH160 test system (16 sockets with
Numascale UPI Node Controller), I find this approach is intrinsically
robust against system latency.

>   2) Compare the TSCs of the other CPUs in a round robin fashion against
>      the boot CPU in the same way the TSC synchronization on CPU hotplug
>      works. This still can suffer from delayed reaction of the remote CPU
>      to the SMP function call and the latency of the control variable cache
>      line. But this latency is not affecting correctness. It only affects
>      the accuracy. With low contention the readout latency is in the low
>      nanoseconds range, which detects even slight skews between CPUs. Under
>      high contention this becomes obviously less accurate, but still
>      detects slow skews reliably as it solely relies on subsequent readouts
>      being monotonically increasing. It just can take slightly longer to
>      detect the issue.

On x86, I agree iterating at a per-thread level is needed rather than
one thread per NUMA node, since the TSC_ADJUST architectural MSR is
per-core and we want detection completeness.

On other architectures, completeness could be traded off for lower
overhead if it is guaranteed each processor thread uses the same clock
value, though this is actually is what the clocksource watchdog seeks
to validate, so agreed on the current approach there too.

> +/* Maximum time between two watchdog readouts */
> +#define WATCHDOG_READOUT_MAX_NS                (50 * NSEC_PER_USEC)

At 1920 threads, the default timeout threshold of 20us triggers
continuous warnings at idle, however 1000us causes none under an 8
hour adverse workload [1]; no HPET fallback was seen. A 500us
threshold causes a low rate of timeouts [2] (overhead amplified due to
retries), thus 1000us adds margin and should prevent retries.

Thanks,
  Dan

-- [1]

n=$(($(getconf _NPROCESSORS_ONLN)/2)); stress-ng --msyncmany $n --vm
$n --vm-bytes 50% --vm-keep --verify --vmstat 30 --timeout 8h

-- [2]

[ 1873.419375] clocksource: Watchdog remote CPU 1807 read timed out
[ 1900.419375] clocksource: Watchdog remote CPU 1861 read timed out
[ 1925.924374] clocksource: Watchdog remote CPU 1912 read timed out
[ 1937.420453] clocksource: Watchdog remote CPU 15 read timed out
[ 1937.925028] clocksource: Watchdog remote CPU 16 read timed out
[ 1949.073317] workqueue: drm_fb_helper_damage_work hogged CPU for
>13333us 515 times, consider switching to WQ_UNBOUND
[ 1954.924464] clocksource: Watchdog remote CPU 50 read timed out
[ 2032.923596] clocksource: Watchdog remote CPU 206 read timed out
[ 2042.924367] clocksource: Watchdog remote CPU 226 read timed out
[ 2066.420624] clocksource: Watchdog remote CPU 273 read timed out
[ 2072.924015] clocksource: Watchdog remote CPU 286 read timed out
[ 2115.602465] workqueue: drm_fb_helper_damage_work hogged CPU for
>13333us 1027 times, consider switching to WQ_UNBOUND
[ 2139.924153] clocksource: Watchdog remote CPU 420 read timed out
[ 2143.419690] clocksource: Watchdog remote CPU 427 read timed out
[ 2147.420587] clocksource: Watchdog remote CPU 435 read timed out
[ 2160.924251] clocksource: Watchdog remote CPU 462 read timed out
[ 2165.419843] clocksource: Watchdog remote CPU 471 read timed out
[ 2170.442815] clocksource: Watchdog remote CPU 481 read timed out
[ 2221.420468] clocksource: Watchdog remote CPU 583 read timed out
--
Daniel J Blueman

