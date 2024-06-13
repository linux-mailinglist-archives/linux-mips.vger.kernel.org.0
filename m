Return-Path: <linux-mips+bounces-3663-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8971C90755F
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 16:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 333C91F23562
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 14:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FEE14601C;
	Thu, 13 Jun 2024 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtlF/p6j"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A54145B2B;
	Thu, 13 Jun 2024 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718289590; cv=none; b=cG5au+vLv0ymS3Byrl70ZjUmhjj6Geq080dlklvf4YsQGnp3M7emLyRuC+IVfAy9vmmdFp2udSMIQPvhCUYlOr1mg54jnJ7RA1xfVudnTQxGdXFQcUnJKGj17EgqHtHcXR09H730wXptMJ6LNSauv6Hz9BNW/NrUDTFbnmnZVz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718289590; c=relaxed/simple;
	bh=/XgdqH12I7+QANuYrNXhbfWjpqVJ36pUPomHgM8NI/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j7vSJyLhZ6HoBKmncmpSWzDy8P2V1lpJLduvbSJnML14a/gSegjGAI6lrgkt49JNj19Ze/+B7jB6BSO8IL59RLK9Rx07PQc7nnsmWHpJ8eXcgjZ5D6r2sG+bdc79+i1uJT1kdPtrXyhJoh0l938wwCdQW5eSHOkgQgGdgq0Kz/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtlF/p6j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30526C2BBFC;
	Thu, 13 Jun 2024 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289589;
	bh=/XgdqH12I7+QANuYrNXhbfWjpqVJ36pUPomHgM8NI/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mtlF/p6jeOnYKoKhbUMaQENnBa/4WKzKcjcJQudfMoBUXV889PwL7eBvFiSai4v0W
	 51LaucZ5fawWqt2PdlHyOdvr/joRZUhdso8+MbKUu+Vc8MNnVwJ3FGTxDgxzEF3KL7
	 KGrlc8zPM1dXF2ZS3wKm9oVkHv428TR9CADht92YvVEyYV5wwVuttqvzoRG3x/ATp5
	 4YNfNNAZ8q4RfzEk7EnVPR966xsKyBU4WBY+RUEkE11qJAoEewYlIPUyNyY8XasFLp
	 gwh6OHCJgAMCr/Lnb73Cg7H6cEnqZmjCajZX8Vd/+tBmffSZAZayPQZlUTkL/ks9xp
	 G+olz39SMKj4Q==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
References: <20240510123018.3902184-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: syscon: Add more simple
 compatibles
Message-Id: <171828958394.2643902.14840727452318999117.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 15:39:43 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 10 May 2024 07:30:14 -0500, Rob Herring (Arm) wrote:
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


