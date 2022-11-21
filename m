Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E55632A55
	for <lists+linux-mips@lfdr.de>; Mon, 21 Nov 2022 18:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbiKURGr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Nov 2022 12:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiKURGq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Nov 2022 12:06:46 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB6FAC7689;
        Mon, 21 Nov 2022 09:06:43 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1oxAFl-00041n-02; Mon, 21 Nov 2022 18:06:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1099AC1C88; Mon, 21 Nov 2022 18:04:42 +0100 (CET)
Date:   Mon, 21 Nov 2022 18:04:42 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] mips: dts: bcm63268: add TWD block timer
Message-ID: <20221121170441.GC3200@alpha.franken.de>
References: <20221113090904.8784-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221113090904.8784-1-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 13, 2022 at 10:09:04AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> BCM63268 TWD contains block with 3 timers. Add binding for it.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> V2: Add missing ';'
> ---
>  arch/mips/boot/dts/brcm/bcm63268.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
> index 8926417a8fbc..c663efce91cf 100644
> --- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
> +++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
> @@ -110,6 +110,11 @@ timer-mfd@10000080 {
>  			reg = <0x10000080 0x30>;
>  			ranges = <0x0 0x10000080 0x30>;
>  
> +			timer@0 {
> +				compatible = "brcm,bcm6345-timer";
> +				reg = <0x0 0x1c>;
> +			};
> +
>  			wdt: watchdog@1c {
>  				compatible = "brcm,bcm7038-wdt";
>  				reg = <0x1c 0xc>;
> -- 
> 2.34.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
