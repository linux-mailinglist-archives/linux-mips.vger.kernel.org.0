Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 637587BB303
	for <lists+linux-mips@lfdr.de>; Fri,  6 Oct 2023 10:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbjJFIYz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Oct 2023 04:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbjJFIYy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Oct 2023 04:24:54 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 03081F4;
        Fri,  6 Oct 2023 01:24:53 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qog8g-0002lb-00; Fri, 06 Oct 2023 10:24:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5C3C2C0243; Fri,  6 Oct 2023 10:21:28 +0200 (CEST)
Date:   Fri, 6 Oct 2023 10:21:28 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] mips: dts: ingenic: Remove unneeded probe-type properties
Message-ID: <ZR/DiLuMVK6CUYIQ@alpha.franken.de>
References: <75d57f5e6dd25d5e8eff1260d289e905bb5cfad2.1693408196.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75d57f5e6dd25d5e8eff1260d289e905bb5cfad2.1693408196.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 30, 2023 at 05:11:55PM +0200, Geert Uytterhoeven wrote:
> The "probe-type" property was only needed when used with the
> (long obsolete) "direct-mapped" compatible value.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/mips/boot/dts/ingenic/jz4725b.dtsi | 1 -
>  arch/mips/boot/dts/ingenic/jz4770.dtsi  | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> index acbbe8c4664c110e..c5c5a094c37d2e08 100644
> --- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> @@ -366,7 +366,6 @@ bch: ecc-controller@130d0000 {
>  
>  	rom: memory@1fc00000 {
>  		compatible = "mtd-rom";
> -		probe-type = "map_rom";
>  		reg = <0x1fc00000 0x2000>;
>  
>  		bank-width = <4>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index 9c0099919db7aba9..504e895e916e57bf 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -461,7 +461,6 @@ usb_otg: usb@13440000 {
>  
>  	rom: memory@1fc00000 {
>  		compatible = "mtd-rom";
> -		probe-type = "map_rom";
>  		reg = <0x1fc00000 0x2000>;
>  
>  		bank-width = <4>;
> -- 
> 2.34.1
> 

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
