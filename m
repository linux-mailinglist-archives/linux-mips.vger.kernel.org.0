Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A51839F996
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 16:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbhFHOwR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 10:52:17 -0400
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:40964 "EHLO
        out28-53.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbhFHOwQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 10:52:16 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436284|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0498931-0.00130407-0.948803;FP=12645373337884369137|2|1|3|0|-1|-1|-1;HT=ay29a033018047204;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KPTncC0_1623163818;
Received: from 192.168.0.103(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KPTncC0_1623163818)
          by smtp.aliyun-inc.com(10.147.40.2);
          Tue, 08 Jun 2021 22:50:20 +0800
Subject: Re: [PATCH 2/2] mmc: JZ4740: Add support for JZ4775 and rename
 unreasonable array name.
To:     Paul Cercueil <paul@opendingux.net>
Cc:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        paul@crapouillou.net
References: <1623002884-57244-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623002884-57244-3-git-send-email-zhouyanjie@wanyeetech.com>
 <B6YDUQ.LVNCFD4XPUIY1@opendingux.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <ba66ff69-5ab9-0e6e-9da9-d4b2bf342b61@wanyeetech.com>
Date:   Tue, 8 Jun 2021 22:50:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <B6YDUQ.LVNCFD4XPUIY1@opendingux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/6/8 下午9:44, Paul Cercueil wrote:
> Hi Zhou,
>
> Le lun., juin 7 2021 at 02:08:04 +0800, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> 1.Add support for probing mmc driver on the JZ4775 SoC from Ingenic.
>> 2.When the support for JZ4775 SoC is added, there will be six compatible
>>   strings, so renaming "jz4740_mmc_of_match[]" to 
>> "jz4740_mmc_of_matches[]"
>>   is more reasonable.
>
> Honestly, you can drop #2. We don't really care about the 
> variable/function names not being "perfect". For instance this driver 
> still use "jz4740_mmc*" functions everywhere even though it supports 
> many more SoCs. Besides, renames like that makes it harder to "git 
> blame" afterwards since it fills the git history with non-functional 
> changes.


Sure, I will drop #2.


