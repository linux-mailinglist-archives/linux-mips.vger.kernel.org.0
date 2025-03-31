Return-Path: <linux-mips+bounces-8419-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF43BA75F22
	for <lists+linux-mips@lfdr.de>; Mon, 31 Mar 2025 09:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00898188928B
	for <lists+linux-mips@lfdr.de>; Mon, 31 Mar 2025 07:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40367198A2F;
	Mon, 31 Mar 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3lmq/Xx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AA878F5D;
	Mon, 31 Mar 2025 07:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404499; cv=none; b=Assp+kICV+WfnFC/ekvxw3s2nZQbhcjXr1ntmmIadZtxGSyBr02RWA66IQeHTAI/bAqv8fZKCBSqrcm2x540NE/yuGovAE7zB4LRkBLiYaf5unliE3aKoUy4hqEFLyVIaY+EUVGw3nqs4YtQ0n5GDfEPECGHrFntFYlHP4vupFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404499; c=relaxed/simple;
	bh=I2xjJSKsxTPdXtdeGhLco5ny4M3RowmsAlXNHfIxfeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNMsqAbLC9qYV9CayZPr/B9ZomJQA7gDQDACGKiKpoKk17gDERoYQOaIdszOSJw8VOB5ttabFCB2lC/uUArPDYo+GpUxxBDcRgDznbQI+QggEFdfWExxBqC8taG4M/2K2FBjUFPsiudrNuc8M+N2g99vc2QrBsXglAcuEke5v3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3lmq/Xx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0758C4CEE3;
	Mon, 31 Mar 2025 07:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743404498;
	bh=I2xjJSKsxTPdXtdeGhLco5ny4M3RowmsAlXNHfIxfeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3lmq/XxMTBDfoD/eUS4Ng0hYx0E4hWnv44mT+wz3WMqq/X1oEgNhUwkLR7vAQGJ7
	 HOIzVIgosJr2vEJIUGda+zgTkAXNZwKzniTbAZgHRjuMTyIqvICXXZjoduwkZsPNOJ
	 vT9jLGAlidzhRd8H8hZL1FG90KmhbRCvGiAYZdBeWRQSss8vTCf6WLSmd9UynxkjsF
	 tqx+cftnM78UzJCOB2QOxEABNp3y6bxThx1eXPDoEx+WR571IObaBw/hBqi0JyVWPJ
	 p74xGgdlh1I+p4v4EQbLX16RF9eyCBiBY8OCHkWE2LyhfTKLAwrIsPrNtLWe+icV5S
	 9n4+9xvGGBZTA==
Date: Mon, 31 Mar 2025 09:01:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 04/10] dt-bindings: timer: Add EcoNet EN751221 "HPT"
 CPU Timer
Message-ID: <20250331-realistic-powerful-elk-6e2ddd@krzk-bin>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
 <20250330170306.2584136-5-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330170306.2584136-5-cjd@cjdns.fr>

On Sun, Mar 30, 2025 at 05:03:00PM +0000, Caleb James DeLisle wrote:
> Add device tree bindings for the so-called high-precision timer (HPT)
> in the EcoNet EN751221 SoC.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
> HPT is a name commonly used in vendor and 3rd party out-of-tree sources.
> ---
>  .../bindings/timer/econet,en751221-timer.yaml | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


