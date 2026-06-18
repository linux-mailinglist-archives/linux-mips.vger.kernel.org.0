Return-Path: <linux-mips+bounces-15139-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zQR4EhzWM2pIHAYAu9opvQ
	(envelope-from <linux-mips+bounces-15139-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 13:27:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8854969FBF2
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 13:27:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b="yXsum/2J";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15139-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15139-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lunn.ch;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4023830812B7
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 11:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647EC33893D;
	Thu, 18 Jun 2026 11:24:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D800F155C97;
	Thu, 18 Jun 2026 11:24:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781852; cv=none; b=gF/Nt8O+qPExvtwj4g7+GR6KfZEN3KOfegd7UUHBcMVfxTojHKrpdZ5pJDm7Y2c2Vs6BQSBIhCSaFC1KTX5ohgJdVYuLofEqtvL8BU/kQSUNweQWmKekU6Un7e3/iNI+kroe0P/iK0vcA0aQWHnCbvY1xbuS2WCeGwIkZNIVrqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781852; c=relaxed/simple;
	bh=VImDC8judLx38ouaN+xL3fKfJVJGYjZYzMhuQtCxzqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTf5ee1hKo4WdznyyHTiiHcwE1BYqwpANbz62sbxlKFKfp012MfgwnZLJ60g63UIX5snEEY8o2UMrbAQqtGTjahC5EzHO9waPwzNsRAQxjWst8W32q1LZKPVKyh2LVXKg/8uTfXTr9RgOeYwpvIfqd92rbxI+IUJJxY6SM9weII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yXsum/2J; arc=none smtp.client-ip=156.67.10.101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KIVhtGDOftKGMoqU6D8/d4TMAblKDzksnARw6vxVdcw=; b=yXsum/2JI2Ph64k4YrNglCS8tA
	xlEjQXaixDCl1NhwC4ls/bBCyr0q/m2NDKVMHhp1f+7/VPhNfLyGxO/oQ6N1kR51WUC2XHvhiK+Qt
	ON52Kx4BQSw8U6UUYRtbNVqEoghiP53xQpw77Oz8uevBbKio2CeNQ0mTr/XeC/O8fnjg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1waAqg-008KhB-Rm; Thu, 18 Jun 2026 13:23:54 +0200
Date: Thu, 18 Jun 2026 13:23:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>,
	Carsten Strotmann <carsten@strotmann.de>,
	Jakub Kicinski <kuba@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	chleroy@kernel.org, npiggin@gmail.com, mpe@ellerman.id.au,
	maddy@linux.ibm.com, linux-mips@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
Message-ID: <91591775-3ac7-4b1f-91a3-9c58df96d9fc@lunn.ch>
References: <20260616084901.3319d82e@kernel.org>
 <1781694488854.956546368.818588236@strotmann.de>
 <489024bc-b6e5-f601-3bce-444d75abbf5d@linux-m68k.org>
 <2791b2e3-bf58-4dce-9262-4f1d8d3241fb@lunn.ch>
 <CAMuHMdU0em2r-SixT_+EpWJnm4f0g8mReYKBXOw42=HGb_T8WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU0em2r-SixT_+EpWJnm4f0g8mReYKBXOw42=HGb_T8WQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15139-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:fthain@linux-m68k.org,m:carsten@strotmann.de,m:kuba@kernel.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:chleroy@kernel.org,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:linux-mips@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linuxppc-dev@lists.ozlabs.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-m68k.org,strotmann.de,kernel.org,physik.fu-berlin.de,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,gmail.com,ellerman.id.au,linux.ibm.com,lists.linux-m68k.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lunn.ch:dkim,lunn.ch:email,lunn.ch:mid,lunn.ch:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8854969FBF2

On Thu, Jun 18, 2026 at 10:13:08AM +0200, Geert Uytterhoeven wrote:
> Hi Andrew,
> 
> On Thu, 18 Jun 2026 at 10:01, Andrew Lunn <andrew@lunn.ch> wrote:
> > If the appletalk community can take the workload off the top level
> > maintainers, respond to all patches within 2 to 3 days, give
> > Reviewed-by, or make change requests, it can probably stay in the
> > Mainline kernel. Otherwise it will move out of tree.
> 
> "2 or 3 days" is rather short.  If we would have to move all code
> maintained by people who cannot respond to all patches within 2 to
> 3 days out of the mainline kernel, you'd end up with a networking
> subsystem without supporting OS ;-)

I do agree that every subsystem is different, but that is the speed
netdev goes, often faster. There are around 150 patches a day
submitted, and in order to not drown in those patches, they need to be
processed fast.

It is however known for a sub-subsystem to move out of netdev to a
mailing list and a git tree of its own, and just send git pull
requests to netdev. It can then move at its own speed.

	Andrew


