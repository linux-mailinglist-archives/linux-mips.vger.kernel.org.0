Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00001338E46
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 14:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhCLNFo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 12 Mar 2021 08:05:44 -0500
Received: from aposti.net ([89.234.176.197]:42494 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231613AbhCLNFX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 08:05:23 -0500
Date:   Fri, 12 Mar 2021 13:05:05 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/6] pinctrl: Ingenic: Add missing pins to the JZ4770
 MAC MII group.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <HOXUPQ.U0CJV6YXUOYX2@crapouillou.net>
In-Reply-To: <1615476112-113101-2-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1615476112-113101-2-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le jeu. 11 mars 2021 à 23:21, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> The MII group of JZ4770's MAC should have 7 pins, add missing
> pins to the MII group.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

No Fixes: tag?
And if the bug wasn't introduced in 5.12-rc1 you'll need to Cc 
linux-stable as well.

> ---
> 
> Notes:
>     v2:
>     New patch.
> 
>  drivers/pinctrl/pinctrl-ingenic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index f274612..05dfa0a 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -667,7 +667,9 @@ static int jz4770_pwm_pwm7_pins[] = { 0x6b, };
>  static int jz4770_mac_rmii_pins[] = {
>  	0xa9, 0xab, 0xaa, 0xac, 0xa5, 0xa4, 0xad, 0xae, 0xa6, 0xa8,
>  };
> -static int jz4770_mac_mii_pins[] = { 0xa7, 0xaf, };
> +static int jz4770_mac_mii_pins[] = {
> +	0x7b, 0x7a, 0x7d, 0x7c, 0xa7, 0x24, 0xaf,

Maybe list them in order?

And are you sure that's the whole list? The PM (section 12.2 in 
jz4770_pm_part3.pdf) lists more pins.

Cheers,
-Paul

> +};
> 
>  static const struct group_desc jz4770_groups[] = {
>  	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
> --
> 2.7.4
> 


