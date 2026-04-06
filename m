Return-Path: <linux-mips+bounces-14073-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBS5KK+o02k4kAcAu9opvQ
	(envelope-from <linux-mips+bounces-14073-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 14:35:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 421D83A3542
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 14:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF743301B4D8
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2026 12:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6546933C53D;
	Mon,  6 Apr 2026 12:35:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024DC3368BF;
	Mon,  6 Apr 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478910; cv=none; b=ps+djf70cw6ue1YAwq728tVqPI4iol9Miqk/mnSdLNZgCDTuAaaiI2Gu3J4mbdiLgTt8DKnbaKdOX/bOgQHtrFIlFByHK3O7SLtEfRb6rujHt6zP3gS0DGpNJlzO1cETmRrLM94gJ8i4mT7pbn2txsSpXvTrGNf7kBd0513uPmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478910; c=relaxed/simple;
	bh=EzXZmIupglbArA3oC7Mzn/QRVx9DOmg7OPXfojpjLoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0fUwppl7iXoCD0+lw+MVAWnU1OInWuhewG0fNFtODHw3bE1pcB81KqqrQDj5fjWiisrCKopbDDuw+i1MybaWVIRSoU4YM8VKIJTSasPIcYFHQAYqy4qDucRteWQn80xrPumCxhHNjEHhLxKx+zluR4gGXQUXom+U5p0hcz5q5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9jAQ-00040z-00; Mon, 06 Apr 2026 14:34:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9ECD8C0EB5; Mon,  6 Apr 2026 14:34:31 +0200 (CEST)
Date: Mon, 6 Apr 2026 14:34:31 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arnd@arndb.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] arch/mips: Drop CONFIG_FIRMWARE_EDID from defconfig files
Message-ID: <adOoV8N5BYueZavi@alpha.franken.de>
References: <20260401082805.214198-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401082805.214198-1-tzimmermann@suse.de>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14073-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.622];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,alpha.franken.de:mid]
X-Rspamd-Queue-Id: 421D83A3542
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 10:27:57AM +0200, Thomas Zimmermann wrote:
> CONFIG_FIRMWARE_EDID=y depends on X86 or EFI_GENERIC_STUB. Neither is
> true here, so drop the lines from the defconfig files.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  arch/mips/configs/ip32_defconfig            | 1 -
>  arch/mips/configs/lemote2f_defconfig        | 1 -
>  arch/mips/configs/malta_qemu_32r6_defconfig | 1 -
>  arch/mips/configs/maltaaprp_defconfig       | 1 -
>  arch/mips/configs/maltasmvp_defconfig       | 1 -
>  arch/mips/configs/maltasmvp_eva_defconfig   | 1 -
>  arch/mips/configs/maltaup_defconfig         | 1 -
>  7 files changed, 7 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

