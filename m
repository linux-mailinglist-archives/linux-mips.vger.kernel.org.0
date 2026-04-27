Return-Path: <linux-mips+bounces-14335-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN2gIzVw72mHBQEAu9opvQ
	(envelope-from <linux-mips+bounces-14335-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 16:18:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 529974742F6
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 16:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11842303B142
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 14:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58563D34BE;
	Mon, 27 Apr 2026 14:14:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091D33C3BED;
	Mon, 27 Apr 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299244; cv=none; b=PCQkjFL8CF9NjNHumFo1x5tLJ2zZLoAiCCryCelZsxpkPtPi03yU3PfjffKU/TAK8R4+QxGbS0IpE64pNvoe8zpyIcE4OlIyxNJgycNsGCUs7b02+rRimVG5P9YxGAQUibWyyWiBPAqwxecEXH04OJZhtRZW4CskmLSc3bUWamA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299244; c=relaxed/simple;
	bh=bMEAfV/9DleZOO02PXeqD9OGwfV45rNtxoathPc2c9Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tuQbqyLIhaTtf6ehN9GJjOdQ4FRnb7deEBENhjsuw1d7zmgD8NvUeHxMI7ucR8uU2ZyNZFTgZFEARy3UReWPgCQCA4k9CH2CjC+JRUo8z3+bIuVVR/UIsybyuUvQJlxhXzhXpmxAKHNZgh8zGluYAuYyJ6Jo8llzbPwPW4RQlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3B5CE92009D; Mon, 27 Apr 2026 16:13:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2D62792009C;
	Mon, 27 Apr 2026 15:13:55 +0100 (BST)
Date: Mon, 27 Apr 2026 15:13:55 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    Elena Reshetova <elena.reshetova@intel.com>, 
    David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>, 
    Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Revert "drivers: convert sbd_duart.map_guard from
 atomic_t to refcount_t"
In-Reply-To: <2026042630-diaphragm-reactor-7cfe@gregkh>
Message-ID: <alpine.DEB.2.21.2604271435070.28583@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2604130239560.29980@angie.orcam.me.uk> <alpine.DEB.2.21.2604130416440.29980@angie.orcam.me.uk> <2026042630-diaphragm-reactor-7cfe@gregkh>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 529974742F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,kernel.org,intel.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14335-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[angie.orcam.me.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sun, 26 Apr 2026, Greg Kroah-Hartman wrote:

> > Revert commit 22a33651a56f ("drivers: convert sbd_duart.map_guard from
> > atomic_t to refcount_t"), which broke perfectly valid code:
> > 
> >   ------------[ cut here ]------------
> >   WARNING: CPU: 1 PID: 1 at lib/refcount.c:114 sbd_request_port+0x54/0x140
> >   refcount_t: increment on 0; use-after-free.
> >   CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.11.0-rc2+ #34
> >   Stack : 0000000014001fe0 0000000000000000 ffffffff80830000 0000000000000000
> >           ffffffff8127bc7a ffffffff8016fe08 ffffffff808d0000 ffffffff808d0000
> >           ffffffff807aa828 ffffffff80822337 ffffffff808ce188 a8000001860b0000
> >           0000000000000001 0000000000000001 00000000000001c8 ffffffff808a3090
> >           00000000000000bb ffffffff801b09d4 a80000018609bb68 ffffffff801231cc
> >           ffffffff812a0000 ffffffff80171388 0000000000001000 ffffffff807aa828
> >           0000000000000001 0000000000000001 0000000000000000 0000000000000000
> >           0000000000000000 a80000018609bab0 0000000000000000 ffffffff803c47cc
> >           0000000000000000 0000000000000000 0000000000000000 0000000000000000
> >           ffffffff807cb648 ffffffff8010bff8 0000000014001fe1 ffffffff803c47cc
> >           ...
> >   Call Trace:
> >   [<ffffffff8010bff8>] show_stack+0x28/0x88
> >   [<ffffffff803c47cc>] dump_stack+0x8c/0xc0
> >   [<ffffffff801aff5c>] __warn+0xe0/0x114
> >   [<ffffffff801233f0>] warn_slowpath_fmt+0x40/0x50
> >   [<ffffffff80455bcc>] sbd_request_port+0x54/0x140
> >   [<ffffffff804563a4>] sbd_config_port+0x2c/0x68
> >   ---[ end trace f666d696412caa3e ]---
> > 
> > (report at the offending commit) -- sbd_request_port() is called twice
> > per DUART instance, to reserve a resource holding the control register
> > block shared between the two channels, so there's no slightest chance
> > for an overflow.  Also this doesn't stop the driver from working and
> > it's just the reservation that is missing as a result, i.e.:
> > 
> > 10060100-100601ff : sb1250-duart
> > 10060200-100602ff : sb1250-duart
> > 
> > as from the offending change, vs:
> > 
> > 10060100-100601ff : sb1250-duart
> > 10060200-100602ff : sb1250-duart
> > 10060300-100603ff : sb1250-duart
> > 
> > beforehand, which is surely why the breakage has gone so long unnoticed.
> > 
> > "If it ain't broke, don't fix it," so just revert the broken commit.
> 
> How about fix this up to work properly with a refcount?  having "open
> coded" atomic variables like this is ripe for problems, like it seems
> this driver is abusing.

 Clearly refcount has odd semantics for this use case, as the failed 
attempt to "fix" this code has shown.

 The natural values for `map_guard' are 0 and 1 (FALSE and TRUE), for the 
resource not taken and taken respectively, however refcount code complains 
about this arrangement as indicated by the report quoted.

 I suppose I can bend backwards and adopt other values, which I'll have to 
figure out from the API somehow, but it's not clear to me how it would 
cause less confusion than original straightforward code, the whole point 
of which is to prevent the resource from being requested again for the 
second port in a DUART.

 Or I could use an ordinary variable, possibly of the `bool' type, guarded 
by a spinlock, but that would be even more of an overkill IMO.

  Maciej

