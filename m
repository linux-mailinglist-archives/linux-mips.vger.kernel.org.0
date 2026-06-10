Return-Path: <linux-mips+bounces-15020-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qO78G8L+KGptOgMAu9opvQ
	(envelope-from <linux-mips+bounces-15020-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 08:05:54 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D784566613D
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 08:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fpqNT5H0;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15020-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15020-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 452343040DA9
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 06:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D992C2FFDE1;
	Wed, 10 Jun 2026 06:05:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657B334105B
	for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2026 06:05:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781071537; cv=none; b=MgQNJ4J5Fg+EhuFMVz3QjimTyIFG+R5srp9OYj0NjvaZEQRNz+U00HW5p8nSfQH/klfIX/cE8cH7FQYreYzgIH9/4z351MbRFoAPWmYzf6wEkg00hHZFiq6P8IM9hH27WnSsEVzOybo4GmnklEvVKuYT0D1YdMVygsYePPFPsWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781071537; c=relaxed/simple;
	bh=y2wsVPelIEtMq3U3KX4WbY3IdmtftE3qpW7t6devt+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jocXwcVlARe9XgrPlsgwHrcsqPZw9FjrLs1tPvPREp38AHF77sBHC7LiWFVl0M0JVGAotOAQ0wRkwnRaTysxU4joX/YcsYqtaM/gFFiG+4Ki/FIWJS51qYM75JhaW5Az2hvd5i7GXsGlxK1VE4IxFXJYRDRGc1yR5d/qqXYszp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpqNT5H0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DE51F0089F
	for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2026 06:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781071535;
	bh=FTK5q5irjTJDtyh2inFzHi3DC2x4G3YrOl+FUqbTtH8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fpqNT5H03zbQNgcEVq8Rf7kstpehLDgDtoQJMjmCbSdBf00/H1epyiItcyJpXohlQ
	 Lx6AFszxQRQaQ/UVRHWpVyM3stQhrHWcYVEOOOYSjGozSjhMxhCBbeSGRNEVgxUKlH
	 zGIFBMlgmQFaKFgwDmZxqjtl/Wz36hbwdLFEK0mFu+LWQubJIqWNgrlP4YQxmUVx2Z
	 USuXQMM5zXrbjNAZAQ9l/7AVWWjR1WEpn4vBBqsiipqWP49mhnjvp9PZrfRX8cGsqI
	 Kb0VbC97YQP2q/tuI2iQcszTRFbbYeeSrhNQ0pZCZ789R0zXHe76yCrGQCqRB8oyqJ
	 Ak0vWUhyTAdhQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68d23430690so12637931a12.3
        for <linux-mips@vger.kernel.org>; Tue, 09 Jun 2026 23:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8lN/2CaqX51Ye56XgxlY2eEWrrmkC/tHUjPFwB9v1I9U/RM4Mk6qEgbhUB0kYQfnnxO5AQDPg9JSo9@vger.kernel.org
X-Gm-Message-State: AOJu0YwXWbAfvEQd6wCCUaJ4XylXvy4yYol0Y8FJ7NQFmSNTWp+JSvU1
	s4jjVOoohFJ8rygKf00wKeUJvZSFnEkrDBaDS0/R4FDBeWqGqJBosbcijeRbe7qCqknYr4Wylgf
	4v/VIx97ivUz+eCWsVql+/rWo1XRWR4Q=
X-Received: by 2002:a05:6402:518c:b0:68c:627d:fc2b with SMTP id
 4fb4d7f45d1cf-68fa5039e51mr10638713a12.16.1781071533743; Tue, 09 Jun 2026
 23:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608093729.12111-1-jelonek.jonas@gmail.com>
In-Reply-To: <20260608093729.12111-1-jelonek.jonas@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 10 Jun 2026 14:05:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7vJ5YniUD8HhFWBbypNyWTo73M_vzw=Y-MZtR-b_RNfw@mail.gmail.com>
X-Gm-Features: AVVi8CeBRd2PLLuFTXLO59EuacgjVdNmuBqSnRmL8jqW-pPNGJNNz_1TkdYV9Ms
Message-ID: <CAAhV-H7vJ5YniUD8HhFWBbypNyWTo73M_vzw=Y-MZtR-b_RNfw@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15020-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jelonek.jonas@gmail.com,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jelonekjonas@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D784566613D

Hi, Jonas,

On Mon, Jun 8, 2026 at 5:37=E2=80=AFPM Jonas Jelonek <jelonek.jonas@gmail.c=
om> wrote:
>
> smp_send_stop() parks all secondary CPUs in stop_this_cpu(). The function
> marks the CPU offline for the scheduler via set_cpu_online(false) but
> never informs RCU, so RCU keeps expecting a quiescent state from CPUs
> that are now spinning forever with interrupts disabled.
>
> As long as nothing waits for an RCU grace period after smp_send_stop()
> this is harmless, which is why it went unnoticed. Since commit
> 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() on PREEM=
PT_RT")
> however, irq_work_sync() calls synchronize_rcu() on architectures without
> an irq_work self-IPI, i.e. where arch_irq_work_has_interrupt() returns
> false. That is the asm-generic default used by MIPS. Any irq_work_sync()
> issued in the reboot/shutdown path after smp_send_stop() then blocks on
> a grace period that can never complete, hanging the reboot:
>
>   WARNING: CPU: 0 PID: 15 at kernel/irq_work.c:144 irq_work_queue_on
>   ...
>   rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
>   rcu: Offline CPU 1 blocking current GP.
>   rcu: Offline CPU 2 blocking current GP.
>   rcu: Offline CPU 3 blocking current GP.
In theory LoongArch has the same problem, but I cannot reproduce,
should I enable PREEMPT_RT? Or there are some special configurations?

Huacai

>
> This issue was noticed on several Realtek MIPS switch SoCs (MIPS
> interAptiv) and came up during kernel bump downstream in OpenWrt from
> 6.18.33 to 6.18.34, after the backport of the patch to the 6.18 stable
> branch. The patch also has been backported all the way back to 6.1.
>
> Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring th=
e
> generic CPU-hotplug offline path, so RCU stops waiting on the parked CPUs
> and grace periods can still complete. MIPS shuts down all CPUs here
> without going through the CPU-hotplug mechanism, so this report is not
> otherwise issued. Reporting a dying CPU to RCU outside the regular hotplu=
g
> offline path is not unprecedented: arm64 does the same in cpu_die_early()=
.
> There it is an exception for a CPU that was coming online and is aborting
> bringup, rather than the default shutdown action as on MIPS.
>
> Fixes: 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() o=
n PREEMPT_RT")
> CC: stable@vger.kernel.org
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
>
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 4868e79f3b30..0f28b4a62e72 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -20,6 +20,7 @@
>  #include <linux/sched/mm.h>
>  #include <linux/cpumask.h>
>  #include <linux/cpu.h>
> +#include <linux/rcupdate.h>
>  #include <linux/err.h>
>  #include <linux/ftrace.h>
>  #include <linux/irqdomain.h>
> @@ -422,6 +423,7 @@ static void stop_this_cpu(void *dummy)
>         set_cpu_online(smp_processor_id(), false);
>         calculate_cpu_foreign_map();
>         local_irq_disable();
> +       rcutree_report_cpu_dead();
>         while (1);
>  }
>
> --
> 2.51.0
>
>

