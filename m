Return-Path: <linux-mips+bounces-14868-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OxrkKV4/IGrfzAAAu9opvQ
	(envelope-from <linux-mips+bounces-14868-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 16:51:10 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFA1638C9E
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 16:51:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b="mXm4zhu/";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14868-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14868-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 669303178C5D
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2026 14:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91B648094A;
	Wed,  3 Jun 2026 14:27:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF23D16E9;
	Wed,  3 Jun 2026 14:27:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496836; cv=none; b=BDgskUaV9dzPnIICYPRBG/oUC4fWnivnBm1rqijRqeGpiz1c6AG5lktmo9RnUBw3r/leFSGVN8ghjzXpxD3f/6k5LcUJw6ldeL+wU7TaCKJrNur/oKO/pYo6KsYM3m1M2DLXERgZ/c7wjaI+pbuKg0llogFp2BMCx9N+8rmWHR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496836; c=relaxed/simple;
	bh=AuGuRH+fFyEdbJRKSt1mI4XMyMufmkTscbswOCeuews=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtNlARfBrp+m4INV4kNvgN8NMantNM+Pc2UfBpzzDbH2b6oRIaq8O1Ne/YFn0HTgEg06vfomVf2cWWW8chgrQLh9XHxn2U+93FucFhlK1hX2VM5Dy6SHWiaZkK8yhcyBl20Vhk3uxGoM2h8+W7Qo+hs3I0x2Jlf1fntkJzwVntI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mXm4zhu/; arc=none smtp.client-ip=90.155.92.199
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=os4aRjDnafKUzup1QuKJHbiKJ+/dQN99U138wr5Ge48=; b=mXm4zhu/Rg+tWnyBEHPAizygP+
	MokSQOOwsmHArQ5zsrd7YX3dwe41qJEnF1l5tg9WYaOHQgJI7SXdYYZZQyEz4Rtg697HMdeiKdyNY
	V6QXv/NtFvmWLicZFBildOj3UogNmhtP8Ig6qT0IAl6uvnLiEBLKWu1anuSJI+qD+b8E9YGOA5KnK
	AD/mZR5Hl1ie8T7XhS/5kg/3/z3q/me369Frj+mf4355m7BAd1/WiLPkkTV+l9MyKXB24EQCXsLht
	mZny4wOhaOGbHX+TMYQmQ1cefA+QUrDIee5OqkmMyL0JDD02lRozDH6sryst0Ib0jaTxT1G7v7bpu
	7mO+FzAA==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUmYe-0000000CPBt-2ufD;
	Wed, 03 Jun 2026 14:27:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 67A053007A4; Wed, 03 Jun 2026 16:26:59 +0200 (CEST)
Date: Wed, 3 Jun 2026 16:26:59 +0200
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
Message-ID: <20260603142659.GW3102624@noisy.programming.kicks-ass.net>
References: <cover.1777999826.git.d@ilvokhin.com>
 <5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
 <20260513193342.GB2545104@noisy.programming.kicks-ass.net>
 <agXBb0ga_6HJrrnm@shell.ilvokhin.com>
 <20260603120811.GW3493090@noisy.programming.kicks-ass.net>
 <aiA3dzjKVq2_cpSY@shell.ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiA3dzjKVq2_cpSY@shell.ilvokhin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14868-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:d@ilvokhin.com,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:tsbogend@alpha.franken.de,m:jgross@suse.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:tglx@kernel.org,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:kernel-team@meta.com,m:paulmck@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[peterz@infradead.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,noisy.programming.kicks-ass.net:mid,infradead.org:from_mime,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CFA1638C9E

On Wed, Jun 03, 2026 at 02:17:27PM +0000, Dmitry Ilvokhin wrote:

> > Something a little like so, which is completely untested, except to
> > build kernel/locking/spinlock.o (with clang-23).
> 
> Thanks a lot for taking a look, Peter.
> 
> I like the static_call idea. It's truly zero cost on x86 (and, as you
> note, even a byte smaller). The one caveat is that it relies on
> HAVE_STATIC_CALL_INLINE to stay free. 
> 
> So my plan would be: static_call where HAVE_STATIC_CALL_INLINE is
> available (x86), and a static branch fallback elsewhere, gated behind a
> default-off config so it imposes nothing on arches/kernels that don't
> opt in. I'm mostly interested in x86, but would like arm64 to work too,
> which would use the fallback.

(i386 doesn't have STATIC_CALL_INLINE, but nobody cares about the
performance on that target, so anything goes really ;-)

> 
> Concretely:
> 
> 1. Split the sleepable-lock patches out and send them separately.
>    They're independent of the static call work and look far less
>    controversial.
> 
> 2. Convert the paravirt spinlock unlock to a static_call, as the
>    foundation for the unlock tracepoint. I'm happy to take a stab at it.
>    Let me know if you'd rather do it yourself.

Yeah, I think that patch as-is *should* work, but like said, I haven't
even tried it, so it could be terribly broken :-)

> 3. Build the unlock tracepoint on top: static_call where it's cheap,
>    config-gated static_branch fallback where it isn't.

Right, so I think we need some sort of custom callback for tracepoint
enable/disable. Its been a minute since I dug through the tracepoint
code, but I don't think it provides that with a convenient wrapper, but
it should be doable.

One thing to note is that when you set the tracepoint unlock function,
it should either tail-call into the original function, or you have to
create two unlock_trace functions, one for native and one for paravirt
and pick the right one.

> Does this plan sound reasonable to you?

Yeah, should work.

> > Also, I think someone should go do some performance runs with
> > ARCH_INLINE_SPIN_* set for x86 just like for s390.
> 
> That's a good point, I'll run benchmarks and report back with the
> results.

Thanks!

