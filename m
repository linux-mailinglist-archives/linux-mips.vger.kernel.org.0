Return-Path: <linux-mips+bounces-14591-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJMGJbfBBWrXawIAu9opvQ
	(envelope-from <linux-mips+bounces-14591-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 14:36:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 214BD541B48
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 14:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 462CB3011F01
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 12:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0ECF3B7751;
	Thu, 14 May 2026 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="TPhTdjRF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491692DF13B;
	Thu, 14 May 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762109; cv=none; b=ZrW5W6UFbOrj7NOgBmjE/zbZbXgdt+QB6iQElrDkCMW3D5fJlcyt7etvUGYqHpSBhOquJAUQkWWJTq3UO2m54frgKt7esfGu4yrtEan5E/HQ321JA8dOPj+ogeXvHx9pu934subiOW2FQkYyJo9JsZXaaLsyytygNUltncwwWTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762109; c=relaxed/simple;
	bh=7Z17vzKmPGH/Pbb/7ctD8uKcREFQ86rHy8rophjdhtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2CuSFkqWRD3ozG1Zct4Oa+a2+xEG3Xnm4VmIbgBFFJ7fc1tMjOoT6cFM16MpDDpZAdIBcOTmyN4dv8MkRjBwGnf3wKvSZab4nPhY4EWSGNhABXoBdQlT+69oqETI0iPrNMa4APQLAmYcd5dlRWwOAIUsrsMzcVsv/5aeP2mYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=TPhTdjRF; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 1CA72D0561;
	Thu, 14 May 2026 12:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1778762097;
	bh=y+NhCJjnIZyhnFujkvatnyre5bEmJDwtE/E2M912hG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TPhTdjRFI6bMS/OOKJ54lvD0Jdu5GlRo183R5LUgQF8SFnSSgF6fvmv9sUFJ1/TQa
	 X1WeGQhCjDPJ7i1MJ3Ykh9XzBWrgV+6lsqXU+f6jXBVEPbYIwq/a70DQrmXtQhv+Iq
	 TENdnh+SCz5u1nhJ8ccEuUihtJsrMS8emVKDMXAU=
Date: Thu, 14 May 2026 12:34:55 +0000
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
Message-ID: <agXBb0ga_6HJrrnm@shell.ilvokhin.com>
References: <cover.1777999826.git.d@ilvokhin.com>
 <5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
 <20260513193342.GB2545104@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513193342.GB2545104@noisy.programming.kicks-ass.net>
X-Rspamd-Queue-Id: 214BD541B48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14591-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,shell.ilvokhin.com:mid]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 09:33:42PM +0200, Peter Zijlstra wrote:
> On Tue, May 05, 2026 at 05:09:34PM +0000, Dmitry Ilvokhin wrote:
> > Use the arch-overridable queued_spin_release(), introduced in the
> > previous commit, to ensure the tracepoint works correctly across all
> > architectures, including those with custom unlock implementations (e.g.
> > x86 paravirt).
> > 
> > When the tracepoint is disabled, the only addition to the hot path is a
> > single NOP instruction (the static branch). When enabled, the contention
> > check, trace call, and unlock are combined in an out-of-line function to
> > minimize hot path impact, avoiding the compiler needing to preserve the
> > lock pointer in a callee-saved register across the trace call.
> > 
> > Binary size impact (x86_64, defconfig):
> >   uninlined unlock (common case): +680 bytes  (+0.00%)
> >   inlined unlock (worst case):    +83659 bytes (+0.21%)
> > 
> > The inlined unlock case could not be achieved through Kconfig options on
> > x86_64 as PREEMPT_BUILD unconditionally selects UNINLINE_SPIN_UNLOCK on
> > x86_64. The UNINLINE_SPIN_UNLOCK guards were manually inverted to force
> > inline the unlock path and estimate the worst case binary size increase.
> > 
> > In practice, configurations with UNINLINE_SPIN_UNLOCK=n have already
> > opted against binary size optimization, so the inlined worst case is
> > unlikely to be a concern.
> 
> This is not quite accurate. You add the (5byte) NOP for the static
> branch, but then you also add another 5 bytes for the CALL and at least
> another 2 bytes (possibly 5) for a JMP back into the previous stream.
> That is 12-15 bytes added to what was a single MOV instruction.
> 
> That is quite ludicrous.

