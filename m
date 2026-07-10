Return-Path: <linux-mips+bounces-15743-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aT9LIazkUGrt7wIAu9opvQ
	(envelope-from <linux-mips+bounces-15743-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 14:25:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C74DE73ABEA
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 14:25:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=DKWqmm7T;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15743-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15743-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A45F301C3C6
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 12:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1002340928A;
	Fri, 10 Jul 2026 12:25:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D043F44C4;
	Fri, 10 Jul 2026 12:25:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686314; cv=none; b=k1YZzvd0I5WXpiV8+8HIOcf26owjk5WznTuWk2uQgFJNwBVXrKFBl8W1QpGjxZL2DDdnur56MLCDbs8rBrVIFECWhcWwlOVmmukS+s61KCFLUM5yLdpzejDyqgwmS3+fQZ3pHN3t8fPZGI4YOuDOR/PH+9WaiNb7KmstqckkaRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686314; c=relaxed/simple;
	bh=Ywc0hoaRqszboCN/Z9m0DI47pAZdqyg4FIYiBaqt80A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCaD4PYUxRfCqUfj0tFcfXYqa99AK+4dzM+dECedH2MpBuR/zD6LuooJFWWz+/fQRIeabGwQVHamstPzErZ6/MzIR9GPNh95yUvIvBoY4VNRMqV5tzQ2i4I7xbn9/w1S+bH73PCs953ir9wtfrNRqUhTNmy683Ar+WKpsMNU66E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DKWqmm7T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF11D1F000E9;
	Fri, 10 Jul 2026 12:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783686312;
	bh=dG8jX7Oq1V64nFRLbfGoJRFM1EbkDsvO0MqXzpKh9pY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DKWqmm7TO4l1qP8D2wfHS9E53zbCLUD3+0NcoRj+e3QX5spSv+ZYip61g7Bs+S5V1
	 TaP7bM1G7vTGSBbOvtYqsZOiNdH5B4MG1OsGP7iL8W0cMq4a/vYFeGabQk1+lotlRZ
	 lveDich9ilARP0P6Rz2tJ11FyNcV7N+cTW58Y5x4=
Date: Fri, 10 Jul 2026 14:25:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	Elena Reshetova <elena.reshetova@intel.com>,
	David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>,
	Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] serial: sb1250-duart: Convert to use a platform
 device
Message-ID: <2026071045-turmoil-daytime-f8f8@gregkh>
References: <alpine.DEB.2.21.2605241602220.1450@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605241625180.1450@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605241625180.1450@angie.orcam.me.uk>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15743-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[alpha.franken.de,kernel.org,intel.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:macro@orcam.me.uk,m:tsbogend@alpha.franken.de,m:jirislaby@kernel.org,m:elena.reshetova@intel.com,m:dwindsor@gmail.com,m:kees@kernel.org,m:ishkamiel@gmail.com,m:linux-mips@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gregkh:mid,linuxfoundation.org:from_mime,linuxfoundation.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C74DE73ABEA

On Mon, May 25, 2026 at 12:12:19AM +0100, Maciej W. Rozycki wrote:
> Conversely only starting the console port so late lets the reset code
> fully utilise our delay handlers, so switch from udelay() to fsleep()
> for transmitter draining so as to avoid busy-waiting for an excessive
> amount of time.

That's a different thing than "convert to a platform device" why are you
mixing this up?

> Since there is one way only remaining to reach sbd_init_port() now, drop 
> the port initialisation marker as no longer needed and go through the 
> channel resets unconditionally.
> 
> Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # needs to use .remove_new for <= 6.10

The first 3 patches in this series are cc: stable, the rest not, which
is a mix I don't really know how to handle.  Please break things up into
series that can go for this release, and those that can wait for the
next onen (i.e. fsleep() stuff).

thanks,

greg k-h

