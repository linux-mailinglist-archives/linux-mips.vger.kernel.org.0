Return-Path: <linux-mips+bounces-14867-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kmh1Ank5IGpPywAAu9opvQ
	(envelope-from <linux-mips+bounces-14867-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 16:26:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 642DC6388C5
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 16:26:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ilvokhin.com header.s=mail header.b=gLhilNgA;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14867-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14867-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=ilvokhin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B8DD3148D9B
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2026 14:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8643859D4;
	Wed,  3 Jun 2026 14:17:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A2C33BBB1;
	Wed,  3 Jun 2026 14:17:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496260; cv=none; b=gGUUszG56KgkeOlMnWVM6ZLFja56axpBtqbBmZ/ag8Q+u9lONmyzj4ki3h1jbz1qYW5SJzQ1cAceYQB7j6VGKRh1fnu8ztqxtYGWh3dlFXD4J0o3KKz87Zpz+6U1ztlv5bDBE8Psym3sHhk3wB8366yRdWoFIiKF6BV9kP494Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496260; c=relaxed/simple;
	bh=Z4Pf4sIO0yokS/Sf6opVPQp6UT9LjyvVbSLpqW/VJXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULxjst5WTXLIxCPIygR3t46E/Je+9b5TpcMmdH6tasYs+HzuRwO56rt/j1zPI4Jw2jN7w+nEGgCSKfyN+GNvLCwzc4RjerMG4U13LFPt5eaPBNUh3Dr1kbb+6exwycJjKQFNPOe0FgrW0kyjq+d4045f4G9uYHgF27/+liW4CKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=gLhilNgA; arc=none smtp.client-ip=178.62.254.231
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id A76B4D10A6;
	Wed, 03 Jun 2026 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1780496251;
	bh=SfhK82Xil3vBLBzbtyq+NFAA8bzLZV/4SRFeV2fyIBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gLhilNgA/246de7OKuDBzuIzyl+ldRCWUnvUz13vpuaTrLa5lQCdfs0BRiS9CyABu
	 A885RQ4sztnBP3xCfblx2wxbXYzH+/yU+KJrXASNY9Wy8+6TjWfuu8hmB6q0torO+N
	 UusytLcEBa+RdN7aUdMerhdk06+/T4dloG+6ZunE=
Date: Wed, 3 Jun 2026 14:17:27 +0000
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
Message-ID: <aiA3dzjKVq2_cpSY@shell.ilvokhin.com>
References: <cover.1777999826.git.d@ilvokhin.com>
 <5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
 <20260513193342.GB2545104@noisy.programming.kicks-ass.net>
 <agXBb0ga_6HJrrnm@shell.ilvokhin.com>
 <20260603120811.GW3493090@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603120811.GW3493090@noisy.programming.kicks-ass.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14867-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:tsbogend@alpha.franken.de,m:jgross@suse.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:tglx@kernel.org,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:kernel-team@meta.com,m:paulmck@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ilvokhin.com:from_mime,ilvokhin.com:dkim,vger.kernel.org:from_smtp,shell.ilvokhin.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 642DC6388C5

On Wed, Jun 03, 2026 at 02:08:11PM +0200, Peter Zijlstra wrote:
> On Thu, May 14, 2026 at 12:34:55PM +0000, Dmitry Ilvokhin wrote:
> 
> > Baseline, in best case scenario of least number of executed
> > instructions.
> > 
> >     3e0:  endbr64                          ; 4 bytes (always executed)
> >     3e4:  movb $0x0,(%rdi)                 ; 3 bytes (unlock,
> >                                            ; always executed)
> >     3e7:  decl %gs:__preempt_count         ; 7 bytes (always executed)
> >     3ee:  je   3f5                         ; 2 bytes (always executed)
> >     3f0:  jmp  __x86_return_thunk          ; 5 bytes (executed if above
> >                                            ; je is not taken)
> >                                            ; rest is not executed
> >     3f5:  call __SCT__preempt_schedule     ; 5 bytes
> >     3fa:  jmp  __x86_return_thunk          ; 5 bytes
> > 
> > Tracepoint (again same case of least number of executed instructions).
> > 
> >     bc0:  endbr64                          ; 4 bytes (always executed)
> >     bc4:  xchg %ax,%ax                     ; 2 bytes (always executed, this is an
> >                                            ; only addition on the execution path).
> >     bc6:  movb $0x0,(%rdi)                 ; 3 bytes (unlock, always executed)
> >     bc9:  decl %gs:__preempt_count         ; 7 bytes (always executed)
> >     bd0:  je   bde                         ; 2 bytes (always executed)
> >     bd2:  jmp  __x86_return_thunk          ; 5 bytes (executed if above
> >                                            ; je is not taken)
> >                                            ; rest is not executed
> >     bd7:  call queued_spin_release_traced  ; 5 bytes
> >     bdc:  jmp  bc9                         ; 2 bytes
> >     bde:  call __SCT__preempt_schedule     ; 5 bytes
> >     be3:  jmp  __x86_return_thunk          ; 5 bytes
> > 
> 
> So I've been playing with this a bit, and it is all really sad.
> 
> Now, since pretty much everybody+dog will have PARAVIRT_SPINLOCK=y, the
> 'best' solution would be changing that paravirt call with a
> static_call(), that actually shrinks the code by 1 byte.
> 
> And then this tracepoint nonsense can simply use a different unlock
> function, just like paravirt.
> 
> 0000 00000000000001d0 <_raw_spin_unlock>:
> 0000  1d0:	f3 0f 1e fa          	endbr64
> 0004  1d4:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 1da <_raw_spin_unlock+0xa>	1d6: R_X86_64_PC32	pv_ops_lock+0x4
> 000a  1da:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 1e1 <_raw_spin_unlock+0x11>	1dd: R_X86_64_PC32	__preempt_count-0x4
> 0011  1e1:	74 06                	je     1e9 <_raw_spin_unlock+0x19>
> 0013  1e3:	2e e9 00 00 00 00    	cs jmp 1e9 <_raw_spin_unlock+0x19>	1e5: R_X86_64_PLT32	__x86_return_thunk-0x4
> 0019  1e9:	e8 00 00 00 00       	call   1ee <_raw_spin_unlock+0x1e>	1ea: R_X86_64_PLT32	__SCT__preempt_schedule-0x4
> 001e  1ee:	2e e9 00 00 00 00    	cs jmp 1f4 <_raw_spin_unlock+0x24>	1f0: R_X86_64_PLT32	__x86_return_thunk-0x4
> 
> 
> 0000 00000000000001d0 <_raw_spin_unlock>:
> 0000  1d0:	f3 0f 1e fa          	endbr64
> 0004  1d4:	e8 00 00 00 00       	call   1d9 <_raw_spin_unlock+0x9>	1d5: R_X86_64_PLT32	__SCT__queued_spin_unlock-0x4
> 0009  1d9:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 1e0 <_raw_spin_unlock+0x10>	1dc: R_X86_64_PC32	__preempt_count-0x4
> 0010  1e0:	74 06                	je     1e8 <_raw_spin_unlock+0x18>
> 0012  1e2:	2e e9 00 00 00 00    	cs jmp 1e8 <_raw_spin_unlock+0x18>	1e4: R_X86_64_PLT32	__x86_return_thunk-0x4
> 0018  1e8:	e8 00 00 00 00       	call   1ed <_raw_spin_unlock+0x1d>	1e9: R_X86_64_PLT32	__SCT__preempt_schedule-0x4
> 001d  1ed:	2e e9 00 00 00 00    	cs jmp 1f3 <_raw_spin_unlock+0x23>	1ef: R_X86_64_PLT32	__x86_return_thunk-0x4
> 
> 
> Something a little like so, which is completely untested, except to
> build kernel/locking/spinlock.o (with clang-23).

Thanks a lot for taking a look, Peter.

I like the static_call idea. It's truly zero cost on x86 (and, as you
note, even a byte smaller). The one caveat is that it relies on
HAVE_STATIC_CALL_INLINE to stay free. 

So my plan would be: static_call where HAVE_STATIC_CALL_INLINE is
available (x86), and a static branch fallback elsewhere, gated behind a
default-off config so it imposes nothing on arches/kernels that don't
opt in. I'm mostly interested in x86, but would like arm64 to work too,
which would use the fallback.

Concretely:

1. Split the sleepable-lock patches out and send them separately.
   They're independent of the static call work and look far less
   controversial.

2. Convert the paravirt spinlock unlock to a static_call, as the
   foundation for the unlock tracepoint. I'm happy to take a stab at it.
   Let me know if you'd rather do it yourself.

3. Build the unlock tracepoint on top: static_call where it's cheap,
   config-gated static_branch fallback where it isn't.

Does this plan sound reasonable to you?

> 
> Also, I think someone should go do some performance runs with
> ARCH_INLINE_SPIN_* set for x86 just like for s390.

That's a good point, I'll run benchmarks and report back with the
results.

