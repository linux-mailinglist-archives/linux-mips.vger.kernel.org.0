Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C0C3C79BF
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jul 2021 00:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbhGMWhj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Jul 2021 18:37:39 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:36732 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbhGMWhj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Jul 2021 18:37:39 -0400
Received: by mail-il1-f179.google.com with SMTP id j5so7238222ilk.3;
        Tue, 13 Jul 2021 15:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MSpVDdjqrdKEACiUcRPjy60421QiTWxnM6Nv9gHM6wY=;
        b=Mv+jEAUw4W/FqGmDKWOwy8YX7CRs7+X1chLzCJzdoETkwG51NtmgfKKqBUR6p3DAAj
         n92ixAIT2W8N+VAoVriGw/uYFzom2AbFheDjwPEvIwFJo7XGv5/KAws77tuV91ypRWC+
         7k1YpVXFtgiZ+OClTc4FRujIVsosCmmxziKHyT1RV5uSyeaanxgOvu9zuk2jEl367dyC
         ixrEo5oAB6MOxx2MnrNa9pbibV70BCiRi2QxPQw19xTjoG253t42wTWmGpL67UkLTgrz
         Hon1d/z/8xFLt8cYufD6DwSpT6UfPLW7JLjenUONNullCC5QXe6W5Qqpla0zqtPOs+W3
         gkow==
X-Gm-Message-State: AOAM533wdiKU/MrGP91aapnVhriVAT2SF2xsB18pf3C2Clj4euhtrYY/
        5XZXJK9+kXb2+HvC71CjzA==
X-Google-Smtp-Source: ABdhPJztQrp4XrTfokmTBuOkLRxzwLyi96owtmbuyUFlJa6C+A/GJH9q5TB2oBwuCMMltSFkJ5WYFw==
X-Received: by 2002:a92:6f07:: with SMTP id k7mr4629322ilc.276.1626215687443;
        Tue, 13 Jul 2021 15:34:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r4sm181262ilb.42.2021.07.13.15.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 15:34:46 -0700 (PDT)
Received: (nullmailer pid 973017 invoked by uid 1000);
        Tue, 13 Jul 2021 22:34:42 -0000
Date:   Tue, 13 Jul 2021 16:34:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: Re: [PATCH v6 08/11] dt-bindings: clock: Add JZ4775 clock bindings.
Message-ID: <20210713223442.GA968962@robh.at.kernel.org>
References: <1624981102-26248-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1624981102-26248-9-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1624981102-26248-9-git-send-email-zhouyanjie@wanyeetech.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 29, 2021 at 11:38:19PM +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add the clock bindings for the JZ4775 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v5:
>     New patch.
>     
>     v5->v6:
>     No change.
> 
>  include/dt-bindings/clock/jz4775-cgu.h | 59 ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 include/dt-bindings/clock/jz4775-cgu.h
> 
> diff --git a/include/dt-bindings/clock/jz4775-cgu.h b/include/dt-bindings/clock/jz4775-cgu.h
> new file mode 100644
> index 00000000..8c2af69
> --- /dev/null
> +++ b/include/dt-bindings/clock/jz4775-cgu.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license please.

> +/*
> + * This header provides clock numbers for the ingenic,jz4775-cgu DT binding.
> + *
> + * They are roughly ordered as:
> + *   - external clocks
> + *   - PLLs
> + *   - muxes/dividers in the order they appear in the jz4775 programmers manual
> + *   - gates in order of their bit in the CLKGR* registers

Can one convert index to register/bit offset? If you can avoid made up 
numbers and use something that corresponds to the h/w, that's preferred.

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
> 
