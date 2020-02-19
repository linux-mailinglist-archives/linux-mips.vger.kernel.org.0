Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C75F9163E47
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 08:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgBSH43 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 02:56:29 -0500
Received: from out28-146.mail.aliyun.com ([115.124.28.146]:35067 "EHLO
        out28-146.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgBSH42 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 02:56:28 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07446616|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.182606-0.00178675-0.815607;DS=CONTINUE|ham_system_inform|0.277137-0.000238632-0.722624;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03291;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.Gpdxgpx_1582098977;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gpdxgpx_1582098977)
          by smtp.aliyun-inc.com(10.147.42.135);
          Wed, 19 Feb 2020 15:56:19 +0800
Subject: Re: [PATCH v5 1/7] clk: JZ4780: Add function for enable the second
 core.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1581792932-108032-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1581792932-108032-3-git-send-email-zhouyanjie@wanyeetech.com>
 <1581864796.3.2@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, allison@lohutok.net,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com,
        mips-creator-ci20-dev@googlegroups.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E4CEA17.4070009@wanyeetech.com>
Date:   Wed, 19 Feb 2020 15:56:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1581864796.3.2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2020年02月16日 22:53, Paul Cercueil wrote:
> Hi Zhou,
>
> Le dim., févr. 16, 2020 at 02:55, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add "jz4780_core1_enable()" for enable the second core of JZ4780,
>> prepare for later commits.
>>
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Tested-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>
>> Notes:
>>     v5:
>>     New patch, split from [1/6] in v4.
>>
>>  drivers/clk/ingenic/jz4780-cgu.c | 58 
>> ++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 53 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/ingenic/jz4780-cgu.c 
>> b/drivers/clk/ingenic/jz4780-cgu.c
>> index d07fff1..4f81819 100644
>> --- a/drivers/clk/ingenic/jz4780-cgu.c
>> +++ b/drivers/clk/ingenic/jz4780-cgu.c
>> @@ -16,7 +16,7 @@
>>
>>  /* CGU register offsets */
>>  #define CGU_REG_CLOCKCONTROL    0x00
>> -#define CGU_REG_PLLCONTROL    0x0c
>> +#define CGU_REG_LCR            0x04
>>  #define CGU_REG_APLL        0x10
>>  #define CGU_REG_MPLL        0x14
>>  #define CGU_REG_EPLL        0x18
>> @@ -46,8 +46,8 @@
>>  #define CGU_REG_CLOCKSTATUS    0xd4
>>
>>  /* bits within the OPCR register */
>> -#define OPCR_SPENDN0        (1 << 7)
>> -#define OPCR_SPENDN1        (1 << 6)
>> +#define OPCR_SPENDN0        BIT(7)
>> +#define OPCR_SPENDN1        BIT(6)
>>
>>  /* bits within the USBPCR register */
>>  #define USBPCR_USB_MODE        BIT(31)
>> @@ -88,6 +88,13 @@
>>  #define USBVBFIL_IDDIGFIL_MASK    (0xffff << USBVBFIL_IDDIGFIL_SHIFT)
>>  #define USBVBFIL_USBVBFIL_MASK    (0xffff)
>>
>> +/* bits within the LCR register */
>> +#define LCR_PD_SCPU            BIT(31)
>> +#define LCR_SCPUS            BIT(27)
>> +
>> +/* bits within the CLKGR1 register */
>> +#define CLKGR1_CORE1        BIT(15)
>> +
>>  static struct ingenic_cgu *cgu;
>>
>>  static u8 jz4780_otg_phy_get_parent(struct clk_hw *hw)
>> @@ -205,6 +212,47 @@ static const struct clk_ops jz4780_otg_phy_ops = {
>>      .set_rate = jz4780_otg_phy_set_rate,
>>  };
>>
>> +static int jz4780_core1_enable(struct clk_hw *hw)
>> +{
>> +    struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
>> +    struct ingenic_cgu *cgu = ingenic_clk->cgu;
>> +    const unsigned int timeout = 100;
>> +    unsigned long flags;
>> +    unsigned int i;
>> +    u32 lcr, clkgr1;
>> +
>> +    spin_lock_irqsave(&cgu->lock, flags);
>> +
>> +    lcr = readl(cgu->base + CGU_REG_LCR);
>> +    lcr &= ~LCR_PD_SCPU;
>> +    writel(lcr, cgu->base + CGU_REG_LCR);
>> +
>> +    clkgr1 = readl(cgu->base + CGU_REG_CLKGR1);
>> +    clkgr1 &= ~CLKGR1_CORE1;
>> +    writel(clkgr1, cgu->base + CGU_REG_CLKGR1);
>> +
>> +    spin_unlock_irqrestore(&cgu->lock, flags);
>> +
>> +    /* wait for the CPU to be powered up */
>> +    for (i = 0; i < timeout; i++) {
>> +        lcr = readl(cgu->base + CGU_REG_LCR);
>> +        if (!(lcr & LCR_SCPUS))
>> +            break;
>> +        mdelay(1);
>> +    }
>
> You can use readl_poll_timeout() from <linux/iopoll.h>.

Sure.

>
>> +
>> +    if (i == timeout) {
>> +        pr_err("%s: Wait for power up core1 timeout\n", __func__);
>> +        return -EBUSY;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct clk_ops jz4780_core1_ops = {
>> +    .enable = jz4780_core1_enable,
>> +};
>> +
>>  static const s8 pll_od_encoding[16] = {
>>      0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7,
>>      0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
>> @@ -701,9 +749,9 @@ static const struct ingenic_cgu_clk_info 
>> jz4780_cgu_clocks[] = {
>>      },
>>
>>      [JZ4780_CLK_CORE1] = {
>> -        "core1", CGU_CLK_GATE,
>> +        "core1", CGU_CLK_CUSTOM,
>>          .parents = { JZ4780_CLK_CPU, -1, -1, -1 },
>> -        .gate = { CGU_REG_CLKGR1, 15 },
>> +        .custom = { &jz4780_core1_ops },
>>      },
>>
>>  };
>> -- 
>> 2.7.4
>>
>

