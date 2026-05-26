Return-Path: <linux-mips+bounces-14774-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AvPAHzAFWrRaAcAu9opvQ
	(envelope-from <linux-mips+bounces-14774-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 17:47:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8425D8FFC
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 17:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68FB93049211
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 15:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F417236F41C;
	Tue, 26 May 2026 15:36:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3526A378806;
	Tue, 26 May 2026 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809771; cv=none; b=icABxLFNtxmZnKgnHJNlZVPZMwtniH/mGUUtO2uQN/oHLIavD1zBerwIH8WfWg62VgBzOcXGQrNWwSi85HZgZ6jhhUW7bBLG4674FywrYcbdo4gXH+AGmPtABn5CQrftNIZCxGKUzJjDkw2LDe9QswAt4+4Bmu9EIMK9N246gS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809771; c=relaxed/simple;
	bh=FQRWY6AEKrfKqaq7BdmWUYjUT4ICHvNZnwYxHBU2XAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5koMV/gdeHkAJt2Yr/jUI1nT6SSohkUHP4SVZxxOKmcjrkJ7ZW5JTzcBGQZTxcq06XzmB259SpsyNOemZdUGdqp7Csbm2DRWt4YpDRv3BKutGgDPndVLDG3LbdUW8E/Ra+UX3UrSxZE9oeX89n7mj4XhVbrPBmt4HaR/h1qI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRtp9-0003HS-00; Tue, 26 May 2026 17:36:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E6B65C0522; Tue, 26 May 2026 16:53:56 +0200 (CEST)
Date: Tue, 26 May 2026 16:53:56 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, Lauri Kasanen <cand@gmx.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mips: n64: add __iomem for writel call
Message-ID: <ahW0BDXCpPseQ4Sx@alpha.franken.de>
References: <20260509035727.1016256-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509035727.1016256-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmx.com];
	TAGGED_FROM(0.00)[bounces-14774-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,alpha.franken.de:mid]
X-Rspamd-Queue-Id: 8A8425D8FFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 08, 2026 at 08:57:27PM -0700, Rosen Penev wrote:
> sparse: incorrect type in argument 2 (different address spaces) @@
> expected void volatile [noderef] __iomem *mem @@
> got unsigned int [usertype] *
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202105261445.AcvPd2EE-lkp@intel.com/
> Fixes: baec970aa5ba ("mips: Add N64 machine type")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/n64/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

