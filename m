Return-Path: <linux-mips+bounces-13982-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI+MD1SLyWlHzAUAu9opvQ
	(envelope-from <linux-mips+bounces-13982-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2026 22:28:04 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74400353F66
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2026 22:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 449DD3008E33
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2026 20:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9C138735D;
	Sun, 29 Mar 2026 20:28:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E58E35F197;
	Sun, 29 Mar 2026 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774816081; cv=none; b=pCyv3a91QQ55FNaRYAeO2ZsGAzVpdwe7TPWXPx9NAxsDJSO4AYWkJF0ASYqxCzY+yl3SfKJ9e9DtKtiujQlz52YWR9QICOuB3euMo1jWaLEwEmuM6DkFl5cWIIQViwqoEE1gEnsc5gI0RRyLJLxFCdAJ6q+Ml70o0c/vsPELSCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774816081; c=relaxed/simple;
	bh=X6fnMJTQQBlb/wbnqjX2VyghGTCT/519AKvV6CMYRoQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OKdh9CKOjEOsBM6lRSUSgI0esJu/QjmAYsVreagh8y/XnG1nfK1mjn8mvs3nMVWnw3ZWqVEtr+XE1iKm7wI+ZOMqNDgMLcmxLEhXV7k+8IPBidTL9dftjYOJGW2zW39gVey/CVEPoJ98uqi+uDKpMUTiO8M+lXasyqzqGT2ByEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E823792009D; Sun, 29 Mar 2026 22:27:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E564792009C;
	Sun, 29 Mar 2026 21:27:56 +0100 (BST)
Date: Sun, 29 Mar 2026 21:27:56 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org, 
    Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
In-Reply-To: <alpine.DEB.2.21.2601271739250.40317@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2603292037020.60268@angie.orcam.me.uk>
References: <20260127135334.qUEaYP9G@linutronix.de> <alpine.DEB.2.21.2601271508160.40317@angie.orcam.me.uk> <20260127165430.7ui_LGkg@linutronix.de> <alpine.DEB.2.21.2601271739250.40317@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13982-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DMARC_NA(0.00)[orcam.me.uk];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74400353F66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 27 Jan 2026, Maciej W. Rozycki wrote:

> > >  I need more data to conclude whether this is the right change to make I'm 
> > > afraid.  Thank you for looking into it though.
> > 
> > Fair enough. Would it work for you if we scratch this from net-next and
> > you route this or something else via the mips tree?
> 
>  No need to, I think I understand the situation now.  Surely the comment 
> referring IRQF_ONESHOT in arch/mips/dec/ioasic-irq.c needs to be removed, 
> but otherwise this is:
> 
> Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>
> 
> Thank you for clarifying this to me, and doing the clean-up in the first 
> place!

 I've now got back to it and while preparing the justification for the 
removal of the IRQF_ONESHOT recommendation and having looked through 
Documentation/core-api/real-time/differences.rst I became stumped and 
need a further clarification after all.

 I read in the document that:

"However, on a PREEMPT_RT system, interrupts are forced-threaded and no 
longer run in hard IRQ context."

and:

"All interrupts are forced-threaded in a PREEMPT_RT system. The exceptions 
are interrupts that are requested with the IRQF_NO_THREAD, IRQF_PERCPU, or 
IRQF_ONESHOT flags."

-- do I infer correctly that on a PREEMPT_RT system in the absence of any 
flags passed to request_irq() the handler requested such as one concerned 
here (i.e. lance_dma_merr_int()) will run with interrupts locally enabled 
on the CPU?

 If so, then either we need to go back and make sure the originating IRQ 
line is masked throughout the execution of the handler (and no standard 
irq-flow method provides it), or any IOASIC DMA error interrupt handlers, 
including this one, have to use the IRQF_NO_THREAD flag instead or the CPU 
will hang looping on the interrupt being retriggered at enable time, as in 
the absence of masking the interrupt output of the interrupt controller 
remains active until the final EOI action.  Have I missed anything?

 Mind that this is somewhat theoretical, given that declance.c is only for 
systems using the MIPS CPU and arch/mips does not enable ARCH_SUPPORTS_RT, 
however should it do sometime, I'd rather all the hell didn't break loose.  
And there's previous art already as I can see IRQF_NO_THREAD used through 
arch/mips, following commit 5a4a4ad851dd ("MIPS: Mark cascade and low 
level interrupts IRQF_NO_THREAD").

  Maciej

