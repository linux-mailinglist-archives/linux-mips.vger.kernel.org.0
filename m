Return-Path: <linux-mips+bounces-11846-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF3BFAA3C
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 09:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E6097504ADA
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 07:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378DD2FC00C;
	Wed, 22 Oct 2025 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PkTnWtr1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D1E2D5927;
	Wed, 22 Oct 2025 07:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118897; cv=none; b=O8XQp9eWCwBgV/ZqX1tXZy5wSimblFi6Wa7O6rb1iJePSDhzZXPHVThGGYjFcaBj8gXWBheP1XdoXphTMiEGWA2NqbxziXF7vD8VdzbS0Y3RWAlFL8b/7vNBGVhG4NuWON5S4cZsmj5h245mG1a6etDLLLTfxjraDEMtrnmGGyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118897; c=relaxed/simple;
	bh=w6Pk318+uWlJig7kSmhciOgwzKqt9hCCrIYqqL4yqNY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ogsdqPFBv8wiVq5N9cCniPcwftrOyfiBsR8M9mzeHT4x+OkplVhbX6jxsyrCyRvDFoDtrtS1PStyc2j+A2VLoGT0acKbGatD8X4hfFdIjopgQED9fCBYSA6/Bmo39KbnTb4OEK2B3oG2CJ0p8TWPQb/F1YtGF7u6VAlR4mbdvlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PkTnWtr1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 39B4F4E41278;
	Wed, 22 Oct 2025 07:41:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A58E606DC;
	Wed, 22 Oct 2025 07:41:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68B39102F241B;
	Wed, 22 Oct 2025 09:41:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761118892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w6Pk318+uWlJig7kSmhciOgwzKqt9hCCrIYqqL4yqNY=;
	b=PkTnWtr1jkPN412arglI0mz2NhL3TRAuP2uayrqji+VoDe4d/FIjOWZ1cc63SLUc2Lo+Jd
	FIt6sYzMUROvjKK/8SgV+CUFUlBPL8rb9ABg11NRZs/srHm3UId29ZEnEIgtzwZi7hu8Bk
	kMs8qKh0az23BYaou/Ar5XWg2AlYUT9Siy4Oo04ojU8ZXk4QSchJV9XKZvEZQhXNDpszvs
	oAABVn1+T2IIXdMSECtUVh5yyhkYANZOUz39ovz7lY/SSCagG40w0uUti1Mtx1aEyaKc5L
	g+6yf9EKsEizPO15T9Qt6fJBKtKZp2axtAOPGBbrxKquY0a8h1C/XZ9rgavKgA==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 09:41:24 +0200
Message-Id: <DDOOJIQS8DK2.1QUEWN5FYYQ32@bootlin.com>
Subject: Re: [PATCH net-next 00/12] net: macb: EyeQ5 support (alongside
 generic PHY driver in syscon)
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Paolo Abeni"
 <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Russell
 King" <linux@armlinux.org.uk>, "Vinod Koul" <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, "Maxime
 Chevallier" <maxime.chevallier@bootlin.com>, "Andrew Lunn"
 <andrew@lunn.ch>, "Jerome Brunet" <jbrunet@baylibre.com>
To: "Jakub Kicinski" <kuba@kernel.org>, =?utf-8?q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
 <20251021171430.579211b2@kernel.org>
In-Reply-To: <20251021171430.579211b2@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 22, 2025 at 2:14 AM CEST, Jakub Kicinski wrote:
> On Tue, 21 Oct 2025 18:32:41 +0200 Th=C3=A9o Lebrun wrote:
>> Merging all this won't be easy, sorry. Is this split across trees OK?
>> The net-next part is pretty evident, it is the rest that appears
>> complex to merge to me. I can resend the series exploded if useful
>> (or at least split net-next versus the rest).
>
> Yes, please respin just the patches that need to go via net-next
> for us (1,3-6?). The rest I don't car^W know :)

Sure thing! Only net beauty is present in V2.

https://lore.kernel.org/lkml/20251022-macb-eyeq5-v2-0-7c140abb0581@bootlin.=
com/

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


