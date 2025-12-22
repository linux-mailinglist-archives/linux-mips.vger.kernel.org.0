Return-Path: <linux-mips+bounces-12541-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D001ACD6C40
	for <lists+linux-mips@lfdr.de>; Mon, 22 Dec 2025 18:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45A593017603
	for <lists+linux-mips@lfdr.de>; Mon, 22 Dec 2025 17:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2448634D4E0;
	Mon, 22 Dec 2025 17:09:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA56A34D4C6
	for <linux-mips@vger.kernel.org>; Mon, 22 Dec 2025 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766423365; cv=none; b=pA7j+A0w/2alTpKkCdb7vbcJo++EH9/XAVuHeQrmIFZBQSye4Re7aDqP1oW/URNYnvcYnIHHJZHk22AZov3zfgngMv51CYZo7Gi01RRdlzOHmxfA5ol03usg+rNaETGQLaBEgBNN/LOF2KWMfId/BUXvIVeo63ddDVnxnVagWbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766423365; c=relaxed/simple;
	bh=ramex1K/+ILmsYYvir3qxsWcozr6UkDTPwaoEz8YgwQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PYWwvXineIwq4b97LH8bIvQqzJyUB0ct6RwjqS8LFHzzt2v6UYDcVKMOO0tHrewF4Ep0JK6wqs5Fr4LAxgvF0uJGpUacSt178oV7ntI5ETyjRHdqML5kDL0KFT5FnnPTSrSWoIctPFlZaJmSy4ngjQZfv+qWY9J3Q+Rs+HUha7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 902B692009C; Mon, 22 Dec 2025 18:09:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8C6B392009B;
	Mon, 22 Dec 2025 17:09:13 +0000 (GMT)
Date: Mon, 22 Dec 2025 17:09:13 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Hauke Mehrtens <hauke@hauke-m.de>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: Realtek rtl838x MIPS boot hangs since 6.6.119
In-Reply-To: <d29f4c9e-1458-47ef-8f5e-1e7a43c729b8@hauke-m.de>
Message-ID: <alpine.DEB.2.21.2512221645090.14570@angie.orcam.me.uk>
References: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de> <alpine.DEB.2.21.2512151706150.31276@angie.orcam.me.uk> <06e66320-110b-4b13-abfc-ed86aeafafb5@hauke-m.de> <d29f4c9e-1458-47ef-8f5e-1e7a43c729b8@hauke-m.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Dec 2025, Hauke Mehrtens wrote:

> I added some more printks into the code. The tlb_write_indexed() in
> r4k_tlb_uniquify() is hanging when it is called in the loop with i == 1.

 This matches my suspicion based on the TLB dump produced with the debug 
log (with all-zeros entries) and 4KEc documentation.  This is going to be 
tough to address given the growing number of platform-dependent variables 
and unknowns to handle with this code, but I'm going to chew it over and 
find a solution.

 NB I had a major connectivity outage through most of last week owing to 
an infrastructure issue affecting the network carrier serving my ISP.  It 
has has been sorted now, but took most of my time and attention (to say 
nothing of 1000km total worth of driving back and forth), and disturbed 
all my work schedules.  Also I was unable to reply even though I saw your 
reports, which arrived shortly before the failure.

 Thank you for your patience while I was distracted.  I'll try to come 
back with a solution ASAP, but please mind the festive season.

  Maciej

