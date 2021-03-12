Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695BE338EDB
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 14:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhCLNdV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 12 Mar 2021 08:33:21 -0500
Received: from aposti.net ([89.234.176.197]:43538 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231511AbhCLNdD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 08:33:03 -0500
Date:   Fri, 12 Mar 2021 13:32:50 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/6] pinctrl: Ingenic: Adjust the sequence of X1830 SSI
 pin groups.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <QYYUPQ.N7I5SFVLO0943@crapouillou.net>
In-Reply-To: <1615476112-113101-4-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1615476112-113101-4-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu. 11 mars 2021 à 23:21, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Adjust the sequence of X1830's SSI related codes to make it consistent
> with other Ingenic SoCs.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v2:
>     New patch.
> 
>  drivers/pinctrl/pinctrl-ingenic.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 0a88aab..607ba0b 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -1473,16 +1473,16 @@ static int x1830_ssi0_gpc_pins[] = { 0x4d, };
>  static int x1830_ssi0_ce0_pins[] = { 0x50, };
>  static int x1830_ssi0_ce1_pins[] = { 0x4e, };
>  static int x1830_ssi1_dt_c_pins[] = { 0x53, };
> -static int x1830_ssi1_dr_c_pins[] = { 0x54, };
> -static int x1830_ssi1_clk_c_pins[] = { 0x57, };
> -static int x1830_ssi1_gpc_c_pins[] = { 0x55, };
> -static int x1830_ssi1_ce0_c_pins[] = { 0x58, };
> -static int x1830_ssi1_ce1_c_pins[] = { 0x56, };
>  static int x1830_ssi1_dt_d_pins[] = { 0x62, };
> +static int x1830_ssi1_dr_c_pins[] = { 0x54, };
>  static int x1830_ssi1_dr_d_pins[] = { 0x63, };
> +static int x1830_ssi1_clk_c_pins[] = { 0x57, };
>  static int x1830_ssi1_clk_d_pins[] = { 0x66, };
> +static int x1830_ssi1_gpc_c_pins[] = { 0x55, };
>  static int x1830_ssi1_gpc_d_pins[] = { 0x64, };
> +static int x1830_ssi1_ce0_c_pins[] = { 0x58, };
>  static int x1830_ssi1_ce0_d_pins[] = { 0x67, };
> +static int x1830_ssi1_ce1_c_pins[] = { 0x56, };
>  static int x1830_ssi1_ce1_d_pins[] = { 0x65, };
>  static int x1830_mmc0_1bit_pins[] = { 0x24, 0x25, 0x20, };
>  static int x1830_mmc0_4bit_pins[] = { 0x21, 0x22, 0x23, };
> --
> 2.7.4
> 


