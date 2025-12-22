Return-Path: <linux-mips+bounces-12543-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4723CD6F7D
	for <lists+linux-mips@lfdr.de>; Mon, 22 Dec 2025 20:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56FD3301D0D4
	for <lists+linux-mips@lfdr.de>; Mon, 22 Dec 2025 19:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED97329D29C;
	Mon, 22 Dec 2025 19:28:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31F3A937
	for <linux-mips@vger.kernel.org>; Mon, 22 Dec 2025 19:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766431735; cv=none; b=Bax/FF/YhoydZ/Q1IzQBmQXaaj25aR9DgYELXCJGNAJ57e4V2f7xukFpshXMs93wrdDPncA6SHdLiHPeZxBBzcqln/yZpvSpcbrLz8hkHbGfJhe55++KeqbTrasNl/jURDh2ushg3isQE1BZ/HEP2tX9j5kLaBLAL8oedDLiT/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766431735; c=relaxed/simple;
	bh=JYwST7WtgLPL9rfrPoEuoOoR8AIwmewI4GDQPFlyJT8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eJWV5Zw8tNVXMIJJwIbubWn4+XkCMznguvdR4nrJg6w8yEVgT20sjC5ccO2JuI/3I3DhUgvId3h58ah2xSk280z5XlMFiNTD+wz8q6+IYjN5MD9/k9VV8Ab51xDRCgrQ5lhrASCNTOZSjlZXp73rAWc62qOJ0NGdIsDaNLriK88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2823892009C; Mon, 22 Dec 2025 20:28:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 225F192009B;
	Mon, 22 Dec 2025 19:28:51 +0000 (GMT)
Date: Mon, 22 Dec 2025 19:28:51 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Hauke Mehrtens <hauke@hauke-m.de>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: Realtek rtl838x MIPS boot hangs since 6.6.119
In-Reply-To: <d036a962-5f22-4503-bad3-75e946c23830@hauke-m.de>
Message-ID: <alpine.DEB.2.21.2512221906160.14570@angie.orcam.me.uk>
References: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de> <alpine.DEB.2.21.2512151706150.31276@angie.orcam.me.uk> <06e66320-110b-4b13-abfc-ed86aeafafb5@hauke-m.de> <d29f4c9e-1458-47ef-8f5e-1e7a43c729b8@hauke-m.de> <alpine.DEB.2.21.2512221645090.14570@angie.orcam.me.uk>
 <d036a962-5f22-4503-bad3-75e946c23830@hauke-m.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Dec 2025, Hauke Mehrtens wrote:

> No hurry, I am not a paying customer. ;-)

 We aim to resolve issues ASAP regardless, especially the critical ones.  
I call it being professional, not necessarily connected either way with 
being paid for.

> We reverted the 2 patches in OpenWrt for all targets. I only saw reports
> related to the 4KEc CPUs on these Realtek SoCs, but did not try other MIPS
> SoCs.

 I believe all MTI cores are affected from MIPS32r1 onwards that do not 
support the TLB HW Invalidate feature (i.e. no CP0.EntryHi.EHINV bit) and 
are left at their reset TLB state by the firmware (if any).  It's escaped 
my verification because YAMON does populate the TLB with unique individual 
VPN values, so I cannot see the reset state with my Malta systems.

 The problem is this vendor-specific pre-EHINV reset state is transparent 
to software, so it has to be determined indirectly or code written to be 
agnostic.  I've had an idea, but I need more time to materialise it once 
my mind has settled after the recent disruptions.

  Maciej

