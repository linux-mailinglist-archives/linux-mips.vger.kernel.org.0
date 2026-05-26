Return-Path: <linux-mips+bounces-14766-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAcNKuW0FWpxYAcAu9opvQ
	(envelope-from <linux-mips+bounces-14766-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:57:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A665D8272
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B4B73076F34
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6143C401A18;
	Tue, 26 May 2026 14:51:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD6A400E05;
	Tue, 26 May 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807072; cv=none; b=rYMAbqGnhBAsqhmfSRYixpDoRqbup2Xki+EfbZmRNqB1LMfjz/65mVtnqDIqfiXuv1dbYLxOH1XC1oLoIiz2dfCKZ6aK5XR9TPNE+bqUCbEEx40Nyp1Ez8xkfk+RIY0i2if+dzfwKLHlvBEdH5qMyhHCTp3pqaAboRHmumgv0qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807072; c=relaxed/simple;
	bh=hLLM+TKEgZ8SsKGhi14i72sxyb5/yQPPXH+RP5lIojM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvLNx8es6OZs3IRHL8dVOI1e29WH3paEowizv+55ZHjFCVSjZ2vKPPxJqydpeiXUY/naXVBK7TzsJSlWx7d1McGKrCf3o+FTdR1Taz5iuCNmk5/SdMbCRZqYibcqeKsDPXKfImgWeo1CdA6NOaJuuNJxJqPekxU54UluluWO9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-00015Z-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 32D82C07FF; Tue, 26 May 2026 16:44:52 +0200 (CEST)
Date: Tue, 26 May 2026 16:44:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: DEC: Remove IRQF_ONESHOT reference for IOASIC DMA
 error IRQs
Message-ID: <ahWx5MX00R64nanU@alpha.franken.de>
References: <alpine.DEB.2.21.2605061142040.46195@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605061142040.46195@angie.orcam.me.uk>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.996];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-14766-lists,linux-mips=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 36A665D8272
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 06, 2026 at 12:15:21PM +0100, Maciej W. Rozycki wrote:
> There is no need for IOASIC DMA error interrupts to use the IRQF_ONESHOT 
> flag, because while they do need to have the source cleared only at the 
> conclusion of handling, the action handler supplied is either run in the 
> hardirq context with interrupts disabled at the CPU level or, where IRQ 
> threading has been forced, the primary handler has the IRQF_ONESHOT flag 
> implicitly added and therefore the original action handler, now run as 
> the thread handler and with interrupts enabled in the CPU, is executed 
> with the originating interrupt line masked.  Therefore no interrupt will 
> retrigger regardless until the original request has been handled.
> 
> Link: https://lore.kernel.org/r/20260127135334.qUEaYP9G@linutronix.de/
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
>  arch/mips/dec/ioasic-irq.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

