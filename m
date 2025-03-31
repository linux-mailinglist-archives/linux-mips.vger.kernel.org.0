Return-Path: <linux-mips+bounces-8422-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E760A76FCE
	for <lists+linux-mips@lfdr.de>; Mon, 31 Mar 2025 23:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E826188A133
	for <lists+linux-mips@lfdr.de>; Mon, 31 Mar 2025 21:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E075D1D5CFB;
	Mon, 31 Mar 2025 21:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGCGKDjt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46FC13D8A4;
	Mon, 31 Mar 2025 21:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743454874; cv=none; b=Hv8K8CyOHv8GpTGrM+4w2G7sYU0/g93ipSYm419ThzdO0rvzRfsFFr9GWJ9OZ+jSiuc4/hkahytdW2WVk++aLIWE7/o6YkbAy2Imqc5yAQ5Mrx05nCgHYAHpZ+t6nObVG6u/KJyB8mR6nm9YA2FG/ynqzA31KMobpBjIglUZ86I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743454874; c=relaxed/simple;
	bh=PXB9+IIdexxKf88I2wNQQL6Ymiw74kkfsgF8CJopTpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3fpLBxYDddG/D5v1Q9ALqeF6VxfxZxUSohpfmwYvjYV6mIcKQhfRzgFP119PrPp5uSFp/OFqgbM+t14W4T34QYH3q65BWcHGHUhx7yPVyp+nysXNmCC3AjfMstqYYi3B8EaAtqBK+nAr70ohJGX3p5d73EEBacIi5zmq6ARxgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGCGKDjt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5971C4CEE3;
	Mon, 31 Mar 2025 21:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743454874;
	bh=PXB9+IIdexxKf88I2wNQQL6Ymiw74kkfsgF8CJopTpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGCGKDjtaPWgg8JQDlWXwrCTej0iosz6GowAQnbt+UNvEnb6XRI3zuaOS6YBODI5R
	 h/EewDHMaLPST9inTzzyOI0ScqAh1WqjvYaRZPDmKXfI2h1aGAth8uIFGtXdsh1bSF
	 HEPCDHohIuI+xHqPzr8ZNX/teuZH4Og4i6uVD07ywY83czZEvH53II0GQj2HtRMVY7
	 es0z/yifpGD1MdAe/4rvw/jSWbAGJkgvLHDU8ykTijC6aGB8cFr4SkNcINBHhz/KCP
	 DyqCPe5IdhPNjG0ni7Tp9PyzNXBT8vk5vUuzLl3Dv+y3toUEe/7m8Xj8zkdvcanQ7N
	 DG+5iV8f3JBKQ==
Date: Mon, 31 Mar 2025 16:01:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	benjamin.larsson@genexis.eu, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 02/10] dt-bindings: interrupt-controller: Add EcoNet
 EN751221 INTC
Message-ID: <174345487191.2817170.10410972908712434627.robh@kernel.org>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
 <20250330170306.2584136-3-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330170306.2584136-3-cjd@cjdns.fr>


On Sun, 30 Mar 2025 17:02:58 +0000, Caleb James DeLisle wrote:
> Document the device tree binding for the interrupt controller in the
> EcoNet EN751221 MIPS SoC.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../econet,en751221-intc.yaml                 | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


