Return-Path: <linux-mips+bounces-14096-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP+2CuAL2mmDyAgAu9opvQ
	(envelope-from <linux-mips+bounces-14096-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2026 10:52:48 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 867683DF052
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2026 10:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A805301DE0F
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2026 08:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8282F4A15;
	Sat, 11 Apr 2026 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K799DHjo"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A582D949B
	for <linux-mips@vger.kernel.org>; Sat, 11 Apr 2026 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775897558; cv=none; b=gKaGuMrZKEOScqIP8KX6xCr5BRYKt+6No9BuXUPR2EyaSLBg99ItyhY+eEKWYr//PCG7qgNZpNp7tJP4WSMBobyY5SEG1uPELtHLf1Pt1gKCH0X1QkDKw1pnZezyZ2njzsI00YGvdjN1r82NBejDKPIgISFWcrw45WNL4cLdRNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775897558; c=relaxed/simple;
	bh=5MOekENutohx2KQWO5DZt7CmPzwY3/lBPVI2yzBUVwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LX8hbwdSriWpbpUtJT3Uc5zy9cxpEnqiysSUhpcEW3P+ty7r2+zuuwxMsgvJEia1KLFA2Fb5x9q5puMbKI36cZxEcLFBD3ENOa6Y0AOGm4QWVxCKuFQE5vLEoxYS6aNfxYCNS1CFXZAKbX/uHtGY1cnBK/t633rVidIzXtCvNsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K799DHjo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD95C2BCB1
	for <linux-mips@vger.kernel.org>; Sat, 11 Apr 2026 08:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775897558;
	bh=5MOekENutohx2KQWO5DZt7CmPzwY3/lBPVI2yzBUVwM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K799DHjoZ6ACVudY6FJjO9FcVaYCHOlJM1+eD3MjepGTBOjZPBiiUGY7Dwc7tUL8N
	 UcL9UD5rlwluD7EkfP3ks3K73nMM59sZ3sw0MEs2I5lYfGbIw8aYvF+4ApEb+bijgC
	 VzQmTe21q28E5vZO+QbOcQmyJd3Z9xkqjQQksYUzTdJWhZeRbBam2icQc1JWC5FJLg
	 Do8ztZyN3HfjROpbFq9kjASckV8h8wb3Il4HyQbl9Jcn7hn4QcWyNVAZ6STH1XmMFJ
	 4gfejYtu+sGZt8wvQBkMxUQjNnlTzjODGBnlpfi+tEK2ffTqQsqzatKd5ibapxraFJ
	 vsZv3Y9bjX5kw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso3789036a12.0
        for <linux-mips@vger.kernel.org>; Sat, 11 Apr 2026 01:52:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU06cHj/ikESdYEQWIF9dqtESPZzcOMjoi+XRcY88XSZ20TPdoPeTsEdLMlg+T2QkqgmCpo3Y+M4QI7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq5Lcey+NKmN8621Ki7amskCMjCAMs2jsdI0HxE1uL7GRKSTOA
	9cMEEwF64dFuGcdlo7XIWFsCX5dABomPKvAPqKiTp8bKV953WYRIPmVM8qWtPDQuCtdA/VntwVw
	asoTxWo0y1pdz3t2g78+VLra9M9bE2Y4=
X-Received: by 2002:a17:907:d7c6:b0:b9d:6a04:beb0 with SMTP id
 a640c23a62f3a-b9d6a04bf1fmr361632566b.4.1775897556789; Sat, 11 Apr 2026
 01:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409164846.3176046-2-stefan.wiehler@nokia.com>
In-Reply-To: <20260409164846.3176046-2-stefan.wiehler@nokia.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Apr 2026 16:52:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H43d0v6XUcCc8sVW-FO6+N0RDq6n4fUzW=NORu8TshozA@mail.gmail.com>
X-Gm-Features: AQROBzBgPmM7xj64sYDIZDhh9-zGBb560-EB0bGCgqgM3P3TNYbvyCznb1OhnFM
Message-ID: <CAAhV-H43d0v6XUcCc8sVW-FO6+N0RDq6n4fUzW=NORu8TshozA@mail.gmail.com>
Subject: Re: [PATCH v2] mips: mm: Call rcutree_report_cpu_starting() even earlier
To: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14096-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 867683DF052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Stefan,

On Fri, Apr 10, 2026 at 12:51=E2=80=AFAM Stefan Wiehler
<stefan.wiehler@nokia.com> wrote:
>
> rcutree_report_cpu_starting() must be called on secondary CPUs before
> allocating memory to avoid the following Lockdep-RCU splat when
> CONFIG_PROVE_RCU_LIST=3Dy:
>
>   WARNING: suspicious RCU usage
>   6.6.119-00d46e15c416-fct #1 Not tainted
>   -----------------------------
>   /kernel/locking/lockdep.c:3762 RCU-list traversed in non-reader section=
!!
>
>   other info that might help us debug this:
>
>   RCU used illegally from offline CPU!
>   rcu_scheduler_active =3D 1, debug_locks =3D 1
>   no locks held by swapper/1/0.
>
>   stack backtrace:
>   CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.119-00d46e15c416-fct #1
>   Stack : 80000000029e37d8 0000000000000000 0000000000000008 80000000029e=
37e8
>           80000000029e37e8 80000000029e3978 0000000000000000 000000000000=
0000
>           0000000000000000 0000000000000001 ffffffff80d9df38 ffffffff810e=
19c0
>           0000000000000000 0000000000000010 ffffffff80a7d140 000000000000=
0000
>           ffffffff81c20814 0000000000000000 ffffffff80da0000 000000000000=
0000
>           ffffffff80cadf38 0000000000000000 0000000000000000 80000000029a=
b680
>           72f093276415c1f3 ffffffff81c2084f ffffffff80da0000 ffffffffc014=
9ed8
>           fffffffffffffffe 80000000029e0000 80000000029e37e0 80000000029a=
bf58
>           ffffffff80129fb0 0000000000000000 0000000000000000 000000000000=
0000
>           0000000000000000 0000000000000000 ffffffff80129fd0 000000000000=
0000
>           ...
>   Call Trace:
>   [<ffffffff80129fd0>] show_stack+0x60/0x158
>   [<ffffffff80a8cd84>] dump_stack_lvl+0x88/0xbc
>   [<ffffffff801c78f8>] lockdep_rcu_suspicious+0x1c0/0x240
>   [<ffffffff801cc80c>] __lock_acquire+0x121c/0x29d8
>   [<ffffffff801ce14c>] lock_acquire+0x184/0x448
>   [<ffffffff80a9ba30>] _raw_spin_lock_irqsave+0x50/0x90
>   [<ffffffff80367038>] ___slab_alloc+0xa08/0x1808
>   [<ffffffff80367e70>] __slab_alloc.isra.0+0x38/0x78
>   [<ffffffff8036b7d4>] __kmem_cache_alloc_node+0x35c/0x370
>   [<ffffffff80308ed8>] __kmalloc+0x58/0xd0
>   [<ffffffff80a8f064>] r4k_tlb_uniquify+0x7c/0x428
>   [<ffffffff80143e8c>] tlb_init+0x7c/0x110
>   [<ffffffff8012bdb4>] per_cpu_trap_init+0x16c/0x1d0
>   [<ffffffff80133258>] start_secondary+0x28/0x128
>
> See also commit 55702ec9603e ("mips/smp: Call
> rcutree_report_cpu_starting() earlier").
>
> Fixes: 231ac951faba ("MIPS: mm: kmalloc tlb_vpn array to avoid stack over=
flow")
> Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
> Cc: stable@vger.kernel.org
> ---
> V1 -> V2: Reorder rcutree_report_cpu_starting() call in
> start_secondary(), fix function name
>
> v1: https://patchwork.kernel.org/project/linux-mips/patch/20260407083324.=
906742-2-stefan.wiehler@nokia.com/
> ---
>  arch/mips/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 4868e79f3b30..bdb47c70d4f5 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -359,8 +359,8 @@ asmlinkage void start_secondary(void)
>         unsigned int cpu =3D raw_smp_processor_id();
>
>         cpu_probe();
> -       per_cpu_trap_init(false);
>         rcutree_report_cpu_starting(cpu);
> +       per_cpu_trap_init(false);
Please see 5056c596c3d1848021a4eaa76ee42f4c05c50346 ("LoongArch/smp:
Call rcutree_report_cpu_starting() at tlb_init()"), maybe MIPS will
have similar issues.

Huacai

>         mips_clockevent_init();
>         mp_ops->init_secondary();
>         cpu_report();
> --
> 2.42.0
>
>

