Return-Path: <linux-mips+bounces-13055-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD76DoTCfGmgOgIAu9opvQ
	(envelope-from <linux-mips+bounces-13055-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 15:39:00 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D0824BBA40
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 15:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA69E300DECF
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 14:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEA736A036;
	Fri, 30 Jan 2026 14:38:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F703191CE;
	Fri, 30 Jan 2026 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783904; cv=none; b=USrSSNB6+gqDdVNOI7ROqW7EBw4YRb16LPU2fhHlZmbWKmBKjBKXmMIg9E+WrncIjDz763f9d4/MQTMYUxtM/0+1GLe/9hVJWKpiRfwl31nZms5f0ADXlvHgFm5790qN/FZuWZZW6+imx+QZv6grU06teJK2uqgF+tu6t0zdATw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783904; c=relaxed/simple;
	bh=Vpj6epuo9fG8PKz4sZexbr8ZrNbxLueecrNLYcvVZnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMvk5oH835I8zsD0OHx+9YflDNhyEPOC6H7j/dXmou2VeT/IsZAoeOCnVE1fr5v0AI8s6QlRrW7KVS7PAtf/eztxs4pndZ5jwKbyVN4pbOsu07vv6RnCqu96EXUHX1MPjNoaTE1oaSP/f5+b6HQkatD1Pq+5eEJdqPUz1lJY+wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vlpdb-0007Et-00; Fri, 30 Jan 2026 15:38:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4E5E4C0907; Fri, 30 Jan 2026 15:35:49 +0100 (CET)
Date: Fri, 30 Jan 2026 15:35:49 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: dts: fix phy-related definition of
 LS7A GMAC
Message-ID: <aXzBxfYp13yZGRNd@alpha.franken.de>
References: <20260102155243.3639731-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102155243.3639731-1-zhengxingda@iscas.ac.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13055-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,alpha.franken.de:mid,iscas.ac.cn:email]
X-Rspamd-Queue-Id: D0824BBA40
X-Rspamd-Action: no action

On Fri, Jan 02, 2026 at 11:52:43PM +0800, Icenowy Zheng wrote:
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
> ---
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
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

applied to mips-next
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

