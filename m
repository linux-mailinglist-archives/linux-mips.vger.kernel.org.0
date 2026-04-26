Return-Path: <linux-mips+bounces-14328-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC5MEIne7ml7ywAAu9opvQ
	(envelope-from <linux-mips+bounces-14328-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 05:56:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF3E46CAF5
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 05:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C9F99300D4FE
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 03:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36AD3914FF;
	Mon, 27 Apr 2026 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y2A1vmxH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF50D371049;
	Mon, 27 Apr 2026 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261902; cv=none; b=Pn0y2CPo49QD+tIkN5OK7YekgVUhzD2y/1S+nkE+BqUWC1A1Hx5a2M7XGDo499AMLJwQWmYXePA1DXV4GMdsQj8+1o0TPJPnA1U69zPKQ+o7H01gRDDoKe/vrOvgbNa2Lb97qpt3mA0CaAukYkrF+iwlT5VxegUIZ9H/TmhsBXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261902; c=relaxed/simple;
	bh=qfOWciOdj+AxDU1vozH6V2JW/zfXtz0rerqMJUQ6QNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IF7S8u22R+PcN46iLwVR3b6qeqEbYD4Lvwnhu0BoGcy9vd6LPPs2orvI5lz7dXVutolkCE10qnsB7X/HfSR2/9Ofp1PwnrT70lMhymkj0PBEJ/FFa5SQh67Vz66PQsZ7GkFNwoyaevytprRBkLmrnoXYbIoyfhLYYUvu9fiGmPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y2A1vmxH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FAAC19425;
	Mon, 27 Apr 2026 03:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261902;
	bh=qfOWciOdj+AxDU1vozH6V2JW/zfXtz0rerqMJUQ6QNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2A1vmxHwpLDmtWzkIcHn4RL2q2l73mUiCLJFGlKnCmMkfihR7TpeoWwqqMqOrcMR
	 P9neA699PPDHfJfCT/JvSxn+BH++su3d5omrSZHXs+pyGhuVwDDrIlRi60cMf0YNFu
	 tAh7nu8zl/HUrV7KYg+8arKMphSSjHpqWbVPm6Rk=
Date: Sun, 26 Apr 2026 22:45:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	Elena Reshetova <elena.reshetova@intel.com>,
	David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>,
	Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Revert "drivers: convert sbd_duart.map_guard from
 atomic_t to refcount_t"
Message-ID: <2026042630-diaphragm-reactor-7cfe@gregkh>
References: <alpine.DEB.2.21.2604130239560.29980@angie.orcam.me.uk>
 <alpine.DEB.2.21.2604130416440.29980@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2604130416440.29980@angie.orcam.me.uk>
X-Rspamd-Queue-Id: 3BF3E46CAF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14328-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[alpha.franken.de,kernel.org,intel.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Mon, Apr 13, 2026 at 04:28:53AM +0100, Maciej W. Rozycki wrote:
> Revert commit 22a33651a56f ("drivers: convert sbd_duart.map_guard from
> atomic_t to refcount_t"), which broke perfectly valid code:
> 
>   ------------[ cut here ]------------
>   WARNING: CPU: 1 PID: 1 at lib/refcount.c:114 sbd_request_port+0x54/0x140
>   refcount_t: increment on 0; use-after-free.
>   CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.11.0-rc2+ #34
>   Stack : 0000000014001fe0 0000000000000000 ffffffff80830000 0000000000000000
>           ffffffff8127bc7a ffffffff8016fe08 ffffffff808d0000 ffffffff808d0000
>           ffffffff807aa828 ffffffff80822337 ffffffff808ce188 a8000001860b0000
>           0000000000000001 0000000000000001 00000000000001c8 ffffffff808a3090
>           00000000000000bb ffffffff801b09d4 a80000018609bb68 ffffffff801231cc
>           ffffffff812a0000 ffffffff80171388 0000000000001000 ffffffff807aa828
>           0000000000000001 0000000000000001 0000000000000000 0000000000000000
>           0000000000000000 a80000018609bab0 0000000000000000 ffffffff803c47cc
>           0000000000000000 0000000000000000 0000000000000000 0000000000000000
>           ffffffff807cb648 ffffffff8010bff8 0000000014001fe1 ffffffff803c47cc
>           ...
>   Call Trace:
>   [<ffffffff8010bff8>] show_stack+0x28/0x88
>   [<ffffffff803c47cc>] dump_stack+0x8c/0xc0
>   [<ffffffff801aff5c>] __warn+0xe0/0x114
>   [<ffffffff801233f0>] warn_slowpath_fmt+0x40/0x50
>   [<ffffffff80455bcc>] sbd_request_port+0x54/0x140
>   [<ffffffff804563a4>] sbd_config_port+0x2c/0x68
>   ---[ end trace f666d696412caa3e ]---
> 
> (report at the offending commit) -- sbd_request_port() is called twice
> per DUART instance, to reserve a resource holding the control register
> block shared between the two channels, so there's no slightest chance
> for an overflow.  Also this doesn't stop the driver from working and
> it's just the reservation that is missing as a result, i.e.:
> 
> 10060100-100601ff : sb1250-duart
> 10060200-100602ff : sb1250-duart
> 
> as from the offending change, vs:
> 
> 10060100-100601ff : sb1250-duart
> 10060200-100602ff : sb1250-duart
> 10060300-100603ff : sb1250-duart
> 
> beforehand, which is surely why the breakage has gone so long unnoticed.
> 
> "If it ain't broke, don't fix it," so just revert the broken commit.

How about fix this up to work properly with a refcount?  having "open
coded" atomic variables like this is ripe for problems, like it seems
this driver is abusing.

thanks,

greg k-h

