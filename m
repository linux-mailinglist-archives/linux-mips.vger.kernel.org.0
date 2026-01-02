Return-Path: <linux-mips+bounces-12719-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D2BCEF6F8
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 23:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B007A300EA2D
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 22:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DACF2D5925;
	Fri,  2 Jan 2026 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="hfYSmihR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oRwf2bX6"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26922405ED;
	Fri,  2 Jan 2026 22:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767393441; cv=none; b=L7dKkbpLeSxVNNfGHg3FtLVcpAzskZAVTuEnYj0WlknY5V72BpJ74Ya1cgG2tp49fwE3Q/B6W/wCd8el8dBpJZeg6G2VnlL+9vEtaclKNKkdn4LxMrRapbJRb9Hl/D2mvWZOGPnpBG1fZHG5CjnVuSqg6JMX1Zyr8myhtkbMKsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767393441; c=relaxed/simple;
	bh=tsTJJQJoqy93O9/uvm41/seu3eu3Du6oDAogevtOBnA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IwLfCQI2tZyYpORnZIZQ8YQm8ES6NyQE3yg8UAHE9cy1CKde/Cda6I9lHSrz2ZyMTJkuveufKsz3bi1ML0geO/gKrXnCApmNLVILYXMottK4Oewh3BJr3J9snyjXq9X4qz986HfYCK5ffZPV05XJUFaz1M/VPzwRaizg9gYUWLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=hfYSmihR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oRwf2bX6; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 027D7EC011D;
	Fri,  2 Jan 2026 17:37:18 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Fri, 02 Jan 2026 17:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767393437;
	 x=1767479837; bh=+8ctVAnu0yjFr1RzDJ3byhbEvs4eon+8GJcR3h7Onqs=; b=
	hfYSmihRuX0g2f2Ksuu7kL6FYN5+qX1QH8M1wdw4ERZLGyDFimU+ZBCrWYDW0Ow2
	NDOFnex57VTszrcEpqRmiBDQSJbBYJZvLj97g4SUxFaQ/OSUKMdswMn34Ep8hg32
	eO5s0yfLMtuCdlytBwHsdxR1HExMANHIcMeUsdAey9RRcBDtKfqAmTbpTjYADFHY
	WaIYJ9DaaU3xpNEOZ0OruJshirFcsXuerj35Akt/7gdRt5Ie547g4X0CC76cvfPD
	tFlaX+mLjTuR1a8q8AwFE0VSQgXZmBckGgOIDSNvhvbjsOYZcEKHIzE54LkiPTYs
	i7OaXm+PNX1DELo258ThQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767393437; x=
	1767479837; bh=+8ctVAnu0yjFr1RzDJ3byhbEvs4eon+8GJcR3h7Onqs=; b=o
	Rwf2bX6c/BBdCGz4DpEpHAvFBglqYnVGMqkaHYEU4E/43uYplZikRd4ec6Ybdar4
	/dNA+2vXiod1GElE8mPTdbKTlKM+EtI8gXjYC6tZrwTc4rvyEmixKLzZLugYcEsz
	ifS5vkFgISFCm6B0YaJcFvJ6PgyKRI5bPErwxXbGWlrCXj6lhNyoGMAkrLK7NBXf
	OFe2nNgvZOqx3pwXmHkp/bDqljN6+A/oZWUeF2Gn8bRCMxnmzsACHcc7AU1SSK+v
	HRGqU+ZYNbBb53+YEqUj73FY2Ut1m8j0wOL4L2KuLsBVZFyeZQb5+Do23Ui8JVsi
	ozrZ5SFas1nrJ4jKuy1Lw==
X-ME-Sender: <xms:nUhYaa3iFzL-9x_A2xEad9zBDAg7C19LuNN4TWy8BCqM6RmsY8fhVA>
    <xme:nUhYaX7F3aLFQ4VkO-4-VctcHdcRKfShlo3RRp-sAhn34K87pbG4gG7NNJBWed8bJ
    JWoskob9Scz8R33iA5NGSfh0a8xiBPBqklQtUcTws8pJ63nyIigkkk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekleekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefhtefhuddtieegleeuiedttdehheduveffjeettdekvdeuiedt
    udejfeeijeeifeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
    thhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhguse
    grlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopeiihhgvnhhggihinhhguggr
    sehishgtrghsrdgrtgdrtghnpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosg
    hhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:nUhYaZjHDWhTNhvJkxfqIFPwQJEa9RXsYUl3o_qKX0NnwB93vtJ48w>
    <xmx:nUhYaSbFoUdxwY1LYThiFVPmINNA2tbPhkj1cK0Te35ArjhCbp0Ufw>
    <xmx:nUhYaW9St7wir5AiIHOYEUl7mG8Z5Wptkb81rTr2Q8W23BiBOBzhQg>
    <xmx:nUhYacNp_JT4dqBTkbO_fV388zuJGQj9NKLI3g6jZMa-Q64X9C9MnQ>
    <xmx:nUhYaVEvm4Tp6VO-bMC0iy7YKOSIIYpREfLegaOzNuIRssJLIYt7JpBW>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 041D52CE0072; Fri,  2 Jan 2026 17:37:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A-FbFKnD6fMB
Date: Fri, 02 Jan 2026 22:36:56 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Message-Id: <d1a0e0ca-22d3-4d58-beb1-88eae19c9a2e@app.fastmail.com>
In-Reply-To: <20260102155243.3639731-1-zhengxingda@iscas.ac.cn>
References: <20260102155243.3639731-1-zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH] MIPS: Loongson64: dts: fix phy-related definition of LS7A GMAC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Fri, 2 Jan 2026, at 3:52 PM, Icenowy Zheng wrote:
> Currently the LS7A GMAC device tree node lacks a proper phy-handle
> property pointing to the PHY node.
>
> In addition, the phy-mode property specifies "rgmii" without any
> internal delay information, which means the board trace needs to add 2ns
> delay to the RGMII data lines; but that isn't known to happen on any
> Loongson board. The ACPI-based initialization codepath, which is used on
> LoongArch-based 3A5000 + 7A1000 hardwares, specifies "rgmii-id" phy
> mode, which should be the one we are using.
>
> Add the lacking phy-handle property and set proper phy-mode.
>
> Tested on a LS3A4000_7A1000_NUC_BOARD_V2.1 board with YT8521S PHY.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Good catch! This with fine with realtek phy chips but YT8521S seems
to be picky.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Also maybe:

Cc: stable@vger.kernel.org

Given those boards rely on built-in DT.

Thanks

> ---
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi 
> b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> index ee71045883e7e..6dee85909f5a6 100644
> --- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> +++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> @@ -199,7 +199,8 @@ gmac@3,0 {
>  					     <13 IRQ_TYPE_LEVEL_HIGH>;
>  				interrupt-names = "macirq", "eth_lpi";
>  				interrupt-parent = <&pic>;
> -				phy-mode = "rgmii";
> +				phy-mode = "rgmii-id";
> +				phy-handle = <&phy0>;
>  				mdio {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -222,7 +223,8 @@ gmac@3,1 {
>  					     <15 IRQ_TYPE_LEVEL_HIGH>;
>  				interrupt-names = "macirq", "eth_lpi";
>  				interrupt-parent = <&pic>;
> -				phy-mode = "rgmii";
> +				phy-mode = "rgmii-id";
> +				phy-handle = <&phy1>;
>  				mdio {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> -- 
> 2.52.0

-- 
- Jiaxun

