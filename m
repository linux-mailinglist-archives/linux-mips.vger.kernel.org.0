Return-Path: <linux-mips+bounces-3547-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B534B9024AF
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jun 2024 16:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3B65B2A502
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jun 2024 14:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAE3132112;
	Mon, 10 Jun 2024 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ifX7rIUS"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA91114AD25;
	Mon, 10 Jun 2024 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718030878; cv=none; b=NnrrgX/IE+Vl7KAiHhAnb+nRmTDpCcCxZmDq8jV4hoQN0u2uOImCp0Z1BTUQJ/XHKUDGuYqw2Wy5goAz9Tl3JMwMA6d6RR4/7tDBEejPlyHNLLYmFC0hL6ppM6bEZZXPj42RE+u3DB9w4tkxPTKp/kxQg1INhuPd1ouPiHe5E2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718030878; c=relaxed/simple;
	bh=TsLWppSPyTvO/wBPl+NGtsl/yO1/CzgHsa3MtV4F7no=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VTT13C04wfiRoR9aEtKNklLpY1BCD0YMjsLIvT3i+6OoZqn0tRH3mCajruQCOu3/fYWREBPS5TrcdcWunISQeup0wRWJifJwxuqYNHV/QLFGf2vCy70BoqSXXOMvCoUwmK9aU183oXnUO07xXa9dLlgo9NlBETpKyaHwgXRn6Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ifX7rIUS; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 870D7240006;
	Mon, 10 Jun 2024 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718030868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vvn/MhvQ3J4B43BBQxlzVkw4aP0ekyeFTkzrVKHeCps=;
	b=ifX7rIUS9OInjeonbpesN5x3CYcBcvGq4JhrOV974+mteff293TVyRTgIOqUm6AG1s0Mbj
	TjwdqC1UaiC3opP40tDomlj0C6J9MmkpH5rBImgMfretXoOGdlAT5wJR7Z7qzNdweVvLe9
	VtvA+wNzFPcSvDU/OA8EztOKB75vgxCBKDXj5UFbGR+gTMBKLnjUYKbMVhzViQCzm2OvnH
	JSxAzSb8y1ClaPX+Fnbw7uTsNM8cMDAMue+q9kUNZPv+fjyY/j5Im8/l3tvx7JeFt2qCng
	mslbvF2zDpq8VmdrbdxW+GwwdZM5SGkOjXkW9S9nuC854M/U2oSoqyU9gcbf8w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To:  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org> ,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Conor Dooley
 <conor.dooley@microchip.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 0/3] Add support for the Mobileye EyeQ6H SoC
In-Reply-To: <20240513-eyeq6h-v2-0-ae8c1974b52b@bootlin.com>
References: <20240513-eyeq6h-v2-0-ae8c1974b52b@bootlin.com>
Date: Mon, 10 Jun 2024 16:47:47 +0200
Message-ID: <87zfrsetws.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Thomas,

> Hello,
>
> Following the support of the EyeQ5 SoC, this series adds the initial
> support for a newer SoC, the EyeQ6H.
>
> The EyeQ6H (or "High") from Mobileye is still based on the MIPS I6500
> architecture as the EyeQ5. The 2 clusters of this SoC contain 4 cores
> each, which are capable of running 4 threads per core. Besides this,
> it features multiple controllers such as the classic UART, high-speed
> I2C, SPI, as well as CAN-FD, PCIe Gen4, Octal/Quad SPI Flash
> interface, Gigabit Ethernet, MIPI CSI-2, MIPI DSI, and eMMC 5.1. It
> also includes a Hardware Security Module, Functional Safety Hardware,
> and video encoders, among other features.
>
> For now, this series just adds initial support with UART and Pinctrl
> support. Another current limitation pointed out in patch 3 is that
> only one CPU is actually running. This limitation will be solved with
> upcoming series.
>
> The main change in this new version is the use of the new way to name
> the clock nodes.

I sent this second version a month ago and the first version even before
that, and I still haven't received any feedback from your side. Does it
mean that you will merge it?

If you think there are some changes to be made, please let me know now
so I will have time to implement them.

Thanks,

Gregpry

>
> Regards,
>
> Gregory
>
> To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> To: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>
> CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Changes in v2:
>
> - Renamed clock node names based on
>   https://lore.kernel.org/all/20240430180415.657067-1-robh@kernel.org/>
> - Use "eyeq6h" instead of "eyeq6" for the compatible string
> - Move compatible string as the first property
> - Link to v1: https://lore.kernel.org/r/20240506-eyeq6h-v1-0-f29b5269cc43=
@bootlin.com
>
> ---
> Gregory CLEMENT (3):
>       dt-bindings: mips: Add bindings for a new Mobileye SoC EyeQ6H
>       MIPS: mobileye: Add EyeQ6H device tree
>       MIPS: mobileye: Add EyeQ6H support
>
>  .../devicetree/bindings/mips/mobileye.yaml         |   5 +
>  arch/mips/Kbuild.platforms                         |   2 +-
>  arch/mips/Kconfig                                  |   7 +-
>  arch/mips/boot/dts/Makefile                        |   2 +-
>  arch/mips/boot/dts/mobileye/Makefile               |   1 +
>  arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts        |  22 ++++
>  .../boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi     |  52 ++++++++++
>  arch/mips/boot/dts/mobileye/eyeq6h-pins.dtsi       |  88 ++++++++++++++++
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  98 +++++++++++++++=
+++
>  arch/mips/configs/eyeq5_defconfig                  |   1 +
>  arch/mips/configs/eyeq6_defconfig                  | 111 +++++++++++++++=
++++++
>  arch/mips/mobileye/Kconfig                         |  26 +++++
>  arch/mips/mobileye/Platform                        |   1 +
>  13 files changed, 411 insertions(+), 5 deletions(-)
> ---
> base-commit: 07e6a6d7f1d9fa4685003a195032698ba99577bb
> change-id: 20240506-eyeq6h-f4c5a95b0909
>
> Best regards,
> --=20
> Gregory CLEMENT <gregory.clement@bootlin.com>

