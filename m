Return-Path: <linux-mips+bounces-14160-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IjIFkDO32maZAAAu9opvQ
	(envelope-from <linux-mips+bounces-14160-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 19:43:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62E406E15
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 19:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 805DC302735B
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 17:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BBB3E3C5E;
	Wed, 15 Apr 2026 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="SM6B0AO6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F48B3CBE7F;
	Wed, 15 Apr 2026 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776275005; cv=none; b=MA9t4FD6B7bd3U8MsvMDt4pGENjVsrOZj4N3BOL99fFyjh8IfcibIyDLmUwhFkDQBIPJFcODWAJoqkj4glBIeerkxfW3hvhPNsmYRq+EuNL/1yZFwHl5ZHudgxD6yW6s36cOxmkgj/7iV4MTR8PkMpLE5yw0ECcrADDsx6pgB/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776275005; c=relaxed/simple;
	bh=wz37IEghmnvxBAYYIPenClkYXs37gFVCzGp061LZKqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFdudc3e1axEgko8MuXAs/ORn/PTkYRXLF0b9HSvEgWvHdcloF8DUALbVeylR3Ehjbav5VLGW5c5z9HgZSPq9JGQdzzdHzZTJWlyjfFCncINh0ry/uE4V7xONA4kjsifY3mGS8V2Krn7t52qmz3BEr92xZke4jhRd0FyirmFnnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=SM6B0AO6; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 93F3CC73A9;
	Wed, 15 Apr 2026 17:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1776274996;
	bh=SOJSWDSELeB0YTngjDwuIRTiVa2seMMmI2D7vgbLJHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SM6B0AO6SmMcSfXheaPbbVLMC7aRcI7Hs4se/r4k9imn2nObg2IzOFbNYHgZgva9b
	 ow5wVC2t14ax/460besk2BLk2ZWreZ/iowSL/PsDXW8Jvz0IPJzEXCWLkYn3Z/5pOK
	 biOqNAzm1emEyoQaB5lwW/xPsxIFCbmK8c4HniVw=
Date: Wed, 15 Apr 2026 17:43:13 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
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
Subject: Re: [PATCH v4 5/5] locking: Add contended_release tracepoint to
 spinning locks
Message-ID: <ad_OMbqBSjtTPsok@shell.ilvokhin.com>
References: <cover.1774536681.git.d@ilvokhin.com>
 <81eb8e0cd90b31e761e12721dbacb967281f840f.1774536681.git.d@ilvokhin.com>
 <8d98d9f4-ccab-4864-b406-d3eb684cab45@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d98d9f4-ccab-4864-b406-d3eb684cab45@paulmck-laptop>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14160-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF62E406E15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 04:20:26PM -0700, Paul E. McKenney wrote:

[...]

> > +static inline void queued_read_unlock(struct qrwlock *lock)
> > +{
> > +	/*
> > +	 * Trace and unlock are combined in the traced unlock variant so
> > +	 * the compiler does not need to preserve the lock pointer across
> > +	 * the function call, avoiding callee-saved register save/restore
> > +	 * on the hot path.
> > +	 */
> > +	if (tracepoint_enabled(contended_release)) {
> > +		queued_read_unlock_traced(lock);
> > +		return;
> > +	}
> > +
> > +	__queued_read_unlock(lock);
> > +}
> 
> Shouldn't this refactoring be its own separate patch, similar to 4/5?
> 
> That would probably clean up this diff a bit.
> 
> > +
> > +static __always_inline void __queued_write_unlock(struct qrwlock *lock)
> >  {
> >  	smp_store_release(&lock->wlocked, 0);
> >  }
> >  
> >  /**
> > - * queued_rwlock_is_contended - check if the lock is contended
> > + * queued_write_unlock - release write lock of a queued rwlock
> >   * @lock : Pointer to queued rwlock structure
> > - * Return: 1 if lock contended, 0 otherwise
> >   */
> > -static inline int queued_rwlock_is_contended(struct qrwlock *lock)
> > +static inline void queued_write_unlock(struct qrwlock *lock)
> >  {
> > -	return arch_spin_is_locked(&lock->wait_lock);
> > +	/* See comment in queued_read_unlock(). */
> > +	if (tracepoint_enabled(contended_release)) {
> > +		queued_write_unlock_traced(lock);
> > +		return;
> > +	}
> > +
> > +	__queued_write_unlock(lock);
> 
> And the same here, so one patch for interposing __queued_read_unlock()
> and another for interposing __queued_write_unlock().
> 
>

[...]

> And is it possible to have one patch for qspinlock and another for qrwlock?
> It *looks* like it should be.
> 
> 							Thanx, Paul
> 

Thanks for the suggestion, Paul.

I think separate commits for the read and write paths of qrwlock is a
bit too fine-grained, but I like the point about mixing refactoring with
instrumentation and keeping different lock types separate.

I'll split this commit into four.

    locking: Factor out __queued_read_unlock()/__queued_write_unlock()                                                    
    locking: Add contended_release tracepoint to qrwlock
    locking: Factor out queued_spin_release()                                                                             
    locking: Add contended_release tracepoint to qspinlock

