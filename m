Return-Path: <linux-mips+bounces-8334-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A22A6DFC3
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 17:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D8EF188E03F
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 16:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74115263C6D;
	Mon, 24 Mar 2025 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVy+zIOK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402F01799F;
	Mon, 24 Mar 2025 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833869; cv=none; b=fYPe4y2Rexzbp3Z79K2OYKliy74eofcKdit3ARfM0tLjAyb4IHW4Otee+OOm3fHHXYlFyfrvbKrbI1QL15Q04+17ugNmqkCYDdLidJJ4b1Q/imqXribuHLEctCiwIPaqtU/Gg3wWQ9dazsKMB7CVWoDIMOr7ProXmiRlf1gxFeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833869; c=relaxed/simple;
	bh=gfXXiQCFAETf0jTJcsIlh59JFNBubS0WLf34O4y8etU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kg6IUU9Ir1irpRS7g5p+dRdNcVCfSZxcXfmxGGAoIfOlOUAkG4CaiHmz9HHxyRPDR3jJEmIUVYteHx8AZY54p0s9XOm1EKUbeHymJxDzqLLvtR4Sc5qRNcQQ5e6aCCTXggHZ1F2dBL21mD5w02ZadefcXRBFW8PGmumKDateBz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVy+zIOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D808EC4CEDD;
	Mon, 24 Mar 2025 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742833869;
	bh=gfXXiQCFAETf0jTJcsIlh59JFNBubS0WLf34O4y8etU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVy+zIOKcgk+jlVdsItdX1cqY1MqL1N9+iqr0YxbG4BiFkrD0ATC8oMKU2Ax9xSMP
	 XwpcRgrIdK/0b60JJy+nOFgC3abTB2W89zJ9sS650vorQ07s1gLl20RcUAdJgaApdO
	 i8wWsz4CS15XYwI+JsXxu6WHriRUJraQgE3NRDPrrlts/FWK11jmGnQ5Mz8ja2nMs8
	 1pV8wPEeYBfxkhaPx4+A8cv2I56/oL7GVPFYxcBDQ48uRfsZHoKiMJifJAACnfrifM
	 rL2SAaIAhHzHQANLKKDaHBGapLadtz54gQsO/ITTJqUdnW8gAhjglfhcEWBkctgDWv
	 2h9l7gAy3WStw==
Date: Mon, 24 Mar 2025 11:31:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Eric Dumazet <edumazet@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-mips@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 03/13] dt-bindings: net: cdns,macb: allow
 dma-coherent
Message-ID: <174283386719.296457.5916372144709687859.robh@kernel.org>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-3-537b7e37971d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-macb-v1-3-537b7e37971d@bootlin.com>


On Fri, 21 Mar 2025 20:09:34 +0100, Théo Lebrun wrote:
> On EyeQ5, the GEM DMA controller is coherent with the CPU;
> allow specifying the information.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


