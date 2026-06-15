Return-Path: <linux-mips+bounces-15074-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id toLwCVjXL2oSHwUAu9opvQ
	(envelope-from <linux-mips+bounces-15074-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:43:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806068567E
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:43:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15074-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15074-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D92D302F73A
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 10:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEFD33B6EA;
	Mon, 15 Jun 2026 10:43:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84984305675;
	Mon, 15 Jun 2026 10:43:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520211; cv=none; b=XITPgj9OX4l/J/cnpeb0Pq/3aNE3xKwSJgxM9YP/OMrBE+tSUuS4RZcLv9aw3Dw8P0DotOkzDJUWCWWuMHGxiRrJHB4Kulp1aVzojTB9nYOTp4PfkOMnlK5k1YxmJacBxxRq9qUhAD/N5S0UrPKvuhSTfJEF/5nKDAh2nttjBpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520211; c=relaxed/simple;
	bh=sL2aqGyO8HmBGgKhktkiLHD9OWRqIGRsNaN3SoHiq64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bjm3nVldCx7bLypFP8Q+Kd58PmhAU5EALyhohlYDL34/gn+xc5c6NDKHX8CEUb7ClzYA7RpbIeqnoRq2GqSgAGWI5IuEF60oYR96JgKAtaVstJxWCNJfzNlCxTSczGju9VHGTMaDtBg3Dp4MmTbDUJZNrKuwxHT30MF1HfE+WLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000JZ-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1693EC06CF; Mon, 15 Jun 2026 12:28:50 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:28:50 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: ath79: reduce ARCH_DMA_MINALIGN
Message-ID: <ai_T4m2Bsd6lOC6s@alpha.franken.de>
References: <20260527222504.17381-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527222504.17381-1-rosenp@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15074-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,alpha.franken.de:mid,alpha.franken.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8806068567E

On Wed, May 27, 2026 at 03:25:04PM -0700, Rosen Penev wrote:
> Currently, ath79 SoCs use the default ARCH_DMA_MINALIGN value of 128
> bytes defined in mach-generic. This is excessive for these platforms
> and leads to significant memory waste in kmalloc.
> 
> Override ARCH_DMA_MINALIGN to use L1_CACHE_BYTES, which is 32 bytes for
> ath79 SoCs.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/include/asm/mach-ath79/kmalloc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 arch/mips/include/asm/mach-ath79/kmalloc.h
> 
> diff --git a/arch/mips/include/asm/mach-ath79/kmalloc.h b/arch/mips/include/asm/mach-ath79/kmalloc.h
> new file mode 100644
> index 000000000000..954f5d6e0dd0
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-ath79/kmalloc.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_MACH_ATH79_KMALLOC_H
> +#define __ASM_MACH_ATH79_KMALLOC_H
> +
> +#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
> +
> +#endif /* __ASM_MACH_ATH79_KMALLOC_H */
> -- 
> 2.54.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

