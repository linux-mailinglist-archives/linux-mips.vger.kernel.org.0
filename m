Return-Path: <linux-mips+bounces-8289-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73765A6C48D
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0022B7A8B92
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9CC232377;
	Fri, 21 Mar 2025 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TGFtRI8s"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BF6221DA2;
	Fri, 21 Mar 2025 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742590212; cv=none; b=DdhCldJhg3x88lL6s4PHIafYqcw9584S0Hn5ZQEE1zukYWdhBJhI4Xe1bsf41s1Fb9L+cvgTcb5XAgHbtmUSMnDMazQKmRH+uSaEEdYZ8nxGVsrGg42IM/vTXZkUb/MO9hQQL/6jhA61hTugmZw4eweqrUnLUE31qCoBNWJ62bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742590212; c=relaxed/simple;
	bh=NYDV0AH6VMybj+/Wwpfj6w3HLv/oqsj2RU5ib1yXgO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgCFdOv3/FjSXBRCeFRimXq6nzQ1g+PXYrL13JPJL4NYM44ySieUYIUFK8wq40r9qi4y+XYLIDxz1m1JyvKmA7ABgeQJyDhT8+vXIEZlodCxy8cHFxgkNGZ9gTx6Hzw5NSGl4bREFUsfZn3tJkzvJzm1QMNCQGvQ/T7Rxyq1Y+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=TGFtRI8s; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yFzOysCPLuMjK3qzNNnYKx7eqzyb8A3svd4W9fSzPuQ=; b=TGFtRI8spN1abBT9KlSGFueqQh
	6/YP2EDo6BjswLesT6nGpeMQ9l84PUNmOlDHSQO43O70iL0m5u383PDralyj13qYDcr5D7CjO2NAZ
	RltzmllqpVOG9toqHbT8+tzjdJcPirCbfOYaqh9GGwj5dM49R26FCx00XWpFfKRnRsoQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvjJA-006eT6-Hj; Fri, 21 Mar 2025 21:49:36 +0100
Date: Fri, 21 Mar 2025 21:49:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next 01/13] dt-bindings: net: cdns,macb: add Mobileye
 EyeQ5 ethernet interface
Message-ID: <2dbbd6c0-84d0-4846-a48d-31891f395c7c@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-1-537b7e37971d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-macb-v1-1-537b7e37971d@bootlin.com>

>            - atmel,sama5d2-gem         # GEM IP (10/100) on Atmel sama5d2 SoCs
>            - atmel,sama5d3-gem         # Gigabit IP on Atmel sama5d3 SoCs
>            - atmel,sama5d4-gem         # GEM IP (10/100) on Atmel sama5d4 SoCs
> +          - mobileye,eyeq5-gem        # Mobileye EyeQ5 SoCs
>            - cdns,np4-macb             # NP4 SoC devices
>            - microchip,sama7g5-emac    # Microchip SAMA7G5 ethernet interface
>            - microchip,sama7g5-gem     # Microchip SAMA7G5 gigabit ethernet interface

These are kind of sorted. Maybe put mobileye after microchip?

	Andrew

