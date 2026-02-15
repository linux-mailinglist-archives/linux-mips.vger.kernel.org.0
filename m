Return-Path: <linux-mips+bounces-13175-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lHYyN665kWnslgEAu9opvQ
	(envelope-from <linux-mips+bounces-13175-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Feb 2026 13:18:54 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E8213EA45
	for <lists+linux-mips@lfdr.de>; Sun, 15 Feb 2026 13:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAB2B3002514
	for <lists+linux-mips@lfdr.de>; Sun, 15 Feb 2026 12:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437E3224AEF;
	Sun, 15 Feb 2026 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="nZ1+6L6h"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2506C1FC7
	for <linux-mips@vger.kernel.org>; Sun, 15 Feb 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771157928; cv=pass; b=Sew3IAa5w43uF2wcMWKdL9ogdMY+KZY+0JjtIQrul/aWGpQDhaXlGaVEXHV2fd7l0XrE6reORdMiLr0+xHOoB5CB3dPFtOZGCxuYuMo0dsv+6NWAQsXVSkBTLWtzLuHQlBSTyCBPi1S3ME0q3Lgl73dsVfBYVkNdg00VGuJYI68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771157928; c=relaxed/simple;
	bh=fmPgLwEbHTQWL0mymkVyx43se3jeqRMBQgj0gxScimQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6KiryPc9idtZyPZFsF5cFNO1NbN4qxYtQYvGrN+JJeGgPzFt/Z1jfhvUKprITBtJVwqZIpo9M00HDGolSAd0g7bL83Wq/x4u+y+FDSM2eW6UPWUVx+5a05m85Yg3jhQsc3Noz7mEA7IoYoEe9mmIoFuZssYeXcz1zn3c1/5ShE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=nZ1+6L6h; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-354b79a9ad5so969036a91.1
        for <linux-mips@vger.kernel.org>; Sun, 15 Feb 2026 04:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771157926; cv=none;
        d=google.com; s=arc-20240605;
        b=CftXrxmwRcjTNxGItAvdtZufXUQH2amHUkwgqA1dX3kqwYPf5mNHzkA3kphKw2JfLg
         LIzFrmEIELzDSoa/27O/JNDjGLihcdX08DIl+ya3rITzHEAiovb2NSGaFlFZkVF/Bzfv
         pyxNmD+dLZsgBE/5DgZZtcDqZtruv7VmbnjfksEKV6W1KmVzc2tX+NQJYUPt+/ZjhID8
         AAbZa5eMJbi0UMcKrrcc6Q5ZwtqWyJgoYy4bxt4wZgNmI2KX1z1niZp7eREIajBhtrxy
         kH2b580Be+4Pzj2Cdv7AmYinPe7Mhw3SCrA+uCNxoSBShrwYzfwusnRw+AI7bJMKu5Ch
         Y63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YvJM/myYoGRZXx3gFIucEsRFfTWcy4DBPC1OXwlubIc=;
        fh=GFz/ZDDyO1YJb4DYNYyzSH84uQ6fzcQqc2/eGvueHeE=;
        b=QYQiXZ6veN61G9q1VM0zpKNnEXcMfeY40+hW/lbRQm7rsl9vf9fR5D0nz7HmDCEquV
         aegVh7mOpPOlzvmLSiJnawnFgyTLWalzF7X5qei4p7++1fN3nn3sdz/rH9S6giwtwCvP
         txvQakEmWwI3zqkSfej7LfzBFf8yHTOEdpKHNShp3hVEXsL/QAuKSx1iH1MgVrT7WXh+
         lbXsbM37gDJfexaX1NE3OjxnyYYlNm4mZCpJuwLrfv7rCm0/hyzLwPvAE8lHls5KE1O8
         6QZ/jO5uyvGRdPzyz0f1z1wEPmaWWBkiyHmPUJRmTafb/ne6q9IUzNe46J5B3mFZqh39
         r0VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1771157926; x=1771762726; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YvJM/myYoGRZXx3gFIucEsRFfTWcy4DBPC1OXwlubIc=;
        b=nZ1+6L6h/tO0grsWaLZ3on2rXhCLLi6ua9rPqCNUN2ORZwSscinQ1LSpkLMAKq3due
         zbTiWQF+aIPVlt/ABJXEq26PemJLtYv4bldNOVgZLmlr3H2cI2DCaSatvKXN5HrINIr5
         JnvViocylfqPAuEGFH3G35nU3U8gGqPFRuEYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771157926; x=1771762726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvJM/myYoGRZXx3gFIucEsRFfTWcy4DBPC1OXwlubIc=;
        b=qLLkFXr/Z0LJAxRjvOtO6s9qpoXzm7ctRBnCavHZoE0TXlK7ss0lb9SdVx05ucvZjY
         A2AIBXO8sRGSpWJ799irYGxFrlHXAtJPqaeAo+Q76uWOofROm484Ky/cJfq0+OicRM94
         n86UySCPA9BEBQqq7yZxQ4861fNkGJY4dAiLXvFw88s6xvyck41Od+x6Fdh0S+xWWqTb
         iIOBWx4qLz0e15ZCpwIfgIS/K3wumOxESHn1bzpDwdy/793v/qpZPeRKeA2fu05v2/gg
         Xp2nE2bgv+KUhsfanLNmoWGrbLWbdesl6Axzr2nO4KNfEwCrrXrdDe1An+reg3Icnkx5
         Z+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQD1DkCd6WGaeZc6aGdZ18es2zU8XnbN7LD+ZJXac2S5YexLhStoRd1nMwmLU/YoKGhE33+x+8fA1u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ppoy9T9Sf9zfzNjiGAIRThyMudjBkOnBCkvDUJtQpraddNjG
	G/qH0nluVW04HTGnt5AGPLZSVgSiR9zZcOwI9RQ24C5Isr+4KM9d9kAus/U0nJLc8cAR+HCIXkc
	2xFlGz/Edsxrpz1BqaAOtpsUcQalTvnBeCVxxEvc61A==
X-Gm-Gg: AZuq6aLnSHalpVOLbglEIQGHM8X1lkeyn9EvVU15aGaMbckHUKyB5iwJu6eTQPerSQI
	28vSwNH7NjTgAweD5RuOzBx4JIdYRidEaxnInO8SCDsmI3r5cPr8VJhOCCCSO9Ciu2FijOdHj2D
	taAyKLNm4lfoh3CR2KwHFK625qgBfyrVeIiF3YLlev/D0CtHpVv5E5Xz0xk6SkvXcOvWOrzfowb
	Ekvt93XWYFhzOgOSWUQOcquRKEM0RVV/HO+1e6kQeVzhcNW+Cb+lQVl5A2Gq27asv/tF38e9AX7
	YCtDe960vtzHAzA6xkQGBHOiXabrM3jR31eg+JkeLoIqC6Nn18kfkRI/OMB+wGC3OP62IieTxjj
	NTY+w2n/8XKZZOkYXQHzla1e0q/eWOF1yLGHNr22t5micdAtv/5958cOwN4vOdEhkhRHuVoW0Di
	9gGgEOVNrkWN0VbHjgZkCiQ5q4HtxNldlf2Kq3izUM847XzDP8
X-Received: by 2002:a17:90b:3912:b0:336:b60f:3936 with SMTP id
 98e67ed59e1d1-35844a4e94dmr4937619a91.12.1771157926489; Sun, 15 Feb 2026
 04:18:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123230651.688818373@kernel.org> <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com> <87jywvfkrs.ffs@tglx>
In-Reply-To: <87jywvfkrs.ffs@tglx>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 15 Feb 2026 20:18:35 +0800
X-Gm-Features: AZwV_QibZJ9E9YhQcsvR295f2r9bTa2GDpaXK9QqRhlPq-MsVfR97oWCo6vVVEU
Message-ID: <CAMVG2ssvadzUUoZw9xdYdZ4T5Sz+xdcQnXmU2NkR0N_yqieT=w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[quora.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-13175-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,eviden.com,gmx.de,alpha.franken.de];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,quora.org:dkim]
X-Rspamd-Queue-Id: E4E8213EA45
X-Rspamd-Action: no action

