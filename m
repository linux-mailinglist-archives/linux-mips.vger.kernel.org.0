Return-Path: <linux-mips+bounces-15132-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bp2GGT2tM2rbEwYAu9opvQ
	(envelope-from <linux-mips+bounces-15132-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 10:33:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B172F69E7A2
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 10:33:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="a7bLhF/a";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15132-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15132-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0C103041788
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 08:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A402F8E85;
	Thu, 18 Jun 2026 08:32:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156838F92D;
	Thu, 18 Jun 2026 08:32:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771525; cv=none; b=UZS7uuEzNrHtZtMgUTk0BfunTFcc8V3Bhy4IdHKht/sY6TGy+2lE5/LaBhAKRchm4yiI6S+18Rt4lS4g/V+FD4v7Z62KdQi1I7H0MfXkT0a9z0lHdLAPTMIb/zvXrSKp3M++joftsxbWAL1D2blchQStfN7NBBzh2nREwMe5HO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771525; c=relaxed/simple;
	bh=ngGey/dDjPJxxE8rcnNt7BxBlhmXCynXpzagHqIx1G8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GN+DYGY4pUMmX17rpueNDG9BJcyyMisTVs14NPujmtTAufMWRmxuc7C/xOzHyZOSajQONNSDdrz5+9M0S3P5dYewEX64YuKXTd3zO6tvt+WGyW8iHaAIRdMxUfAEtRjN38CXpwx6/S5oiJyb0Z2sFj4+Zjgxfp3ZTFZlEfla4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a7bLhF/a; arc=none smtp.client-ip=103.168.172.148
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 3EE3CEC0125;
	Thu, 18 Jun 2026 04:32:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 18 Jun 2026 04:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781771523; x=1781857923; bh=DX/5eoMehoRMx1NS0o3ilj6Cat8DUGz4t+h
	0dl/9b8w=; b=a7bLhF/avj96bs8ne8CbAjwUs9qrJycSakuzm7NpXWgZobZcDJd
	97IGbNu/qmA9gBGPBPbt6U3H4fdFM4Ur0JupUaEHSO1CuD6X4PIZLMTtBwmThK7i
	U1K6naJpXHb8f9MJiYh6yjbr0hBUvvqhMPCPjDVRva6rOovXq8ly7UXnRbt4ZDbg
	A+v+fWIpNl8XPIEeqB0lFds6r2JG1bp/DrNJ/AIHrPSN4kfZzbFG/96BV154YZ8H
	Iyd3xXzuZ++SsIQgH8q3kDj/dAiCf35oGVR7FTtQHR5st9k1DzeYsxZJO9Floa+Z
	hlZRD1hUJ3bwQVBJk9lTd5fPMPyiWj0rSUw==
X-ME-Sender: <xms:Aq0zap0az8UG10rexhGH9sHYzO9pzrr35k3cJscocbx9fclwlFKmww>
    <xme:Aq0zar-x1tU0MkrrIzSKKKWpEG0tzYj6npaSbBkuHvbftxLntPwZaEJd-o4icysvq
    zUrxB9pbwVJcwMpv77L-S5vGnRBGnFLTb3yNGU6Cge9H-Tr9Wp4wM0>
X-ME-Received: <xmr:Aq0zalYvQ3dpyrtCrpEs9-T8vfL3TYTjJEK2SFc4D32akizW3mvU9SyadFWk>
X-ME-Proxy-Cause: dmFkZTENUo1ZmJt29bGwYRxNLA/I+cx87fAWyEWHgTjdGerg5dLt/PVhI8bN6q9UjDukdN
    m0Dby0iAlLvdA93Tb246Tx53rTY4N97xRSicwUn+OaBVZmBlmlNSDPB2p9AXE4zW5ZBNBW
    yUZ9m5kMt9vA32mPt71DSoPh/ovPZiR47gjL2xWM+ZS/mKDMl5rHa8+816FK43bPOoOy8b
    t02nTTbmkFWULrtaps3qJnuK0Tk3EU0TIMz+GeRwZusioUwIrQomUDFx+fJXsjjHOyQOCr
    jpz2p58GQ6I3GuTa3sMzUx466v4Fc+qPeNgnVqY0VVIUZrbr6+0GKUwLT+vdJWuRcK8vee
    WcWB4I8H1UrY7YgFfyclVx12Iws2XY9FWqutabemH10TvAfLoiT37z3P9GxlG1YDSvgdoH
    RlI/XownDhkRbg1D3coHR/NFeU+nR4D14Kj/bm51Qh+dae1VZUfig7aa5sFTrcwkCBBsZV
    YtgvrT3AnUw5QnW/mqpbmFlnHSqTOBR9uxhYMi4aAAOnO1F5QCwS6fzO4ZAJJmthFxOaOH
    62E9AhfHlCCchvM25CyqKP+0Y95H0/OTIZVKwsq/nLDkfOk7JLve7rQhmJb8UEZysLtwwd
    tra4bDuA8Ph6lacrGYoSGWYSgNYu9xolAQX8hMIdjxopXjwiXuljwbJvaAGA
X-ME-Proxy: <xmx:Aq0zaqxV3a70epHyy_Xk7BDS6N4_GJHhP5-h8e4BOPLyNjr0dI3UmA>
    <xmx:Aq0zaj-7Me0Rt6HBSYVfAX_DliHHakKRqX1cDt3G7usLSRaIYxI4EA>
    <xmx:Aq0zamzq1qxfnDlMBwn1cqwNsiY__E9NIpjqXRijCKz6MuKgFSzRSg>
    <xmx:Aq0zaov5eHvAQNUxJ3oQ2L2z1tzg2WzOfTjPen8jL7kTCIU0X1uBxA>
    <xmx:A60zarQxTkwnS_YYBiQm1quQzacJKLs6ftsDWO2YEV-4YFzYy3Le3l4a>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jun 2026 04:32:00 -0400 (EDT)
Date: Thu, 18 Jun 2026 18:31:55 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Andrew Lunn <andrew@lunn.ch>
cc: Carsten Strotmann <carsten@strotmann.de>, Jakub Kicinski <kuba@kernel.org>, 
    Carsten Strotmann <cas@strotmann.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
    pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
    geert@linux-m68k.org, chleroy@kernel.org, npiggin@gmail.com, 
    mpe@ellerman.id.au, maddy@linux.ibm.com, linux-mips@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
In-Reply-To: <2791b2e3-bf58-4dce-9262-4f1d8d3241fb@lunn.ch>
Message-ID: <4b08a56c-b209-22c8-7835-6fee7ac7a8b8@linux-m68k.org>
References: <20260616084901.3319d82e@kernel.org> <1781694488854.956546368.818588236@strotmann.de> <489024bc-b6e5-f601-3bce-444d75abbf5d@linux-m68k.org> <2791b2e3-bf58-4dce-9262-4f1d8d3241fb@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15132-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:carsten@strotmann.de,m:kuba@kernel.org,m:cas@strotmann.de,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:geert@linux-m68k.org,m:chleroy@kernel.org,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:linux-mips@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER(0.00)[fthain@linux-m68k.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[strotmann.de,kernel.org,physik.fu-berlin.de,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,linux-m68k.org,gmail.com,ellerman.id.au,linux.ibm.com,lists.linux-m68k.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fthain@linux-m68k.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux-m68k.org:mid,linux-m68k.org:from_mime,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B172F69E7A2


On Thu, 18 Jun 2026, Andrew Lunn wrote:

> appletalk is just one of many many drivers where the listed Maintainers 
> does not respond to patches, or there is no Maintainer at all. So a lot 
> of work falls on the top level netdev Maintainers.

It goes with the territory. If that messes up their performance reviews, I 
am okay with that. We all make our own choices.

> In fact, a lot of the AI driven bug fixes tend to fall into this 
> category of old drivers with no active Maintainers, since that tends to 
> be where the poorer quality code is.

That has not been my experience. I rarely see a review from sashiko-bot on 
the scsi mailing list that doesn't list as many pre-existing bugs as new 
bugs. This is almost always actively developed code, not mature code.

In anycase, quality is irrelevant here. I'm happy to see fixes for any 
code base whatever its level of quality and whatever the quality metric. 

What matters more to me than quality is utility.

> So top level netdev Maintainers are having to do a lot more work, on old 
> drivers which very few people care about. That is a poor use of their 
> talent, when we actually want them working on drivers for modern 
> hardware with a lot of users.
> 

Again, that has not been my experience. Linux often gets installed because 
the hardware is not modern enough so the vendor has abandoned it and so
there's no better alternative than Linux.

As for wasted talent, this industry discards skillsets just as fast as you 
discard e-waste. It goes with the territory. Moreover, if maintainers are 
not using AI to make themselves more effective then they should admit to 
retro-computing.

