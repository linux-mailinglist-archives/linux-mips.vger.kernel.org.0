Return-Path: <linux-mips+bounces-6750-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F309C95A3
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 00:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E666F1F21236
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 23:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85FD1B21B9;
	Thu, 14 Nov 2024 23:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAC1+ySv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872061AD418;
	Thu, 14 Nov 2024 23:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625221; cv=none; b=vA0WTJY3k5S3Nyqzj/MZfkqj0Koztb0ot4Kp0gxyOfCfEXGhnTMacwRE7CI68EH2s683BgN/8g6aoEkoTgAzm1xFHv9g9HowpKbTb6ri1+MbIdfz79tnskqXKv4q1DyxqaFKE+3L6QZDoFIdiO+vFOsEUyX9yF+VKrxGNVBeuvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625221; c=relaxed/simple;
	bh=eEEJRBEJEyj3BHGjsrsWEFXHtJcBIppwsfMH6wmhmn0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=FmFA9T/AEdwVEdVbqg2iH14TylBGatoFiq88bmexAeahyqM2udhcBz01V2WhGSiN8iZNOpFcJVbPq6GfMAONi/maGxzjOk37iZL1SqD0IQ1yGBO7yh3/gTObhcZmZrWGFuTuL1AZlpghlVHiWtxKpfJWKRSWgiQODTPqL48XS1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAC1+ySv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB7CC4CECD;
	Thu, 14 Nov 2024 23:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731625221;
	bh=eEEJRBEJEyj3BHGjsrsWEFXHtJcBIppwsfMH6wmhmn0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VAC1+ySvMBMUTCo5Ta8UFfHwzLLi4coDM9w9siYH7TUrQGfyGJziPwH74ZlFqDKCh
	 nr/fDHdDypAZrwIOWs2L9+AKd46ni678QM8tTAtPGO4j8cyvg6Kv5lYm8OaPiAw0v4
	 cJZ1ZbwLFjs+zSjRyObJIkcQKQC2eSvgKv4NC8FOkh+uyoU/M/D7L/DMqeBZikTbcb
	 Uh52OmCINIemmez4D8ovqrfZc/9OO2dEkbfUwtEyU5r7bopLkYUmwFc7/oylhC9MRO
	 2snCXwsLubM0f3A+IP2I1S2+5OVTYZj8IaAVvtzlNpfLxumWz7MqUoYwjF4NeQEH5K
	 F6+9wUrfCGcaw==
Message-ID: <7d32e8110f6a21c39553f507cdc6389a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106-mbly-clk-v2-7-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com> <20241106-mbly-clk-v2-7-84cfefb3f485@bootlin.com>
Subject: Re: [PATCH v2 07/10] clk: eyeq: add EyeQ6H central fixed factor clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 14 Nov 2024 15:00:18 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Th=C3=A9o Lebrun (2024-11-06 08:03:58)
> Previous setup was:
>  - pll-cpu clock registered from driver at of_clk_init();
>  - occ-cpu clock registered from DT using fixed-factor-clock compatible.
>=20
> Now that drivers/clk/clk-eyeq.c supports registering fixed factors, use
> that capability to register occ-cpu.
>=20
> Also switch from hard-coded index 0 for pll-cpu to using the
> EQ6HC_CENTRAL_PLL_CPU constant by exposed dt-bindings headers.
>=20
> occ-cpu is exposed at of_clk_init() because it gets used by both the DT
> CPU nodes and the GIC timer.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-next

