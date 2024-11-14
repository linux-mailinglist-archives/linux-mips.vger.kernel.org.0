Return-Path: <linux-mips+bounces-6749-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FF19C959C
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 00:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 386C3284A0F
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 23:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105FD1B2192;
	Thu, 14 Nov 2024 23:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hG2RVamy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584C1B2188;
	Thu, 14 Nov 2024 23:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625215; cv=none; b=hS5mO5IoyixiosjKyd/fwR3C0YBIWU0nAaTeMxXjoo2P7qF+qrDPu1B07ixUni21JjtdxA+R6GP3hgCPR6QX56DVO8ICytCC51Hr1P5Navwz4drTXADKvVe9q/CuHYajVW58eOoEiycnGPJkBcCCUQxw51Rs7C+SPUXEoj0+TRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625215; c=relaxed/simple;
	bh=vBwaQE/axNQ0gVAs9UWakzm4zMXZvEVh5w0PKKn2SFM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=pq3jc7R1GFXy88TN6zc+hmaBnzL3TmDRbmIG5PtRrUYEucwFOyLlN30kJ0Icn0Y6X65WPThT2JG7q57gGrdvQWcT3uah1yLniMAB0eJb7xpANDFKaj30Mi0j/eEO/ykuFtvu5ToiOWR5DEKQ54l4gJuXaDb902MpXBIOQpWY/tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hG2RVamy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F507C4CECD;
	Thu, 14 Nov 2024 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731625213;
	bh=vBwaQE/axNQ0gVAs9UWakzm4zMXZvEVh5w0PKKn2SFM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hG2RVamyiw7I/WGCJXFkOIEm/9uRK/S7OAzNuZP2pbQuBJvtf/DDXgmc236yO54wN
	 v80obG59RxLdUmZHMlSjDZhEYZAPxHfMRLkus/US1RWl3ZS7PWhrEBbo89TGwWe32R
	 Wtu6pLiQCF2ryhDdj79D2s/eS9RQY6Q6oVQ14ytPBm7gwcp81INl92i818FysW5vhO
	 xfXjm/8AOyWwBSOSS/rwHH6aS2Fvqb+Ja7JSKSne+3RJGyfNb34aV26vK7134KMCCI
	 +S6vaGkzgc3GF4vr+aZpWIgGEmq7dSMiD/zSFEjF5nWFzKm4hNcCzsr5HnH2quSyTE
	 pTFi4rBuoo0kA==
Message-ID: <031c82c881e3da8894fdb452da8cb9e6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106-mbly-clk-v2-6-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com> <20241106-mbly-clk-v2-6-84cfefb3f485@bootlin.com>
Subject: Re: [PATCH v2 06/10] clk: eyeq: add EyeQ5 fixed factor clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 14 Nov 2024 15:00:11 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Th=C3=A9o Lebrun (2024-11-06 08:03:57)
> Expose additional clocks on EyeQ5. Some indexes come from dt-bindings
> headers, others are private to the driver.
>=20
> Few clocks are early (of_clk_init() stage: core clocks and UART clock),
> others can wait until platform device probe. The source for this list
> is downstream Mobileye kernel and some internal documentation.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-next

