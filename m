Return-Path: <linux-mips+bounces-9541-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC80AEBF95
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 21:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6073F5652A3
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 19:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CF01F874C;
	Fri, 27 Jun 2025 19:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeSdvolZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA891E1E0B;
	Fri, 27 Jun 2025 19:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051765; cv=none; b=D6oeB8ewJHHXhbj7c6b76ALVR3IyhuoqCfcHaVZIeYFh2J5N5cAHQZYKeLeq7xRgOQSEa3BxFg3O3UJdJOE7d5yLzm3OWFVMw3oWvx9QlfULwwssIFRlMU+VPJjYL+jeYI2R4pqC+Qv4WW4rKcFNyTz9ZTG+ry4uD2fiCJ55Xyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051765; c=relaxed/simple;
	bh=e3ItbkmjlCF+WHhbj2/fNpi4b7yR0M+6lB+y/2rBgh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyYe7JTxWRN7bvmsEQtL4igwUL89jr9J8w4PfhAOmbYt4nLyAAHpN5+mJE9MKpnGYoweTwBSGLlcZGOG9pBRYX+KJnF11RfhtPOL0BrAkykB5J1XsB9BR3BxiE/fN9/8cVT8F5ZoZkmOy8s42ye+abeNAXlrkPXu/TaHxsEcOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeSdvolZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DD2C4CEE3;
	Fri, 27 Jun 2025 19:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751051764;
	bh=e3ItbkmjlCF+WHhbj2/fNpi4b7yR0M+6lB+y/2rBgh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeSdvolZ1UWrXJ9VSVn0ZS0DXIqe2eIXrXITt8duLo+CfF5vTXac+ssoZApecraH1
	 P6B34G+ZT4coa3ZcU6wxNroRRNJoZdFztXJD03a4AdF1WGj/t9kpNYDL/NfBJE4Wof
	 KmdnpV4SLP6BzmvZek6j0+ATHYvGhFeAd1DG8mXmgIsOfucxt3OywgB99zLXehfevR
	 mqU7rlqzqJtoNk10nnojKRiZNt0EB9GqJ5bK68DoJUsEIZlO21up/E/uvVTp+qY8Wt
	 bHmHC42juwXKYjbB+5rAmVCmyt4SIW3YdBju8ygb3Yey69lLMJjOUfvZszDV8BjyJY
	 3XsaCQMDAlyHw==
Date: Fri, 27 Jun 2025 20:15:55 +0100
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
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
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Rafal Ozieblo <rafalo@cadence.com>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Jeff Garzik <jeff@garzik.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next v2 16/18] MIPS: mobileye: add EyeQ5 DMA IOCU
 support
Message-ID: <20250627191555.GD1776@horms.kernel.org>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-16-ff8207d0bb77@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627-macb-v2-16-ff8207d0bb77@bootlin.com>

On Fri, Jun 27, 2025 at 11:09:02AM +0200, Théo Lebrun wrote:
> Both Cadence GEM Ethernet controllers on EyeQ5 are hardwired through CM3
> IO Coherency Units (IOCU). For DMA coherent accesses, BIT(36) must be
> set in DMA addresses.
> 
> Implement that in platform-specific dma_map_ops which get attached to
> both instances of `cdns,eyeq5-gem` through a notifier block.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

...

> diff --git a/arch/mips/mobileye/eyeq5-iocu-dma.c b/arch/mips/mobileye/eyeq5-iocu-dma.c

...

> +const struct dma_map_ops eyeq5_iocu_ops = {
> +	.alloc			= eyeq5_iocu_alloc,
> +	.free			= eyeq5_iocu_free,
> +	.alloc_pages_op		= dma_direct_alloc_pages,
> +	.free_pages		= dma_direct_free_pages,
> +	.mmap			= eyeq5_iocu_mmap,
> +	.get_sgtable		= eyeq5_iocu_get_sgtable,
> +	.map_page		= eyeq5_iocu_map_page,
> +	.unmap_page		= eyeq5_iocu_unmap_page,
> +	.map_sg			= eyeq5_iocu_map_sg,
> +	.unmap_sg		= eyeq5_iocu_unmap_sg,
> +	.get_required_mask	= dma_direct_get_required_mask,
> +};
> +EXPORT_SYMBOL(eyeq5_iocu_ops);

Hi Théo,

Does eyeq5_iocu_ops need to be exported?
If so it should probably be declared in a header file somewhere.
But I if not probably the EXPORT_SYMBOL line should be
dropped, and the structure made static.

Flagged by Sparse.

> +
> +static int eyeq5_iocu_notifier(struct notifier_block *nb,
> +			       unsigned long event,
> +			       void *data)
> +{
> +	struct device *dev = data;
> +
> +	/*
> +	 * IOCU routing is hardwired; we must use our above custom
> +	 * routines for cache-coherent DMA on ethernet interfaces.
> +	 */
> +	if (event == BUS_NOTIFY_ADD_DEVICE &&
> +	    device_is_compatible(dev, "mobileye,eyeq5-gem")) {
> +		set_dma_ops(dev, &eyeq5_iocu_ops);
> +		return NOTIFY_OK;
> +	}
> +
> +	return NOTIFY_DONE;
> +}

...

