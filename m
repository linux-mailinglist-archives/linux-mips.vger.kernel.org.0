Return-Path: <linux-mips+bounces-8389-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE9EA73518
	for <lists+linux-mips@lfdr.de>; Thu, 27 Mar 2025 15:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 235F51733C2
	for <lists+linux-mips@lfdr.de>; Thu, 27 Mar 2025 14:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967F8218E8B;
	Thu, 27 Mar 2025 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CEW2RmAJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81075218AC3;
	Thu, 27 Mar 2025 14:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087367; cv=none; b=pLGfpLYLkNXpoESTw9VJNozcmErCLyuIOMdKc1kDaavIyR1ejSnncU3M1QPYZ5Cqs0ItIqhg3e8Y1/ybmCi4IsKC7kEaVNMEcEjUyorOQ3Z0ninQylUMMNZfAzr2q9EN1+WZioumGMFH3NxtnnnvGDTpHS6+gzNtFPcgUyhWfr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087367; c=relaxed/simple;
	bh=/grcYqbyYZQ5Vwrz2k3XVB96o14jNKChWN67TCZobuU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=qaTBwnoEmTtUSpRCGPTTsLYOIavYUPWhWa9mTpI2jZhQ8LNubyJIkDQ50YBvkEk6MurYX/NyrV7jvIIjaG52772YRkbkb5srfGkpcKtf2pEMtzFpbp5JMBZ2/jp5mYIMPvDAucB+dKVuhVBekSSPjkNg2SPxSa91sVTE//ygzTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CEW2RmAJ; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA2A8442C2;
	Thu, 27 Mar 2025 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743087355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/grcYqbyYZQ5Vwrz2k3XVB96o14jNKChWN67TCZobuU=;
	b=CEW2RmAJ0ZDIzcNCEGfqG12mMeklqkwNJKpzCSlg6383UsHweJQM18ErERVBaRnbRDiGie
	Y7Ozeul3aVRs7XMAaBZTsKjhxCP9iXsJUJgx4cjfPqP4iGavMfaB2qDnQXDRSv0EDtV8Fm
	16EdXjq/0Nj/GW2ZB2OLb0tSumrEwK+EEi4ZL5Vel9p/PmA0ItmJ5cfcX2LYoUPb04vcJr
	kNqCv/yd/62DMcUWBXv9yv9ghC9WKt6sYUcWSkYTid/Lgzgnudv36zCZpXt+LObqISONbG
	ZGSDXoVYRhfSjNaETztUFouCkasuhDQIjuoCcjBBiMoBjwfqES17kC9jtLA5uA==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Mar 2025 15:55:52 +0100
Message-Id: <D8R4WB208RUL.14XIUFIVV416O@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next 02/13] dt-bindings: net: cdns,macb: allow
 tsu_clk without tx_clk
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Richard Cochran" <richardcochran@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-mips@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-2-537b7e37971d@bootlin.com>
 <20250324163001.GA272324-robh@kernel.org>
In-Reply-To: <20250324163001.GA272324-robh@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffuvefvofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeluefgiefgtdegfeehjeetteevveejkefgiedtkeefteejgfdvkeffgeejhfduieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvjedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhto
 hepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com

On Mon Mar 24, 2025 at 5:30 PM CET, Rob Herring wrote:
> On Fri, Mar 21, 2025 at 08:09:33PM +0100, Th=C3=A9o Lebrun wrote:
>> Allow providing tsu_clk without a tx_clk as both are optional.
>
> Why? Is there some new h/w? Where's the compatible for it. Or this fixes=
=20
> some existing user? Which one?

I encountered this while supporting a new compatible yes:
mobileye,eyeq5-gem.

But this is more about relaxing unneeded requirements: the previous
bindings said "if you provide a tsu_clk, please provide a tx_clk". That
constraint can be removed as there is no relation inbetween tx_clk and
tsu_clk.

So I'd describe that as a semantic fix of the dt-bindings, that happens
to be useful for our newly introduced compatible.

Or am I mistaken? In any case, I should expand the commit message.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


