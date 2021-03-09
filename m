Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFE6331F4A
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 07:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhCIGd0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 01:33:26 -0500
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:43762 "EHLO
        out28-100.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhCIGdP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 01:33:15 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1749291|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0121347-0.000267848-0.987597;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047201;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.JiMa0r5_1615271589;
Received: from 192.168.1.112(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JiMa0r5_1615271589)
          by smtp.aliyun-inc.com(10.147.42.198);
          Tue, 09 Mar 2021 14:33:10 +0800
Subject: Re: [PATCH 0/6] clk: Ingenic JZ4760(B) support
To:     Paul Cercueil <paul@crapouillou.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20210307141759.30426-1-paul@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <feef3ac6-1df3-1e81-950d-e11886ee7ae2@wanyeetech.com>
Date:   Tue, 9 Mar 2021 14:31:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210307141759.30426-1-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/3/7 下午10:17, Paul Cercueil wrote:
> Hi,
>
> Here are a set of patches to add support for the Ingenic JZ4760(B) SoCs.
>
> One thing to note is that the ingenic,jz4760-tcu is undocumented for now,
> as I will update the TCU documentation in a different patchset.
>
> Zhou: the CGU code now supports overriding the PLL M/N/OD calc
> algorithm, please tell me if it works for you.


After set "od = 1;", the overriding works, but I think we still need 
some further improvements related to OD,

because there is no OD bits in the I2S PLL, this will cause error in 
"ingenic_pll_recalc_rate()", and may cause

"ingenic_pll_calc()" to also have error(if we will introduce support for 
non 1 od values).


I think maybe we can add codes to detect if there is an 
"pll_od_encoding". If it is NULL, it means no OD bits, then

do some corresponding processing( for example, setting corresponding 
variable to 1) to ensure proper calculation.


Thanks and best regards!


> Cheers,
> -Paul
>
> Paul Cercueil (6):
>    dt-bindings: clock: ingenic: Add ingenic,jz4760{,b}-cgu compatibles
>    clk: Support bypassing dividers
>    clk: ingenic: Read bypass register only when there is one
>    clk: ingenic: Remove pll_info.no_bypass_bit
>    clk: ingenic: Support overriding PLLs M/N/OD calc algorithm
>    clk: ingenic: Add support for the JZ4760
>
>   .../bindings/clock/ingenic,cgu.yaml           |   4 +
>   drivers/clk/ingenic/Kconfig                   |  10 +
>   drivers/clk/ingenic/Makefile                  |   1 +
>   drivers/clk/ingenic/cgu.c                     |  92 ++--
>   drivers/clk/ingenic/cgu.h                     |  12 +-
>   drivers/clk/ingenic/jz4725b-cgu.c             |  12 +-
>   drivers/clk/ingenic/jz4740-cgu.c              |  12 +-
>   drivers/clk/ingenic/jz4760-cgu.c              | 433 ++++++++++++++++++
>   drivers/clk/ingenic/jz4770-cgu.c              |  15 +-
>   drivers/clk/ingenic/tcu.c                     |   2 +
>   include/dt-bindings/clock/jz4760-cgu.h        |  54 +++
>   11 files changed, 591 insertions(+), 56 deletions(-)
>   create mode 100644 drivers/clk/ingenic/jz4760-cgu.c
>   create mode 100644 include/dt-bindings/clock/jz4760-cgu.h
>
