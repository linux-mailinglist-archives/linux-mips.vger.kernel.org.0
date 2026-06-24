Return-Path: <linux-mips+bounces-15176-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HxiQM0U5O2qrTQgAu9opvQ
	(envelope-from <linux-mips+bounces-15176-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 03:56:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C63C6BAD8A
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 03:56:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hOYG8CvU;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15176-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15176-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2887300D696
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 01:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF8B274B3B;
	Wed, 24 Jun 2026 01:56:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B092F2701BB
	for <linux-mips@vger.kernel.org>; Wed, 24 Jun 2026 01:56:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782266175; cv=none; b=P3ES92oxUuAT7b1vXlNw6NqWxJHQpVSsmhFDjeF7mWMxu/T8xoLKGT4vosUhLa/VWjebQPbAqmGeEF22nQqfpm/CgSQOVbwl6L79zYYen3jP0eRxn7J++PgW1t8SgymAZ2dZo3xy992U1uuLkeRqHlz3pfbdHght7r4wjayav0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782266175; c=relaxed/simple;
	bh=gPu3FOxQiQ0uU+fA2TV2OJYMCl07bZ8LHmEofD6dl7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VP1U6FXZfvl7fUfiNtL0CvSFQGGSJnh5e6pEyoxUu0jjQ/ZM6gK42GUoLp89uBBOSWR6l8JWyakyGY5p89fSiQa7nnDQjKNgTE6eI1fjqEKXjYAMOPP3La0E+k3efu2Uds/2CSfK9Uu+8/FlJFsMS3pQ1LmL0ChzRWP6m0BQktA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOYG8CvU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9218F1F00ADB
	for <linux-mips@vger.kernel.org>; Wed, 24 Jun 2026 01:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782266174;
	bh=f0vOxifqaz+hS+VdiakGBn1KstKfYAxDodPWoCbL64k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hOYG8CvUCINhDuCDMjPm2seU1QtglhJD2HV/0m6Jy6/XUOrNmaNlOsJycpK5mRkC9
	 ReX9Pre8uWzXnJQ0EhnN9hI9JtDNSW1lggW4ldGDP9F4H/iz9mTwnM7MACKztvagDL
	 REY9zm2MIdL8QMfjQYlls8kOGmX5odKS6/95sI2JTcWzNURJjpkbhruXdQd/MLuqdh
	 gi/pjRqPFqwnOXOZsiP8eR07uRHw599tTb9ee3+/2U7mdv2pOvBSKc/iDvTsVCBUP2
	 9XTubPxRdhoQkzGpwiOiDtB+8vHRf0a3BiJwzHx2BLsmDrMcqiBmpgrQxCSlWTJuoW
	 qFLaR7XlG2l2Q==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-697f6c67028so187683a12.1
        for <linux-mips@vger.kernel.org>; Tue, 23 Jun 2026 18:56:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/KSopR9kRnXCUX5vW7+cuvcLl6kZv0j5rGsD0199JhGrPPGFsufdcC5f6iq4jwJjzra4b/pP27rWog@vger.kernel.org
X-Gm-Message-State: AOJu0YwDgNuv1JFZS4npxVknH9SnwFSdVqM1pOMYJ7qtLw66vgBwMcU2
	lEfCfNPqdQuKMvQXBY55IQSFJFyXLBeqSWATXRe3Sz8reiig/8qiVtI7gZYgaIW5BqFJrP2Nwoj
	O5kb+LhYrwDqXbKRzzBJ/nlKQMaGbryo=
X-Received: by 2002:aa7:dc09:0:b0:697:9fd4:1433 with SMTP id
 4fb4d7f45d1cf-697d42d9a94mr2231369a12.7.1782266173207; Tue, 23 Jun 2026
 18:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623172728.191557-1-xry111@xry111.site>
In-Reply-To: <20260623172728.191557-1-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 24 Jun 2026 09:56:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H78gWEVDXy6pgOFScLMuMx-fssiXDZNzYZKt0Zgt75=fA@mail.gmail.com>
X-Gm-Features: AVVi8CfE_V_m6-Q1zejbbndpjmWD3SpdRr3dhW790ice0TWK-LcLVLpR5Ll2s-I
Message-ID: <CAAhV-H78gWEVDXy6pgOFScLMuMx-fssiXDZNzYZKt0Zgt75=fA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: loongson64: add IRQ work based on self-IPI
To: Xi Ruoyao <xry111@xry111.site>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Mingcong Bai <jeffbai@aosc.io>, Henry Chen <chenx97@aosc.io>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15176-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xry111@xry111.site,m:tsbogend@alpha.franken.de,m:jiaxun.yang@flygoat.com,m:jeffbai@aosc.io,m:chenx97@aosc.io,m:jiayuan.chen@linux.dev,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C63C6BAD8A

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Jun 24, 2026 at 1:28=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> Since the commit 91840be8f710 ("irq_work: Fix use-after-free in
> irq_work_single() on PREEMPT_RT"), we observed the performance of
> execve() is significantly impacted on MIPS.
>
> While we are unsure how that commit caused the impact or how to improve
> it (or even if it can be improved at all), implementing IRQ work with
> self-IPI seems able to mitigate the impaction.
>
> Perhaps this can/should be implemented for other MIPS architecture
> processors as well, but we don't have the enough knowledge of them, nor
> access to the hardware.  So only implement it for loongson64 here.
>
> Link: https://lore.kernel.org/6be1cdd5f91dd7418a32ff372a6f3ae259b19195.ca=
mel@xry111.site/
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/mips/include/asm/irq_work.h |  9 +++++++++
>  arch/mips/include/asm/smp.h      |  2 ++
>  arch/mips/loongson64/smp.c       | 10 ++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 arch/mips/include/asm/irq_work.h
>
> diff --git a/arch/mips/include/asm/irq_work.h b/arch/mips/include/asm/irq=
_work.h
> new file mode 100644
> index 000000000000..d4fa2d80aabc
> --- /dev/null
> +++ b/arch/mips/include/asm/irq_work.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_MIPS_IRQ_WORK_H
> +#define _ASM_MIPS_IRQ_WORK_H
> +static inline bool arch_irq_work_has_interrupt(void)
> +{
> +       return IS_ENABLED(CONFIG_MACH_LOONGSON64) && IS_ENABLED(CONFIG_SM=
P);
> +}
> +#endif /* _ASM_MIPS_IRQ_WORK_H */
> diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
> index 2427d76f953f..a545568f1cac 100644
> --- a/arch/mips/include/asm/smp.h
> +++ b/arch/mips/include/asm/smp.h
> @@ -50,6 +50,8 @@ extern int __cpu_logical_map[NR_CPUS];
>  #define SMP_CALL_FUNCTION      0x2
>  /* Octeon - Tell another core to flush its icache */
>  #define SMP_ICACHE_FLUSH       0x4
> +/* Loongson64 - Self IPI for IRQ work */
> +#define SMP_IRQ_WORK           0x8
>
>  /* Mask of CPUs which are currently definitely operating coherently */
>  extern cpumask_t cpu_coherent_mask;
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index 147acd972a07..e584299d0fde 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -381,6 +381,13 @@ loongson3_send_ipi_mask(const struct cpumask *mask, =
unsigned int action)
>                 ipi_write_action(cpu_logical_map(i), (u32)action);
>  }
>
> +#ifdef CONFIG_IRQ_WORK
> +void arch_irq_work_raise(void)
> +{
> +       loongson3_send_ipi_single(smp_processor_id(), SMP_IRQ_WORK);
> +}
> +#endif
> +
>  static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
>  {
>         int cpu =3D smp_processor_id();
> @@ -397,6 +404,9 @@ static irqreturn_t loongson3_ipi_interrupt(int irq, v=
oid *dev_id)
>                 irq_exit();
>         }
>
> +       if (action & SMP_IRQ_WORK)
> +               irq_work_run();
> +
>         return IRQ_HANDLED;
>  }
>
> --
> 2.54.0
>