>
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>  drivers/mmc/host/jz4740_mmc.c | 25 ++++++++++++++-----------
>>  1 file changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/mmc/host/jz4740_mmc.c 
>> b/drivers/mmc/host/jz4740_mmc.c
>> index b3c636e..ea8434f 100644
>> --- a/drivers/mmc/host/jz4740_mmc.c
>> +++ b/drivers/mmc/host/jz4740_mmc.c
>> @@ -2,6 +2,7 @@
>>  /*
>>   *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
>>   *  Copyright (C) 2013, Imagination Technologies
>> + *  Copyright (C) 2021, 周琰杰 (Zhou Yanjie) 
>> <zhouyanjie@wanyeetech.com>
>>   *
>>   *  JZ4740 SD/MMC controller driver
>>   */
>> @@ -114,6 +115,7 @@ enum jz4740_mmc_version {
>>      JZ_MMC_JZ4740,
>>      JZ_MMC_JZ4725B,
>>      JZ_MMC_JZ4760,
>> +    JZ_MMC_JZ4775,
>>      JZ_MMC_JZ4780,
>>      JZ_MMC_X1000,
>>  };
>> @@ -138,7 +140,7 @@ enum jz4740_mmc_state {
>>   * COOKIE_MAPPED: the request was mapped in the irq handler,
>>   * and should be unmapped before mmc_request_done is called..
>>   */
>> -enum jz4780_cookie {
>> +enum jz4775_cookie {
>>      COOKIE_UNMAPPED = 0,
>>      COOKIE_PREMAPPED,
>>      COOKIE_MAPPED,
>> @@ -194,7 +196,7 @@ static void jz4740_mmc_write_irq_mask(struct 
>> jz4740_mmc_host *host,
>>  static void jz4740_mmc_write_irq_reg(struct jz4740_mmc_host *host,
>>                       uint32_t val)
>>  {
>> -    if (host->version >= JZ_MMC_JZ4780)
>> +    if (host->version >= JZ_MMC_JZ4775)
>>          writel(val, host->base + JZ_REG_MMC_IREG);
>>      else
>>          writew(val, host->base + JZ_REG_MMC_IREG);
>> @@ -202,7 +204,7 @@ static void jz4740_mmc_write_irq_reg(struct 
>> jz4740_mmc_host *host,
>>
>>  static uint32_t jz4740_mmc_read_irq_reg(struct jz4740_mmc_host *host)
>>  {
>> -    if (host->version >= JZ_MMC_JZ4780)
>> +    if (host->version >= JZ_MMC_JZ4775)
>>          return readl(host->base + JZ_REG_MMC_IREG);
>>      else
>>          return readw(host->base + JZ_REG_MMC_IREG);
>> @@ -674,7 +676,7 @@ static void jz4740_mmc_send_command(struct 
>> jz4740_mmc_host *host,
>>              cmdat |= JZ_MMC_CMDAT_WRITE;
>>          if (host->use_dma) {
>>              /*
>> -             * The 4780's MMC controller has integrated DMA ability
>> +             * The JZ4775's MMC controller has integrated DMA ability
>>               * in addition to being able to use the external DMA
>>               * controller. It moves DMA control bits to a separate
>>               * register. The DMA_SEL bit chooses the external
>> @@ -682,13 +684,13 @@ static void jz4740_mmc_send_command(struct 
>> jz4740_mmc_host *host,
>>               * can only use the external controller, and have a
>>               * single DMA enable bit in CMDAT.
>>               */
>> -            if (host->version >= JZ_MMC_JZ4780) {
>> +            if (host->version >= JZ_MMC_JZ4775) {
>>                  writel(JZ_MMC_DMAC_DMA_EN | JZ_MMC_DMAC_DMA_SEL,
>>                         host->base + JZ_REG_MMC_DMAC);
>>              } else {
>>                  cmdat |= JZ_MMC_CMDAT_DMA_EN;
>>              }
>> -        } else if (host->version >= JZ_MMC_JZ4780) {
>> +        } else if (host->version >= JZ_MMC_JZ4775) {
>>              writel(0, host->base + JZ_REG_MMC_DMAC);
>>          }
>>
>> @@ -866,7 +868,7 @@ static int jz4740_mmc_set_clock_rate(struct 
>> jz4740_mmc_host *host, int rate)
>>      writew(div, host->base + JZ_REG_MMC_CLKRT);
>>
>>      if (real_rate > 25000000) {
>> -        if (host->version >= JZ_MMC_X1000) {
>> +        if (host->version >= JZ_MMC_JZ4775) {
>
> This changes the behaviour for the JZ4780.
>
> Even if it is correct, this belongs in its own commit (with a Fixes 
> tag), or at the very least a mention about it in the commit message.


In fact, both JZ4775 and JZ4780 support this feature, I will add a 
corresponding description in the commit message.


>
>> writel(JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY |
>>                     JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHASE_DLY |
>>                     JZ_MMC_LPM_LOW_POWER_MODE_EN,
>> @@ -955,15 +957,16 @@ static const struct mmc_host_ops jz4740_mmc_ops 
>> = {
>>      .enable_sdio_irq = jz4740_mmc_enable_sdio_irq,
>>  };
>>
>> -static const struct of_device_id jz4740_mmc_of_match[] = {
>> +static const struct of_device_id jz4740_mmc_of_matches[] = {
>>      { .compatible = "ingenic,jz4740-mmc", .data = (void *) 
>> JZ_MMC_JZ4740 },
>>      { .compatible = "ingenic,jz4725b-mmc", .data = (void 
>> *)JZ_MMC_JZ4725B },
>>      { .compatible = "ingenic,jz4760-mmc", .data = (void *) 
>> JZ_MMC_JZ4760 },
>> +    { .compatible = "ingenic,jz4775-mmc", .data = (void *) 
>> JZ_MMC_JZ4775 },
>>      { .compatible = "ingenic,jz4780-mmc", .data = (void *) 
>> JZ_MMC_JZ4780 },
>
> Looks to me that the JZ4775 and JZ4780 have the exact same behaviour, 
> so this patch could have been a one-liner, adding "ingenic,jz4775-mmc" 
> with the JZ_MMC_JZ4780 ID.
>

Sure, I will change it in the next version.


Thanks and best regards!


> Cheers,
> -Paul
>
>>      { .compatible = "ingenic,x1000-mmc", .data = (void *) 
>> JZ_MMC_X1000 },
>>      {},
>>  };
>> -MODULE_DEVICE_TABLE(of, jz4740_mmc_of_match);
>> +MODULE_DEVICE_TABLE(of, jz4740_mmc_of_matches);
>>
>>  static int jz4740_mmc_probe(struct platform_device* pdev)
>>  {
>> @@ -980,7 +983,7 @@ static int jz4740_mmc_probe(struct 
>> platform_device* pdev)
>>
>>      host = mmc_priv(mmc);
>>
>> -    match = of_match_device(jz4740_mmc_of_match, &pdev->dev);
>> +    match = of_match_device(jz4740_mmc_of_matches, &pdev->dev);
>>      if (match) {
>>          host->version = (enum jz4740_mmc_version)match->data;
>>      } else {
>> @@ -1124,7 +1127,7 @@ static struct platform_driver jz4740_mmc_driver 
>> = {
>>      .driver = {
>>          .name = "jz4740-mmc",
>>          .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>> -        .of_match_table = of_match_ptr(jz4740_mmc_of_match),
>> +        .of_match_table = of_match_ptr(jz4740_mmc_of_matches),
>>          .pm = pm_ptr(&jz4740_mmc_pm_ops),
>>      },
>>  };
>> -- 
>> 2.7.4
>>
>
