Return-Path: <linux-mips+bounces-14121-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKD/Ii2k3GkEUgkAu9opvQ
	(envelope-from <linux-mips+bounces-14121-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 10:07:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF303E8CE2
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 10:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9D493016D36
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 08:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C325E3A450F;
	Mon, 13 Apr 2026 08:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LPttxcex"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1C389111;
	Mon, 13 Apr 2026 08:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067475; cv=none; b=Os0JbEa5U4C05v7Nwuh700tfPpLv7ey3Whi82Bk8TkIce3LZA0HHTiYVFXFkrc97/HOvMPWeRFjoS0hDokDVObVbQjMSZ+u/bJugiUZKkclGDQc3PTN6hOo8+WT/hLYJ5InF7GD1q3BkbgTtxl6GwM47DrBrtuVel1med7crdCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067475; c=relaxed/simple;
	bh=nRwmameaeIsZPQfij1qNyLreaRDR+ql4yfEH+VgvVs4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sE9fJRzOjGPfmF2Lsg1dg9bUvjLxg5CC2SjWrrJcFpHZxSI09K6YRk5IB3GvBaXV6vjlkNTd7hAdc/HEfaPmTpW9i8M1F6pkUkstCZZNZkEiARacDCP5CZhgkq/TUmdjrGLQYcych8CBdheq42v/GewiMw7m8jqgm8MAQ5JXT64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LPttxcex; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1C880C5B19E;
	Mon, 13 Apr 2026 08:05:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 923D65FFB9;
	Mon, 13 Apr 2026 08:04:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B4AF10450246;
	Mon, 13 Apr 2026 10:04:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776067470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jeaWaNAvawAg39iZTdMC6jFeHce/2BRX0MTNxqAljDM=;
	b=LPttxcexn+oaDeFgkWoAO0WDpImIBkeUzYnlP/fWz8BA+vHb6j/2ugl//byfEYJb4JSIs6
	DgSkSeFCio+Cti3XrG+HJe3khQRopbUduuRplWxzmdPPAE+H1MbWu9nzTMBFUP5xWgZqBG
	PZIJz/H92OODJQSHecGxXb6WVxx9YwWLI3n/TEDOXqPiBOYBffbdddnavf8hifaDSsqzTv
	be2bIfqYmLHfVZrhjPnXRmX7kLRDAlArdDW3crTok2ine0xEyqZlfyKCm4+VPAkGkQQXuZ
	ecNoZ2Va04cH8idKk0uYWZdHN1b88546HTlutS+NzS9ZSvwwRt8rViRmxLsDbw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 10:04:27 +0200
Message-Id: <DHRVDETB559R.1J1MUGSZ0VVEX@bootlin.com>
Subject: Re: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create()
 error path
Cc: <stable@vger.kernel.org>
To: "Guangshuo Li" <lgs201920130244@gmail.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260412124247.2494971-1-lgs201920130244@gmail.com>
In-Reply-To: <20260412124247.2494971-1-lgs201920130244@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14121-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,mobileye.com,bootlin.com,baylibre.com,kernel.org,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid,bootlin.com:url]
X-Rspamd-Queue-Id: 0FF303E8CE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Guangshuo,

Subject is:

> Subject: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create()
>          error path

I cannot find a public V1?
https://lore.kernel.org/lkml/?q=3Ds%3Aeyeq+f%3AGuangshuo

On Sun Apr 12, 2026 at 2:42 PM CEST, Guangshuo Li wrote:
> eqc_auxdev_create() allocates an auxiliary_device with kzalloc() before
> calling auxiliary_device_init().
>
> When auxiliary_device_init() returns an error, the function exits
> without freeing adev. Since the release callback is only expected to
> handle cleanup after successful initialization, adev should be freed
> explicitly in this path.
>
> Add the missing kfree(adev) before returning from the
> auxiliary_device_init() error path.
>
> Fixes: 25d904946a0b ("clk: eyeq: add driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

I have a guess this is LLM generated?
Are you missing the Assisted-by trailer?
https://docs.kernel.org/process/coding-assistants.html#attribution

The patch could be in theory useful.
In practice however, it's a different story.

 - Comit message says "Since the release callback is only expected to
   handle cleanup after successful initialization, adev should be freed
   explicitly in this path".

   Two things are wrong here:

   1. the driver cannot be removed so there is no "release
      callback" (guessing you mean driver remove?).

   2. this text seems to imply eqc_auxdev_create() makes probe fail,
      which it doesn't. It only generates a warning and keeps probing.

 - This driver cannot be built as module (will always be probed at boot)
   and cannot be removed. So the "leak" we are talking about is
   2 * sizeof(struct auxiliary_device)

   But in no sensible case it can occur. The platforms that use this
   driver probably cannot boot if our auxiliary drivers aren't present.
   So if eqc_auxdev_create() fails then the warning is here to be nice
   but you probably will fail booting afterwards.

   My guess is: you might succeed booting without the reset driver but
   if you fail the pinctrl one then you won't have a UART. Anyway in no
   world do you have a sensible EyeQ kernel config that leads to
   clk-eyeq probing but not its auxdevs.

 - If you fix this then there are other resources cleanup to "fix".

    - ioremap() in eqc_probe()
    - kzalloc of cells in eqc_probe()
    - probably others

   But, same as above, "fixing" those will only be useful in kernels
   that will panic in a few milliseconds.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


