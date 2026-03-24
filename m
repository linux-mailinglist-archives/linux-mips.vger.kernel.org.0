Return-Path: <linux-mips+bounces-13898-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMJ4EtzbwWmJXQQAu9opvQ
	(envelope-from <linux-mips+bounces-13898-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 01:33:32 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 799B82FFBA5
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 01:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCABE30A1BE4
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 00:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2584E23EAAF;
	Tue, 24 Mar 2026 00:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RazGUv0c"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01634239567;
	Tue, 24 Mar 2026 00:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312013; cv=none; b=tPCxDuO3bFz4t0t+wE1svxa7nwqNE+doWHDt+nKTiMK06oPd06zOag9+OpaJ9cBzE92lT7bFSpSZxBdsTQTK6LSbmNbzPE3DUK1y4oacEkJOAVHl+kPl+hevuv7K09gGAwpmhFZ9hMrOK9SaYdDIo/Fo74832UW1j1Jav96yvz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312013; c=relaxed/simple;
	bh=8EFnLqCqldebP/JoEw0wlX/bJCFtGDCVA4vtG7xZAYs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=KET7ovzUcOp+qmfHFzGL+fH59NZmRp0wm4CMuNRIzepsITwux1NdjdB5rZi5PXuUh/mq8x03UNThO0QLz9AcEPDAhhXGUZ6IFEklCeV4irCUYPBTSvEcEOttMJnYW5XyqOu6I2k3ERlH6Aldv/H5kyiMNMqYzIKW95j8TChb4+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RazGUv0c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C563C4CEF7;
	Tue, 24 Mar 2026 00:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774312012;
	bh=8EFnLqCqldebP/JoEw0wlX/bJCFtGDCVA4vtG7xZAYs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RazGUv0cLXxv/zFNz3/E0zSSIJ9xUOl02zY2nShH5xJ6SoCI+EcCsVBn/LHhOJbud
	 vJfGf8MPSHOvonhQnn7rZFsd8kUyHR3EaPy4RwWCfA8SpQ7YAPn5P/JwBSKCOKXKSM
	 Fvu+7S3C0mtKNS+9drwNky9H4vzT9rTJ54u/uqYgnUYJIIvHwhdwq2lOp21Mz8287u
	 fjEtZlS+VJt3J7ylwN37Jb7yx8cKZ6srOJZ9T/8Ula2iIKKQwnNdTHSVQnbGpNnage
	 0iFRECrdzywtHHi4jsWVW/uK/3C4x216xXOEnARamo2aD1x8nqRjILbzK9399Ytlx+
	 8yzFb2IkhPxCQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260316-eyeq6lplus-v4-2-bf44dfc7a261@bootlin.com>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com> <20260316-eyeq6lplus-v4-2-bf44dfc7a261@bootlin.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Mar 2026 17:26:48 -0700
Message-ID: <177431200897.5403.17257813032469546685@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13898-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email]
X-Rspamd-Queue-Id: 799B82FFBA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Beno=C3=AEt Monin (2026-03-16 08:25:39)
> The "Other Logic Block" found in the EyeQ6Lplus from Mobileye provides
> various functions for the controllers present in the SoC.
>=20
> The OLB produces 22 clocks derived from its input, which is connected
> to the main oscillator of the SoC.
>=20
> It provides reset signals via two reset domains.
>=20
> It also controls 32 pins to be either a GPIO or an alternate function.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

