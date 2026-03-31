Return-Path: <linux-mips+bounces-13999-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BFnNL2/y2k9LgYAu9opvQ
	(envelope-from <linux-mips+bounces-13999-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 14:36:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F5369879
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 14:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E79E130A813B
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 12:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B933E276B;
	Tue, 31 Mar 2026 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="sqT6OpXi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFA83A7840;
	Tue, 31 Mar 2026 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774960325; cv=none; b=ZBALXDTxVa5T2wTVFW1mFESVM8uDPmm8/uw8runnXnyW3qRpNqsXZTkGmIh2dPSZ+Xn6BNQYj+91cKqyGRy88xz+ihWdQte1UKheqLHORaEhhFAEdDnzLPCW+9TUq3k/XjVWrTMjbo3ZJkyS6+/6nZPnvPa8mC2FRZXXiYsB/rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774960325; c=relaxed/simple;
	bh=xzhHOq15v3yW4B2OW/LJhYw8T79itL8h+tYr5o6Wjsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2e+/o5+rcbA5AT+lmSMp7Flc30GYC7aYPk+H/Bt/rVQ/gAM3wv2NNh2u/awCoAkhyZKcHolU5ac0CqVOMKvt+5gkSktBmBhA5qvsLNzrJNEtozDheWOaFnuMkoje6aK/tww7ifZpaiC/CuCW5j94s0XDV0uA/UU24lt99TR96E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=sqT6OpXi; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 13031BE24E;
	Tue, 31 Mar 2026 12:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1774960322;
	bh=Z2eDNMN/atToABrH6ndusX6IX5Tl7QShF5YQMMFudmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sqT6OpXij7sXEX3lR7XgTL1XcgqS0sbDtamjJbhFSIjtfPZbzbcUFQsqFcFf2rKIG
	 xkuFi6SFXicXAPn0RihX5CqsaIzIdziwT35ZJgVXt9fOj2prKQ9PpypId/QyqhaZ/s
	 /TOW0Qcvg1BqUshPhXmKn/69Wfdtpsvoz2aqbO3I=
Date: Tue, 31 Mar 2026 12:32:00 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
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
	kernel-team@meta.com
Subject: Re: [PATCH v4 0/5] locking: contended_release tracepoint
 instrumentation
Message-ID: <acu-wAFTVCmI4_da@shell.ilvokhin.com>
References: <cover.1774536681.git.d@ilvokhin.com>
 <20260331102704.921355-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331102704.921355-1-usama.arif@linux.dev>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13999-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ilvokhin.com:dkim,ilvokhin.com:email]
X-Rspamd-Queue-Id: 410F5369879
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 03:27:03AM -0700, Usama Arif wrote:
> On Thu, 26 Mar 2026 15:09:59 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrote:
> 
> > The existing contention_begin/contention_end tracepoints fire on the
> > waiter side. The lock holder's identity and stack can be captured at
> > contention_begin time (e.g. perf lock contention --lock-owner), but
> > this reflects the holder's state when a waiter arrives, not when the
> > lock is actually released.
> > 
> > This series adds a contended_release tracepoint that fires on the
> > holder side when a lock with waiters is released. This provides:
> > 
> > - Hold time estimation: when the holder's own acquisition was
> >   contended, its contention_end (acquisition) and contended_release
> >   can be correlated to measure how long the lock was held under
> >   contention.
> > 
> > - The holder's stack at release time, which may differ from what perf lock
> >   contention --lock-owner captures if the holder does significant work between
> >   the waiter's arrival and the unlock.
> > 
> > Note: for reader/writer locks, the tracepoint fires for every reader
> > releasing while a writer is waiting, not only for the last reader.
> > 
> 
> Would it be better to reorder the patches? It would help with git
> bisectability as well. Move the refractoring work in patch 4 and
> 5 (excluding adding the tracepoints ofcourse) earlier, and then add
> all the tracepoints in the same commit at the end? It would help
> in the future with git blame to see where all the tracepoints
> were added as well.

Thanks for the suggestion, Usama.

I'd prefer to keep the current ordering: each refactoring commit is
immediately followed by the commit that uses it. For example,
queued_spin_release() is factored out right before the commit that adds
the tracepoint to spinning locks. This makes the motivation for the
refactoring clear and should also ease the review since the context is
still fresh.

Bisectability should be fine as-is, each commit compiles and works
independently, since the refactoring patches do not introduce behavioral
changes on their own.

