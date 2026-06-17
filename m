Return-Path: <linux-mips+bounces-15117-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dmv1A9aKMmoT1wUAu9opvQ
	(envelope-from <linux-mips+bounces-15117-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 13:53:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8FF699514
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 13:53:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=strotmann.de (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15117-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15117-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 323B030EC573
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 11:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7283E1D06;
	Wed, 17 Jun 2026 11:31:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from strotmann.de (smtp3.strotmann.de [46.38.233.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC81B2E7387;
	Wed, 17 Jun 2026 11:31:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695916; cv=none; b=OHT5p8QBK9ah0CUF9j4rPnp22rvRRFtoYlTIhJzRQe0Ygunct0u5FKLWXNbGAL8bZoY/JqDb/CWLZczTJWiF5xze2cj5jpjnk1cO3WaEvj70n9c7S9xKcEyk0WhAV80Iv0JU6NksHcckYA8fIQHDlr6G0E/2Byssn3On1Y4OmSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695916; c=relaxed/simple;
	bh=YH7ckNVCV7GvfOt04xpsONXUNkezZP13ClayWtUh03c=;
	h=Content-Type:Message-Id:From:To:Cc:Subject:Date:In-Reply-To:
	 References:MIME-Version; b=ZdH3asMKPVZRtl3/nOc4SvsPZd4vR9geIIDRoIYOJ2XSZAKx14nOYuLYYBTU8e3urygG0aV+nAz3B9A8luytp+HpJVBPhsQLZLq0EbXUWbSjZmdrE/+MXaDgLdLUpRtacIBUVYhH7+7oie26RvS8SozIbwRKefImYGtZDmLV2Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=strotmann.de; spf=pass smtp.mailfrom=strotmann.de; arc=none smtp.client-ip=46.38.233.133
Received: from smtp2.strotmann.de (unknown [IPv6:fd01::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp3.strotmann.de (Postfix) with ESMTPS id CB0837FD72;
	Wed, 17 Jun 2026 13:31:43 +0200 (CEST)
Received: from noip.localdomain (unknown [IPv6:fd00::1000])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp2.strotmann.de (Postfix) with ESMTPSA id 4ggLrR65XHzJZmg;
	Wed, 17 Jun 2026 13:15:51 +0200 (CEST)
Content-Type: text/plain; charset=utf-8; format=flowed
Message-Id: <1781694488854.956546368.818588236@strotmann.de>
From: Carsten Strotmann <carsten@strotmann.de>
To: Jakub Kicinski <kuba@kernel.org>, Carsten Strotmann <cas@strotmann.de>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 geert@linux-m68k.org, chleroy@kernel.org, npiggin@gmail.com,
 mpe@ellerman.id.au, maddy@linux.ibm.com, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
Date: Wed, 17 Jun 2026 11:15:50 +0000
In-Reply-To: <20260616084901.3319d82e@kernel.org>
References: <20260616084901.3319d82e@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[strotmann.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[physik.fu-berlin.de,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,linux-m68k.org,gmail.com,ellerman.id.au,linux.ibm.com,lists.linux-m68k.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-15117-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:cas@strotmann.de,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:geert@linux-m68k.org,m:chleroy@kernel.org,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:linux-mips@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linuxppc-dev@lists.ozlabs.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[carsten@strotmann.de,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[carsten@strotmann.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[strotmann.de:mid,strotmann.de:url,strotmann.de:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE8FF699514

Hi Jakub,

On Tuesday 16 June 2026 05:49:01 PM (+02:00), Jakub Kicinski wrote:

 > > the solution, as Adrian pointed out, is to leave these features in
 > > the Linux kernel but have them disabled by default.
 > 
 > I think y'all need to internalize that "just leave it in" means work.
 > _Someone_ has to handle the reports and patches. And since nobody is
 > doing that the code is going to GitHub, where it can continue to "just
 > be left" or whatever, without racking up CVEs for the Linux kernel
 > and leading to maintainer burn out :/
 > 

That's a good point. The large influx of reports is a problem, 
and burn out of maintainers is a too high cost.

 > > Maybe put a warning message in the kernel config tools that people
 > > should only enable these if they know what they are doing.
 > > 
 > > These "retro"-features should not pose any security risk of they are
 > > not compiled into a kernel.
 > 
 > Nobody is stopping you from using this code! It's perfectly suitable 
 > to be an out of tree module. Maybe it'd be harder if someone wanted to
 > remove a CPU architecture you want to use, but protocols are perfectly
 > fine as loadable modules. You can continue to use the code from:
 >  https://github.com/linux-netdev/mod-orphan
 > 
 > Presumably you could get Debian to package that and you wouldn't even
 > know the sources no longer live in the kernel tree.
 > 

It seems the current situation is the price of success (of Linux, which is 
good).

I guess the way to go would be to move these old drivers to userspace in 
order to 
reduce dependencies on the Linux Kernel. But that is not a task for the 
Linux-Maintainers, but for the Retro-Community.

Thanks for your work and the background information

Carsten

-- 
https://strotmann.de

