Return-Path: <linux-mips+bounces-13144-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HadAkhyimn3KQAAu9opvQ
	(envelope-from <linux-mips+bounces-13144-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 00:48:24 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D38115722
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 00:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4321301983E
	for <lists+linux-mips@lfdr.de>; Mon,  9 Feb 2026 23:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A643033DE;
	Mon,  9 Feb 2026 23:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKurMois"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6FF2D7394;
	Mon,  9 Feb 2026 23:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770680899; cv=none; b=EzlBBW4AW4iIOm1W6LiLWgP52hMxgLUIPeFjVjeBJpBOqiCE80WA5HNq9W3Yc285t5+Wt+rxmIiK1MJ2Ps6cPP+XzwBjG1sJrAT12HXWbFyBYZ1XbVksssYWZexnadweY8xEkGCUNZFTgZxEKvD+zqGvpqqkr4WsgVtxdBQNVqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770680899; c=relaxed/simple;
	bh=mpkN8neCNPVEdMaAIOUGCGbbnLiorreYktvNeByMVvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPQUB9USeEzqzXO3yr9A4jk8xY+6XxYG1IqVuC4Vliqbclc0fd1wGWht+Zn+rPtDB+c21J/+Xq1+k3psAWnR0OTsvvSJ/gfko9q3uupvIrA69ZX9ttUXXIVgjDN2DYcOQu2fZIyHB91ilBb25991OzzSpE8IjIDM3fvPA8y7Wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKurMois; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC718C116C6;
	Mon,  9 Feb 2026 23:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770680898;
	bh=mpkN8neCNPVEdMaAIOUGCGbbnLiorreYktvNeByMVvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKurMoisNsBaFKCEnzrqlH5LcZzUCeV37zGm4SsFV71HM8/YeHro/aysOZLT86+3P
	 E4xkUVfWjurcn4pFbPbgtAEvnDaz3JKNilZUODcUJyHbsL0ajUI/itARd9gIcL9BmL
	 HL9qlYH7wSGLrFfA4vvGXKT4C6YvfSO/PxrS1xTGHWzHrKUG7ITQ8Eenx7FUE+vhKk
	 rco6l3a0fgr2BDoUIqShWQRc5bylI3OoOfzXVwAAbFDwu5sDHOcDnLqwt6fKc3hlHV
	 9IVwTrkLxoMwXT0m2z5S16eQXu8MfKpgtoxiqQpBe78KI3R8zQR6L2o/oUoeBwAgTi
	 qxwTenKvkOuZg==
Date: Mon, 9 Feb 2026 17:48:18 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: interrupt-controller: add LS7A PCH LPC
Message-ID: <20260209234818.GA2119841-robh@kernel.org>
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
 <20260131094547.455916-3-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131094547.455916-3-zhengxingda@iscas.ac.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-13144-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: A2D38115722
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 05:45:41PM +0800, Icenowy Zheng wrote:
> Loongson 7A series PCH contains an LPC controller with an interrupt
> controller.
> 
> Add the device tree binding for the interrupt controller.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../loongson,pch-lpc.yaml                     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
> new file mode 100644
> index 0000000000000..c00fbf31f47f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/loongson,pch-lpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson PCH LPC Controller
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +description:
> +  This interrupt controller is found in the Loongson LS7A family of PCH for
> +  accepting interrupts sent by LPC-connected peripherals and signalling PIC
> +  via a single interrupt line when interrupts are available.
> +
> +properties:
> +  compatible:
> +    const: loongson,pch-lpc-1.0

Where does 1.0 come from? We don't do version numbers generally unless 
you define where the versions come from (e.g. Soft IP releases for 
FPGAs). I would have expected "ls7a" in the compatible instead.

Rob

