Return-Path: <linux-mips+bounces-14387-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJrOHIN/8Wk2hQEAu9opvQ
	(envelope-from <linux-mips+bounces-14387-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 05:48:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547748EC1A
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 05:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B38D301A748
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 03:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3553938F253;
	Wed, 29 Apr 2026 03:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNVm7WTB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F7938F235;
	Wed, 29 Apr 2026 03:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434419; cv=none; b=G4eygRLKKUtg6I/NOLaRu1tyWHvjdoLCIFtj879GpoAUrlduD+Dn3cbf85QwIXNxqADxKVXHdxivLsxrPHzP3o/m8NPlNYG1eupRyUhSqpaSo6mW4DytcRuwl1nNCJSdug9YhsY/IijTIxDlcyfoBoZe0y5m/yu61//5cffSjQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434419; c=relaxed/simple;
	bh=/MEa2Fq2BTYER4OXlPjCrO9/O5Ew6iOB5RCGtNlKWcE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=utDJ905O2763noFbq5UwM1P9r67bkNW2TYZ/X0pz1Nq/SjI9Kj9jLP+LUM3dkeArsI7/ybRfx+bZVdVBbsEHew9FF1KsFZ3nzeldSeuJKpgSAOOomMGty09KC1OPR3J1GV7z4KJvXje7KYr16pFuUvcUAEJW6LiP2v4xQV+tazM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNVm7WTB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8F9C2BCB4;
	Wed, 29 Apr 2026 03:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434418;
	bh=/MEa2Fq2BTYER4OXlPjCrO9/O5Ew6iOB5RCGtNlKWcE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aNVm7WTB7e7SzAk10BZaFoD/ajSUxoQqIpS29VvLOv96dhn2Z9aqj1HtOOjfj7uQ/
	 X9LpKHpFmif1daqh926lk3zHtOonIyEU2fAAd+wBcwYbkOym4tPU3jUIB9Mdr9qOcK
	 09YYqw5fCfZJSdMdVgsKajmBOTsDrTHhX22yzSaiA7VeCTjjd0vGUTCu7M6gjUL50x
	 gsLIg3XngSO/S76dTqk+IO15kswblakumIGF7JYr6xv9yf2si0OzrwHo72C4wNgzan
	 WJB13VLsrCaAu9RD1H+IKUcMLKrCkyNyx5G6Cr6ydjsmg388OuElynCbPd5ROl/+Is
	 71selElWnjidQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260225-macb-phy-v7-3-665bd8619d51@bootlin.com>
References: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com> <20260225-macb-phy-v7-3-665bd8619d51@bootlin.com>
Subject: Re: [PATCH v7 3/3] reset: eyeq: drop device_set_of_node_from_dev() done by parent
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Date: Tue, 28 Apr 2026 19:04:08 -0700
Message-ID: <177742824867.5403.11815560359227140766@localhost.localdomain>
User-Agent: alot/0.12
X-Rspamd-Queue-Id: 2547748EC1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14387-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,localhost.localdomain:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:email,pengutronix.de:email]

Quoting Th=C3=A9o Lebrun (2026-02-25 08:55:07)
> Our parent driver (clk-eyeq) now does the
>         device_set_of_node_from_dev(dev, dev->parent)
> call through the newly introduced devm_auxiliary_device_create() helper.
>=20
> Doing it again in the reset-eyeq probe would be redundant.
> Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
> Also fix the following comment that talks about "our newfound OF node".
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-fixes

