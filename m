Return-Path: <linux-mips+bounces-15059-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oqAMBWu8KmrbvwMAu9opvQ
	(envelope-from <linux-mips+bounces-15059-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 15:47:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A07CF672706
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 15:47:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b="ibs/lTWy";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15059-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15059-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09189337897E
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 13:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9B840F8C3;
	Thu, 11 Jun 2026 13:45:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166473FBEBC;
	Thu, 11 Jun 2026 13:45:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185509; cv=none; b=UxdEoKvV+APV+VffqgSggF2jwAJXfAuHDb8nVfT/zfyYGswq5Mu/80DVcvjaPrB+458w2KC6PJMfwingSX0eebME9RyLJIZ1ro7qAnlCV3GUKtWKTQLz3c4rUsbau2ENXiOC08IvkkB4B13gmY8jVmrlw3veeuwG4Y4gla9GPy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185509; c=relaxed/simple;
	bh=kUIwqYLzboTXSW9mocUnEjpqnAKtc9Q3KI2UV2OLx0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5DWruKl6rGFWLqoSTUu5V984+xtht/7FiC2XTs5LiBCq14bENWnu7/VWepVS+myI6vBr1/6l+0AbNt0+k9QghSMK474oc2O+UXjpIqIz10rJpjfgRg8nqtrQORcNBm9mx7Q5SEzt994vKhaKyzihaswMEHV+DYZdS8b5ODXI8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ibs/lTWy; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m0fD9KCk/6I6qo6Wg6wfui77ADSGp/LJkYfEAup3lwY=; b=ibs/lTWyAjLVWXS3n4wPjA79OS
	ITb//Iv1CxtQUrx/67IL+hYSamUfqJOQPft+Dglj3UFpe6AehWYKHnyrdmyQlnLCCHnR37eSF04YY
	BV8xlmAh95887QUefrFHmh4w0rqaGST435zBbQpMYZ8US3gRQg+HjRI0XuAaxBi7gclydQf69ZDM5
	k61d3A3iRRXuQJHaZacf+KNxVaTzU7pWHtqGjdFKnziZBtLLfi6vKmz1i2qN9G7/mZEKcluKIADZP
	arbxTyUtAa9KswEQnkGYCnK7u+EJaXbbI3n2nupMq3G+mbNR2VmbwbcZlBXNHkE7grhJz1GNpvuDh
	FnJVAQdw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfi7-00000001ydR-0GUg;
	Thu, 11 Jun 2026 13:44:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0B6CD3002F0; Thu, 11 Jun 2026 15:44:42 +0200 (CEST)
Date: Thu, 11 Jun 2026 15:44:42 +0200
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
	kernel-team@meta.com, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v6 5/7] locking: Add contended_release tracepoint to
 qspinlock
Message-ID: <20260611134442.GJ48970@noisy.programming.kicks-ass.net>
References: <cover.1777999826.git.d@ilvokhin.com>
 <5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
 <20260513193342.GB2545104@noisy.programming.kicks-ass.net>
 <agXBb0ga_6HJrrnm@shell.ilvokhin.com>
 <20260603120811.GW3493090@noisy.programming.kicks-ass.net>
 <aiphFXe_TPNPxZ_n@shell.ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiphFXe_TPNPxZ_n@shell.ilvokhin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15059-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:d@ilvokhin.com,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:tsbogend@alpha.franken.de,m:jgross@suse.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:tglx@kernel.org,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:kernel-team@meta.com,m:paulmck@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[peterz@infradead.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,infradead.org:dkim,infradead.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A07CF672706

On Thu, Jun 11, 2026 at 07:17:41AM +0000, Dmitry Ilvokhin wrote:
> On Wed, Jun 03, 2026 at 02:08:11PM +0200, Peter Zijlstra wrote:
> > Also, I think someone should go do some performance runs with
> > ARCH_INLINE_SPIN_* set for x86 just like for s390.
> 
> As promised, I set ARCH_INLINE_SPIN_UNLOCK{,_BH,_IRQ,_IRQRESTORE} for
> x86 and measured the effect on a few real workloads.
> 
> Short version: inlining of _raw_spin_unlock() adds measurable kernel
> i-cache pressure on every workload I tried, and on a
> kernel-i-cache-bound one (nginx connection churn) it costs ~1.27%
> throughput. I did not find a workload where it helps.

Thanks for checking!

