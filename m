Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DC4344DC7
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhCVRxb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 22 Mar 2021 13:53:31 -0400
Received: from aposti.net ([89.234.176.197]:54630 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230231AbhCVRxZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Mar 2021 13:53:25 -0400
Date:   Mon, 22 Mar 2021 17:53:07 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 01/10] pinctrl: Ingenic: Add missing pins to the JZ4770
 MAC MII group.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <JOTDQQ.MOZVXC128CJA2@crapouillou.net>
In-Reply-To: <1615975084-68203-2-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1615975084-68203-2-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le mer. 17 mars 2021 à 17:57, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> The MII group of JZ4770's MAC should have 7 pins, add missing
> pins to the MII group.
> 
> Fixes: 5de1a73e78ed ("Pinctrl: Ingenic: Add missing parts for JZ4770 
> and JZ4780.")

This fixes a commit that was introduced in an older kernel (than the 
one in -rc phase). Therefore you need to Cc linux-stable. Like this:

Cc: <stable@vger.kernel.org> # v5.0

> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

With that said:

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v2:
>     New patch.
> 
>     v2->v3:
>     Add fixes tag.
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
> +};
> 
>  static const struct group_desc jz4770_groups[] = {
>  	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
> --
> 2.7.4
> 


