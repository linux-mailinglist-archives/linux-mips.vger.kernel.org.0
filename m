Return-Path: <linux-mips+bounces-14592-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEOIBGTcBWokcgIAu9opvQ
	(envelope-from <linux-mips+bounces-14592-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 16:29:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4CE5431CD
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 16:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F00930E5A13
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 14:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB3A425CF2;
	Thu, 14 May 2026 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="2LqHdCq5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E0B413244;
	Thu, 14 May 2026 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768026; cv=none; b=AJEsQnS5I3l1SZmBqh55RWxAPJFKrpEP5HcBLa/d56mtTss54OZmeG1Iq23GqJncL/4S2D6HlnXglxhhKiJKs4p5qEXIPQ5mhdqNh7anI+RKLjQW68dJXCFID1/OQmEg4ahOt1f0/tEJkFuEYPdyNop9XynL3XDq3sOhly5R1z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768026; c=relaxed/simple;
	bh=RZ497f2MkBSfcDNRv07WOD93tdragrIfUhY+O1zJISk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6tOOjD0e4enRTbotUhrnYmkwPnrB/amwbsn0WNVYGs0B7xM5Cg3eoiAe7JWW0c64wWRxf2Mx90Wob0nF2VcpNb7on+c3xiqNhAF/3ops8VoG9rM9ab9eQDmhJjONv/7VfdobyTymRw+OgxwtnQiemgUKPBEavWsNrMegbYZnO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=2LqHdCq5; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 92774D0572;
	Thu, 14 May 2026 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1778768016;
	bh=CEtEQitvr5ZkBK9ei+U84T7UAt16YdxOYlqifuRSuCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2LqHdCq5tSBQ3BZqU0GmdOcvGsRqUa4wcPdAHu8hjvMz6CYEy0/FcUOv3IiSY6ajb
	 LJ3OiABsNiurRx+c2LFTGtfo/wrG5XGj49b8jVqXLWLHz8oq3JNDQsDBaYJg6nMv4k
	 SnM09PPyXc4AO4h3CaPUrJA/LHwqYctv2hZXMW48=
Date: Thu, 14 May 2026 14:13:35 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Steven Rostedt <rostedt@goodmis.org>
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
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	virtualization@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v6 5/7] locking: Add contended_release tracepoint to
 qspinlock
Message-ID: <agXYjw3GM15WtC-H@shell.ilvokhin.com>
References: <cover.1777999826.git.d@ilvokhin.com>
 <5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
 <20260513114102.50f4ca68@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513114102.50f4ca68@gandalf.local.home>
X-Rspamd-Queue-Id: BE4CE5431CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14592-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ilvokhin.com:email,ilvokhin.com:dkim]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 11:41:02AM -0400, Steven Rostedt wrote:
> On Tue,  5 May 2026 17:09:34 +0000
> Dmitry Ilvokhin <d@ilvokhin.com> wrote:
> 
> > Use the arch-overridable queued_spin_release(), introduced in the
> > previous commit, to ensure the tracepoint works correctly across all
> 
> Remove the ", introduced in the previous commit," That's useless in git
> change logs.

Thanks for the suggestion, will do here and in other places.

[...]

> >  /**
> >   * queued_spin_unlock - unlock a queued spinlock
> >   * @lock : Pointer to queued spinlock structure
> > + *
> > + * Generic tracing wrapper around the arch-overridable
> > + * queued_spin_release().
> >   */
> >  static __always_inline void queued_spin_unlock(struct qspinlock *lock)
> >  {
> > +	/*
> > +	 * Trace and release are combined in queued_spin_release_traced() so
> > +	 * the compiler does not need to preserve the lock pointer across the
> > +	 * function call, avoiding callee-saved register save/restore on the
> > +	 * hot path.
> > +	 */
> > +	if (tracepoint_enabled(contended_release)) {
> > +		queued_spin_release_traced(lock);
> > +		return;
> 
> Get rid of the "return;". What does it save you? It just makes it that you
> need to duplicate the code. Even though it's a one liner, it can cause bugs
> in the future if this changes. You could call the function:
> 
>   do_trace_queued_spin_release_traced(lock);
> 
> 
> > +	}
> >  	queued_spin_release(lock);
> >  }
> >  
> > diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
> > index af8d122bb649..649fdca69288 100644
> > --- a/kernel/locking/qspinlock.c
> > +++ b/kernel/locking/qspinlock.c
> > @@ -104,6 +104,14 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
> >  #define queued_spin_lock_slowpath	native_queued_spin_lock_slowpath
> >  #endif
> >  
> > +void __lockfunc queued_spin_release_traced(struct qspinlock *lock)
> > +{
> > +	if (queued_spin_is_contended(lock))
> > +		trace_call__contended_release(lock);
> > +	queued_spin_release(lock);
> 
> And then remove the duplicate call of "queued_spin_release()" here.

This is the scenario the comment above the static branch describes.
Here's what it looks like in practice on x86_64 (defconfig, compiled
with GCC 11).

Current design (trace + unlock combined, with return):
  
    endbr64
    xchg %ax,%ax                     ; NOP (static branch)
    movb $0x0,(%rdi)                 ; unlock
    decl %gs:__preempt_count
    je   preempt
    jmp  __x86_return_thunk
    call queued_spin_release_traced  ; cold
    jmp  preempt_handling            ; cold
    call __SCT__preempt_schedule
    jmp  __x86_return_thunk

With the trace-only function (no return, unlock after the call):
  
    endbr64
    push %rbx                        ; saves callee-saved rbx (!)
    mov  %rdi,%rbx                   ; preserve lock across call (!)
    xchg %ax,%ax                     ; NOP (static branch)
    movb $0x0,(%rbx)                 ; unlock
    decl %gs:__preempt_count
    je   preempt
    pop  %rbx                        ; callee-saved restore (!)
    jmp  __x86_return_thunk
    call queued_spin_release_traced  ; cold
    jmp  unlock                      ; cold
    call __SCT__preempt_schedule
    pop  %rbx
    jmp  __x86_return_thunk

Three extra instructions marked by "!" on the hot path (push, mov, pop),
all wasted when the tracepoint is off. That's the main reason for
combining trace and unlock in the same out-of-line function.

