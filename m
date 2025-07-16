Return-Path: <linux-mips+bounces-9840-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C41ECB07CB5
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 20:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47ED81AA6D48
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 18:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BA829B766;
	Wed, 16 Jul 2025 18:21:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E81329AAF7;
	Wed, 16 Jul 2025 18:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690109; cv=none; b=uA11jLLSZnfoxaGt2UK4tTqvjKO9RFnnlQXngILwCCvic24Tj8yWa1/PognbgFrvGr8am3FdAMDWv/S2rfi67L4ZX+/fJ2RFp+Ppx9wmq2fqxmb3hvoMtED9fEqJ+04OHl4Bn9pksfoXXRkB9OhObW9Z1pTVu4RGVyAn/93DTes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690109; c=relaxed/simple;
	bh=OISzIwgKW9Ut4RNYygd7oYWqpTp409ADl/d7dz7BO2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7+PT2W7Fj1FzGTUzl8jnETmYNwM2SPS/nUxeEVb/wRxrnTcK9u2bYZo8vcD4OzsZAZ81KyM/XdntqNQUoajXGG0njsr5moQthVS1IlH0ihOFLXqVYUtclN2UkZ2Bn3BNrR1JxZhqDQp9BVdkDzWsXHiB2jWkfu6jOdaDSj0Ahc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uc6ZW-0006DN-00; Wed, 16 Jul 2025 20:09:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 81182C0976; Wed, 16 Jul 2025 20:05:41 +0200 (CEST)
Date: Wed, 16 Jul 2025 20:05:41 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 0/6] MIPS: Mobileye: EyeQ5: add GPIO/I2C
 devicetrees/defconfigs
Message-ID: <aHfp9ZkSZ3x6hEhx@alpha.franken.de>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>

On Fri, Jul 04, 2025 at 01:47:05PM +0200, Théo Lebrun wrote:
> Here we push changes to have GPIO and I2C support by default in EyeQ5
> defconfigs and devicetrees.
> 
> Linux driver work has been pushed in the past. Devicetree patches
> accompanied those series but didn't get merged at that time. Acked-by
> on I2C DTS patches come from there.
> 
> We start by a small new defconfig patch that a clean working tree after:
> 
>    ⟩ make eyeq5_defconfig && \
>      make savedefconfig   && \
>      mv defconfig arch/mips/configs/eyeq5_defconfig
> 
> I2C DTS patches:
> https://lore.kernel.org/lkml/20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com/
> 
> GPIO DTS patch:
> https://lore.kernel.org/lkml/20240228-mbly-gpio-v2-28-3ba757474006@bootlin.com/
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
> Théo Lebrun (6):
>       MIPS: eyeq5_defconfig: Update for v6.16-rc1
>       MIPS: mobileye: eyeq5: add 5 I2C controller nodes
>       MIPS: mobileye: eyeq5: add evaluation board I2C temp sensor
>       MIPS: mobileye: eyeq5: add two GPIO bank nodes
>       MIPS: eyeq5_defconfig: add GPIO subsystem & driver
>       MIPS: eyeq5_defconfig: add I2C subsystem, driver and temp sensor driver
> 
>  arch/mips/boot/dts/mobileye/eyeq5-epm5.dts |   8 +++
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi     | 105 +++++++++++++++++++++++++++++
>  arch/mips/configs/eyeq5_defconfig          |  10 ++-
>  3 files changed, 120 insertions(+), 3 deletions(-)
> ---
> base-commit: b4674c5af605321f2ec0c8ac5a884c4ecfad7214
> change-id: 20250704-of-commits-d76e6d76a6f1

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

