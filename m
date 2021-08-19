Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A49C3F13BB
	for <lists+linux-mips@lfdr.de>; Thu, 19 Aug 2021 08:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhHSGpL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Aug 2021 02:45:11 -0400
Received: from out28-193.mail.aliyun.com ([115.124.28.193]:48218 "EHLO
        out28-193.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbhHSGpK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Aug 2021 02:45:10 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09123356|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0210625-0.000612203-0.978325;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.L2mzdyl_1629355470;
Received: from 192.168.88.131(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.L2mzdyl_1629355470)
          by smtp.aliyun-inc.com(10.147.41.121);
          Thu, 19 Aug 2021 14:44:31 +0800
Subject: Re: [PATCH v7 00/11] Add new clocks and fix bugs for Ingenic SoCs.
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        paul@crapouillou.net
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
Message-ID: <892b4671-462d-d0da-a2d0-2c140b519b26@wanyeetech.com>
Date:   Thu, 19 Aug 2021 14:44:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,


A gentle ping :)


On 2021/7/24 下午5:34, 周琰杰 (Zhou Yanjie) wrote:
> v4->v5:
> 1.modify the CGU PLL correlation code to make it compatible with I2S PLL.
> 2.Change X1000's I2S clock to CGU_CLK_PLL as Paul Cercueil's suggestion.
> 3.Add documentation for JZ4775 and X2000 bindings.
> 4.Add JZ4775 and X2000 clock bindings.
> 5.Add CGU driver for JZ4775 and X2000.
>
> v5->v6:
> Change the type of stable_bit from u8 to s8, because a negative value will
> appear when the stable_bit bit does not exist.
>
> v6->v7:
> 1.Add Rob Herring's Acked-by.
> 2.Change to dual license.
>
> 周琰杰 (Zhou Yanjie) (11):
>    clk: JZ4780: Add function for disable the second core.
>    clk: Ingenic: Adjust cgu code to make it compatible with I2S PLL.
>    dt-bindings: clock: Add missing clocks for Ingenic SoCs.
>    clk: Ingenic: Fix problem of MAC clock in Ingenic X1000 and X1830.
>    clk: Ingenic: Add missing clocks for Ingenic SoCs.
>    clk: Ingenic: Clean up and reformat the code.
>    dt-bindings: clock: Add documentation for JZ4775 and X2000 bindings.
>    dt-bindings: clock: Add JZ4775 clock bindings.
>    dt-bindings: clock: Add X2000 clock bindings.
>    clk: Ingenic: Add CGU driver for JZ4775.
>    clk: Ingenic: Add CGU driver for X2000.
>
>   .../devicetree/bindings/clock/ingenic,cgu.yaml     |   4 +
>   drivers/clk/ingenic/Kconfig                        |  20 +
>   drivers/clk/ingenic/Makefile                       |   2 +
>   drivers/clk/ingenic/cgu.c                          | 118 ++-
>   drivers/clk/ingenic/cgu.h                          |  10 +-
>   drivers/clk/ingenic/jz4725b-cgu.c                  |  49 +-
>   drivers/clk/ingenic/jz4740-cgu.c                   |  49 +-
>   drivers/clk/ingenic/jz4760-cgu.c                   | 106 ++-
>   drivers/clk/ingenic/jz4770-cgu.c                   |  83 +--
>   drivers/clk/ingenic/jz4775-cgu.c                   | 572 +++++++++++++++
>   drivers/clk/ingenic/jz4780-cgu.c                   | 149 ++--
>   drivers/clk/ingenic/x1000-cgu.c                    | 210 ++++--
>   drivers/clk/ingenic/x1830-cgu.c                    | 210 ++++--
>   drivers/clk/ingenic/x2000-cgu.c                    | 790 +++++++++++++++++++++
>   include/dt-bindings/clock/jz4775-cgu.h             |  59 ++
>   include/dt-bindings/clock/x1000-cgu.h              |   5 +
>   include/dt-bindings/clock/x1830-cgu.h              |   5 +
>   include/dt-bindings/clock/x2000-cgu.h              |  89 +++
>   18 files changed, 2210 insertions(+), 320 deletions(-)
>   create mode 100644 drivers/clk/ingenic/jz4775-cgu.c
>   create mode 100644 drivers/clk/ingenic/x2000-cgu.c
>   create mode 100644 include/dt-bindings/clock/jz4775-cgu.h
>   create mode 100644 include/dt-bindings/clock/x2000-cgu.h
>
