Return-Path: <linux-mips+bounces-3664-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8031907567
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 16:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02BA31C217F3
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 14:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1179146D41;
	Thu, 13 Jun 2024 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjtuT8Xc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C22145B3F;
	Thu, 13 Jun 2024 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718289596; cv=none; b=mCA2/8N97eYZIxiL1YJe4Peeu+Td4+OD/T54cZDlzyCIRp0iCwyllSBEu+6a4PUZYD7JUx7ZNKuVdU8NheOnU2cKp0Dg/UbOhWPrL6l9SCfruZoYeF/DgB9MzNWovmBYN2jjqDuNPx/vOM72JGy+uWjOBWNorzv84X7zRHB1cWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718289596; c=relaxed/simple;
	bh=E524rcct08hz6YUrxdb412RbfB6vmLjWaw3BPmGgUfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BVl3rb92G6EPGYEV2LyP5z5Gq9vCTZgM5y/7k/vL8JXY7aEkw/RQe7cJMIJ6jYdD0+++uol5FHxoX+8hhnTXP79B2j8SnoGGzpCdOxkW3Psc9LScX1NSxOTkR+DtIff3mV1Q/AM6g1J0KQFuBotikGeJ+WZ3lu4RxCKABlCL71I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjtuT8Xc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEF3C4AF4D;
	Thu, 13 Jun 2024 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289596;
	bh=E524rcct08hz6YUrxdb412RbfB6vmLjWaw3BPmGgUfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gjtuT8Xcz/yiy2MnxocB2sxoQHKjoPmW/zo//t0zNiZ+atwsq4a2odwxj4K7QUeQb
	 vdpYwo14D0+Ce4fUCqAcZvmhVEfH9PydKjeIUCEF7Q5GKw9OtQksS0ws/NFGcbHphy
	 PVyJy+/GPCawa9QHsAbfigFDO3HHS+svFzcF3jun5/nF9e5kGjF4W1Fl+iNXrUeyng
	 ceMx3dcAlRNqOfHpnC1/xPlXUVoLj1Lu0ID0iWuxhy2dhlYY3Upi7kfr8BJHLwKVkr
	 D/fNVBbQBi20BKi5EstWse2QH0jQ6TXFLl+bM5Tp5OEQHXr0ip9mq98L3Y3QqId/Xz
	 KoIFCWN5jlnJA==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Yisen Zhuang <yisen.zhuang@huawei.com>, 
 Salil Mehta <salil.mehta@huawei.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240603131230.136196-2-robh@kernel.org>
References: <20240603131230.136196-2-robh@kernel.org>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: syscon: Add more simple
 compatibles
Message-Id: <171828959006.2643902.8308227314531523435.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 15:39:50 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 03 Jun 2024 08:12:27 -0500, Rob Herring (Arm) wrote:
> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: syscon: Add more simple compatibles
      commit: 234db2775b9eff77b8ec2216cc8a286d1dd2cd65

--
Lee Jones [李琼斯]


