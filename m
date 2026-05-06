Return-Path: <linux-mips+bounces-14481-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLtCNvQI+2mbVQMAu9opvQ
	(envelope-from <linux-mips+bounces-14481-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 11:25:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E44D8916
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 11:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC7F5301AEF8
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 09:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FB93E274C;
	Wed,  6 May 2026 09:25:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7183DDDC6;
	Wed,  6 May 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059507; cv=none; b=UefF9im65Ybr+tB9inR+Ju9Pa9LBlDJO2pKyaO2MqtMt9bVPe+fafuv3SbL/D0rUepdzQ12/vMWXq66MwNp1FG+GwhA9VHcWVHLWo/XL8WLC2lwTuBrTDH24HguMs4OFF2VHHN/x6vgiEqz2z5KZHtummuJOw3ROubD+E1SFJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059507; c=relaxed/simple;
	bh=/35uEn+4XJDIaayoz6RO8yeaBNabBLVqE+DiS42ggA4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nCiXoSeU2IQQ4XjRkhH/fR1BxkywB7PIcEgbPrdpI2dtyxtgaVhLAWIzvVxwNNDV4HwyRApYEU64iYfhLuL/EWxD7qaaHu8mxTn3FMSib12OwG5y0Va5sA9A+i0GuZR1O0qiQiBAkD7GF0zAkcBweafJwMxx5Of68MIYQLSu9RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 4F93092009C; Wed,  6 May 2026 11:25:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 4CCF292009B;
	Wed,  6 May 2026 10:25:02 +0100 (BST)
Date: Wed, 6 May 2026 10:25:02 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org, 
    Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
In-Reply-To: <20260505152450.1KYVS2pr@linutronix.de>
Message-ID: <alpine.DEB.2.21.2605060040230.46195@angie.orcam.me.uk>
References: <20260127135334.qUEaYP9G@linutronix.de> <alpine.DEB.2.21.2601271508160.40317@angie.orcam.me.uk> <20260127165430.7ui_LGkg@linutronix.de> <alpine.DEB.2.21.2601271739250.40317@angie.orcam.me.uk> <alpine.DEB.2.21.2603292037020.60268@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605042332070.46195@angie.orcam.me.uk> <20260505072954.Ov2t-FGt@linutronix.de> <alpine.DEB.2.21.2605051233210.46195@angie.orcam.me.uk> <20260505123203.jifiaxEL@linutronix.de> <alpine.DEB.2.21.2605051410280.46195@angie.orcam.me.uk>
 <20260505152450.1KYVS2pr@linutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 638E44D8916
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14481-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DMARC_NA(0.00)[orcam.me.uk];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Tue, 5 May 2026, Sebastian Andrzej Siewior wrote:

> I'm not if sure if you may need to change the primary handler if the
> interrupt flow is EOI and cascading based on what you wrote. If you have
> access to the HW then you it should be easy to test given the
> `threadirqs' argument should expose problems.

 The interrupt is exceedingly rare, I've only seen it actually fire maybe 
a dozen times across all my systems in 25+ years.  It happens when there 
is a memory read error on DMA, such as an uncorrected ECC or parity error 
(depending on the system variant), or a bus timeout.

 It should be possible to orchestrate it, such as by making the LANCE DMA 
pointer register refer an unpopulated location in the system address map; 
memory ECC errors can be induced too by the DRAM controller's diagnostic 
feature.  It seems enough hassle though I'd rather get things right by the 
spec.

 Thanks for the hint as to the `threadirqs' facility though, it may come 
up helpful sometime.

  Maciej

