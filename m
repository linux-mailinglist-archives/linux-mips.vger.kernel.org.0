Return-Path: <linux-mips+bounces-14596-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9wjyCXnyBWobdwIAu9opvQ
	(envelope-from <linux-mips+bounces-14596-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 18:04:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A98FB5446CC
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 18:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42A5D30158BC
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 16:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A27132AAB2;
	Thu, 14 May 2026 16:04:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE1C327C08;
	Thu, 14 May 2026 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774642; cv=none; b=HpyfHM/WV2pqioQATQcRC+EM8EP2LF4z2KO+YSRhj7x8urQQuTb6HwDCueQs/rwwU72eQwvcGawgGruMjNPZ7IOnOjGo3hsWdFAfrwZTfdy5LaA+rhQxa2NPL4rTdh7j1d8R/hhPvDQtuX9v8HZbwRDmSqjjt6dzRcMyDCudj3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774642; c=relaxed/simple;
	bh=IfJ4JpyIX3bxpjESdnNrG0HyvHftYTP+uUETrEn8WJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EvyD88kmIpxiBbgtbWvZJg0GZizhAqVEwhGpY1LcbxZdvVijki509B/mW+o5kxxDLr6IXDYhkg1FLgHapAmsFst7PUmiC9uEtb0nOwW9FPSKU2vlED/ovk9Z1yHx0uHALJAejV9spyqyjI1SI536cBa5f5hFUvs/alL7RHtan1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 4F1EB12032B;
	Thu, 14 May 2026 16:03:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 3251B20028;
	Thu, 14 May 2026 16:03:45 +0000 (UTC)
Date: Thu, 14 May 2026 12:03:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long
 <longman@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Dennis Zhou
 <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter
 <cl@gentwo.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, kernel-team@meta.com, "Paul E.
 McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v6 5/7] locking: Add contended_release tracepoint to
 qspinlock
Message-ID: <20260514120348.7a64facc@gandalf.local.home>
In-Reply-To: <agXYjw3GM15WtC-H@shell.ilvokhin.com>
References: <cover.1777999826.git.d@ilvokhin.com>
	<5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
	<20260513114102.50f4ca68@gandalf.local.home>
	<agXYjw3GM15WtC-H@shell.ilvokhin.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: yq6zq8w6pg8sf89tbku7px9pn6kjg7ib
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18+AovYNGIlALhyn+K5C/7gpJOZfNyJEu4=
X-HE-Tag: 1778774625-341613
X-HE-Meta: U2FsdGVkX19HQDyuK5W1sWFaIilY7bm7Gf/MZYHKwmEDTE3ZbhyKfVzPtSNaRvRwwLibMDr+clEajGn4IMslvXyWRSAtdRw7n20LqpU/ZL1JRwQy7RM1IZ8C/G8JiCKlU7NLZxt8T0jLkJLCLpPM7qJ+dpyaKbSRbUbJJ9wssRC6BHcQX6wyCcVcl8zzZF/OVyWwMsrTKquwAEsHp9WwFxub5w8dGBF9fpamxEC5Vrgn4VfpydBb94gT6qa9OETZ2G0tA+8SrtKJggxMx1uuZ2LNQUPr2vuo/NU83uN08IiVbeRQ5csVSw+NNSzK03CbEK4AKDmVTf9PZCF/6yk3hM3689icTTPJeoQXH95ipe2RYbbc23zucZ9uSvKuke71iwqS2WK43PR19rLABJH2Mw==
X-Rspamd-Queue-Id: A98FB5446CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-mips@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14596-lists,linux-mips=lfdr.de];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 14 May 2026 14:13:35 +0000
Dmitry Ilvokhin <d@ilvokhin.com> wrote:

> > > +void __lockfunc queued_spin_release_traced(struct qspinlock *lock)
> > > +{
> > > +	if (queued_spin_is_contended(lock))
> > > +		trace_call__contended_release(lock);
> > > +	queued_spin_release(lock);  
> > 
> > And then remove the duplicate call of "queued_spin_release()" here.  
> 
> This is the scenario the comment above the static branch describes.
> Here's what it looks like in practice on x86_64 (defconfig, compiled
> with GCC 11).
> 
> Current design (trace + unlock combined, with return):
>   
>     endbr64
>     xchg %ax,%ax                     ; NOP (static branch)
>     movb $0x0,(%rdi)                 ; unlock
>     decl %gs:__preempt_count
>     je   preempt
>     jmp  __x86_return_thunk
>     call queued_spin_release_traced  ; cold
>     jmp  preempt_handling            ; cold
>     call __SCT__preempt_schedule
>     jmp  __x86_return_thunk
> 
> With the trace-only function (no return, unlock after the call):
>   
>     endbr64
>     push %rbx                        ; saves callee-saved rbx (!)
>     mov  %rdi,%rbx                   ; preserve lock across call (!)
>     xchg %ax,%ax                     ; NOP (static branch)
>     movb $0x0,(%rbx)                 ; unlock
>     decl %gs:__preempt_count
>     je   preempt
>     pop  %rbx                        ; callee-saved restore (!)
>     jmp  __x86_return_thunk
>     call queued_spin_release_traced  ; cold
>     jmp  unlock                      ; cold
>     call __SCT__preempt_schedule
>     pop  %rbx
>     jmp  __x86_return_thunk
> 
> Three extra instructions marked by "!" on the hot path (push, mov, pop),
> all wasted when the tracepoint is off. That's the main reason for
> combining trace and unlock in the same out-of-line function.

Ah, because the return makes it into two tail calls.

I still don't like the duplication, perhaps add some more comments about
needing to update the other location if anything changes here? And perhaps
comment that this duplicate code helps the assembly.

-- Steve


