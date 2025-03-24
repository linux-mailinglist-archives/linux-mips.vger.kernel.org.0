Return-Path: <linux-mips+bounces-8332-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 507EEA6DF62
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 17:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72B9D188D050
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 16:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084C32620EA;
	Mon, 24 Mar 2025 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gf68N48I"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2391D261583;
	Mon, 24 Mar 2025 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742832849; cv=none; b=TJYu+NA+XAMi7j+PlP0R41+jiTJbnadY/Ei5T2zfAvo/sHefBSwLfsyJ0pYcifLbdgTYeyPxiJAkNp4/Vkajw0kFy2Qc63zDWp7hrztR2ApXe+3S40UBjiNZXlnaiZMDUtQwn4++X3yZw3rct1B8t3dIOlwAlpBdp/JVt3kKJKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742832849; c=relaxed/simple;
	bh=qWUcDEvNPwe+MVToQY1UJqIGr2oMYuSjPCHLZBofknA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=luHPy+XmVpkyTl91yrZpLfQ/eNQqwdQx4m+/4Wk2GTQEKO0VN29b9MrlQIHyukPqaT5rMWGgcHY5fDL3j5D/iPlr5jP+VMSzcsy26/u2KZb/JRwOswBy94Oq9dD9vl5ynU5KIGC4yEmw6nqRuEru3eL0arqkF3AVlgKBGvegxSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gf68N48I; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9EB62047D;
	Mon, 24 Mar 2025 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742832845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6KzmIi53X4fObYuJrA4GCKCHJLPzFl8bnqM+4sgwCQ=;
	b=Gf68N48IxHGYxw5YhiOZutJryK0qFHSxJJeAYRbkVLq+oNDSGW0qesENhdVAAjAfxKxj9D
	ZE/cLxKqWuH93q2c0TTha9uIb72TJzQnCArJ60qE9rphdjgh2rXoahvIdv8WFP6+7om7f1
	fHSKvAZ4eKzHpX4Us105kKzkdm35JbDjF4lr72btvKLJSU3WG2SZ2KULSLV5mQUM7D509K
	Wbt9VlL2xLhEtaqv6+fe+BwzpPU02bkyjLbZ+DrlOmwxQ0Abn+cT68213S1R07uGTL+j4N
	n2336Y+3wBww2TlzhtGWwataCUV4jvefAI8JSJyL1IjQHIcV/tFTyTlKYk6tEw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2025 17:14:01 +0100
Message-Id: <D8OMOI980I2X.1JH4RKWL1V86E@bootlin.com>
Subject: Re: [PATCH net-next 01/13] dt-bindings: net: cdns,macb: add
 Mobileye EyeQ5 ethernet interface
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Samuel Holland" <samuel.holland@sifive.com>,
 "Richard Cochran" <richardcochran@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-mips@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Andrew Lunn" <andrew@lunn.ch>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-1-537b7e37971d@bootlin.com>
 <2dbbd6c0-84d0-4846-a48d-31891f395c7c@lunn.ch>
In-Reply-To: <2dbbd6c0-84d0-4846-a48d-31891f395c7c@lunn.ch>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevvffhofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduteeltdevjedvkeelueejhfdvleeiueetvdfgveffffekueeghffhieduleejveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpr
 ggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

On Fri Mar 21, 2025 at 9:49 PM CET, Andrew Lunn wrote:
>>            - atmel,sama5d2-gem         # GEM IP (10/100) on Atmel sama5d=
2 SoCs
>>            - atmel,sama5d3-gem         # Gigabit IP on Atmel sama5d3 SoC=
s
>>            - atmel,sama5d4-gem         # GEM IP (10/100) on Atmel sama5d=
4 SoCs
>> +          - mobileye,eyeq5-gem        # Mobileye EyeQ5 SoCs
>>            - cdns,np4-macb             # NP4 SoC devices
>>            - microchip,sama7g5-emac    # Microchip SAMA7G5 ethernet inte=
rface
>>            - microchip,sama7g5-gem     # Microchip SAMA7G5 gigabit ether=
net interface
>
> These are kind of sorted. Maybe put mobileye after microchip?

I never understood how most lists end up mostly sorted. Changes for V2:
 - add a "dt-bindings: net: cdns,macb: sort compatibles" patch,
 - add the mobileye compatible below microchip's.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


