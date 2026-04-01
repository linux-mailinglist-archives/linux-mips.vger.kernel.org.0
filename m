Return-Path: <linux-mips+bounces-14005-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J8ZNkGBzWlveQYAu9opvQ
	(envelope-from <linux-mips+bounces-14005-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Apr 2026 22:34:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 342B8380395
	for <lists+linux-mips@lfdr.de>; Wed, 01 Apr 2026 22:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7DD43031307
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2026 20:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1A73264C3;
	Wed,  1 Apr 2026 20:30:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4C91A0B15;
	Wed,  1 Apr 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075456; cv=none; b=VYTdX0p96vYzJ1ypRJLHZPd+ZM9uBXa0dpiy3v31J/ZactO4B+G32+vqJeJuapzk3vSa4z2iMMLH8f9TDLRZ4cH/tZ7nsl9EvVsR8JlP6o08kQW9+djIxpsumYJqwSTVctskLgRsOz3ztAzDWIJHJ/3RkUd7oeL/MLeNTOUagzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075456; c=relaxed/simple;
	bh=JpBx18Gt2PrHk2QtesQSNQ4tjuv1KnomDhSxJHrVhKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfPQM50+T1jtzAYvutT4d9oIjLVH7FeZrEx0pLmzi9CAfXg8chDrWKf1LwQdUVNJuT8hiIolVmduPEglrNjsYPuQcjZjtjSDBf1n5WSWArWJwE7Ak/eyy2jwd5VugIKkLS76zDi9pz/QZuo/JMJjyGlAUOV9StaTOFdKuC6cy5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w82D7-0008HD-00; Wed, 01 Apr 2026 22:30:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1D265C0DC9; Wed,  1 Apr 2026 22:30:28 +0200 (CEST)
Date: Wed, 1 Apr 2026 22:30:28 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix the GCC version check for `__multi3' workaround
Message-ID: <ac2AZPDScM4Nlft5@alpha.franken.de>
References: <alpine.DEB.2.21.2603300218310.60268@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2603300218310.60268@angie.orcam.me.uk>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-14005-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.699];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orcam.me.uk:email,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alpha.franken.de:mid]
X-Rspamd-Queue-Id: 342B8380395
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 02:54:09AM +0100, Maciej W. Rozycki wrote:
> It was only GCC 10 that fixed a MIPS64r6 code generation issue with a 
> `__multi3' libcall inefficiently produced to perform 64-bit widening 
> multiplication while suitable machine instructions exist to do such a 
> calculation.  The fix went in with GCC commit 48b2123f6336 ("re PR 
> target/82981 (unnecessary __multi3 call for mips64r6 linux kernel)").
> 
> Adjust our code accordingly, removing build failures such as:
> 
> mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
> div64.c:(.text+0x84): undefined reference to `__multi3'
> 
> with the GCC versions affected.
> 
> Fixes: ebabcf17bcd7 ("MIPS: Implement __multi3 for GCC7 MIPS64r6 builds")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601140146.hMLODc6v-lkp@intel.com/
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # v4.15+
> ---
>  arch/mips/lib/multi3.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

