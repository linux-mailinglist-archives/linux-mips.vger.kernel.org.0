Return-Path: <linux-mips+bounces-13750-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIBBNA62umlWawIAu9opvQ
	(envelope-from <linux-mips+bounces-13750-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:26:22 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D19132BD0F7
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8519330C6C73
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 14:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D0D3DBD6A;
	Wed, 18 Mar 2026 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="fqG2/ku5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DD73DA5CC
	for <linux-mips@vger.kernel.org>; Wed, 18 Mar 2026 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843064; cv=pass; b=nO5Pi1L6BJemVNUDNmW42v2ifF03Bvp3vlgMhC5BMKFnKoTvemdkxKSibTX+Wp54Un/M7nadBoOS1tUwdkS/ZqL0idlM0rZ6kVXew/0zfq/2d29GC8fE4UHBVuOmtp9rJqJEtyNXSB0bedBCYMowdJZDpFgMqegZQIZ0E7kS0c0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843064; c=relaxed/simple;
	bh=r1Tv53bgcF0yQoW1GmCwxqNOei3YJYYA/bpEEFiatPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8X0UEYOuo7mVZvpMvBFYp6hO6ETWPukmPiH27djC0qnZes8QKS7CEDkLx7EzvwMgbkyR+9B6Cl2gIdooB5j+QxOQJGz4p3cEi5//k16492NN/q1lA5njPdYRnIk5M8k+5zf8H/bY58goS6T4JdZrBcvLRGQ9KF2gSmSCyE03Yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=fqG2/ku5; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c2af7d09533so5541697a12.1
        for <linux-mips@vger.kernel.org>; Wed, 18 Mar 2026 07:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773843062; cv=none;
        d=google.com; s=arc-20240605;
        b=PBFZSGkaLokYzY6CAXiNQ26cl/fibAv1UxVGYbloeqJrMmqdMBWQLLMY+5HCxInx3N
         aBTS/+Z4OftGAbiEfKgCWEP3ToWcMXzN9ddohvNK5rHbk5U+7LY3uXWSDv8H0aUNRTwR
         zctJdI2ANGMsOwHMIplbdgj3Cf52U+toItTqwQZ5/WE43hfHONb0C7jHR81YtI8XqSDf
         YU+OV39ao8daucNQZecin8EGzSPwcJ/rJRr1xB7tiF0hAH7dBTJQb7fzUi/6toX+hPwa
         HYySR3bZ58ivfYpii4UKHzeWdk2u9GdABAc+pia5MyeavoD5oKhlbyklJ92Ly8XzU7N1
         /6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FnVK97GbDjmBW9z+YmT+CgHjnje3lfRiHrtm0Ff5Slw=;
        fh=KQR4EnY0SQ81Ch3xl1A1AyiLpAp880tAwVuCHKIPWYk=;
        b=Za8R3HKv+i5JNNcphBdniqfR9w729xVTa06eALrK4qq3Btz13LUeD5ZbEJKBZx0D8n
         /tcfcMK3dcOhRcvDo/91J72cOeMwjossVwWUqLKhIyGKutrIczCFe8UY/c9Oa3YfUMAW
         lona0WP/H+Jcf03AGxi54LZQ/AgYs3M+sVAnVQ46hLEgDmoXklBpvSrhVraXN/VXk/eo
         yUurUNNr6ctVKJ+g+cbzmEJFRPnk473F+5hwBKCXxiLd8tD7n7b3W044g+1M5T7rT6TN
         dZVBr2NYFjnDIPWvVqx7KgeaY8GBa9tJxzGWl7Aam3tM5Q+wcTgexUZv0LIi6wbFeQtp
         d0eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1773843062; x=1774447862; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FnVK97GbDjmBW9z+YmT+CgHjnje3lfRiHrtm0Ff5Slw=;
        b=fqG2/ku5WZeMiK4M7oVqmnbnqpyErkfuffEbiuQR3bI1IFg/XkerdVSoVwMezs59XZ
         Y0WzY7HNVWX2RzFKjtVKIlk0iCV6KvPTYUBjhvP/vZzM5mWe4DJhojWxb7hPn7madbUw
         T9xgMIZlczd4VAbOltL2NUzUvbLFOlDo/SoAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773843062; x=1774447862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnVK97GbDjmBW9z+YmT+CgHjnje3lfRiHrtm0Ff5Slw=;
        b=GhOxCs2JSJ5ar+6Ae9OKK6UnL+Clz1U7eThDr8GLHhO2urKqVzftlZ79S7U3TTgnp4
         xGshcohPqbvNT66eEplfJhuJ6H2b/mhEd1n8JegmJCCHOZwXNYnsHr6U9p9F6Kbrt+YA
         J6uesNUD9MWqcVVqpy4rQSC9DohpAMDoRGFNJfcwazVcYou/RQQdCEzW/EO35QKAz7Oe
         ByWDWCekPDFxaAGV6HIhpTt1vge1mKFGos5s3U/9JkgcaE8mnh3QPUgpPD4EQJ4Fjiil
         f1LK3pCFJ5eeUDN/6ANNnWcMWsveX4By5ds7GVKQuh4OM3CfYOWvdex23chJin4xGUUl
         nt0w==
X-Forwarded-Encrypted: i=1; AJvYcCULHduE846R8xv+gTXgd+zjnKFlT/noJeXyhxV//HeGH7UnLwYpWCi6/s5aER4sYBK97yf42GGBbZu5@vger.kernel.org
X-Gm-Message-State: AOJu0YyhmpLn2lFzflcGVLYQzQBPVxeRNj2cOXN/rYZgvBtqmdQEe6oM
	uOitxCjUttXi3yBXYj7gCECophrqaA9tdFgWFCGQSU7VJn2AcmsfEJrSpTyIgYul45flMgLdZPY
	c9FNiG/UhT1FxeIQLDAQbcnynhKtxKCJxarylN1eROg==
X-Gm-Gg: ATEYQzwH59roIEa2keoJnytuSVLl3BRi1aT/rUHqAGmOwR9h+K9Fj1thhRSH4IQHti9
	RTyWN2MvizoHrSwEq8VKiR5xc7FBjH0/zJW24at1q/sRXn+asn6h2UZAVvxaJziSLVOlnQbOial
	0cZKQ4NMdmCVHV4MCw1iyGirFQ3CmbSZGv7xSmhoNmcgurrEX8lstGLIyXeoYAVt2ZEcnmdhuk0
	t6GCoGBz5au5yxntseSkFXBq1vnT+XFu9Y4gL2b/oirsbVBBDXOcv4j5daO+aifoVQbc9DvA9Gm
	RNKkR6exclpql5ktsexA43PnmOuRnonzm5z49PTQNZTIQJ470G6FSgoiPv/mnuuFcUQ6h6MK0+q
	RJOZn7ogMF4NdbMVgMf/EKlzn2XrrCOC4YfwzhsM1M28+4EW2Rru5T2CmpGQOoFf+zqJWK8134t
	l9VoHITc14Q1tmXedv135+daYflaK54WSVOxgyYWV5aFi3o5zJ
X-Received: by 2002:a05:6a20:9e4d:b0:398:71e4:6287 with SMTP id
 adf61e73a8af0-39b99ca5836mr3522080637.10.1773843062426; Wed, 18 Mar 2026
 07:11:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123230651.688818373@kernel.org> <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
 <87jywvfkrs.ffs@tglx> <CAMVG2ssvadzUUoZw9xdYdZ4T5Sz+xdcQnXmU2NkR0N_yqieT=w@mail.gmail.com>
 <87ms0zva5i.ffs@tglx> <CAMVG2st0c7zoh-OYom_UwSA7WPDfRuM7f9gmt4pzU=Ap1Bm9Rw@mail.gmail.com>
 <87h5qeomm5.ffs@tglx>
In-Reply-To: <87h5qeomm5.ffs@tglx>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 18 Mar 2026 22:10:51 +0800
X-Gm-Features: AaiRm53qCcKmSZ75mDD2sq2Ae3VTV6FcRA7OAu2j0qsr1TYY0QthhUFhNLiKS7U
Message-ID: <CAMVG2stkXYJqrcaYpiPu0No=rTo8W+MxZZNZp6wjBE3sEphR8A@mail.gmail.com>
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	John Stultz <jstultz@google.com>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner <jwiesner@suse.de>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, Scott Hamilton <scott.hamilton@bull.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13750-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,gmx.de,alpha.franken.de,bull.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	NEURAL_HAM(-0.00)[-0.981];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,quora.org:dkim,quora.org:email,suse.de:email,mail.gmail.com:mid,alien8.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: D19132BD0F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026 at 17:01, Thomas Gleixner <tglx@kernel.org> wrote:
>
> On Sun, Mar 15 2026 at 22:59, Daniel J. Blueman wrote:
> > On Mon, 23 Feb 2026 at 21:53, Thomas Gleixner <tglx@kernel.org> wrote:
> > With that said, on the 16 socket (1920 thread) setup, we see most
> > remote calls end up timing out with WATCHDOG_READOUT_MAX_US at 50,
> > leading to excessive logging. pr_info_once() would be a good approach
> > to avoid the spam, however I still feel we should use a higher
> > (250-500us?) timeout to keep the mechanism effective.
> >
> > I also feel if a remote hardware thread is seen to timeout, retrying
> > has a high likelyhood of timing out also, so it may be cheaper in the
> > bigger picture to not retry. Sensitivity could be increased by walking
> > threads in socket order (S0T0 ... S15T0 S0T1 ... S15T1 ...). These two
> > items are my only concerns.
>
> Right. So I ditched the immediate retry and replaced the hard coded
> timeout with a runtime calculated one when NUMA is enabled. It's a
> reasonable assumption that insanely big systems have properly
> initialized SLIT/SRAT tables. So we can just [ab]use the node distance
> to determine the timeout for a remote CPU.

The node distance matches well: changing "if (wd_seq >
WATCHDOG_READOUT_MAX_NS) {" to use WATCHDOG_NUMA_MAX_TIMEOUT_NS, this
presented no regressions on 16 sockets/1920 threads during idle and a
"stress-ng --msyncmany 0" all thread adverse workload for 2h.

> ---
> From: Thomas Gleixner <tglx@kernel.org>
> Subject: clocksource: Rewrite watchdog code completely
> Date: Sat, 24 Jan 2026 00:18:01 +0100
>
> From: Thomas Gleixner <tglx@kernel.org>
>
> The clocksource watchdog code has over time reached the state of an
> unpenetrable maze of duct tape and staples. The original design, which was
> made in the context of systems far smaller than today, is based on the
> assumption that the to be monitored clocksource (TSC) can be trivially
> compared against a known to be stable clocksource (HPET/ACPI-PM timer).
>
> Over the years it turned out that this approach has major flaws:
>
>   - Long delays between watchdog invocations can result in wrap arounds
>     of the reference clocksource
>
>   - Scalability of the reference clocksource readout can degrade on large
>     multi-socket systems due to interconnect congestion
>
> This was addressed with various heuristics which degraded the accurracy of
> the watchdog to the point that it fails to detect actual TSC problems on
> older hardware which exposes slow inter CPU drifts due to firmware
> manipulating the TSC to hide SMI time.
>
> To address this and bring back sanity to the watchdog, rewrite the code
> completely with a different approach:
>
>   1) Restrict the validation against a reference clocksource to the boot
>      CPU, which is usually the CPU/Socket closest to the legacy block which
>      contains the reference source (HPET/ACPI-PM timer). Validate that the
>      reference readout is within a bound latency so that the actual
>      comparison against the TSC stays within 500ppm as long as the clocks
>      are stable.
>
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
>
>   3) Rewrite the watchdog test so it tests the various mechanisms one by
>      one and validating the result against the expectation.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Tested-by: Borislav Petkov (AMD) <bp@alien8.de>
> Reviewed-by: Jiri Wiesner <jwiesner@suse.de>
> Link: https://patch.msgid.link/20260123231521.926490888@kernel.org
> ---
> V2: Make it more cache line friendly and tweak it further for insane big
>     machines - Daniel

Signed-off-by: Daniel J Blueman <daniel@quora.org>

Thanks and great work Thomas!
  Dan
--
Daniel J Blueman

