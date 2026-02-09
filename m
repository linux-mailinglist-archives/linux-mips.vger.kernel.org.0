Return-Path: <linux-mips+bounces-13139-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKsrBZTViWnSCAAAu9opvQ
	(envelope-from <linux-mips+bounces-13139-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 09 Feb 2026 13:39:48 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C665610ED47
	for <lists+linux-mips@lfdr.de>; Mon, 09 Feb 2026 13:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C784030166DB
	for <lists+linux-mips@lfdr.de>; Mon,  9 Feb 2026 12:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF0B372B53;
	Mon,  9 Feb 2026 11:59:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F8B346770;
	Mon,  9 Feb 2026 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770638397; cv=none; b=HYNXVXsWD1BagmBWh5kXUXHqdoCQyJvrJo8XLlXdQB/mEJM3mt4C3K1hKRZT8B1CkHWecPQchSXky91kWHaXZ7MKVca8/zHYmdLsujvNhguh1/4Y7aAfDjfh85UMVeRNXtCKAa8S8CA+sf4L7KJSbYleHgBr/9KDc39fEXtPof8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770638397; c=relaxed/simple;
	bh=luI9Qc+/6IiB5aws+60a9k2dcPH41jMpwq6ZHScl9bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpkLjR11ryaCDXz7xECaD6QdrF58nuzPBJq02W0UDVU3Bunvd0MYx7tzCuTfBi8nJ0P8X15RnT1k1NnVI2USzdbKMwuQQvPqJYpS7F7p2v0Ml7z5s/VzlL8nH8rKborf20JWtqcYNmt+7U9nZDINroKu6logkcJwCBBQ1wXW3jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vpPvg-0007A2-00; Mon, 09 Feb 2026 12:59:48 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E9069C0907; Mon,  9 Feb 2026 12:59:36 +0100 (CET)
Date: Mon, 9 Feb 2026 12:59:36 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Implement ARCH_HAS_CC_CAN_LINK
Message-ID: <aYnMKFmB3Ve5-2OS@alpha.franken.de>
References: <20260109-cc-can-link-mips-v2-1-38123bfc5628@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109-cc-can-link-mips-v2-1-38123bfc5628@linutronix.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13139-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,alpha.franken.de:mid]
X-Rspamd-Queue-Id: C665610ED47
X-Rspamd-Action: no action

On Fri, Jan 09, 2026 at 11:08:49AM +0100, Thomas Weiﬂschuh wrote:
> The generic CC_CAN_LINK detection does not handle different byte orders
> or ABIs. This may lead to userprogs which are not actually runnable on
> the target kernel.
> 
> Use architecture-specific logic supporting byte orders instead.
> 
> Modern 64-bit toolchains default to a n32 libc, which are not
> supported by all kernel configurations, as MIPS32_N32 is optional.
> On 64-bit, test for a n32 ABI libc first and fall back to o64 and
> o32 if necessary.
> 
> Link: https://lore.kernel.org/lkml/20260105100507-14db55e3-aa71-48bf-a6ac-33b186bd082f@linutronix.de/
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Use -mabi= over -m32/-m64
> - Link to v1: https://lore.kernel.org/r/20251222-cc-can-link-mips-v1-1-6d87a8afe442@linutronix.de
> ---
>  arch/mips/Kconfig | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

applied to mips-next
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

