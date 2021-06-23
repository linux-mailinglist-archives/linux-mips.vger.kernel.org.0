Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02883B2057
	for <lists+linux-mips@lfdr.de>; Wed, 23 Jun 2021 20:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhFWSgr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 23 Jun 2021 14:36:47 -0400
Received: from aposti.net ([89.234.176.197]:56938 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229523AbhFWSgr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 23 Jun 2021 14:36:47 -0400
Date:   Wed, 23 Jun 2021 19:34:15 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/3] MIPS: Ingenic: Add MAC syscon nodes for Ingenic
 SoCs.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <3L36VQ.1XFKT5OGBXT2@crapouillou.net>
In-Reply-To: <1624377338-75384-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624377338-75384-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624377338-75384-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le mar., juin 22 2021 at 23:55:37 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add MAC syscon nodes for X1000 SoC and X1830 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> Acked-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v1->v2:
>     No change.
> 
>  arch/mips/boot/dts/ingenic/x1000.dtsi | 7 +++++++
>  arch/mips/boot/dts/ingenic/x1830.dtsi | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi 
> b/arch/mips/boot/dts/ingenic/x1000.dtsi
> index aac9ded..dec7909 100644
> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> @@ -80,6 +80,11 @@
> 
>  			status = "disabled";
>  		};
> +
> +		mac_phy_ctrl: mac-phy-ctrl@e8 {
> +			compatible = "syscon";
> +			reg = <0xe8 0x4>;
> +		};

I acked this patch already, but you do need to update the CGU binding 
documentation as well.

-Paul

>  	};
> 
>  	ost: timer@12000000 {
> @@ -347,6 +352,8 @@
>  		clocks = <&cgu X1000_CLK_MAC>;
>  		clock-names = "stmmaceth";
> 
> +		mode-reg = <&mac_phy_ctrl>;
> +
>  		status = "disabled";
> 
>  		mdio: mdio {
> diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi 
> b/arch/mips/boot/dts/ingenic/x1830.dtsi
> index 59ca3a8..215257f 100644
> --- a/arch/mips/boot/dts/ingenic/x1830.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
> @@ -73,6 +73,11 @@
> 
>  			status = "disabled";
>  		};
> +
> +		mac_phy_ctrl: mac-phy-ctrl@e8 {
> +			compatible = "syscon";
> +			reg = <0xe8 0x4>;
> +		};
>  	};
> 
>  	ost: timer@12000000 {
> @@ -336,6 +341,8 @@
>  		clocks = <&cgu X1830_CLK_MAC>;
>  		clock-names = "stmmaceth";
> 
> +		mode-reg = <&mac_phy_ctrl>;
> +
>  		status = "disabled";
> 
>  		mdio: mdio {
> --
> 2.7.4
> 