On Mon, 2 Feb 2026 at 19:27, Thomas Gleixner <tglx@kernel.org> wrote:
> >> +/* Maximum time between two watchdog readouts */
> >> +#define WATCHDOG_READOUT_MAX_NS                (50 * NSEC_PER_USEC)
>
> > At 1920 threads, the default timeout threshold of 20us triggers
> > continuous warnings at idle, however 1000us causes none under an 8
> > hour adverse workload [1]; no HPET fallback was seen. A 500us
> > threshold causes a low rate of timeouts [2] (overhead amplified due to
> > retries), thus 1000us adds margin and should prevent retries.
>
> Right. Idle is definitely an issue when the remote CPU is in a deep
> C-state.
>
> My concern is that the control CPU might spin there for a millisecond
> with interrupts disabled, which is not really desired especially not on
> RT systems.
>
> Something like the untested below delta patch should work.

Good step forward! We can also reduce remote cacheline invalidation by
putting 'seq' into the cacheline after 'cpu_ts' by reordering:

struct watchdog_cpu_data {
       atomic_t                remote_inprogress;
       struct clocksource      *cs;
       enum wd_result          result;
       u64 cpu_ts[2];
       call_single_data_t      csd;
       atomic_t        seq; /* Keep in second cacheline to elide
unnecessary invalidation */
};

and reordering the inner loop:

        for (int seq = local + 2; seq < WATCHDOG_REMOTE_MAX_SEQ; seq += 2) {
                if (!watchdog_wait_seq(wd, start, seq))
                        return;

               /* Capture local timestamp before possible non-local
coherency overhead */
               now = cs->read(cs);

               /* Store local timestamp before reading remote to limit
coherency stalls */
               wd->cpu_ts[local] = now;
               prev = wd->cpu_ts[remote];
               delta = (now - prev) & cs->mask;

                if (delta > cs->max_raw_delta) {
                        watchdog_set_result(wd, WD_CPU_SKEWED);

With that said, with your latest change on the 1920 thread setup,
WATCHDOG_READOUT_MAX_US 1000 is still needed to avoid timeouts during
the previous adverse workload, however some timeouts are still seen
during massive parallel process teardowns.

To limit overhead, perhaps it is sufficient to set the timeout to
100us, avoid retries (as the hardware thread may continue to be busy
and will be rechecked later anyway), and log timeouts at the debug
level if at all.

Thanks,
  Dan
--
Daniel J Blueman

