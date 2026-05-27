Return-Path: <linux-mips+bounces-14789-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDNGFI7zFmo6ygcAu9opvQ
	(envelope-from <linux-mips+bounces-14789-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2026 15:37:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1F75E513E
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2026 15:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B65B63049714
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2026 13:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5175D40F8CB;
	Wed, 27 May 2026 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="tD9Y95jH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45C040FDB6;
	Wed, 27 May 2026 13:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888662; cv=none; b=TKA3QiGDJQx8qx775pfkDYqm41koAIijRw8FO47lXX1lBVrgfuMJKLdEUtzq8P1kkMi+d3rSL+9LG71bR8DvazjPDun71NUvdddVpk8nAjChbuEyKoD0i5iqWDL6m2ooujRAmhPuVceJqvIcukqB5cjfp9Avg+it3vpjlNjaEEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888662; c=relaxed/simple;
	bh=1wytUo+2Aeq9VGu4j/kp+Z/iRR4RMhRU4MM8FIkyicA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBrqX78bzEEVc/Y4nyC/0YHTP2IpiwKyQL0wX374TtmYdwcos0C56I/kqsKzn1zv4s9iLm0CG8vOoWsMH5sC5nrbgj4CtCkrI8iaLMYdI+uW4L1YEDrB1hCNKdRH/ImNokTBc+LkIcc+NRlSc/S2fYLCygnjziYgH3TzDFfdd/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=tD9Y95jH; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id A4CA2D0D06;
	Wed, 27 May 2026 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1779888658;
	bh=kUtPQMqnGRZK4WtBtal4fkwqBGL1onBAC0FZaenXB+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tD9Y95jHJ7FHOR/3K3r+mZ2uCwLkbP7wrlCEb9kG3J6t+6n9iKA3+dtPEa4P98bh/
	 o5ovibdCKYI+Qo2jmZQ0eu+Zv4aRy24lOcvlMPgLYo/rPTGo6fKNw9U9ZrOf+VboDg
	 XtEX60Utm7kiii60sP4mieyLYPGASkfm5fIew4eo=
Date: Wed, 27 May 2026 13:30:57 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	virtualization@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v6 5/7] locking: Add contended_release tracepoint to
 qspinlock
Message-ID: <ahbyERN5PICY6qxm@shell.ilvokhin.com>
References: <cover.1777999826.git.d@ilvokhin.com>
 <5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
 <20260513193342.GB2545104@noisy.programming.kicks-ass.net>
 <agXBb0ga_6HJrrnm@shell.ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agXBb0ga_6HJrrnm@shell.ilvokhin.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14789-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ilvokhin.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,shell.ilvokhin.com:mid]
X-Rspamd-Queue-Id: AE1F75E513E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Peter,

Gentle ping on this. I wanted to check if the assembly analysis in my
previous reply changed the picture at all.

You were right that the commit message was misleading about the total
size increase: it's 9 bytes per call site, not just the NOP.

That said, when I looked at the executed path with the tracepoint
disabled, the only addition is the 2-byte NOP (xchg %ax,%ax).

Both the baseline and instrumented _raw_spin_unlock() fit within a
single 64-byte cache line, and I wasn't able to measure any difference
with locktorture: lock() cost completely dominates, unlock() accounts
for less than 1% of the total, so any overhead is indistinguishable from
noise.

If the cost is still a concern, I see two possible paths forward:

1. Guard the spinlock/qrwlock instrumentation behind a Kconfig option
   (disabled by default), so only kernels that explicitly opt in pay
   the cost.

2. Drop the spinlock/qrwlock instrumentation entirely and keep
   contended_release for sleepable locks only.
  
Happy to go whichever direction you prefer.

