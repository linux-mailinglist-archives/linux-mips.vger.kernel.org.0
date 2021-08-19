Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8F23F168B
	for <lists+linux-mips@lfdr.de>; Thu, 19 Aug 2021 11:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237540AbhHSJsV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 19 Aug 2021 05:48:21 -0400
Received: from aposti.net ([89.234.176.197]:43038 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236292AbhHSJsV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Aug 2021 05:48:21 -0400
Date:   Thu, 19 Aug 2021 11:47:36 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 08/11] dt-bindings: clock: Add JZ4775 clock bindings.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <C7Z2YQ.GPU7ZNCXXLGH1@crapouillou.net>
In-Reply-To: <1627119286-125821-9-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1627119286-125821-9-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam., juil. 24 2021 at 17:34:43 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add the clock bindings for the JZ4775 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v5:
>     New patch.
> 
>     v5->v6:
>     No change.
> 
>     v6->v7:
>     Change to dual license.
> 
>  include/dt-bindings/clock/jz4775-cgu.h | 59 
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 include/dt-bindings/clock/jz4775-cgu.h
> 
> diff --git a/include/dt-bindings/clock/jz4775-cgu.h 
> b/include/dt-bindings/clock/jz4775-cgu.h
> new file mode 100644
> index 00000000..4625418
> --- /dev/null
> +++ b/include/dt-bindings/clock/jz4775-cgu.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +/*
> + * This header provides clock numbers for the ingenic,jz4775-cgu DT 
> binding.
> + *
> + * They are roughly ordered as:
> + *   - external clocks
> + *   - PLLs
> + *   - muxes/dividers in the order they appear in the jz4775 
> programmers manual
> + *   - gates in order of their bit in the CLKGR* registers
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_JZ4775_CGU_H__
> +#define __DT_BINDINGS_CLOCK_JZ4775_CGU_H__
> +
> +#define JZ4775_CLK_EXCLK		0
> +#define JZ4775_CLK_RTCLK		1
> +#define JZ4775_CLK_APLL			2
> +#define JZ4775_CLK_MPLL			3
> +#define JZ4775_CLK_OTGPHY		4
> +#define JZ4775_CLK_SCLKA		5
> +#define JZ4775_CLK_UHC			6
> +#define JZ4775_CLK_UHCPHY		7
> +#define JZ4775_CLK_CPUMUX		8
> +#define JZ4775_CLK_CPU			9
> +#define JZ4775_CLK_L2CACHE		10
> +#define JZ4775_CLK_AHB0			11
> +#define JZ4775_CLK_AHB2PMUX		12
> +#define JZ4775_CLK_AHB2			13
> +#define JZ4775_CLK_PCLK			14
> +#define JZ4775_CLK_DDR			15
> +#define JZ4775_CLK_VPU			16
> +#define JZ4775_CLK_OTG			17
> +#define JZ4775_CLK_EXCLK_DIV2	18
> +#define JZ4775_CLK_I2S			19
> +#define JZ4775_CLK_LCD			20
> +#define JZ4775_CLK_MSCMUX		21
> +#define JZ4775_CLK_MSC0			22
> +#define JZ4775_CLK_MSC1			23
> +#define JZ4775_CLK_MSC2			24
> +#define JZ4775_CLK_SSI			25
> +#define JZ4775_CLK_CIM0			26
> +#define JZ4775_CLK_CIM1			27
> +#define JZ4775_CLK_PCM			28
> +#define JZ4775_CLK_BCH			29
> +#define JZ4775_CLK_EXCLK_DIV512	30
> +#define JZ4775_CLK_RTC			31
> +#define JZ4775_CLK_NEMC			32
> +#define JZ4775_CLK_I2C0			33
> +#define JZ4775_CLK_I2C1			34
> +#define JZ4775_CLK_I2C2			35
> +#define JZ4775_CLK_SADC			36
> +#define JZ4775_CLK_UART0		37
> +#define JZ4775_CLK_UART1		38
> +#define JZ4775_CLK_UART2		39
> +#define JZ4775_CLK_UART3		40
> +#define JZ4775_CLK_PDMA			41
> +#define JZ4775_CLK_MAC			42
> +
> +#endif /* __DT_BINDINGS_CLOCK_JZ4775_CGU_H__ */
> --
> 2.7.4
> 


