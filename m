Return-Path: <linux-mips+bounces-13955-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id z+84OWtcxWlM9wQAu9opvQ
	(envelope-from <linux-mips+bounces-13955-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 17:18:51 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 625623383D4
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 17:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 433F730797EA
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 15:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60D0402BB9;
	Thu, 26 Mar 2026 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UiudyLeX"
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FF53EC2CF;
	Thu, 26 Mar 2026 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540552; cv=none; b=MUXoZvELm/Vvxe2rsBtV9y3289LWMdPUaQcWBikDP3PDhC7s15YF3UePrPPNXMjT/15QkA3bCKAnrTjXH2hBBrOA1sV2p3qXXCaKMzdcS+S6mCz5W0kVd4sM61Dp2OxQBR4j6jW5jN81SvXNZ4HOL0/aC/B8EvFw8O6itPGR+lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540552; c=relaxed/simple;
	bh=qFfgT9iRxpiHtI4D+5sPdo9t8IjEESJzXV9gLaascyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p64dsMe3vZllJuBphIapCmd8jCsEHInzN57+5wCEN8UcTDSeXcgfFV+a9jlQLV/HmaxfDpnmYh4dlNYCwZdpQJJtBx9IxMoYsD+UkIlyE429SyioUvaYED6QZcx1oqsVbr6doHLPEK5g/y3Ctzhxd4oTmxsk9XuJUuR0HMZ8n2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UiudyLeX; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HRMNAvoI8/jKpG3++5LCwSufZK5n9g0ksfmeuh3S+yc=; b=UiudyLeXKQzMSbmKfuP/Zq+N8l
	IJDs6wTduVJKqHnN/f0afsAgOf4cS3xdwL0PxL8RL0k30hz/63Kd87bxVbI800dmZwSpgXXLgzcdL
	mZR23rCOkayBzyq0F3GOwGI33G02XOgl6IxdMOJpMPmWjEJ1g9uOP9VrQhQ7vg8QHlnKw0NrQ5Pxw
	epgi4PS1GTbZ3rWTK/n76XLji3ba4JKjQiI5cCMfxp2zEjjtcNaAfb5+0y/W4v+mzzYFViT7Me/KH
	7H+iItNqVxtGm261E4WxJwf6Sxa4AVIWPLGHUtVHnDmM5EIixAKmj/bzZ6hfNTbbbCLSRJ9laMPxC
	eIrBO/zA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5n3K-00000000G5w-0Ka1;
	Thu, 26 Mar 2026 15:55:22 +0000
Date: Thu, 26 Mar 2026 15:55:21 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dmitry Ilvokhin <d@ilvokhin.com>
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
Message-ID: <acVW6eFGwqACD91Y@casper.infradead.org>
References: <cover.1774536681.git.d@ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774536681.git.d@ilvokhin.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13955-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[casper.infradead.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:dkim]
X-Rspamd-Queue-Id: 625623383D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 03:09:59PM +0000, Dmitry Ilvokhin wrote:
> The existing contention_begin/contention_end tracepoints fire on the
> waiter side. The lock holder's identity and stack can be captured at
> contention_begin time (e.g. perf lock contention --lock-owner), but
> this reflects the holder's state when a waiter arrives, not when the
> lock is actually released.
> 
> This series adds a contended_release tracepoint that fires on the
> holder side when a lock with waiters is released. This provides:
> 
> - Hold time estimation: when the holder's own acquisition was
>   contended, its contention_end (acquisition) and contended_release
>   can be correlated to measure how long the lock was held under
>   contention.
> 
> - The holder's stack at release time, which may differ from what perf lock
>   contention --lock-owner captures if the holder does significant work between
>   the waiter's arrival and the unlock.

As someone who's not an expert in this area (so please use short words
to explain it to me), why do we want to know how long this holder took
to release the lock from when it became contended?

I understand why we want to know how long any given waiter had to wait
to gain the lock (but we already have tracepoints which show that).

I also don't understand why we want to know the holder's stack at
release time.  The stack at contention-begin time will include
the point at which the lock was acquired which should be correlated
with where the lock was released.

Perhaps examples might help me understand why we want this?

