Return-Path: <linux-mips+bounces-15416-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6vo/DhxCRmrqMwsAu9opvQ
	(envelope-from <linux-mips+bounces-15416-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 12:49:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E586F62BC
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 12:48:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15416-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15416-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23EC930398C8
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jul 2026 10:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334053C5826;
	Thu,  2 Jul 2026 10:46:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45B43C1400;
	Thu,  2 Jul 2026 10:46:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989199; cv=none; b=mOi1olyGIeZWKSwYDPPVCrynaiD0IoSJvOpm36Js/wnBi4k/m445YQgej6sMmOf0pOrYKdS7mC3snoWhDh5NGNnx5HQbJwXP1vM3S4FoT5efvPjJAvn7ratwO70B13U4VTLHZAq7DejiwpqT1oz/OmFsl2YsItzrpuCsEv/ca18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989199; c=relaxed/simple;
	bh=T/VYdxO+cFellJCBE9JnSRCYAC/tFqM8jVDZEPBwSFU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RS0iaWfpUQbSihUjkrTjN+oeQYW8jXnRYxGtFHn4rBSRRBAjm0NlAk8tNnS8LJfIyRhjChCGomT5J5000Gpsl36HcAIN3AQ9wHXXEZY3O5MqMd/IKTVr0o50waIKRbc/gwl5ITIo3KpFDSrQFvFFDvpDm0G9+ZRqpwAEyk5riuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id AD1B992009C; Thu,  2 Jul 2026 12:38:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A9F5D92009B;
	Thu,  2 Jul 2026 11:38:59 +0100 (BST)
Date: Thu, 2 Jul 2026 11:38:59 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Stefan Wiehler <stefan.wiehler@nokia.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v2] mips: mm: Call rcutree_report_cpu_starting() even
 earlier
In-Reply-To: <18fdaf3e-a957-4d9e-bc29-3c570d50f482@nokia.com>
Message-ID: <alpine.DEB.2.21.2607021125340.516@angie.orcam.me.uk>
References: <20260409164846.3176046-2-stefan.wiehler@nokia.com> <alpine.DEB.2.21.2604101353010.29980@angie.orcam.me.uk> <dff4fa6e-8eed-4dde-be99-f8adced872e2@nokia.com> <7fd22b08-d9af-4751-a6f3-6ef9c9205a2b@nokia.com> <4a414140-66d7-4114-9b36-e746573d4fa9@nokia.com>
 <alpine.DEB.2.21.2605231440350.1450@angie.orcam.me.uk> <18fdaf3e-a957-4d9e-bc29-3c570d50f482@nokia.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefan.wiehler@nokia.com,m:tsbogend@alpha.franken.de,m:jiaxun.yang@flygoat.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chenhuacai@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_SENDER(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15416-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8E586F62BC

Hi Stefan,

> >  I'm afraid I have no QEMU installation ready to use, so I can't reproduce
> > your steps without getting sidetracked.  Would you be able to explain why
> > it triggers with QEMU and possibly the I6400 CPU in particular, but not on
> > real SMP hardware I have?  From your commit description I infer this isn't
> > supposed to be a heisenbug.
> 
> The only explanation that comes to my mind is that your platform has
> TLBINV support and never calls r4k_tlb_uniquify() [1], therefore
> skipping the kmalloc() call. Would you please verify that?

 The Broadcom SiByte SB-1 core I have tried to reproduce this issue with 
(in a dual SMP configuration) is a MIPSr1 CPU and does not have the TLBINV 
instruction or the EHINV feature and neither is architectually allowed to.  
I have used it as one of the test platforms for 64-bit r4k_tlb_uniquify() 
verification and it is guaranteed to call this function.

 I'll see what I can do, but it'll take a while, so maybe someone else can 
try and reproduce it with their setup before I can get to it?

  Maciej

