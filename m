Return-Path: <linux-mips+bounces-12441-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B75CB36D6
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 17:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1EE9312673D
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 16:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA63830BF67;
	Wed, 10 Dec 2025 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p5gpe+TY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D3130C35D
	for <linux-mips@vger.kernel.org>; Wed, 10 Dec 2025 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765382815; cv=none; b=OIpaP+ViNsSi0XAQcrm6hGu9pdXAvZFz0fxUdp+M49M042r443SWUya1bVv3Jz2a0c/BRyIdoRESbHMxaSbePSGAuLdAdsOjCbKFcPsumJG12czYxqwrAOROdw/sm/5nCgA6VHG0VK9syRKVkDB8Ei17zVnqXiZaF/9m1xJihtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765382815; c=relaxed/simple;
	bh=j7IMaXSGae8/zSMNH5tabWZidQgz9x1xyATYXrO5kSw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PeAlJAUAe8FUnNySjzw6QuaApjkqT+8UZys/kZVe8SF4411swIe9r1lMuTrwsLvXAXSA1zyhxNeiFgYEkzzNdv712FFvmqbj4ULEaNUoCNOljCAPOM9sYAdvHprO66dYq4po2JRLg0pu2juVVb/OyvaeStMTlPiECFEEggBL5jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p5gpe+TY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3589C4E41B44;
	Wed, 10 Dec 2025 16:06:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F33E560714;
	Wed, 10 Dec 2025 16:06:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28B0F11931A8F;
	Wed, 10 Dec 2025 17:06:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765382810; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j7IMaXSGae8/zSMNH5tabWZidQgz9x1xyATYXrO5kSw=;
	b=p5gpe+TY6I51MtjCELzk2RuavVYrxS0W4GzteyJMuGq/AobyDzlbDT6HQpOhBePE+lxBjS
	vh6x8gTEGWxjhkBfVtvruvJWHlZZU1oonAzdrSsn+d4Mlp4QRVgz2SmQ+EATau9Op5jfa9
	EYXw1yzBETDD2qFZky97F+TMoyIDj/ISZVbsXTHnVP41gA5LDFbE2ncfmAJnVwmmussDaW
	P/G62UzJbkbnDna9clHZhjRVOnnQA7eeZjksxcw634AyCJH346fAYQTyaU+SU5uglrFRkm
	BBpvVyqUgkFjprwvoNcIFB9Jt8BvXbHy/OBJzX+rwQKn7HkabEbs3y4uohsHtw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 17:06:47 +0100
Message-Id: <DEUNZ5TYSY2E.1QO656BT3YQ5D@bootlin.com>
Subject: Re: [PATCH v4 4/7] clk: eyeq: add EyeQ5 children auxiliary device
 for generic PHYs
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
 <20251124-macb-phy-v4-4-955c625a81a7@bootlin.com>
In-Reply-To: <20251124-macb-phy-v4-4-955c625a81a7@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Nov 24, 2025 at 3:41 PM CET, Th=C3=A9o Lebrun wrote:
> Grow our clk-eyeq family; it knows how to spawn reset provider and pin
> controller children. Expand with a generic PHY driver on EyeQ5.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