Thanks for the feedback, Peter. This is exactly the kind of feedback I
was looking for.

I understand your concerns and initially I had exactly the same
thoughts, and after I looked into the generated code more carefully the
impact on the executed path is smaller than the total size increase
suggests.

Generated code of _raw_spin_unlock() for baseline (before the patch) is
31 bytes in total (x86_64, defconfig, GCC 11).

    3e0:  endbr64                          ; 4 bytes
    3e4:  movb $0x0,(%rdi)                 ; 3 bytes (unlock)
    3e7:  decl %gs:__preempt_count         ; 7 bytes
    3ee:  je   3f5                         ; 2 bytes
    3f0:  jmp  __x86_return_thunk          ; 5 bytes
    3f5:  call __SCT__preempt_schedule     ; 5 bytes
    3fa:  jmp  __x86_return_thunk          ; 5 bytes

Generated code of _raw_spin_unlock() with tracepoint (after the patch
applied) is 40 bytes in total.

    bc0:  endbr64                          ; 4 bytes
    bc4:  xchg %ax,%ax                     ; 2 bytes (NOP, static branch)
    bc6:  movb $0x0,(%rdi)                 ; 3 bytes (unlock)
    bc9:  decl %gs:__preempt_count         ; 7 bytes
    bd0:  je   bde                         ; 2 bytes
    bd2:  jmp  __x86_return_thunk          ; 5 bytes
    bd7:  call queued_spin_release_traced  ; 5 bytes
    bdc:  jmp  bc9                         ; 2 bytes
    bde:  call __SCT__preempt_schedule     ; 5 bytes
    be3:  jmp  __x86_return_thunk          ; 5 bytes

It is 40 bytes (+9 bytes compared to baseline, 2 bytes for NOP and 7
bytes for CALL and JMP).

But if we look at the executed path the picture is a bit different.

Baseline, in best case scenario of least number of executed
instructions.

    3e0:  endbr64                          ; 4 bytes (always executed)
    3e4:  movb $0x0,(%rdi)                 ; 3 bytes (unlock,
                                           ; always executed)
    3e7:  decl %gs:__preempt_count         ; 7 bytes (always executed)
    3ee:  je   3f5                         ; 2 bytes (always executed)
    3f0:  jmp  __x86_return_thunk          ; 5 bytes (executed if above
                                           ; je is not taken)
                                           ; rest is not executed
    3f5:  call __SCT__preempt_schedule     ; 5 bytes
    3fa:  jmp  __x86_return_thunk          ; 5 bytes

Tracepoint (again same case of least number of executed instructions).

    bc0:  endbr64                          ; 4 bytes (always executed)
    bc4:  xchg %ax,%ax                     ; 2 bytes (always executed, this is an
                                           ; only addition on the execution path).
    bc6:  movb $0x0,(%rdi)                 ; 3 bytes (unlock, always executed)
    bc9:  decl %gs:__preempt_count         ; 7 bytes (always executed)
    bd0:  je   bde                         ; 2 bytes (always executed)
    bd2:  jmp  __x86_return_thunk          ; 5 bytes (executed if above
                                           ; je is not taken)
                                           ; rest is not executed
    bd7:  call queued_spin_release_traced  ; 5 bytes
    bdc:  jmp  bc9                         ; 2 bytes
    bde:  call __SCT__preempt_schedule     ; 5 bytes
    be3:  jmp  __x86_return_thunk          ; 5 bytes

On the execution path we are getting 21 byte worth of instructions on
baseline against 23 bytes. The only addition on any executed path is the
2-byte NOP, that has a special treatment in CPU, cheap, but not entirely
free.

From a total size perspective it's 9 bytes, but on the executed path it's
a single 2-byte NOP.

Does this change the picture for you, or is the NOP still a concern for
this path?

> 
> I disagree that UNINLINE_SPIN_UNLOCK=n opts against binary size. For x86
> the unlock is smaller than a function call.
> 

Fair point on the UNINLINE_SPIN_UNLOCK characterization, but
UNINLINE_SPIN_UNLOCKis always "y" on x86_64. The inlined case only
applies to s390 (unconditionally), csky and loongarch (when
!PREEMPTION). I'll remove this, thanks.

> 
> I really don't see how this is worth it.

