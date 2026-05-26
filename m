Return-Path: <linux-mips+bounces-14772-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCNlG/CzFWpVYQcAu9opvQ
	(envelope-from <linux-mips+bounces-14772-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:53:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 182305D802C
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D758303053B
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC5E4048A7;
	Tue, 26 May 2026 14:51:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07273FF88A;
	Tue, 26 May 2026 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807074; cv=none; b=d8PGEdPvKIETUAsltmzQPkZV+xecA42lNkMe4ydXvL2vV4HHgMiX58Sp6dSJfqWZsUhGsmjv6G2xtyNHlzs7DAB1NuJQ9A8TCf8SnhH83bohbnK/Jt2BtPBT1DlcQ1fJA1UnyRQ1c9PfG52kphJhVF1D7utR+Nxlqn9UhsR3eWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807074; c=relaxed/simple;
	bh=NMdeeyE/bKkXz2gAan02F24Low4Q5zyVPiysCb61mUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khmdUH2lzWip4++bvn38gnnNac00GACc7m9HGQKAeqPoolreY+mstPTnTGKzBz0pcouDW1YzmzFO7m7VAYrN3bfAQzqL3fTwHb5uOd5mr5v2yaUAWDO+6U+WziIOXQuCGlEbtM6YOe7WaF/4FLXFiFPl22Zr8Nit/GcHGFhU88s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-00015F-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B109DC0522; Tue, 26 May 2026 16:42:49 +0200 (CEST)
Date: Tue, 26 May 2026 16:42:49 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Felix Fietkau <nbd@nbd.name>, Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Rosen Penev <rosenp@gmail.com>, Nick Hainke <vincent@systemli.org>,
	openwrt-devel@lists.openwrt.org
Subject: Re: [PATCH] MIPS: ralink: reduce ARCH_DMA_MINALIGN
Message-ID: <ahWxaT2josfOnKNa@alpha.franken.de>
References: <20260428082543.95896-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428082543.95896-1-qingfang.deng@linux.dev>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,yahoo.com,nbd.name,hauke-m.de,wp.pl,gmail.com,systemli.org,lists.openwrt.org];
	TAGGED_FROM(0.00)[bounces-14772-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 182305D802C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 28, 2026 at 04:25:40PM +0800, Qingfang Deng wrote:
> Currently, Ralink SoCs use the default ARCH_DMA_MINALIGN value of 128
> bytes defined in mach-generic. This is excessive for these platforms
> and leads to significant memory waste in kmalloc.
> 
> Override ARCH_DMA_MINALIGN to use L1_CACHE_BYTES, which is 16 bytes for
> RT288X and 32 bytes for other Ralink SoCs.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  arch/mips/include/asm/mach-ralink/kmalloc.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 arch/mips/include/asm/mach-ralink/kmalloc.h

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

