Return-Path: <linux-mips+bounces-14366-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULVaIhHC72mLFQEAu9opvQ
	(envelope-from <linux-mips+bounces-14366-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 22:07:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DCD479B1E
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 22:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63FFE3026329
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 20:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977AE2DF153;
	Mon, 27 Apr 2026 20:07:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4C72DECC2;
	Mon, 27 Apr 2026 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320421; cv=none; b=PhdPh6GeOasM3uLmnyKoXMiE8CiQmSLMutoIQg0n1WDRyuBNhuhlcrJ+oNh6DsEZ69GSkq6GfPOcIQZF0qnHtOTGs3pjENbTq4v+5P5a5qcNWE6u0zUAl5RM6F3lnWoBqEi10DlKceXFenaJfBgJzcgtYbqj/mMt8YLMVQ/++Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320421; c=relaxed/simple;
	bh=nHcpEksPsmLpnJ1q3xrEZGsme/bRdQl6OuYZzVDWF3U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LnPlEY8fvKs1qJDUyQwYQpHK7mPW5wC5VckaSV6tg41Go7XkE6Ux+MxocqQTFObwyf1WgTYLTTM1V2mDl7zlAjPhFspD1su9p2pWmxVCopsoF/Ez1Mx6WEdL9DUsPfRlUVNYK2wBl0zPbY+ZnsfnV7+eLuCpWkUO4ODgIHs4ee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 757FB9200B4; Mon, 27 Apr 2026 22:06:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6F20192009D;
	Mon, 27 Apr 2026 21:06:56 +0100 (BST)
Date: Mon, 27 Apr 2026 21:06:56 +0100 (BST)
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
In-Reply-To: <2026042737-siamese-cod-84c5@gregkh>
Message-ID: <alpine.DEB.2.21.2604272057250.28583@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2604130239560.29980@angie.orcam.me.uk> <alpine.DEB.2.21.2604130416440.29980@angie.orcam.me.uk> <2026042630-diaphragm-reactor-7cfe@gregkh> <alpine.DEB.2.21.2604271435070.28583@angie.orcam.me.uk>
 <2026042737-siamese-cod-84c5@gregkh>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E3DCD479B1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,kernel.org,intel.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14366-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, 27 Apr 2026, Greg Kroah-Hartman wrote:

> > > How about fix this up to work properly with a refcount?  having "open
> > > coded" atomic variables like this is ripe for problems, like it seems
> > > this driver is abusing.
> > 
> >  Clearly refcount has odd semantics for this use case, as the failed 
> > attempt to "fix" this code has shown.
> > 
> >  The natural values for `map_guard' are 0 and 1 (FALSE and TRUE), for the 
> > resource not taken and taken respectively, however refcount code complains 
> > about this arrangement as indicated by the report quoted.
> > 
> >  I suppose I can bend backwards and adopt other values, which I'll have to 
> > figure out from the API somehow, but it's not clear to me how it would 
> > cause less confusion than original straightforward code, the whole point 
> > of which is to prevent the resource from being requested again for the 
> > second port in a DUART.
> > 
> >  Or I could use an ordinary variable, possibly of the `bool' type, guarded 
> > by a spinlock, but that would be even more of an overkill IMO.
> 
> No, that would be best because using an atomic is the same end result,
> but it confuses us humans who are the ones responsible for maintaining
> the code over time.

 Right, it's missing a MAINTAINERS entry; I'll add one with the respin as 
I wrote this stuff anyway and still care the most I believe.  And having 
thought a little about it at a bus stop I realised I got confused too, so 
it may have to be a counter after all.  I'll see what fits best, but I'm 
currently away from this hardware (which is not at my lab) until mid May, 
so it'll have to wait.

  Maciej

