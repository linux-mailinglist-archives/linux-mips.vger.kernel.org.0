Return-Path: <linux-mips+bounces-3199-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9468C2B06
	for <lists+linux-mips@lfdr.de>; Fri, 10 May 2024 22:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D30E1C22668
	for <lists+linux-mips@lfdr.de>; Fri, 10 May 2024 20:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C514D9F2;
	Fri, 10 May 2024 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eq3rLu84"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C77567D;
	Fri, 10 May 2024 20:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715372163; cv=none; b=lo5eYCzoi/yWSxdE5FhrlCAbNDWeJnA4idtTOHQX/PHX1jszcvR3C6Kx4kNCRygqSrkM1ZdijIsYyCRgjBzEFR1Udrlh1AzrzE5Sfksgz5xx6h/WEkMiOlsugU9JRD5ZQN0m/iEnXfBgtHFYKyMJZ+zGO0pH59LwtTYsDH4A3PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715372163; c=relaxed/simple;
	bh=pmQ9AQITJFZy+youh/0jj+z+qY75g9ys3kkz/LOAbwo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=iPaudrB2+7c5f8tLTCvof0ZxX1OFxqzXwjXHYPtUqLsyw5ZxY0iUno1u7MoTrgf9rCcHfMBA+wVygqW7jF10jGPlvLF5mUsat5kxHU6CHLs1x0jS9MUsxOkyQwQ4ZJUbCd25XA+h8Z0xT5bPZeNESUPLSNSV6VWYBW6QXWZY1Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eq3rLu84; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F648C113CC;
	Fri, 10 May 2024 20:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715372162;
	bh=pmQ9AQITJFZy+youh/0jj+z+qY75g9ys3kkz/LOAbwo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eq3rLu842lVFGjL//lACe/xYhdPHq7+5jm7/PIJyXOvBAhxNq1hQatlizQKAcrHbe
	 e/vEDsQZTCS/ZmxHhuTtCMzeNq79kJGrvFaTD+gRETEoufZVFr08eE9EfVestsNmcN
	 pF7shYpzPmHWAwgbLxc5ljRjOYRkx3FMfs4z/O4cMxHRWvDeT/s/mUvbTW1Bpze/5W
	 d3cYj8uwV3aLkeZrSbJOM8OkAYgmLD6mxnLbTcvY6/QSpTeFSoRW1PnSB36SwLPkTC
	 7b0Rf5HhPkPZMTsvEcCQ80Tg/FpL5PQSAQoSYqZ+iku9NbXqOOcRk89jVzxpF+DlbY
	 0S9lyaZBIk4Iw==
Message-ID: <d7ce7ea6b13f2da8e07a345365d8f2b3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
References: <20240510123018.3902184-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor+dt@kernel.org>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Gregory Clement <gregory.clement@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Paolo Abeni <pabeni@redhat.com>, Richard Weinberger <richard@nod.at>, Rob Herring (Arm) <robh@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, UNGLinuxDriver@microchip.com, Vignesh Raghavendra <vigneshr@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>
Date: Fri, 10 May 2024 13:16:00 -0700
User-Agent: alot/0.10

Quoting Rob Herring (Arm) (2024-05-10 05:30:14)
> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

