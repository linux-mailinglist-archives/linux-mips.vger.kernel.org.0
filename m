Return-Path: <linux-mips+bounces-15322-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PgZ/KRWvQmq7/gkAu9opvQ
	(envelope-from <linux-mips+bounces-15322-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:44:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2555D6DDD98
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:44:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15322-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15322-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38D9330757DB
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 17:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5D2382F02;
	Mon, 29 Jun 2026 17:40:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A553C3453;
	Mon, 29 Jun 2026 17:40:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754811; cv=none; b=OrwRDod7KEuXSnULzsUZFhs/NkXmL3dp5k0BCoz3FGkBY7kLwmepFPJkTrfct5PIfGCQp5GihGwnnnHiqI52xAFcfNPb96cSRPZGImJPujXMkWWvow1KCXuvhyEKfvas6tqA7XC/BuOaRicLQFA7SUcb4/koxzgjwFlQaR00teo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754811; c=relaxed/simple;
	bh=h6RqCzY473q3j2e4/eJDtRWCxGaC1Nk1nTAqBqWPSYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzPJ6wl1zIn26SR1HrOPsyeq4pmzW3Verf57IA25dbpzeHp+XpWa/POJ+k/tGAMgLKAeWUN1H4lDPUaRvWA3lEXzJTvskEunreED6MU8ca2W6FCBzXl5WgWBEd0J5SYRxXlNdtynjWQArd1PJncABsonPEcOBvcxcg0WF34LsZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1weFd2-0005ib-00; Mon, 29 Jun 2026 19:18:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 57BA0C0142; Mon, 29 Jun 2026 19:14:44 +0200 (CEST)
Date: Mon, 29 Jun 2026 19:14:44 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: configs: Enable the current Ingenic USB PHY symbol
Message-ID: <akKoBOSNmk5KUVFn@alpha.franken.de>
References: <20260624081739.1283-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624081739.1283-1-pengpeng@iscas.ac.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15322-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:email,alpha.franken.de:mid,alpha.franken.de:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2555D6DDD98

On Wed, Jun 24, 2026 at 04:17:39PM +0800, Pengpeng Hou wrote:
> The Ingenic USB PHY provider is now built from phy-ingenic-usb.o under
> `CONFIG_PHY_INGENIC_USB`.
> 
> The Ingenic defconfigs below still enable the stale `CONFIG_JZ4770_PHY`
> symbol.  That symbol no longer carries the provider object, so the
> defconfigs lose the intended USB PHY provider after olddefconfig.
> 
> Use `CONFIG_PHY_INGENIC_USB` instead.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/mips/configs/cu1000-neo_defconfig | 2 +-
>  arch/mips/configs/cu1830-neo_defconfig | 2 +-
>  arch/mips/configs/gcw0_defconfig       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

