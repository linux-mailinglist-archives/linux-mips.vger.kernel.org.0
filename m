Return-Path: <linux-mips+bounces-14009-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPplFjCGzWkregYAu9opvQ
	(envelope-from <linux-mips+bounces-14009-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Apr 2026 22:55:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC00380660
	for <lists+linux-mips@lfdr.de>; Wed, 01 Apr 2026 22:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D907E3046B9E
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2026 20:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F6E364040;
	Wed,  1 Apr 2026 20:30:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6EE2FD7BE;
	Wed,  1 Apr 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075457; cv=none; b=aE/I1kA7QGKMdlobwhUzljnS5aRljObscTPirnaEU88SLO4FEmafu6RRGr1RImiLSqpObIBq7OKQFtoJI8UpIpF2CBBH2xd4MjKwA6UIqRoTxnhSjLVUozFVVAR3cZcSuZC/hH4FcvwKlCpoUC+z3B2W9mJviuK7A8jpbW/ioo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075457; c=relaxed/simple;
	bh=BQHtOIlcRNd347Leecq/jzKVHOQSNV1WlEI8GeplSjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8tAOHceA+IQhtYNM9ZU3eNWAFKVTh6q8XkxSTEU7JfDEq9BW1hScpLOoKA3znSC3n5wAoK5kSTZsoE8etm8Yrtg++kxXCko+PiGW+JRd7NSJcny3F4SGZGZbaC0JrFczMjBSGqtqyoP2BD2JGZyPvyqGHgd8qOgWA0iJOU+n5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w82D7-0008H7-00; Wed, 01 Apr 2026 22:30:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id EF197C0988; Wed,  1 Apr 2026 22:28:10 +0200 (CEST)
Date: Wed, 1 Apr 2026 22:28:10 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rong Zhang <rongrong@oss.cipunited.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Yao Zi <me@ziyao.cc>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>, Rong Zhang <i@rong.moe>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Loongson64: env: Check UARTs passed by LEFI
 cautiously
Message-ID: <ac1_2jpwEFVs_4bV@alpha.franken.de>
References: <20260314211336.408561-1-rongrong@oss.cipunited.com>
 <20260315172824.352412-1-rongrong@oss.cipunited.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315172824.352412-1-rongrong@oss.cipunited.com>
X-Spamd-Result: default: False [7.34 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14009-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alpha.franken.de:mid,ziyao.cc:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ECC00380660
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Mon, Mar 16, 2026 at 01:28:22AM +0800, Rong Zhang wrote:
> Some firmware does not set nr_uarts properly and passes empty items.
> Iterate at most min(system->nr_uarts, MAX_UARTS) items to prevent
> out-of-bounds access, and ignore UARTs with addr 0 silently.
> 
> Meanwhile, our DT only works with UPIO_MEM but theoretically firmware
> may pass other IO types, so explicitly check against that.
> 
> Tested on Loongson-LS3A4000-7A1000-NUC-SE.
> 
> Fixes: 3989ed418483 ("MIPS: Loongson64: env: Fixup serial clock-frequency when using LEFI")
> Cc: stable@vger.kernel.org
> Reviewed-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
> ---
> Changes in v2:
> - Sort new includes alphabetically (thanks Yao Zi)
> ---
>  arch/mips/loongson64/env.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

