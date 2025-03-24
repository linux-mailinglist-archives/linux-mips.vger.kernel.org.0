Return-Path: <linux-mips+bounces-8333-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A92FA6DFA8
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 17:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F8ED7A5A88
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 16:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503DB263C88;
	Mon, 24 Mar 2025 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4C4eund"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A812263C7F;
	Mon, 24 Mar 2025 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833803; cv=none; b=kfLKer6rmtIj8rTIXmvcicpeESzIUyr4cAIPKKtO2m9ji+/ixsZ+hKixtNKKH8wf/05dYg6CKEyZzblseVeM+9Ht7SlKJ44S0XrBUE2x+83KPCBuq/dwYp4t6vXmhBEvXThV1PwQJmwk/lWP+wUbw7fMKSs/wo7jUeJceKiOOEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833803; c=relaxed/simple;
	bh=WvkpUcMN3vInzzbGLg8lMVtx9rUMhLM25v7I0hur7lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqXLAsP5G8hJE6lXTf9Xmp4InwcHm7V8nDlLfA6Em+0Nz+qlXXJIOGOvhCGNLeVn4+P+zj6wv9cD3OMWdHLjbWV3mWAsee637tVvruWkVL7Rn9rvqQX+WKymQ0hseOpUHNHZj5so5hRcu7DcCk5bXn8aUKM3aPsbM31pwGEfLdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4C4eund; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370F8C4CEDD;
	Mon, 24 Mar 2025 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742833802;
	bh=WvkpUcMN3vInzzbGLg8lMVtx9rUMhLM25v7I0hur7lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4C4eundvBapMbUkgTpHlunXo+CDTXYqi27do+EwQbqFJ2XFJL1FWrjfl/STnVFp+
	 J5Puw9UFKkvlov9VuV4QQAjpkr5Pt1KEMY1CzriDj9YsHDtF6q25Yz2gJzICJM8o7h
	 nvTYBzqs5GaTh0AuhXjnMmeAveDwvZa4ZHaU86V8APyIPML6YBWVHxxW5v+apw7m6e
	 sASknFsAUDZnbUHJqL8XZPBtRJYS9aSTenLjkC9Cgo31fSZpt1ybIAiat+DDWu1k90
	 CvIMJGXzp4EOZvCuGMkAtLW4YgZARedNUsXmWvOucPwso9Ph8b+vO+Lgp1+Pflyy5V
	 oiQltfj4rUY1g==
Date: Mon, 24 Mar 2025 11:30:01 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
Subject: Re: [PATCH net-next 02/13] dt-bindings: net: cdns,macb: allow
 tsu_clk without tx_clk
Message-ID: <20250324163001.GA272324-robh@kernel.org>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-2-537b7e37971d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-macb-v1-2-537b7e37971d@bootlin.com>

On Fri, Mar 21, 2025 at 08:09:33PM +0100, Théo Lebrun wrote:
> Allow providing tsu_clk without a tx_clk as both are optional.

Why? Is there some new h/w? Where's the compatible for it. Or this fixes 
some existing user? Which one?

> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> index 306d14958778df1a80a15e24d8ed5409704613be..36fcae1b20d757b3ebe615a9fc66068000ded56d 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -85,7 +85,7 @@ properties:
>      items:
>        - enum: [ ether_clk, hclk, pclk ]
>        - enum: [ hclk, pclk ]
> -      - const: tx_clk
> +      - enum: [ tx_clk, tsu_clk ]
>        - enum: [ rx_clk, tsu_clk ]
>        - const: tsu_clk
>  
> 
> -- 
> 2.48.1
> 

