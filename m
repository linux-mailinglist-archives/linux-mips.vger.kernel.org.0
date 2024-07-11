Return-Path: <linux-mips+bounces-4293-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B20EC92F0C2
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 23:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C35C281145
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 21:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD43C19EECC;
	Thu, 11 Jul 2024 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKohomAq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1851509BC;
	Thu, 11 Jul 2024 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720732416; cv=none; b=mX4r751FJWGhbSZ0V3PYDH62uqGXsAEW2wHEWdRgdDjFqNCCR6ozX8i+pBRwPrF/uCSnygOZU+bf5Sf3eMBbiR6mmloVQX/1GiB2RTwDO2HzPX0ff0YfaGc7/jQKeTcgqgngCT+d7RWvHhX1muDdXWbHJ1EPmPt3KW1yR2bFGn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720732416; c=relaxed/simple;
	bh=zD3H2nNg/pVAuxwarSoosSrcXFyYiiavlKTZ20sCeM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+4rZebtr5BPCuik5jGrNTLzTMKpD2A4i3shmr00ZeKJb5M9B2IWX3kJegKSk2hVhoZaRHYVq+RU5P/PZHFzQFMFNfMfyZDnCIu6RPOrtIVn9h7ee16zKkEwO/h81F0A/TTABb0J2x1DpiH8ZnuWVpY0tYo/IK7gCe8LkcsR9Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKohomAq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03340C116B1;
	Thu, 11 Jul 2024 21:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720732416;
	bh=zD3H2nNg/pVAuxwarSoosSrcXFyYiiavlKTZ20sCeM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKohomAqoc4gxipkRO1NgxAokKA94Gmr8tOd2ACAmsEj27nT89p91hNF3B/Ba15m5
	 BokRn8jrE7DZ5UpFkC+yZJ4B21K1265XiHkcFaFj+QfTd0ydjtJVUp/y7z7YRepd0o
	 ssB0uFPV14oMw58KotNoUISsF+Dz+liGFUSuZEOqYFXLhJY/a9n1nYWRnSRfqrkS8O
	 PH8feg45iCzaqaalMckvM4D6v2i79rAmDIHsP1KqBZVNbmeyvWtkAohtiAAVd0ZTqX
	 pdVEP+U+l246KAY3vm7mzDQa/B+aY5ZMlsDg+xE+GnsbV+EOJ3rstuj9PFC/At4R9D
	 lkTts2tve+/Lg==
Date: Thu, 11 Jul 2024 15:13:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, bert@biot.com,
	sander@svanheule.net, daniel.lezcano@linaro.org,
	paulburton@kernel.org, kabel@kernel.org, tsbogend@alpha.franken.de,
	conor+dt@kernel.org, peterz@infradead.org, john@phrozen.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	tglx@linutronix.de, mail@birger-koblitz.de, ericwouds@gmail.com
Subject: Re: [PATCH v5 06/10] dt-bindings: interrupt-controller:
 realtek,rtl-intc: Add rtl9300-intc
Message-ID: <172073241371.3019767.1008127650947227633.robh@kernel.org>
References: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
 <20240710043524.1535151-7-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710043524.1535151-7-chris.packham@alliedtelesis.co.nz>


On Wed, 10 Jul 2024 16:35:20 +1200, Chris Packham wrote:
> Add a compatible string for the interrupt controller found on the
> rtl930x SoCs. The interrupt controller has registers for VPE1 so these
> are added as a second reg cell.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v5:
>     - set reg::minItems = 2 when compatible == "rtl9300-intc"
>     Changes in v4:
>     - None
>     Changes in v3:
>     - Add reg::minItems where required
>     Changes in v3:
>     - Use items to describe the regs property
>     Changes in v2:
>     - Set reg:maxItems to 2 to allow for VPE1 registers on the rtl9300. Add
>       a condition to enforce the old limit on other SoCs.
>     - Connor and Krzysztof offered acks on v1 but I think the changes here
>       are big enough to void those.
> 
>  .../realtek,rtl-intc.yaml                     | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


