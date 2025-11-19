Return-Path: <linux-mips+bounces-12309-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB33C7092F
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 19:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 801EC2D591
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 18:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E3B365A09;
	Wed, 19 Nov 2025 18:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKbOQFww"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA23830ACEE;
	Wed, 19 Nov 2025 18:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763575629; cv=none; b=s06fjS5IGAahMbSjbPdNo+cvlBNZbTyQT0BaUcTV8TwAJ4E8NSv4+MXipVFT/pVpLCjl4584a0Ai4Ml0aFz+aRjl8XbMDahYrCHfUtnvzlDMHULuq3HScisKSFU/DwY3pOv8FaycJhHr2ZK77BI4RZVWMcTrkYrxFpLuD3vuJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763575629; c=relaxed/simple;
	bh=4d5rcTTQrqxAwHFaEaXz/InkRKSrlbPARDoNksmiCEg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=KvXEJA4gUR8FWhRH3hiNN2/8vNj3Zpt000Ndod34wtZCdTEtWPR4n0VIZNV/2YL5h+N2Mi5OVP8B62ZmOOL4QrCel85NiNUQ3zyVWwYQNUDW4o7gKOLQItX8ns7yL4+1rAI1AE23doXY061U0bknYfNcNWbrMirNBPEEX3+nRek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKbOQFww; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A69EC4CEF5;
	Wed, 19 Nov 2025 18:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763575626;
	bh=4d5rcTTQrqxAwHFaEaXz/InkRKSrlbPARDoNksmiCEg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pKbOQFwwmhYoWDKR/2FuVI6VMRMd2zKEVIsN/acQhKxl93XDSD8FvrTjPG6ihhTIy
	 guT6Ut5ihv5Fhtcy9iUQK4WG2TSkhRNhyV1NjhouV8/GS0LJ11Zr9rOueb2PWiwm28
	 pncSlYGs7R4Jr/X5Vy6cBOxI4ApYpSPkiY0ypF529Pevez9JJtjHhFXUg1+XG/ny9T
	 bzU6ZwsCslyUwjbQ5QE3y4rNMifQH0uySdwkIZYSkY5Pesl4tagnEkDk7YzAMIOsS5
	 OTDalcGxrUW/2FL4Zy/dKaCJomPx/UdfRuQDDpXoYv55z7uhQwIrHRWzT2BCbjn4aL
	 2z+Si8wQvktwA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251119-macb-phy-v3-3-e9a7be186a33@bootlin.com>
References: <20251119-macb-phy-v3-0-e9a7be186a33@bootlin.com> <20251119-macb-phy-v3-3-e9a7be186a33@bootlin.com>
Subject: Re: [PATCH v3 3/7] clk: eyeq: use the auxiliary device creation helper
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vinod Koul <vkoul@kernel.org>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Wed, 19 Nov 2025 10:07:04 -0800
Message-ID: <176357562473.11952.15433192921239262065@lazor>
User-Agent: alot/0.11

Quoting Th=C3=A9o Lebrun (2025-11-19 07:51:11)
> From: Jerome Brunet <jbrunet@baylibre.com>
>=20
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>=20
> Use it and remove some boilerplate code.
>=20
> Tested-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>  # On Mobileye EyeQ5
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

You need to add your SoB here.

