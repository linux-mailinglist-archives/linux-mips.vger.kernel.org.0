Return-Path: <linux-mips+bounces-14446-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AW6gGyKd+Wlg+QIAu9opvQ
	(envelope-from <linux-mips+bounces-14446-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 09:32:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9774C7FF5
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 09:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6B4130208BE
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 07:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37513DF00C;
	Tue,  5 May 2026 07:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZYA4QJ/d";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l/9e7/D3"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8323A42846D;
	Tue,  5 May 2026 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966201; cv=none; b=HyPrn5V+uN1ZN61gdf8+xww+gD14PcTHKoDBduQGxiNPrBKMZq015DcRVQ0YmmD1hbM+EU18pmW0sJWJ7zRul/RBEL3MF3ctAGj/WbHduzWDNkm4Ls1/WmxRMVVqy2XhCgb3fXb8Bj2EffQ23Pb022/j1nPFnYDrUrJfzh33Ry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966201; c=relaxed/simple;
	bh=Mnc2hoZLvbm/kNdSaAVvsiO0Tsn8OPrfgghIMf1EpDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5SeDr846+gBDRO2fwJ6zNXlgMN/c5dV/i5h9HQ7SOdk5OwFEFhcKXUWFYqWKO69oz0m/ZIS1ttfxsO52COn9XOK0KM0waXhcRrNnUbCJAPtzHmIMxhpiTRaLTTkOXGsyryS0k0sen4HwfSkWfCzAN/laxcvhbodyfZAepxZFBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZYA4QJ/d; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l/9e7/D3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 5 May 2026 09:29:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777966196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NpK8AnewU1uPLgOLGs+f2bK9sMEbV9YbuGWB3e9BzzQ=;
	b=ZYA4QJ/d9RaDABQAXTVHP2rWxRrA78/EvZfkbFjDz1xldsoY6Q+cx2prC7cljm79yLNU+N
	dcwQZEVOUUukz95gz1V2w4qJLTnloAq6LRWFWW8ENMKyH39HKAq2dkiCoj3/9VKE1Y8af/
	m6GZ5LE8OfY5xKEh/6i4AnXCX4j51DeR2qfOKlapdsKd6IvkY/K1QY6msru2RiiNRXBFBl
	2YmeLHDBNxZPh8ovpcRHNgPEzVhnoKY+gaDD0GgpfTrjKwtqN6LAB1ZUJ/jzPBspkos5Nl
	iDxAhhKSuF+x5OAsWdT993416JO2MySHUNArTRNCYztIVgBfIKNTTYfaSwshIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777966196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NpK8AnewU1uPLgOLGs+f2bK9sMEbV9YbuGWB3e9BzzQ=;
	b=l/9e7/D3XSDs2ZSbClUOAvy+HxGzybciopnuvaiccu4xmbmGIK/9KoSIFH4nqTJWMMODTk
	CtI8cEVD+vdAM6AA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
Message-ID: <20260505072954.Ov2t-FGt@linutronix.de>
References: <20260127135334.qUEaYP9G@linutronix.de>
 <alpine.DEB.2.21.2601271508160.40317@angie.orcam.me.uk>
 <20260127165430.7ui_LGkg@linutronix.de>
 <alpine.DEB.2.21.2601271739250.40317@angie.orcam.me.uk>
 <alpine.DEB.2.21.2603292037020.60268@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605042332070.46195@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605042332070.46195@angie.orcam.me.uk>
X-Rspamd-Queue-Id: EA9774C7FF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	TAGGED_FROM(0.00)[bounces-14446-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	TO_DN_SOME(0.00)[]

On 2026-05-04 23:35:42 [+0100], Maciej W. Rozycki wrote:
> On Sun, 29 Mar 2026, Maciej W. Rozycki wrote:
> 
> >  I've now got back to it and while preparing the justification for the 
> > removal of the IRQF_ONESHOT recommendation and having looked through 
> > Documentation/core-api/real-time/differences.rst I became stumped and 
> > need a further clarification after all.
> > 
> >  I read in the document that:
> > 
> > "However, on a PREEMPT_RT system, interrupts are forced-threaded and no 
> > longer run in hard IRQ context."
> > 
> > and:
> > 
> > "All interrupts are forced-threaded in a PREEMPT_RT system. The exceptions 
> > are interrupts that are requested with the IRQF_NO_THREAD, IRQF_PERCPU, or 
> > IRQF_ONESHOT flags."
> > 
> > -- do I infer correctly that on a PREEMPT_RT system in the absence of any 
> > flags passed to request_irq() the handler requested such as one concerned 
> > here (i.e. lance_dma_merr_int()) will run with interrupts locally enabled 
> > on the CPU?
> 
>  No reply, but I've gone through irq_setup_forced_threading() now and my 
> inference was indeed correct, and the handler does need to be installed 
> with IRQF_NO_THREAD.  I'll send corrective patches shortly.

Sorry. I missed that previous email.
IRQF_NO_THREAD will not force-thread the interrupt handler so it will
run with interrupts disabled.

With force-threading enabled, the interrupt handler is masked in the
IRQ-chip until after the threaded-handler run. See the cond_unmask_irq()
in handle_level_irq() or the mask_irq() & cond_unmask_eoi_irq() in
handle_fasteoi_ack_irq(). That means the hw-IRQ is done, the thread is
running with interrupts enabled but the hw-IRQ will not trigger again.
The cited commit 5a4a4ad851dd8 ("MIPS: Mark cascade and low level
interrupts IRQF_NO_THREAD") is different as it acts on cascading
interrupts which is not what we have here.

If you request a threaded interrupt you must either provide two handler
and the primary must mask the interrupt so it does not fire again or you
pass a flag such as IRQF_ONESHOT and which point the IRQ subsystem will
mask the IRQ within the irqchip so it does not fire again.

>   Maciej

Sebastian

