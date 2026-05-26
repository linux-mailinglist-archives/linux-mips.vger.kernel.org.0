Return-Path: <linux-mips+bounces-14773-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K5nAFS7FWrKYQcAu9opvQ
	(envelope-from <linux-mips+bounces-14773-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 17:25:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 702425D8A6C
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 17:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63FCA3135562
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 15:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6EB40629E;
	Tue, 26 May 2026 15:08:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAC4405C5A;
	Tue, 26 May 2026 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808106; cv=none; b=M+7Q4HQ5OtuHvc6PSguw9tZq8PvEzBcTfgOxOffeUZoVPSr4VUysdBrNEA74YbmgMJuWFUCA4t8q/iw+xhLDerQLHIP0zPJ7dblZwklXBTbVmnaLcYAoES9gvx2IeJKNc3yp79SDzUb7S1jF1R/+ifpdgDUc+6WEbWNKCtvT4UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808106; c=relaxed/simple;
	bh=18Ll05h93qLha5IN3xqHxu/pEtgz5qPO/pKnrGCMtuE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZWsc1qGyJv0eEVQET1BK8755zL2lriVpCWIlyPdEOTYOfvL6TQuLZ0p87Ov6aOhUancht3YOz8PK5NzhopevKV++JHEsUAUfCdoPylptJyi2ysQpASkU2TStUfOeo3TIOdISmeKjF+1hz5H7QJxDQd5xmEvzBk1/J3tqalqnAYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2C75292009D; Tue, 26 May 2026 17:08:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2630192009B;
	Tue, 26 May 2026 16:08:23 +0100 (BST)
Date: Tue, 26 May 2026 16:08:23 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 00/10] MIPS: DEC: Fix serial device regressions + RTC
 cleanup
In-Reply-To: <ahWyuPUMe7XQ9fZp@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2605261604510.1450@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk> <alpine.DEB.2.21.2605221609220.1450@angie.orcam.me.uk> <ahWyuPUMe7XQ9fZp@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14773-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 702425D8A6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026, Thomas Bogendoerfer wrote:

> >  Will you be able to get these two changes merged sometime soon now that 
> > Greg has queued changes 03/10 through 09/10, so that these prerequisites 
> > land ahead and there's no 64-bit regression in mainline?
> 
> I've applied 01/10 and 02/10. 10/10 doesn't apply to my tree, because it
> depends on the platform.c changes from dz/zs driver change not yet present
> in my tree. So either Greg takes it via his tree or I'll pick it up in
> a second pull request during the merge window

 Fine with me either way, thanks for taking care of this stuff!  I'm glad 
I was able to find time and momentum to get these issues finally sorted, 
as I was aware of them for quite a while now, but there's so much to pick 
from.  More to come.

  Maciej

