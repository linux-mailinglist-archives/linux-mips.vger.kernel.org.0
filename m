Return-Path: <linux-mips+bounces-14761-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP1uGH6zFWpxYAcAu9opvQ
	(envelope-from <linux-mips+bounces-14761-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:51:42 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 192FA5D7F42
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A91D530182FC
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E223FF89A;
	Tue, 26 May 2026 14:51:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2CE3FFAB9;
	Tue, 26 May 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807071; cv=none; b=rwzYEpQaieJnuvL5olmoTDmeQimdyj+rwe9QHu3UlxWZ5q7pShE1xLM1T7Wi4oAj7zHE3tAOB6ks5GQnJN9vyFnDnDu1Om46EgQ9zeX9MBF82vmNRjFPZ/88aJNaQOssbKV3DM51WBvyQzcYe7ZFbC/KRRNKq1nqjxMDI3NX3T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807071; c=relaxed/simple;
	bh=q0R2WmyWnbg2MejpFO6ouqo9jMd0E/Aae1r3bx48hJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKkeDGJ3M5NOetRsELmtjdPzDzYRRMaVg1XOH2xYNK86XVHhkqJCoh6S7nxe4xR76ShDyLfEn1K2x1gSGfli+/+WzIYnmSKEvhHIF2aamTXBVkYZq+R6HkUzt+uxmLJCo2odaZZSLJggR7uD1NMqmozSXMXvo9+I4HeNBgBuBIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-000157-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1D9C3C0837; Tue, 26 May 2026 16:48:24 +0200 (CEST)
Date: Tue, 26 May 2026 16:48:24 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 00/10] MIPS: DEC: Fix serial device regressions + RTC
 cleanup
Message-ID: <ahWyuPUMe7XQ9fZp@alpha.franken.de>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605221609220.1450@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605221609220.1450@angie.orcam.me.uk>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.991];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-14761-lists,linux-mips=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 192FA5D7F42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 04:15:06PM +0100, Maciej W. Rozycki wrote:
> Hi Thomas,
> 
> On Wed, 6 May 2026, Maciej W. Rozycki wrote:
> 
> >  Two extra introductory changes, 01/10 and 02/10 have now been added to 
> > platform code.  No modification has been made to original changes.  The 
> > original description follows, updated for patch renumbering.
> 
>  Will you be able to get these two changes merged sometime soon now that 
> Greg has queued changes 03/10 through 09/10, so that these prerequisites 
> land ahead and there's no 64-bit regression in mainline?

I've applied 01/10 and 02/10. 10/10 doesn't apply to my tree, because it
depends on the platform.c changes from dz/zs driver change not yet present
in my tree. So either Greg takes it via his tree or I'll pick it up in
a second pull request during the merge window

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

