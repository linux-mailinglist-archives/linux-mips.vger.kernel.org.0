Return-Path: <linux-mips+bounces-14386-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHmkONt/8Wk2hQEAu9opvQ
	(envelope-from <linux-mips+bounces-14386-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 05:49:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77448ECBC
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 05:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 368A7307D132
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 03:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D6538D686;
	Wed, 29 Apr 2026 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yrw6xGKJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E461A38D018;
	Wed, 29 Apr 2026 03:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434417; cv=none; b=idEtYP6d8+KeKjxkyVbzTr+8u59kIR35hK9c3eC8JDjk5nRtFOYEELlLfy5cfQy++zHApMlr3577JOnYJTjdO1RXdYog2LI2/MrnCzdvvyRdDCL+vSnwGW19FdVia3SJ3HjnSl7ICNjSWH8SZmRsNcFDSZHAT12RB8kK1aQ2414=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434417; c=relaxed/simple;
	bh=3FK+ZIcXR0O+flZ3oKr9lpHuO/MLpwIZsKcY1taj5/s=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fMyXu317QcExtaSNQJA9FQq77HQjZID+YUM3yCN3UTgHuvqRpnvmTFeXlYpVueqIw3fNrJfmdFwYnGofkgIp3UlHgnk7H/PdcLnIXw6IpIfBxT3PaAU+rUELCB+HjUNJ6Np6aMJJVqnQVu0qsmBwqmqS+dMaSEkrfgz85HY84no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yrw6xGKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC92FC19425;
	Wed, 29 Apr 2026 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434416;
	bh=3FK+ZIcXR0O+flZ3oKr9lpHuO/MLpwIZsKcY1taj5/s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Yrw6xGKJRj53rvgkgUVauieGEWUrRMluiYUK4Es7W04L0ftDtCPqXuSZ9sJV/lP30
	 z2PzOBhlNix3mHT7qSR8dtX/YkSnNMOEqQHuBSwqX3dYHyWitDxIjUKkBbOciWJsHB
	 GFXydQcU6b9SMtlc9RVIkgQmbN1JPg29AT2fB3h/PkM69+T3JBpPKMtKxjhyxLjJSE
	 JykZbWuQPX72Q5BjXZ60NMJacfPfXteu6in5QH3N+/AVXuyYHY4zc6Fc9kwjsAqbBW
	 pDYAF6qsW/2l8R6zDQ0nIvlgi3Hf8KDjrZAj11SC35QBAGhIxxtH+bMUIU/XpOsjKp
	 A3Q5uN4sYYF/A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260225-macb-phy-v7-2-665bd8619d51@bootlin.com>
References: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com> <20260225-macb-phy-v7-2-665bd8619d51@bootlin.com>
Subject: Re: [PATCH v7 2/3] clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Date: Tue, 28 Apr 2026 19:04:04 -0700
Message-ID: <177742824404.5403.17850198266857901522@localhost.localdomain>
User-Agent: alot/0.12
X-Rspamd-Queue-Id: 7F77448ECBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14386-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,localhost.localdomain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Quoting Th=C3=A9o Lebrun (2026-02-25 08:55:06)
> Grow our clk-eyeq family; it knows how to spawn reset provider and pin
> controller children. Expand with a generic PHY driver on EyeQ5.
>=20
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-fixes

