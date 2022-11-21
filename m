Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F84D632A52
	for <lists+linux-mips@lfdr.de>; Mon, 21 Nov 2022 18:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiKURGr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Nov 2022 12:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiKURGq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Nov 2022 12:06:46 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E9CCDC72D0;
        Mon, 21 Nov 2022 09:06:43 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1oxAFl-00041n-03; Mon, 21 Nov 2022 18:06:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 20394C1C88; Mon, 21 Nov 2022 18:05:05 +0100 (CET)
Date:   Mon, 21 Nov 2022 18:05:05 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mips: dts: brcm: bcm7435: add "interrupt-names" for NAND
 controller
Message-ID: <20221121170505.GD3200@alpha.franken.de>
References: <20221108085032.4609-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221108085032.4609-1-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 08, 2022 at 09:50:32AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Second interrupt can be DMA or EDU one. Specify it explicitly using
> interrupt-names property. This matches documented binding.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  arch/mips/boot/dts/brcm/bcm7435.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
> index 8c001b944c8b..cfdf9804e126 100644
> --- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
> +++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
> @@ -422,6 +422,7 @@ nand: nand@41c800 {
>  			reg = <0x41c800 0x600>, <0x41d000 0x100>;
>  			interrupt-parent = <&hif_l2_intc>;
>  			interrupts = <24>, <4>;
> +			interrupt-names = "nand_ctlrdy", "flash_dma_done";
>  			status = "disabled";
>  		};
>  
> -- 
> 2.34.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
