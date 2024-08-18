Return-Path: <linux-mips+bounces-4928-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4AD955D6C
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2024 18:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6D841F211F0
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2024 16:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339F9145B2D;
	Sun, 18 Aug 2024 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctyjVRbN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006CA1428F3;
	Sun, 18 Aug 2024 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723997899; cv=none; b=ZczrimxlkA4SwW1xt0GMQvsfHTWR3k1NApSDl/yDC09bBmcnuf/tMFeV+tWtV4dVB/cVrVBafj5u3g/tApocVpVawpdfbpViRRUgGCXtWJ2DIx9RIcLAqeSUHrz2R59AF7ipXuivo9yk4CdTdUiQEXQ8gwPBZzzw9mrOEj9iDO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723997899; c=relaxed/simple;
	bh=wH/q17EcEM1yaX/QyJjRxmoKQTkpYh+1vI+c83h+e30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ18QO8bewvj6Y4FzY4NylrinP07oMS+/tH+crVm8maeWUw8b8VzMp7qXISSzvpcmuSysJK+/CjE70APWZX8qHE0ab0J9+abyM0LBLFR1ZxDb+3C18suZZYRzkdUsx8mtYQiz3UejGOHPFYQIQONpI+hQf70Wd9munAF/StXjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctyjVRbN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB6EC32786;
	Sun, 18 Aug 2024 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723997898;
	bh=wH/q17EcEM1yaX/QyJjRxmoKQTkpYh+1vI+c83h+e30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctyjVRbNpRe4lev974iUalRA4DqpO46Do2yiZunEtwRcmp3yo0ZHP6kHW3VrFU+FV
	 Y4I1tIa4iTf9P+SZzFQpCvf/mSt68b1PGIzWBBf0Z+ufxM/mL+y1jH3m1lCi2mBHSL
	 acxPNNUBHzs0zHkl/S1n+yKJ01mzije5DlWPLPdSwF5BrpoJLKHFzmff/ikaCrVp/b
	 I2TnEjvvw7LFo8cBqIRnoG3dvxplAtjz5Zro+jyajxgpZv/odJfk0uUCEX8gTazYhs
	 5lT1QL5ZE2i317aWsnN2AOryK3AvXWP5Aj5gQrSdtWmnHmNK7EVBmw9ENpRxhLL8dq
	 dE+NsgFLVlhJg==
Date: Sun, 18 Aug 2024 10:18:16 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, maz@kernel.org, mark.rutland@arm.com,
	saravanak@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Message-ID: <20240818161816.GA173148-robh@kernel.org>
References: <20240817074107.31153-2-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817074107.31153-2-ajones@ventanamicro.com>

On Sat, Aug 17, 2024 at 09:41:08AM +0200, Andrew Jones wrote:
> An 'msi-parent' property with a single entry and no accompanying
> '#msi-cells' property is considered the legacy definition as opposed
> to its definition after being expanded with commit 126b16e2ad98
> ("Docs: dt: add generic MSI bindings"). However, the legacy
> definition is completely compatible with the current definition and,
> since of_phandle_iterator_next() tolerates missing and present-but-
> zero *cells properties since commit e42ee61017f5 ("of: Let
> of_for_each_phandle fallback to non-negative cell_count"), there's no
> need anymore to special case the legacy definition in
> of_msi_get_domain().
> 
> Indeed, special casing has turned out to be harmful, because, as of
> commit 7c025238b47a ("dt-bindings: irqchip: Describe the IMX MU block
> as a MSI controller"), MSI controller DT bindings have started
> specifying '#msi-cells' as a required property (even when the value
> must be zero) as an effort to make the bindings more explicit. But,
> since the special casing of 'msi-parent' only uses the existence of
> '#msi-cells' for its heuristic, and not whether or not it's also
> nonzero, the legacy path is not taken. Furthermore, the path to
> support the new, broader definition isn't taken either since that
> path has been restricted to the platform-msi bus.
> 
> But, neither the definition of 'msi-parent' nor the definition of
> '#msi-cells' is platform-msi-specific (the platform-msi bus was just
> the first bus that needed '#msi-cells'), so remove both the special
> casing and the restriction. The code removal also requires changing
> to of_parse_phandle_with_optional_args() in order to ensure the
> legacy (but compatible) use of 'msi-parent' remains supported. This
> not only simplifies the code but also resolves an issue with PCI
> devices finding their MSI controllers on riscv, as the riscv,imsics
> binding requires '#msi-cells=<0>'.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> v3:
>  - switch to of_for_each_phandle() to further cleanup/simplify the
>    code [Rob]
> v2:
>  - switch to of_parse_phandle_with_optional_args() to ensure the
>    absence of #msi-cells means count=0
> 
>  drivers/of/irq.c | 35 ++++++++---------------------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index c94203ce65bb..b74a3f5fc4e2 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -709,8 +709,7 @@ struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
>   * @np: device node for @dev
>   * @token: bus type for this domain
>   *
> - * Parse the msi-parent property (both the simple and the complex
> - * versions), and returns the corresponding MSI domain.
> + * Parse the msi-parent property and returns the corresponding MSI domain.
>   *
>   * Returns: the MSI domain for this device (or NULL on failure).
>   */
> @@ -718,33 +717,15 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
>  				     struct device_node *np,
>  				     enum irq_domain_bus_token token)
>  {
> -	struct device_node *msi_np;
> +	struct of_phandle_iterator it;
>  	struct irq_domain *d;
> +	int err;
>  
> -	/* Check for a single msi-parent property */
> -	msi_np = of_parse_phandle(np, "msi-parent", 0);
> -	if (msi_np && !of_property_read_bool(msi_np, "#msi-cells")) {
> -		d = irq_find_matching_host(msi_np, token);
> -		if (!d)
> -			of_node_put(msi_np);
> -		return d;
> -	}
> -
> -	if (token == DOMAIN_BUS_PLATFORM_MSI) {
> -		/* Check for the complex msi-parent version */
> -		struct of_phandle_args args;
> -		int index = 0;
> -
> -		while (!of_parse_phandle_with_args(np, "msi-parent",
> -						   "#msi-cells",
> -						   index, &args)) {
> -			d = irq_find_matching_host(args.np, token);
> -			if (d)
> -				return d;
> -
> -			of_node_put(args.np);
> -			index++;
> -		}
> +	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
> +		d = irq_find_matching_host(it.node, token);
> +		if (d)
> +			return d;
> +		of_node_put(it.node);

Pretty sure the iterator does this for you. I can fixup when applying.

I plan to tag for stable too.

Shout if you disagree with either of these.

Rob

