Return-Path: <linux-mips+bounces-15112-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lEZxCEF0MWr1jgUAu9opvQ
	(envelope-from <linux-mips+bounces-15112-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 18:05:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6C9691ACF
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 18:05:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K1Zgu4IM;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15112-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15112-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B3E531833AD
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 15:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57CD3C414F;
	Tue, 16 Jun 2026 15:49:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9339282C;
	Tue, 16 Jun 2026 15:49:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781624943; cv=none; b=QHc2a7ikmJUfhXa3JSo+B6cbs2vOG5NSYIQNQMgpxIwagpjeWoz7N8nUvOqdZMarNRWYbjZ/cvaDPFDDsDqTSg8VWNpNJqsewXVMjZBoaxIBWBiLeu09mf6mAdR5H1AlIFJ+MMzbIbuGpnp8ImGtm2ea3hdy1+Lne0J6jAwWHa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781624943; c=relaxed/simple;
	bh=NQKEtwuJplslo1S0a1EuGFXO5pQxOKxvj/9PhHq1Gw0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAsEYpyUHsE2ca0dy5FYNCEzzNhAYhmc2CzqGzuncP41+T73jgsm/NbNYiWT4CGlI7p88iDoWks/FUhVTtFzJbW//E5NfT+Td0/Se3x3vOF44LElgN5C2OUatuTcmDDXxKFGTvzQESOG8tqSrtXBysaizhC13eRNPvpu19EEcg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1Zgu4IM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13EC1F00A3A;
	Tue, 16 Jun 2026 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781624942;
	bh=LwBPJI0zIYaGqkx1gEaeFo2rsRmh3p4qrOGbWDxyeO0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=K1Zgu4IMExh7jVVg+2IFXKcFfxCtgqqknPSgNk95pMqsypDLzD2QVFu6TptWzkDGZ
	 1YRTc4b7aRDRfRCJLepsIdRKV5PlqaJRGKGzjOzgErOK+HC6N+5vicmrEDClCyYvrG
	 YEm5iik1EYQiaWU5qzafp8VM/hJ1QPW6iusrwEaaSZWtD/CtGIzbai0Z2JCQJPH2nz
	 4I/CEpzHPrk0WGCzwnkZeJSrepcJ3biv4V1RH6JUebicDQcaPZifoORh3ZbSOpE+do
	 CDP1qjdZij4tJYT85PBnJMjWGjmTmywO1no7Rx4VzWJeyaIo6tBSEENR2qURrq5B8B
	 wOgf3aKc7W4kg==
Date: Tue, 16 Jun 2026 08:49:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Carsten Strotmann <cas@strotmann.de>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 geert@linux-m68k.org, chleroy@kernel.org, npiggin@gmail.com,
 mpe@ellerman.id.au, maddy@linux.ibm.com, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
Message-ID: <20260616084901.3319d82e@kernel.org>
In-Reply-To: <A3590144-073C-46D6-8425-90EE0C4D48E8@strotmann.de>
References: <20260615222935.947233-1-kuba@kernel.org>
	<c3789160609a10e232ba3e27c4b13adbb170956c.camel@physik.fu-berlin.de>
	<20260615175535.5bc56cfc@kernel.org>
	<A3590144-073C-46D6-8425-90EE0C4D48E8@strotmann.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15112-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:cas@strotmann.de,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:geert@linux-m68k.org,m:chleroy@kernel.org,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:linux-mips@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linuxppc-dev@lists.ozlabs.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[physik.fu-berlin.de,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,linux-m68k.org,gmail.com,ellerman.id.au,linux.ibm.com,lists.linux-m68k.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E6C9691ACF

On Tue, 16 Jun 2026 09:13:46 +0200 Carsten Strotmann wrote:
> I'm a user of AppleTalk and other "Retro"-Features in the Linux Kernel.
> 
> On 16 Jun 2026, at 2:55, Jakub Kicinski wrote:
> 
> > We can complain about the AI slop til the cows comes home.
> > I don't like it, you don't like it. What difference does it make?
> >
> > If y'all have real solutions please share. Complaining about
> > "commercial interests" and "nuk[ing] everything in a panic reaction"
> > is not helpful.  
> 
> the solution, as Adrian pointed out, is to leave these features in
> the Linux kernel but have them disabled by default.

I think y'all need to internalize that "just leave it in" means work.
_Someone_ has to handle the reports and patches. And since nobody is
doing that the code is going to GitHub, where it can continue to "just
be left" or whatever, without racking up CVEs for the Linux kernel
and leading to maintainer burn out :/

> Maybe put a warning message in the kernel config tools that people
> should only enable these if they know what they are doing.
> 
> These "retro"-features should not pose any security risk of they are
> not compiled into a kernel.

Nobody is stopping you from using this code! It's perfectly suitable 
to be an out of tree module. Maybe it'd be harder if someone wanted to
remove a CPU architecture you want to use, but protocols are perfectly
fine as loadable modules. You can continue to use the code from:
 https://github.com/linux-netdev/mod-orphan

Presumably you could get Debian to package that and you wouldn't even
know the sources no longer live in the kernel tree.

