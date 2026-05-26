Return-Path: <linux-mips+bounces-14765-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AJXGoSzFWpxYAcAu9opvQ
	(envelope-from <linux-mips+bounces-14765-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:51:48 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C1C5D7F69
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AACB30144FE
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E028D40149E;
	Tue, 26 May 2026 14:51:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2C8400E04;
	Tue, 26 May 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807071; cv=none; b=dUUola8paYi+bJJyyAgTDbdzcYbFUV7Ua12MUwigw4/EX3yzLaNieH1E4czLxYf0N7DBnb1FQ/M7becx9XTokBpEs97ChlJ9MlEjtH69XvKH2L/Kp9LFqDPXvKuKTo5yI6eBUCPWmiERL14Gei0VVga9qxaVSQvBlxZTln7SD5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807071; c=relaxed/simple;
	bh=5Zv1nv4v2mucxPM+Ait+cYaNpxCt/1/kYQ1ebH4yO9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sps94ca7dUo73JyASH98KFkgPxwQl4BMZ4Em7pQMrLE9j+AyzjillNcn3Puw9Dnp4cqx50GbJkK4eyVCRidCaf0GFlMn+4MOLyywiJrS4ZVNVqfvieGCBm0T99FMFGwd3MCEKSs2pujuIOdsAtCV090eCwBMTLZ4MZQTSAvtZgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-00015H-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 17C34C0637; Tue, 26 May 2026 16:43:34 +0200 (CEST)
Date: Tue, 26 May 2026 16:43:34 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Walleij <linusw@kernel.org>, brgl@kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: RB532: attach the software node to its target GPIO
 controller
Message-ID: <ahWxlprtWVgS3Q9A@alpha.franken.de>
References: <20260430-mips-rb532-gpio-v1-1-845a0c6206a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-mips-rb532-gpio-v1-1-845a0c6206a5@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14765-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 30C1C5D7F69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 30, 2026 at 01:23:13PM +0200, Bartosz Golaszewski wrote:
> GPIOLIB wants to remove the software node's name matching against GPIO
> controller's label that is going on behind the scenes in software node
> lookup. To that end, we need to convert all existing users to using
> software nodes actually attached to the GPIO devices they represent.
> 
> In order to use an attached software node with the GPIO controller on
> rb532: convert the GPIO module into a real platform device, provide
> platform device info for it in device.c and assign the software node
> using its swnode field.
> 
> The software node will get inherited by the GPIO chip from the parent
> platform device in devm_gpiochip_add_data() as we don't set the fwnode
> using any other of the mechanisms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/mips/rb532/devices.c | 32 ++++++++++++++++++++++++++------
>  arch/mips/rb532/gpio.c    | 41 +++++++++++++++++++++--------------------
>  2 files changed, 47 insertions(+), 26 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

