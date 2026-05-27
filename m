Return-Path: <linux-mips+bounces-14786-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFMKFFOmFmoOoAcAu9opvQ
	(envelope-from <linux-mips+bounces-14786-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2026 10:07:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1A85E0D8C
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2026 10:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E7FB3013EC6
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2026 08:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478733BF69A;
	Wed, 27 May 2026 08:07:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9B42F6560;
	Wed, 27 May 2026 08:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869254; cv=none; b=NxVXNaQrsJ6So56TlOIccuvHm5M4hq0lq3NprTpQ4qcJCiLtDpT/0M+37CQrP1rzBCYihI8K+7sqU7sCBmS+SPy9OQB47oI08/7Sy7ayGYXZTzCfHLzgG0Q3uM4ShEf40Tj4wjwlR3aYno/DvPtsiXYphPRgbTQeFSw/oHmrUuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869254; c=relaxed/simple;
	bh=HAU6cOeCjIdc38KAomUbrxCjhBH8ZPtQXSRuH2EAfog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4GciUNme7xgKJpHaEWiq4sXeDVLArnY6/LIHsIcPvV8sd0hBukEFbqDUxZeZARbaobEPN4Yfi3X0ltU12VSOG5NAVdUGn+NFbu4YMv/5Sc3a4C4HZH3rMYVTxk/rqJtI1/OhGho91YLg39ETrCCLzMQL6+8T/cdyH6wRMUzF1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wS9IQ-0006aS-00; Wed, 27 May 2026 10:07:22 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4AEAAC0522; Wed, 27 May 2026 10:06:21 +0200 (CEST)
Date: Wed, 27 May 2026 10:06:21 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Johan Hovold <johan@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] MIPS: ip22-gio: fix leaks and replace static root
Message-ID: <ahal_RNl6ACvPEVf@alpha.franken.de>
References: <20260424102849.2616035-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424102849.2616035-1-johan@kernel.org>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-14786-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2E1A85E0D8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 24, 2026 at 12:28:44PM +0200, Johan Hovold wrote:
> This series fixes some issues found through inspection when looking into
> replacing the statically allocated gio bus root device.
> 
> Johan
> 
> 
> Johan Hovold (5):
>   MIPS: ip22-gio: fix kfree() of static object
>   MIPS: ip22-gio: fix gio device memory leak
>   MIPS: ip22-gio: fix device reference leak in probe
>   MIPS: ip22-gio: switch to dynamic root device
>   MIPS: ip22-gio: do not export device release function
> 
>  arch/mips/include/asm/gio_device.h |  6 ------
>  arch/mips/sgi-ip22/ip22-gio.c      | 34 ++++++++++--------------------
>  2 files changed, 11 insertions(+), 29 deletions(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

