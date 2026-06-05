Return-Path: <linux-mips+bounces-14909-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wmgeFBQ8ImqOUAEAu9opvQ
	(envelope-from <linux-mips+bounces-14909-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 05:01:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC0644C90
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 05:01:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cqNVU2vx;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14909-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14909-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71D0030276B4
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2026 03:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C1E3D47B8;
	Fri,  5 Jun 2026 03:01:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9037E3A6B6D
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 03:01:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780628496; cv=none; b=PqxXOmzda95QTJLsTWYWaUOSmhsySIPiN6aFoVlZaF0omXGvj1rfqzzHVFIhz/Tfl/MqSU2zAod/Ig0XIw4VAvHex/iHmh8fJkpeN+qQn/KuEvY7lFH/bxY20uGp0WlmtNWxrrFeBVKvuQ86TUn+R3jCIULQFsnxCCFnTaEIgQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780628496; c=relaxed/simple;
	bh=8oFkNBae0WeW+XySIH1TOUSpYWfTkzh/iTHSAUFFS/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRORovms39r/O5DL1P/pFJNClM0bTjFLFtfxIJq7IXFUitYCfmC6hnTXMw0UOvhtkL/+hg9HDhQx14gAeludhMvNKDastpwGInUeciaw/Kotg3shb0A0j3+MKC1Rcyg+xyUzBgcL+cSEsZfG2aVFPd500KxiYVZKOwuRKYLECZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqNVU2vx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8271F0089A
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 03:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780628492;
	bh=Qot5MKbUL/+0V3hX55HDcvFA3oU5tA4W2gsnoTLBjzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cqNVU2vxL4eaEV0/nqpzC3gpvg19r6Jy7XmFvYTbMBAIAp+DWAy9pbrPZKQe6xWzk
	 GL+THwP9U4h3glbl63IUpsWpmbf7A0gJfoEyQxLz+tBmKA0cg5UU+1CztDt53mki2G
	 K2HYiFUqWLXc9lY61zyL8uP/acdiLIzkFclr5KV3AWRrKLBwmbAQC15/W5pt/fqyKK
	 v3kn4sKeZjfytGHvoPyKVhuq2WTJqpIMaThWGetRGalo6ksCqg4DwuyfpX0ZC2zJ0P
	 pyp0Q3dxb+oXVN+vWITrlVLWNHJc2zPyTPyLTTNpO0quE5X/vPXHg7iNzcdzqqK2k7
	 /IcyM9QwcxhbQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68d234218bcso2794429a12.2
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 20:01:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ86+EOPYeYiAn5JFcLJ3qSxxTMQN0l2oJD2QI0zvE/AAxMfbC20Je6roqlk01BtvPyf4PBlPX1CEe2U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+WmICDtiqY9408p8WafqqcqvVtqLia38YKRYAmb4KVLIu5cEB
	mP9hXbMn3dfcNBxdxIhA2r3Fi4MsGNXdKTRIb2Sdq2i2/PgNSMp4UlZI++6f3ZpwbeKc3hHmNhL
	GYxSJGkmfg3Dt0bLRl8HzDVrrxTRQu98=
X-Received: by 2002:a17:907:9486:b0:bd4:7bed:512a with SMTP id
 a640c23a62f3a-bf372159fecmr59795766b.30.1780628490779; Thu, 04 Jun 2026
 20:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
In-Reply-To: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Jun 2026 11:01:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6khmNSNLOpVzV2B9qmRVAZkY6w8nYVrJC6QBP5CrFd3w@mail.gmail.com>
X-Gm-Features: AVVi8Cff9VD9kkc76jgjyhmWfyiyAtuxoVRhN2LR48HGLll75a6yTaczl2ar0aU
Message-ID: <CAAhV-H6khmNSNLOpVzV2B9qmRVAZkY6w8nYVrJC6QBP5CrFd3w@mail.gmail.com>
Subject: Re: [PATCH] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14909-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jelonek.jonas@gmail.com,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jelonekjonas@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3CC0644C90

Hi, Jonas,

On Fri, Jun 5, 2026 at 2:25=E2=80=AFAM Jonas Jelonek <jelonek.jonas@gmail.c=
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
>
> This issue popped up during kernel bump downstream in OpenWrt from
> 6.18.33 to 6.18.34, since the suspected change has been backported to
> 6.18 stable branch [1].
Now 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single()
on PREEMPT_RT") has been backported to as early as 6.1 LTS.

>
> Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring th=
e
> generic CPU-hotplug offline path (and arm64's stop handling), so RCU stop=
s
> waiting on the parked CPUs and grace periods can still complete.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/?h=3Dlinux-6.18.y&id=3D18c0456ea2615b1a743a6db739c74411c3b42bc6
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
I'm not sure but maybe it is better to before local_irq_disable()?

Huacai
>         while (1);
>  }
>
> --
> 2.51.0
>
>

