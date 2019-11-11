Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A55F6C24
	for <lists+linux-mips@lfdr.de>; Mon, 11 Nov 2019 02:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfKKBOD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 Nov 2019 20:14:03 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:51682 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfKKBOD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 Nov 2019 20:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1573434838; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RkvKZSkNZr28wpzu05MKt1aQUXGxsl91Pokk2fWN4Qw=;
        b=QheMlhNY8AlqAU877HUpnGMawf1WXJKYU/RvJoWDclx03zy/8IqWxEsXQVcxAdythEXz0H
        QHbKHuHyPKbUjY28RI+l8fT6knUGnK8gOuKjZPMpgV2SzZAaw6jFUH7zrcgHpIZ5U3r5F+
        +1NUYctE4KovooPncb6Q+XGFaxtsAsM=
Date:   Mon, 11 Nov 2019 02:13:52 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2 v3] dt-bindings: clock: Add X1000 bindings.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, paul.burton@mips.com, sboyd@kernel.org,
        robh+dt@kernel.org, syq@debian.org, mark.rutland@arm.com
Message-Id: <1573434832.3.1@crapouillou.net>
In-Reply-To: <1573378102-72380-2-git-send-email-zhouyanjie@zoho.com>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
        <1573378102-72380-1-git-send-email-zhouyanjie@zoho.com>
        <1573378102-72380-2-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le dim., nov. 10, 2019 at 17:28, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Add the clock bindings for the X1000 Soc from Ingenic.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

> ---
>  .../devicetree/bindings/clock/ingenic,cgu.txt      |  1 +
>  include/dt-bindings/clock/x1000-cgu.h              | 44=20
> ++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 include/dt-bindings/clock/x1000-cgu.h

When you send a revised version of a patchset, it's common practice to=20
have a per-patch changelog right here. Then a cover letter is only=20
really needed for big patchsets that need extra information.

>=20
> diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt=20
> b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
> index ba5a442..75598e6 100644
> --- a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
> +++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
> @@ -11,6 +11,7 @@ Required properties:
>    * ingenic,jz4725b-cgu
>    * ingenic,jz4770-cgu
>    * ingenic,jz4780-cgu
> +  * ingenic,x1000-cgu
>  - reg : The address & length of the CGU registers.
>  - clocks : List of phandle & clock specifiers for clocks external to=20
> the CGU.
>    Two such external clocks should be specified - first the external=20
> crystal
> diff --git a/include/dt-bindings/clock/x1000-cgu.h=20
> b/include/dt-bindings/clock/x1000-cgu.h
> new file mode 100644
> index 00000000..bbaebaf
> --- /dev/null
> +++ b/include/dt-bindings/clock/x1000-cgu.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This header provides clock numbers for the ingenic,x1000-cgu DT=20
> binding.
> + *
> + * They are roughly ordered as:
> + *   - external clocks
> + *   - PLLs
> + *   - muxes/dividers in the order they appear in the x1000=20
> programmers manual
> + *   - gates in order of their bit in the CLKGR* registers
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_X1000_CGU_H__
> +#define __DT_BINDINGS_CLOCK_X1000_CGU_H__
> +
> +#define X1000_CLK_EXCLK		0
> +#define X1000_CLK_RTCLK		1
> +#define X1000_CLK_APLL		2
> +#define X1000_CLK_MPLL		3
> +#define X1000_CLK_SCLKA		4
> +#define X1000_CLK_CPUMUX	5
> +#define X1000_CLK_CPU		6
> +#define X1000_CLK_L2CACHE	7
> +#define X1000_CLK_AHB0		8
> +#define X1000_CLK_AHB2PMUX	9
> +#define X1000_CLK_AHB2		10
> +#define X1000_CLK_PCLK		11
> +#define X1000_CLK_DDR		12
> +#define X1000_CLK_MAC		13
> +#define X1000_CLK_MSCMUX	14
> +#define X1000_CLK_MSC0		15
> +#define X1000_CLK_MSC1		16
> +#define X1000_CLK_SSIPLL	17
> +#define X1000_CLK_SSIMUX	18
> +#define X1000_CLK_SFC		19
> +#define X1000_CLK_I2C0		20
> +#define X1000_CLK_I2C1		21
> +#define X1000_CLK_I2C2		22
> +#define X1000_CLK_UART0		23
> +#define X1000_CLK_UART1		24
> +#define X1000_CLK_UART2		25
> +#define X1000_CLK_SSI		26
> +#define X1000_CLK_PDMA		27
> +
> +#endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
> --
> 2.7.4
>=20
>=20

=

