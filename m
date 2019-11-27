Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2543D10B444
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 18:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfK0RTS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Nov 2019 12:19:18 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:57226 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfK0RTS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Nov 2019 12:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1574875156; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qm4Bp6xEH4gzTSGf8XJZFyOKVD9Yc5lDueukFVsJXso=;
        b=Mi2dC0jlfct8iYYCs7ItSb/0U2+YIl19k4On1OhvNLogkankzwOreiyd7g0mcWHjxkDyEx
        g01ky6cTtGskvSI9EM/3RkMVmo0C+W3Yg+nEBki/9budh5NsuUBLaXdNyRqgQK0rONa7Er
        HTeoT02ffCoO5+/1x/I2Wzlu90rJ2MM=
Date:   Wed, 27 Nov 2019 18:19:08 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 4/5] dt-bindings: clock: Add USB OTG clock for X1000.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <1574875148.3.3@crapouillou.net>
In-Reply-To: <1574825576-91028-5-git-send-email-zhouyanjie@zoho.com>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
        <1574825576-91028-5-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le mer., nov. 27, 2019 at 11:32, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Add the USB OTC clock bindings for the X1000 Soc from Ingenic.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  include/dt-bindings/clock/x1000-cgu.h | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>=20
> diff --git a/include/dt-bindings/clock/x1000-cgu.h=20
> b/include/dt-bindings/clock/x1000-cgu.h
> index bbaebaf..c401fce 100644
> --- a/include/dt-bindings/clock/x1000-cgu.h
> +++ b/include/dt-bindings/clock/x1000-cgu.h
> @@ -29,16 +29,17 @@
>  #define X1000_CLK_MSCMUX	14
>  #define X1000_CLK_MSC0		15
>  #define X1000_CLK_MSC1		16
> -#define X1000_CLK_SSIPLL	17
> -#define X1000_CLK_SSIMUX	18
> -#define X1000_CLK_SFC		19
> -#define X1000_CLK_I2C0		20
> -#define X1000_CLK_I2C1		21
> -#define X1000_CLK_I2C2		22
> -#define X1000_CLK_UART0		23
> -#define X1000_CLK_UART1		24
> -#define X1000_CLK_UART2		25
> -#define X1000_CLK_SSI		26
> -#define X1000_CLK_PDMA		27

You can't do that. These macros are ABI now, since they are used in the=20
devicetree. Just use the next valid number for your OTG clock.

Cheers,
-Paul

> +#define X1000_CLK_OTG		17
> +#define X1000_CLK_SSIPLL	18
> +#define X1000_CLK_SSIMUX	19
> +#define X1000_CLK_SFC		20
> +#define X1000_CLK_I2C0		21
> +#define X1000_CLK_I2C1		22
> +#define X1000_CLK_I2C2		23
> +#define X1000_CLK_UART0		24
> +#define X1000_CLK_UART1		25
> +#define X1000_CLK_UART2		26
> +#define X1000_CLK_SSI		27
> +#define X1000_CLK_PDMA		28
>=20
>  #endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
> --
> 2.7.4
>=20
>=20

=

