Return-Path: <linux-mips+bounces-14579-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MpaMmrQBGr0PQIAu9opvQ
	(envelope-from <linux-mips+bounces-14579-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 21:26:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7E539EC7
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 21:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB9E03017FA3
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 19:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11333AA4FE;
	Wed, 13 May 2026 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HJfkqXV+"
X-Original-To: linux-mips@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9EA3B19A8;
	Wed, 13 May 2026 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700385; cv=none; b=ZzWBIARd3IGxxS9NfeXVEcrIMXhlZsI9P0YUoL1EE7acZ801UXkjqyimxZ0sf/tvAbXKoO0VQHtlOWPYlvOApV35l+xXmYtvAESosp4UHgInnhfhx/LjjPHwwaO0BKKCSqHppjjj2MsUw2AWWHeWbywDw/lRRRMPrghi6QP79BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700385; c=relaxed/simple;
	bh=45c9OV2GPaYfwize4vc5GxTCEBADyTVSFmlnujT5NMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lM7o1BRFTUox0FAGVdMHaKQIpHReTn+cGWw76cSQHQMq80LBy0cCrVUfn3gnBJ5YCfz8HFY+42dTK0R6sGANtxx7wrf13n3zuY1RU0XY2bJNsyp6mCrW1gW/W66Lxy/i1slnNk/Y8hcc4bMF2rdgErV6GqCz2Uoln+b8sAiCnG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HJfkqXV+; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5jXgOm2W/v1Vl1bT+RF7zk/Xq/msqAlwEyLXpPVPOgA=; b=HJfkqXV+o9pZuHWl156uv9ZV1+
	pAU2fPeisDFyWOFbut8ow8ktjj2bC4mXW5tWR+lScGE4ycAW6WnbitCChoduuN8LwzsBfUbDl5BmP
	xNdaqsf20yeJuhpMBbzq2iMviJaFhZVTbHMaR1plTPwOBP1MwX60viyi+7jsK35C5KXa6K4hktEVX
	iMOqPFzM+nEy/L+epKsE8B9XQ/5fOffw66BfqUQEvXN4YvlywwsuficHa+2WKTXnd5TqL3mT5mKtV
	+tdwDCAUbR8KJ1Gd7i/flhb1qvyv1NeielP4naekfJ1Inewrcigqg8s4qjK7BJ25kK6KNmpCg319C
	D6FKTjZw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFDa-000000018qi-2vA8;
	Wed, 13 May 2026 19:26:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 026183007A4; Wed, 13 May 2026 21:26:05 +0200 (CEST)
Date: Wed, 13 May 2026 21:26:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dmitry Ilvokhin <d@ilvokhin.com>
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
	kernel-team@meta.com
Subject: Re: [PATCH v6 0/7] locking: contended_release tracepoint
 instrumentation
Message-ID: <20260513192605.GA2545104@noisy.programming.kicks-ass.net>
References: <cover.1777999826.git.d@ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777999826.git.d@ilvokhin.com>
X-Rspamd-Queue-Id: 41B7E539EC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14579-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:dkim]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 05:09:29PM +0000, Dmitry Ilvokhin wrote:

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
> 
> Note: for reader/writer locks, the tracepoint fires for every reader
> releasing while a writer is waiting, not only for the last reader.

And for qspinlock.

I am really not sure this is worth the overhead for qspinlock / rwlock.

