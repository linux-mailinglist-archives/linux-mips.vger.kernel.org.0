Return-Path: <linux-mips+bounces-5161-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD82962E11
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 19:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 888781F2538B
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 17:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A921A705E;
	Wed, 28 Aug 2024 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2pFooLv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F11A4F3F;
	Wed, 28 Aug 2024 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724864458; cv=none; b=jN7j2530XrIWfLYiPMVLVrQNNITfWjSQ1HyNhITOkGXAjLLEQN3llIJ1tQg2+cbXZJl60d/tMi9iy480vr2FfNHIYN+W5XgJARCQNjAglxEBg5582VzhGlufkkFFyHaiQRGTTlxQY9i4rdbKWCa7YySuHflXDXVD7EjFItpwt+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724864458; c=relaxed/simple;
	bh=nO77iIxdd02hF4E9tDlYoiBUA4JWXzvnnSS2wI9f4nM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=KwkRk3zRpu2Cbx0n+1yQliIV0F0EJq9QXj2r0ZgfLZzuj5n/bS8LrCtA8kuKm8YPt0B/fFdqjtMgyGkqDzx0asJS0R6WeBUDeQ1OduNqqxSJXRWCCU17/DZMbFAN6e3Uv/5/bYkiaoDCm64Lm18+eA0tgqSKEs1ldFZc1FS4Jdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2pFooLv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F139C4CEDF;
	Wed, 28 Aug 2024 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724864458;
	bh=nO77iIxdd02hF4E9tDlYoiBUA4JWXzvnnSS2wI9f4nM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Y2pFooLvVPPXz7nwZb9jTgXWJXi4uakj20PF+IsgktZrUaYmwdNonK2MITKW6/AK/
	 JRvrTGK5Ipp+arPZ3vrHUcofKC9OvgwLKZBrZkwzgbC1Fcyht0la272dQ9LBcNSFcs
	 nwplEI79ohQAgmHL4UnWcP6Wt28PwBJWYLQY/cwa0fA0wA0tElS8DduKeYMcRQ+Nq6
	 BvXSTJ1qzMKF2p30B36r/DS2TWVjErIV7S35mV3OmPFTzMPzUI4drzQ1p8Ce4X+2Yx
	 br9FV+UDA3MEITIXsWibgtc3/6izu2b6WenBwkhenAvg16xOgp9XzW85BrNN3tK7Co
	 N4PZ0JDpTU88A==
Message-ID: <83b3274296b7d9353aff4caf618ee042.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240818173014.122073-5-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org> <20240818173014.122073-5-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 5/5] dt-bindings: clock: st,stm32mp1-rcc: add top-level constraints
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Conor Dooley <conor+dt@kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Rob Herring <robh@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Date: Wed, 28 Aug 2024 10:00:56 -0700
User-Agent: alot/0.10

Quoting Krzysztof Kozlowski (2024-08-18 10:30:14)
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next

