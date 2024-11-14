Return-Path: <linux-mips+bounces-6747-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D49C9C9593
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 00:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9FF6B21D27
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 23:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB091B0F3C;
	Thu, 14 Nov 2024 22:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiLHIu13"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A97E1AC45F;
	Thu, 14 Nov 2024 22:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625198; cv=none; b=TkYxyKeSpmey2e6W83kZCQnBrsJYLDGSAqclJlPP7T1X1z+d6bD2CRHBvPJMRLQH/fxTm/vX775IIVW5R2S47Fx/XEVrZ5Gd6awEfUjshF8RFDG6Vx8MFSBp8xgkOiRxWt60+pqa5jIIr8yuXKEAzGSBJjzowfkxe97ov2ZvL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625198; c=relaxed/simple;
	bh=nk92cHKNH/3B3IX8HoL/R3feqB7rIV38g6kfgeMYhRs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=B0xLPWg4a5FF/wg8N4uyExM3omGuRue7VR7tiWyyFJ8OvR4FUoQKWEmZpRetRBjWh29uzVdyPVMdeSFEACyPwvnm36AjRcHfKov8eAOepzmkSDBQI6PzKhnkqQpnFF75Y6XL20p2VPMrsnhHKfkvskzfjio/6BCykO90BLxY5Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiLHIu13; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78A2C4CECD;
	Thu, 14 Nov 2024 22:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731625198;
	bh=nk92cHKNH/3B3IX8HoL/R3feqB7rIV38g6kfgeMYhRs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IiLHIu13+2E8gZ0PwPGXCFTv2ADNTl0AxkmUKFGTVsXYIUv+B4waM0uuBvfbCogs/
	 shNQDaMns9yk8Gqq+VjRPuqdvcfEBF3fQUbarJzah2aP8P54dWPYW74zN8vdWGaM8z
	 kgRbLaP+TTHE8qYQx1n1bNZxOYW3xvzQJoKkvLT3VVejHc1Fouyk7vq2JTCEEL88dN
	 wqEpiyKwhJwMt58nElEtDxoYBCjsJGKbuK2vJ8Oh+NlHZ5DKqtMyk80FqNJXOy3jYS
	 0u2hV46oTFrHnc26u6kJmR97JFtLfoCV31DlXLfbXAp/s1WsFI4NUiDYSf0Mj5ew6a
	 tcN25QZgE9Ozg==
Message-ID: <2cc80bf42d4d7862a1f91d3e84e07b38.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106-mbly-clk-v2-4-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com> <20241106-mbly-clk-v2-4-84cfefb3f485@bootlin.com>
Subject: Re: [PATCH v2 04/10] clk: eyeq: require clock index with phandle in all cases
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 14 Nov 2024 14:59:56 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Th=C3=A9o Lebrun (2024-11-06 08:03:55)
> We used to let compatibles with a single clock exposed to not have
> a cell. Switch away from that and enforce a cell in all cases.
>=20
> This is done at the same time as some compatibles
> (mobileye,eyeq6h-{central,west}-olb) go from one to more clocks
> exposed. Let's do the same switch and avoid future devicetree
> work if/when others follow.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-next

