Return-Path: <linux-mips+bounces-15146-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Z6nHH/sNGrgkAYAu9opvQ
	(envelope-from <linux-mips+bounces-15146-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 09:15:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7646A447B
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 09:15:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a8JtNSsW;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15146-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15146-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A6D930276A6
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 07:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FD335200C;
	Fri, 19 Jun 2026 07:14:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98A33F37A
	for <linux-mips@vger.kernel.org>; Fri, 19 Jun 2026 07:14:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781853271; cv=none; b=s8UQ6Jsaqhpmg6xuIcNbGY5U0K+9Mj4k5VHyHOn1QF/SWeUM2sq5v0dkgRvy6mQgTk6PZRs62ufC05eA9xgQdbCJjy508yxAZtAK28nIavRTA0Vfiw7Ea0l41N/8ZxDU/rCyIsnVWfVQSIbifrdnxkv+2y7Qh0flCZGs3jvSxJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781853271; c=relaxed/simple;
	bh=pFkwZT3DEH1dsI/D4DqyH8m2UvBfRyRJYi0n59bqyU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uf3KNWCZpErpGx6AFyypDwVV/mWRsbPsnOeBA7acV3dVX0cC7ieqBYQH6qgiYxrVMt1m4mhXwPtF6iiRALH6lsKG96BJRDG4ulFU5XqMV5e8/wylcwtVmx0cuEBMwbF85xufB3Vpp3sEi3WQIxkAWfOJUU+LeUCcJ5JxnxaofOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8JtNSsW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE80F1F00A3F
	for <linux-mips@vger.kernel.org>; Fri, 19 Jun 2026 07:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781853270;
	bh=pFkwZT3DEH1dsI/D4DqyH8m2UvBfRyRJYi0n59bqyU8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a8JtNSsW5ZOpqGHqjZTEoOF7Q2KP7uNXdMKtGrVWpUV35d2nU14EaOIeSq4IVm9Sw
	 Q2RHPWqcywrhjozIBq/n3Gwrwql/64fh2PVJqlKr9ttfZMqfEdzUz9iBmXzY7uMLan
	 C4ILjwxkr7E/oXTDurBAnSOQV8qVF0LCk8UQyBAOQr+sQO3Tsd/XKRkcOVR5OCkqCK
	 Xk7BE5uX/pCBwqHZW6EEDr10qkY0YZTr02WE43JfjLb6YbgPEwd3PKrbMqKOx9krYE
	 sOQH/siXmBInoaU4O45pcATSUKGZASC9tRS5u1UFVCG2tiX0P4ng/zYXxW1qrghU1x
	 3srI9hLgi1ndA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-693c69b97e7so2869677a12.2
        for <linux-mips@vger.kernel.org>; Fri, 19 Jun 2026 00:14:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8MuGzSEC8oMpehTL7Tn2bpWfkuf54iJXKUjJxpZLBjbdUIXnsmlgu6IlKvwHXW72K/Y2sjeZhCLeJr@vger.kernel.org
X-Gm-Message-State: AOJu0YxROn7gih95sl0x0Qimw0BqCZT3olvFKAyTa4RHVV90ttdi7qi3
	0R4ELxwof5ESV2h5s92WAti6Aivab/K5rusgg6NYH1u5J0+6aZSlEM4IZHJJaX+RmLqisK2Cyqe
	V6mPZfeq53N430MnQoCYBH4ROf9G4HJc=
X-Received: by 2002:a05:6402:3510:b0:697:6463:8329 with SMTP id
 4fb4d7f45d1cf-697646386b5mr211191a12.17.1781853269349; Fri, 19 Jun 2026
 00:14:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608093729.12111-1-jelonek.jonas@gmail.com>
 <CAAhV-H7vJ5YniUD8HhFWBbypNyWTo73M_vzw=Y-MZtR-b_RNfw@mail.gmail.com>
 <731bd6c4-0f70-45a2-8480-8fed315b82b4@gmail.com> <CAAhV-H6Va1VzpvdA-w5fX9KrZQArdX_Bjpg6t+4QNn3jHfgjmA@mail.gmail.com>
 <e9696d4d-7cd0-4d7f-af87-2b4631549475@gmail.com> <CAAhV-H5psOJQey+frswdc5Q76UnhCkrHJ_jtqvxHsfmi-dskyw@mail.gmail.com>
 <9cd444b3-aeb0-46bb-a8a3-1526aa8f191a@gmail.com>
In-Reply-To: <9cd444b3-aeb0-46bb-a8a3-1526aa8f191a@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 19 Jun 2026 15:14:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4syPSuseQ=LQRW21V1Bd3XR6=7vKwhxGud-Q8nH=1eEQ@mail.gmail.com>
X-Gm-Features: AVVi8CdHBNzFO4GmZtECgBzjzv3LaTB7HLs9O5oNrDSJ_CIhB5sjr-gwtdJZwJ4
Message-ID: <CAAhV-H4syPSuseQ=LQRW21V1Bd3XR6=7vKwhxGud-Q8nH=1eEQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15146-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,loongson.cn:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC7646A447B

On Mon, Jun 15, 2026 at 3:40=E2=80=AFPM Jonas Jelonek <jelonek.jonas@gmail.=
com> wrote:
>
> On 15.06.26 09:30, Huacai Chen wrote:
> >> [...]
> >>
> >>> However, synchronize_rcu() only gets called in the
> >>> IS_ENABLED(CONFIG_PREEMPT_RT) case, so I think your configuration
> >>> needs PREEMPT_RT, right?
> >>>
> >>> You said this is the default behavior, but PREEMPT_RT is not enabled =
by default.
> >> The condition where this is added has two parts, see [1]. While PREEMP=
T_RT
> >> isn't active for MIPS, arch_irq_work_has_interrupt gives false for MIP=
S (since
> >> there is no implementation and it falls back to the generic one). This=
 then
> >> also calls synchronize_rcu.
> > Sorry, this is my mistake, then what's your preemption model? There
> > are too many config files for MIPS now.
>
> I'm using PREEMPT_NONE, apparently default for all targets in OpenWrt.
With some hack I also reproduce a similar issue on LoongArch in the
PREEMPT_NONE model.
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Huacai

>
> > Huacai
> >
> >>> Huacai
> >>>
> >> Best,
> >> Jonas
> >>
> >> [1] https://elixir.bootlin.com/linux/v7.1-rc7/source/kernel/irq_work.c=
#L291-L302
>
> Best,
> Jonas

