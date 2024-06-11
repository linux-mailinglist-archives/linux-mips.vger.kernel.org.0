Return-Path: <linux-mips+bounces-3562-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7922903700
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 10:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A6E0284998
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 08:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBE317555C;
	Tue, 11 Jun 2024 08:49:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0232F176ACA;
	Tue, 11 Jun 2024 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095757; cv=none; b=Gf3HUADU233GzHt6UCEjUwip+haD6vx2XI/yJGHin7/EMEeSxUg71A9iL6V9rLgshzIJBW9A4Hso6Voc558MEM1GXJDqDDwuK43xQElfeMPJkY3pMLB3HkrBEg4jB/UKLrXTMoVJcA9xPWy0xQkwLMgUZez7082xhRPwI2ygxAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095757; c=relaxed/simple;
	bh=xtxhM9TFj7x5jOE2s0N7yda4v9pZvJj3tWDd54Z3alQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miBW4/h/WLZqer03TTYEZ2/H57pynqYWBOg1lzygabrpMsJzdxcPPmpbuR5MVmygJADHoudn8Rk8iluv48YgpldWThkBBnG6YrJDl8GNPtQwNq1Nlwttf3aKmyQ4o8pw7X9tWleHYF1Lepyr4O3k6gfAegZFty6FYkBIWrXfkks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sGxBT-0000Ng-00; Tue, 11 Jun 2024 10:48:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0FBEFC0411; Tue, 11 Jun 2024 10:42:04 +0200 (CEST)
Date: Tue, 11 Jun 2024 10:42:04 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 0/3] Add support for the Mobileye EyeQ6H SoC
Message-ID: <ZmgN3KDxdSytj4WI@alpha.franken.de>
References: <20240513-eyeq6h-v2-0-ae8c1974b52b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240513-eyeq6h-v2-0-ae8c1974b52b@bootlin.com>

On Mon, May 13, 2024 at 08:34:14PM +0200, Gregory CLEMENT wrote:
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
> 
> Regards,
> 
> Gregory
> 
> To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> To: Théo Lebrun <theo.lebrun@bootlin.com>
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
> - Link to v1: https://lore.kernel.org/r/20240506-eyeq6h-v1-0-f29b5269cc43@bootlin.com
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
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  98 ++++++++++++++++++
>  arch/mips/configs/eyeq5_defconfig                  |   1 +
>  arch/mips/configs/eyeq6_defconfig                  | 111 +++++++++++++++++++++
>  arch/mips/mobileye/Kconfig                         |  26 +++++
>  arch/mips/mobileye/Platform                        |   1 +
>  13 files changed, 411 insertions(+), 5 deletions(-)
> ---
> base-commit: 07e6a6d7f1d9fa4685003a195032698ba99577bb
> change-id: 20240506-eyeq6h-f4c5a95b0909

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

