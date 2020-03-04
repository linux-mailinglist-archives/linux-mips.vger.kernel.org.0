Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE16F178EAF
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2020 11:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387626AbgCDKmB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Mar 2020 05:42:01 -0500
Received: from out28-5.mail.aliyun.com ([115.124.28.5]:48265 "EHLO
        out28-5.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387776AbgCDKmB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Mar 2020 05:42:01 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2020651|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.351558-0.00513039-0.643312;DS=CONTINUE|ham_system_inform|0.0595886-0.000272615-0.940139;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03307;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.Gw1wbHL_1583318513;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gw1wbHL_1583318513)
          by smtp.aliyun-inc.com(10.147.41.121);
          Wed, 04 Mar 2020 18:41:54 +0800
Subject: Re: [PATCH 2/4] clk: Ingenic: Add support for TCU of X1000.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, linux-mips@vger.kernel.org
References: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1582100974-129559-4-git-send-email-zhouyanjie@wanyeetech.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de, maz@kernel.org,
        jason@lakedaemon.net, sboyd@kernel.org, mturquette@baylibre.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E5F85F0.5060605@wanyeetech.com>
Date:   Wed, 4 Mar 2020 18:41:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1582100974-129559-4-git-send-email-zhouyanjie@wanyeetech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2020年02月19日 16:29, 周琰杰 (Zhou Yanjie) wrote:
> X1000 has a different TCU containing OST, since X1000, OST has been
> independent of TCU. This patch is prepare for later OST driver.
>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Any review/ack from clock framework subsystem?


Thanks and best regards!

> ---
>   drivers/clk/ingenic/tcu.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
> index ad7daa4..8799907 100644
> --- a/drivers/clk/ingenic/tcu.c
> +++ b/drivers/clk/ingenic/tcu.c
> @@ -317,10 +317,17 @@ static const struct ingenic_soc_info jz4770_soc_info = {
>   	.has_tcu_clk = false,
>   };
>   
> +static const struct ingenic_soc_info x1000_soc_info = {
> +	.num_channels = 8,
> +	.has_ost = false, /* X1000 has OST, but it not belong TCU */
> +	.has_tcu_clk = false,
> +};
> +
>   static const struct of_device_id ingenic_tcu_of_match[] __initconst = {
>   	{ .compatible = "ingenic,jz4740-tcu", .data = &jz4740_soc_info, },
>   	{ .compatible = "ingenic,jz4725b-tcu", .data = &jz4725b_soc_info, },
>   	{ .compatible = "ingenic,jz4770-tcu", .data = &jz4770_soc_info, },
> +	{ .compatible = "ingenic,x1000-tcu", .data = &x1000_soc_info, },
>   	{ /* sentinel */ }
>   };
>   
> @@ -471,3 +478,4 @@ static void __init ingenic_tcu_init(struct device_node *np)
>   CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
>   CLK_OF_DECLARE_DRIVER(jz4725b_cgu, "ingenic,jz4725b-tcu", ingenic_tcu_init);
>   CLK_OF_DECLARE_DRIVER(jz4770_cgu, "ingenic,jz4770-tcu", ingenic_tcu_init);
> +CLK_OF_DECLARE_DRIVER(x1000_cgu, "ingenic,x1000-tcu", ingenic_tcu_init);

