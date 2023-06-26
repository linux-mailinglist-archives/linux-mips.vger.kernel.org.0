Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A1673D89A
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jun 2023 09:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjFZHew (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Jun 2023 03:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjFZHeu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Jun 2023 03:34:50 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DC8B61AC;
        Mon, 26 Jun 2023 00:34:48 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qDgkA-0002xN-00; Mon, 26 Jun 2023 09:34:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AE9D7C02FD; Mon, 26 Jun 2023 09:19:25 +0200 (CEST)
Date:   Mon, 26 Jun 2023 09:19:25 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>, WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH V5 4/5] MIPS: Loongson64: DTS: Add RTC support to LS7A PCH
Message-ID: <20230626071925.GA4397@alpha.franken.de>
References: <cover.1685693501.git.zhoubinbin@loongson.cn>
 <25fa98ee2fac5955c68158ad7428900491981f2d.1685693501.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25fa98ee2fac5955c68158ad7428900491981f2d.1685693501.git.zhoubinbin@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 02, 2023 at 05:50:49PM +0800, Binbin Zhou wrote:
> The RTC module is now supported, enable it.
> 
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> index 2f45fce2cdc4..7c69e8245c2f 100644
> --- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> +++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> @@ -19,6 +19,13 @@ pic: interrupt-controller@10000000 {
>  			#interrupt-cells = <2>;
>  		};
>  
> +		rtc0: rtc@100d0100 {
> +			compatible = "loongson,ls7a-rtc";
> +			reg = <0 0x100d0100 0 0x78>;
> +			interrupt-parent = <&pic>;
> +			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		ls7a_uart0: serial@10080000 {
>  			compatible = "ns16550a";
>  			reg = <0 0x10080000 0 0x100>;
> -- 
> 2.39.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
