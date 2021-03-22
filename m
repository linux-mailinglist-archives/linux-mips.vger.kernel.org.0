Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02AC344E00
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 19:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhCVSB2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 22 Mar 2021 14:01:28 -0400
Received: from aposti.net ([89.234.176.197]:56252 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231182AbhCVSBT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Mar 2021 14:01:19 -0400
Date:   Mon, 22 Mar 2021 18:01:04 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 05/10] dt-bindings: pinctrl: Add bindings for new
 Ingenic SoCs.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <S1UDQQ.OKUWFQAJJIVA2@crapouillou.net>
In-Reply-To: <1615975084-68203-6-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1615975084-68203-6-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer. 17 mars 2021 à 17:57, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add the pinctrl bindings for the JZ4730 SoC, the JZ4750 SoC,
> the JZ4755 SoC, the JZ4775 SoC and the X2000 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v2:
>     New patch.
> 
>     v2->v3:
>     No change.
> 
>  .../bindings/pinctrl/ingenic,pinctrl.yaml          | 23 
> ++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git 
> a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml 
> b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> index 44c04d1..60604fc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> @@ -17,10 +17,12 @@ description: >
>    naming scheme "PxN" where x is a character identifying the GPIO 
> port with
>    which the pin is associated and N is an integer from 0 to 31 
> identifying the
>    pin within that GPIO port. For example PA0 is the first pin in 
> GPIO port A,
> -  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 and 
> the X1830
> -  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The 
> JZ4760, the
> -  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a total 
> of 192
> -  pins.
> +  and PB31 is the last pin in GPIO port B. The JZ4730, the JZ4740, 
> the X1000
> +  and the X1830 contains 4 GPIO ports, PA to PD, for a total of 128 
> pins. The
> +  X2000 contains 5 GPIO ports, PA to PE, for a total of 160 pins. 
> The JZ4750,
> +  the JZ4755 the JZ4760, the JZ4770 and the JZ4780 contains 6 GPIO 
> ports, PA
> +  to PF, for a total of 192 pins. The JZ4775 contains 7 GPIO ports, 
> PA to PG,
> +  for a total of 224 pins.

While we're at it, the JZ4725B has also 4 GPIO ports.

> 
>  maintainers:
>    - Paul Cercueil <paul@crapouillou.net>
> @@ -32,20 +34,28 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - ingenic,jz4730-pinctrl
>            - ingenic,jz4740-pinctrl
>            - ingenic,jz4725b-pinctrl
> +          - ingenic,jz4750-pinctrl
> +          - ingenic,jz4755-pinctrl
>            - ingenic,jz4760-pinctrl
>            - ingenic,jz4770-pinctrl
> +          - ingenic,jz4775-pinctrl
>            - ingenic,jz4780-pinctrl
>            - ingenic,x1000-pinctrl
>            - ingenic,x1500-pinctrl
>            - ingenic,x1830-pinctrl
> +          - ingenic,x2000-pinctrl
>        - items:
>            - const: ingenic,jz4760b-pinctrl
>            - const: ingenic,jz4760-pinctrl
>        - items:
>            - const: ingenic,x1000e-pinctrl
>            - const: ingenic,x1000-pinctrl
> +      - items:
> +          - const: ingenic,x2000e-pinctrl
> +          - const: ingenic,x2000-pinctrl
> 
>    reg:
>      maxItems: 1
> @@ -62,14 +72,19 @@ patternProperties:
>      properties:
>        compatible:
>          enum:
> +          - ingenic,jz4730-gpio
>            - ingenic,jz4740-gpio
>            - ingenic,jz4725b-gpio
> +          - ingenic,jz4750-gpio
> +          - ingenic,jz4755-gpio
>            - ingenic,jz4760-gpio
>            - ingenic,jz4770-gpio
> +          - ingenic,jz4775-gpio
>            - ingenic,jz4780-gpio
>            - ingenic,x1000-gpio
>            - ingenic,x1500-gpio
>            - ingenic,x1830-gpio
> +          - ingenic,x2000-gpio
> 
>        reg:
>          items:
> --
> 2.7.4
> 


