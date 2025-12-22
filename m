Return-Path: <linux-mips+bounces-12542-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD65CD6D4E
	for <lists+linux-mips@lfdr.de>; Mon, 22 Dec 2025 18:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94883301E5AE
	for <lists+linux-mips@lfdr.de>; Mon, 22 Dec 2025 17:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5906D33C526;
	Mon, 22 Dec 2025 17:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b="wPvfUHE2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C05A33C1B9
	for <linux-mips@vger.kernel.org>; Mon, 22 Dec 2025 17:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766424392; cv=none; b=ALAP11mw4qZ29PMIhlmmJHOfhhJ7hkygw/7Cf88RuDkZj8pHnMYolizi8AaPDoS/zMX7WS7IOQ+TYDN6cZDw/KnaxDZQcxlfY1gZiQhb5aySoodZ8XwsDwRamwzaZlRJ2xuoTqYxlmV5shLsshsIRXiKrPf186hANEBI2tOQq48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766424392; c=relaxed/simple;
	bh=kwW05N1YT/gkrSiszWWJcnYwfjWsGlJM9lyXi/6XbZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0HtBPAO7SIqQaq6CNCS0ByiQk7/iCdi+TjBE50K3r0Xyv4QWc6YPuX3JE2vc8JLHZoYFgUHegVGyJm539GQqhcvACr9z2yjads+AGsAmvYVy/ZA9aNjyQKAGw+5itZDcyJU6m7bRuwUEN3ZgNq/uFAEOWF1RK9zWRy34XH8W0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de; spf=pass smtp.mailfrom=hauke-m.de; dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b=wPvfUHE2; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hauke-m.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dZlRk29zJz9t2V;
	Mon, 22 Dec 2025 18:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1766424386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tYIu9Hz9xwqyPUcMN+2g6aBe2SD9sGU4UJooHPMzRWc=;
	b=wPvfUHE2QvsAgoasdiKDX6ug2sgZyBH0/7PAsJW63Ld7IAiJV/ttTpYRvYWHY3LVwBgPaD
	oh+Q5lVUE9+lNMgZ0jtvuFxleGIWGIrKk30IcwufNwzQD85LTwVP4EQXAER/K67H0LSWmQ
	SbKqmtkrU1kkZ2Pd3uSeuk1BMOIqf50ekScEQ5zTWMwddJ7F2S3wmpxn1ZKEZ8iucmEMHq
	WFlhMBmq6k4rClDBd8BA+cejPrQ1+dH7e5tKDoBQV7M3HKTqVueN+dXW4xIqcW66So3xvz
	Gec09H7qbN5wsVyVh89gvyN3WuCo/0A5FjngBJ6FNglquSnl/HnDvxb4EsIv4Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hauke@hauke-m.de designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hauke@hauke-m.de
Message-ID: <d036a962-5f22-4503-bad3-75e946c23830@hauke-m.de>
Date: Mon, 22 Dec 2025 18:26:23 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Realtek rtl838x MIPS boot hangs since 6.6.119
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>
 <alpine.DEB.2.21.2512151706150.31276@angie.orcam.me.uk>
 <06e66320-110b-4b13-abfc-ed86aeafafb5@hauke-m.de>
 <d29f4c9e-1458-47ef-8f5e-1e7a43c729b8@hauke-m.de>
 <alpine.DEB.2.21.2512221645090.14570@angie.orcam.me.uk>
Content-Language: en-US
From: Hauke Mehrtens <hauke@hauke-m.de>
In-Reply-To: <alpine.DEB.2.21.2512221645090.14570@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4dZlRk29zJz9t2V

On 12/22/25 18:09, Maciej W. Rozycki wrote:
> On Mon, 15 Dec 2025, Hauke Mehrtens wrote:
> 
>> I added some more printks into the code. The tlb_write_indexed() in
>> r4k_tlb_uniquify() is hanging when it is called in the loop with i == 1.
> 
>   This matches my suspicion based on the TLB dump produced with the debug
> log (with all-zeros entries) and 4KEc documentation.  This is going to be
> tough to address given the growing number of platform-dependent variables
> and unknowns to handle with this code, but I'm going to chew it over and
> find a solution.
> 
>   NB I had a major connectivity outage through most of last week owing to
> an infrastructure issue affecting the network carrier serving my ISP.  It
> has has been sorted now, but took most of my time and attention (to say
> nothing of 1000km total worth of driving back and forth), and disturbed
> all my work schedules.  Also I was unable to reply even though I saw your
> reports, which arrived shortly before the failure.
> 
>   Thank you for your patience while I was distracted.  I'll try to come
> back with a solution ASAP, but please mind the festive season.
> 
>    Maciej
Hi,

No hurry, I am not a paying customer. ;-)

We reverted the 2 patches in OpenWrt for all targets. I only saw reports 
related to the 4KEc CPUs on these Realtek SoCs, but did not try other 
MIPS SoCs.

Hauke

