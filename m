Return-Path: <linux-mips+bounces-14436-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMYYMEUf+Wlw5wIAu9opvQ
	(envelope-from <linux-mips+bounces-14436-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 00:35:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3BB4C46F9
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 00:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCEF2301AAA7
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2026 22:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AB237BE8C;
	Mon,  4 May 2026 22:35:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F5D3469F6;
	Mon,  4 May 2026 22:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934146; cv=none; b=YSJiNjv6WqVFFcX8pAHThQ1eAXe+YpzUEZ2cL1ZM1T7curNg41tRyl253marHmsplQx4Yq4OPXvir8d/uKFRvB2n77KcP3b1y/kj3ySQ4jG7bGlIVREJk49na0gUWRw6u/U4bdq0wpqynXVXbKL2IKA48auBruGB/PfifdJOV5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934146; c=relaxed/simple;
	bh=tkc4ktKzfrjNBs9fFRTpHmuoFjhfer9hzn3xLZRCxz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QCatYSImNZxvEmwAPEIw8rFu+S+RP5oij+izYD+v2yeNuNJw1CdfeT5i12IrRN5RsoYRfV02LPDbA2ZDHLan86KwQdaJc7onlo+kznvWzDp8Yk9YAkURzHswrgRsVtz4vDLhd/sIxh1RvQnmu4tcJVLY3+5dprm2VJWpgF5h8uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6F2E692009C; Tue,  5 May 2026 00:35:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6904092009B;
	Mon,  4 May 2026 23:35:42 +0100 (BST)
Date: Mon, 4 May 2026 23:35:42 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org, 
    Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
In-Reply-To: <alpine.DEB.2.21.2603292037020.60268@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605042332070.46195@angie.orcam.me.uk>
References: <20260127135334.qUEaYP9G@linutronix.de> <alpine.DEB.2.21.2601271508160.40317@angie.orcam.me.uk> <20260127165430.7ui_LGkg@linutronix.de> <alpine.DEB.2.21.2601271739250.40317@angie.orcam.me.uk>
 <alpine.DEB.2.21.2603292037020.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 3C3BB4C46F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14436-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.866];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sun, 29 Mar 2026, Maciej W. Rozycki wrote:

>  I've now got back to it and while preparing the justification for the 
> removal of the IRQF_ONESHOT recommendation and having looked through 
> Documentation/core-api/real-time/differences.rst I became stumped and 
> need a further clarification after all.
> 
>  I read in the document that:
> 
> "However, on a PREEMPT_RT system, interrupts are forced-threaded and no 
> longer run in hard IRQ context."
> 
> and:
> 
> "All interrupts are forced-threaded in a PREEMPT_RT system. The exceptions 
> are interrupts that are requested with the IRQF_NO_THREAD, IRQF_PERCPU, or 
> IRQF_ONESHOT flags."
> 
> -- do I infer correctly that on a PREEMPT_RT system in the absence of any 
> flags passed to request_irq() the handler requested such as one concerned 
> here (i.e. lance_dma_merr_int()) will run with interrupts locally enabled 
> on the CPU?

 No reply, but I've gone through irq_setup_forced_threading() now and my 
inference was indeed correct, and the handler does need to be installed 
with IRQF_NO_THREAD.  I'll send corrective patches shortly.

  Maciej

