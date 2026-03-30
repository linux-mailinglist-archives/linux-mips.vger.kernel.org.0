Return-Path: <linux-mips+bounces-13986-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMgYLjkwymkA6AUAu9opvQ
	(envelope-from <linux-mips+bounces-13986-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 10:11:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D9356EC1
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 10:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDE1C305856A
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 08:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E3E39E184;
	Mon, 30 Mar 2026 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BuLAqCs+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2E237EFF5
	for <linux-mips@vger.kernel.org>; Mon, 30 Mar 2026 08:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857885; cv=none; b=dhdfTcS9HfFro+Nf55HgtVUJVawJ9GhJEETdGPkL3U4Mgav02BOD9KZ/92W4NsgTVQGZrwKw7woC1RiY2z9ECq+6AUCPBBup6YK3g59FuzdvvczcPvy/vSnPOMsUXaVx97arursvKWtk/Y+4Z0XN3NmUqpW9amTrPBnjeB+4v4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857885; c=relaxed/simple;
	bh=NI+dDSFb+B4wbwRhOwzVtiWfHdckWtXrPaqJM/br4Gw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bYclCddX0p2c0eFwtExq9Io/svKP0faCNvbFA5d3P3yhwgFZ6QQCJWZUDAeOGmCAdHe0CD/9U99Q0hlMxc/aB55gongtQUwa3WAyyVq4oDAH/X7gPU+eoqj+Nz5WOy8Umwsajp/jWguwDdufNs5B1hcYBOZjqJvOQxfxMVExzSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BuLAqCs+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D41151A3095;
	Mon, 30 Mar 2026 08:04:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A8E525FFA8;
	Mon, 30 Mar 2026 08:04:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC6F110451B68;
	Mon, 30 Mar 2026 10:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774857874; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e9yXhXYtA6S7FCEzYya4xIi0QVtCAmYf97xEC+a39pE=;
	b=BuLAqCs+HBjveDvPLCofBbG3aZy+a93jX/iMOoC574ORAOecwYhDZ09PuPx2PYleznVEuX
	F+SVcj/mvXpWnUqakXVfj+24ofCXLNpg87FiS2fkHDdD+N3uvb1Bn7M50LKueAwkimYCwo
	F/ebg/i4BGA104opCHdNPWw1/pDQjewsSbM95bsM5WAhx8lkUEI5YEXlVgKMOp3K7ZrEWc
	gVT/CrDIU/adbPBjqFewfx+8OGL8KnGZz9vUtT3JdgwqkiZbe7+ynqPhXmf/ozL6pj7INl
	VBJN8D7+dUhrOX1ksxOMMzZVABbl7TaBhcjPKVIQuxBi1Ov5yE84uCqiP9rQTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,  Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Bartosz Golaszewski <brgl@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mips@vger.kernel.org,
  linux-input@vger.kernel.org,  linux-gpio@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] MIPS/mtd: Handle READY GPIO in generic NAND
 platform data
In-Reply-To: <20260328-mips-input-rb532-button-v1-2-98e201621501@kernel.org>
	(Linus Walleij's message of "Sat, 28 Mar 2026 16:55:48 +0100")
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
	<20260328-mips-input-rb532-button-v1-2-98e201621501@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 30 Mar 2026 10:04:30 +0200
Message-ID: <87a4vpbv5d.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,gmail.com,kernel.org,nod.at,ti.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13986-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 1E6D9356EC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 28/03/2026 at 16:55:48 +01, Linus Walleij <linusw@kernel.org> wrote:

> The callbacks into the MIPS RB532 platform to read the GPIO pin
> indicating that the NAND chip is ready are oldschool and does
> not assign GPIOs as properties to the NAND device.
>
> Add a capability to the generic platform NAND chip driver to use
> a GPIO line to detect if a NAND chip is ready and override the
> platform-local drv_ready() callback with this check if the GPIO
> is present.
>
> This makes it possible to drop the legacy include header
> <linux/gpio.h> from the RB532 devices.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/mips/rb532/devices.c        | 36 +++++++++++++++++++++-------------=
--
>  drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++++++-

Fine by me for the MTD bits!

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

