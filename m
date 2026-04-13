Return-Path: <linux-mips+bounces-14127-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCU1DqTz3GkvYgkAu9opvQ
	(envelope-from <linux-mips+bounces-14127-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 15:46:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC33ECB34
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 15:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E0CC3010758
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 13:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3E33CF02F;
	Mon, 13 Apr 2026 13:45:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7063CA485;
	Mon, 13 Apr 2026 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776087924; cv=none; b=d6476Xm7hhjIIYz9Tl+kM7fT8f4WGmtAzo/VuiBm6e1sd3nsJ2duo2RBZVH4fu1N/AxGeTyBSrCMxsWfO/ctQ4LkoQdh3lHBilaKqviIPsGk8/XmatxqKKp7mFPauqc3pRg3fhQhYksEaP2zexVdB1tFXJY1lUjFPjR+FU6D4h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776087924; c=relaxed/simple;
	bh=Odv5zH1J4LxnKF5UkH74kWOp+Irz5AABX7a6T6Der+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXpJr/Ggow+GTZfGd4SaydFs2g1O6G32W61MnYbN9r6/K1EnhduU/508tygRgkAdItTkIXSny+QxAW4q0JGntXiTxi09NMklmF6cp/x7vlVLkpK0qeMlJIVPsy/eOBP5RGzpy8+skpHD7eH3JXholfI+nrFdhgJ8n1YF77vatys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wCHbE-0004aF-00; Mon, 13 Apr 2026 15:45:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3E540C0256; Mon, 13 Apr 2026 15:43:01 +0200 (CEST)
Date: Mon, 13 Apr 2026 15:43:01 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] MIPS RB532 GPIO descriptor conversion
Message-ID: <adzy5WHWbZUZjQ8I@alpha.franken.de>
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bootlin.com,nod.at,ti.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14127-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.957];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3DDC33ECB34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 04:55:46PM +0100, Linus Walleij wrote:
> This moves the MIPS Mikrotik RouterBoard RB532 over to using
> GPIO descriptors by augmenting the two remaining drivers using
> GPIOs to use software nodes and device properties.
> 
> This is part of the pull to get rid of the legacy GPIO API
> inside the kernel.
> 
> It would be nice if someone can test of this actually works,
> I've only compile-tested it.
> 
> If we can agree on this method to move forward with this machine
> it would be nice if the MIPS maintainer could merge the end
> result with ACKs from the input and MTD maintainers.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (2):
>       MIPS/input: Move RB532 button to GPIO descriptors
>       MIPS/mtd: Handle READY GPIO in generic NAND platform data
> 
>  arch/mips/rb532/devices.c         | 83 ++++++++++++++++++++++++++++-----------
>  drivers/input/misc/rb532_button.c | 35 ++++++++++++++---
>  drivers/mtd/nand/raw/plat_nand.c  | 24 ++++++++++-
>  3 files changed, 113 insertions(+), 29 deletions(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

