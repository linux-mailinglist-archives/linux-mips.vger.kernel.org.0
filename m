Return-Path: <linux-mips+bounces-6748-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFCC9C9598
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 00:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A9A281653
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 23:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728101B3922;
	Thu, 14 Nov 2024 23:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0Nw2xlZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41548374CC;
	Thu, 14 Nov 2024 23:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625206; cv=none; b=nM9VK95ALOQS6ax1D+QsbRc2l8OfL6ySzyuEJeWH9eXniPR/5purDMxL5ZS5I32XtX40le+Bx5x0sHsjGnVBPT2jtIeKpQ/GakMAFoIBYdBdKaqierYKh+jaE6nrCXLxSCaq86eBhrkZdPnAt2RKmzkGAfVpq/Q1mw2C/wXOEKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625206; c=relaxed/simple;
	bh=qvi5lynApf4D6gfDRYuaPUgZaPlbusqUnSTNwUSiffo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Jvg4kpr0cbSR6JqGGCkhN0PT+OS9aN4S4Ibmy6lwaA8YQUNtUf3q7NFTWxJPVVLwfPozMTZRlG3isLk/nEBKiqigo+TKsHBsxVl6y5LQxRwj0tuRWDY3ATuHLLBQRGcOgeTocew9nzgETzukWQxa68bXzUBEL8V9LfGs/cBZrRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0Nw2xlZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4730C4CECD;
	Thu, 14 Nov 2024 23:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731625205;
	bh=qvi5lynApf4D6gfDRYuaPUgZaPlbusqUnSTNwUSiffo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h0Nw2xlZY7RvYw8ioMBTuGNAPTcpqN9ucSeg1rJ9n9HuLusKp4iAFIWbdUDCcR7AF
	 wsn+CJwD6Jckk2jHbrLoHVbw9blNCNUYbURtUdUOI1lp2IGpu6em8aj4aeHoiveaA/
	 8cMBmcr4mkbQIgJzMU9ElMqC5SM0jODDJKrSIhJPAMkUrRuJf1RlFmoAZhYb7pd+iv
	 zNxdPbMnQaAHE6Kk6NUY53q0Tt7FkX4hbTJ/WaayXkl7FzEUF+FdwNkZWXgTijdVzJ
	 WL7G3ZnOOVOlHKsRVHjN+OrdvvwkhX3usYY62LdLSYU7I4fUih4lF+DHw2i7HGvqtE
	 +Q+yf7AksXMGw==
Message-ID: <60283626a078dde6f56963f5cc763c0d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106-mbly-clk-v2-5-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com> <20241106-mbly-clk-v2-5-84cfefb3f485@bootlin.com>
Subject: Re: [PATCH v2 05/10] clk: eyeq: add fixed factor clocks infrastructure
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 14 Nov 2024 15:00:03 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Th=C3=A9o Lebrun (2024-11-06 08:03:56)
> Driver can currently host two types of clocks:
>  - PLLs derived directly from the main crystal (taken using a fwhandle).
>  - Divider clocks derived from those PLLs.
>=20
> PLLs can be instantiated from of_clk_init() or platform device probe,
> using two separate clock providers. Divider clocks are all instantiated
> at platform device probe.
>=20
> Add a third type of clocks: fixed factors. Those can be instantiated at
> both stages. They can be parented to any clock from the driver. Early
> match data and match data store the list of fixed factor clocks.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-next

