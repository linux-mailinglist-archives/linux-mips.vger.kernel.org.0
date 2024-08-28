Return-Path: <linux-mips+bounces-5159-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E3A962E00
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 19:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AFA21C23D60
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 17:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1751A4F31;
	Wed, 28 Aug 2024 17:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXJ/6JlS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C3C1A3BD0;
	Wed, 28 Aug 2024 17:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724864419; cv=none; b=TNMVlt1vnk88yxAfxEP4A62GPXgKhgWH8zGCwTGwC8qPCsVuArnRSImn4yWsbQfSifSWuUZ8b8LI5EJYgDePPFbGOYZcE87d2u82Ot6qgFAbk9sgVXWVnMuGdEpj2w7JqTPOFFzOxwUGMh4BGcSdpFc4XoR2T7UyeXHHeYeuefI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724864419; c=relaxed/simple;
	bh=wvcCw/u2DHmQjZ+lBFZsEG5m3ALmQ5p1JIzRH0qd2OY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mkEsVGt9lyKuTznPYoNbpgAcWp7DemyWScCEhG9lLJsJ2C43RszUmHihzBYX4pYCa8PedInci4LJSdDlWHscNzY1ogJtyY/OdDd1IBXJNk4TgfkeTj3PXtGscLy4AGMP2Id2hIwzru3eso5Hm3fvQ5eoQWFqC7Q9+nBt8HjzZ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXJ/6JlS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B98C4CEDA;
	Wed, 28 Aug 2024 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724864418;
	bh=wvcCw/u2DHmQjZ+lBFZsEG5m3ALmQ5p1JIzRH0qd2OY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YXJ/6JlS49eKre5/7JLOUjrfR2hvDTzcLLYUdHxEG51KRx369KPbzsP27VUzIVKuy
	 CUJf5q3YAe7O3XIDhuew9We81iY6C0xrfPGCz8ZDDu9qzBO3ZHopPQxVgzsZk5OpK4
	 DPD5SU22ZUuXmXbREb85PpvPY/b0G1fv664vdzHu9NatA18kmK+YyblqSpod2PjNYu
	 NnzirXjAtxU7e7bUoxYb5Uxe3jVDf2QKYnSgswYULp2UkiWZZb+5pciHzrz/goGi4E
	 lyPvgQhF7OiIG/H9SrHl5NtWRdxRLP2Melm25mxupRtN+26v4szyx2l/M8lYQaLd7j
	 uMxMk2BZvtBtw==
Message-ID: <4a441f73cea283e694465d5a7c4bef6d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: clock: baikal,bt1-ccu-div: add top-level constraints
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Conor Dooley <conor+dt@kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Rob Herring <robh@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Date: Wed, 28 Aug 2024 10:00:16 -0700
User-Agent: alot/0.10

Quoting Krzysztof Kozlowski (2024-08-18 10:30:10)
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next

