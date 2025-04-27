Return-Path: <linux-mips+bounces-8816-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F841A9E3EA
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 18:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFAED1716CB
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 16:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE811A5BA6;
	Sun, 27 Apr 2025 16:23:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5136E522A;
	Sun, 27 Apr 2025 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745770992; cv=none; b=cQBdbGPxZd8HWxfUcKSoLWaMVIub+rFQRQ26UyYVHPFzANfgyc0nA8oMnJJ7zsVZV7cR8tjQmfODYZgze689raukYpehI+mb+yvhElZ4xj5G8dPKGCjvQWQ8GNgzzPfcQyhsiUdiFvMP/18q3+2PD7NGfLz8cFpLxpdcxJVfIkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745770992; c=relaxed/simple;
	bh=EIOPmxx/fF9h+f6rhelUy6/ZY96XIzB0YB+Bilpm+es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9D+qxdXisIQ/h+o9+zyus/SCTAqVMWEngvv2WWxzndQ2JTv6BcR5OZpmj9oJ/ybL1KVAyAqojB/K+w3lzxlrkBkmN+UDDd/uvkXiMltDvjTtx40EcVzQ8Vcx+8AH53MJ7FWqS+K6dWEtnKnzvCw6LydilmMYp49t5/WBQ1vu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u94mV-0001Ut-00; Sun, 27 Apr 2025 18:23:03 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D6D1CC01A2; Sun, 27 Apr 2025 18:22:50 +0200 (CEST)
Date: Sun, 27 Apr 2025 18:22:50 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length
 struct member
Message-ID: <aA5Z2izR-HKAdi99@alpha.franken.de>
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
 <aAIF_kEFlOOVNDaE@alpha.franken.de>
 <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
 <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk>
 <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
 <alpine.DEB.2.21.2504181337350.18253@angie.orcam.me.uk>
 <B71034AC-B0FC-4C5F-8562-661D6AD11056@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B71034AC-B0FC-4C5F-8562-661D6AD11056@linux.dev>

On Fri, Apr 18, 2025 at 03:38:36PM +0200, Thorsten Blum wrote:
> Would it make sense to also change the register arrays 'mpl' and 'mtp'
> from ULL to UL? ULL seems unnecessarily confusing to me.

no, ULL is correct. These registers are always 64bit independent whether
CPU is in 32bit or 64bit mode.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

