Return-Path: <linux-mips+bounces-5160-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A941F962E08
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 19:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E7DAB22630
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 17:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DFA1A3BD0;
	Wed, 28 Aug 2024 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAMo9qGD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005AD13D612;
	Wed, 28 Aug 2024 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724864429; cv=none; b=Yfk0RjR5KNNoeUJ4KEfTWrXQo0/nx+cRSL28X4919v1kKe33TmEyJgFcN88w5cqRjMmzDSahrBvzGibfIEe/CNnLnlW31RqQ+/7rcUktLQ4zpuf6b1PYHNJh0Hn77iJqyU0ZW53OBHvZ4yoqAvyW382RCyVD50GioWaE2Rlo35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724864429; c=relaxed/simple;
	bh=b1/yAhL78h8Qexpk6AQkwIxD117TkTuBxuGjc8ZTs/Y=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=K3CuJWoudsowxW1p/iZduljCP5mPbA8POSIPB+lL6ZUTjvbPw9UzDCL6eOzbwwyZYj+4YT69rW4gZDk4w9hcRp4FqcmQLT3oI6pEGqdv0S0NHE7A7FDSuE/IRRLccCbYiwHaK4t/tfL9MKDWXBqEfpHitYFRtlumokgVl9D5PU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAMo9qGD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C841C4CEC7;
	Wed, 28 Aug 2024 17:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724864428;
	bh=b1/yAhL78h8Qexpk6AQkwIxD117TkTuBxuGjc8ZTs/Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MAMo9qGDvfnno5VtsBng//64g+l74YvpodpqJGZfDDIkAN9UbL7DXkLOPUd6WLk47
	 kwoIMFMX1DQFeDFx5GDZ5795kaBNBZLa+80uJA74DMJPKgKkaVkfBKm+8aiobQjUIt
	 hGWsOCvVSt2vGEkfDBGOItgkWNhY0xl+pkZWo2b5f3tFr2hjuRhCHmVxZeR5iQNhne
	 9+S2QZdRfOg3EusSBVjLXf0mkwo+op0Iz/AE0gRtpWpNUqJ9DpeSiuGeaut8t5wntJ
	 ZC3oQrY3d9pK51sIYoVjt+kW2KV1ELvNu0ef/vARgcqLWrDm36gBg53IbM+loYjket
	 P/smIQcPZxcqg==
Message-ID: <af8009dd5ff762cbefe6453d85d07d2e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240818173014.122073-2-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org> <20240818173014.122073-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/5] dt-bindings: clock: cirrus,lochnagar: add top-level constraints
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Conor Dooley <conor+dt@kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Rob Herring <robh@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Date: Wed, 28 Aug 2024 10:00:26 -0700
User-Agent: alot/0.10

Quoting Krzysztof Kozlowski (2024-08-18 10:30:11)
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks.  Drop also redundant assigned-clocks properties, because
> core dtschema allows them if clocks are provided.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next

