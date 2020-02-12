Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4037615AD8E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2020 17:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgBLQmb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Feb 2020 11:42:31 -0500
Received: from relaygw4-3.mclink.it ([213.21.178.146]:45267 "EHLO
        relaygw4-3.mclink.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbgBLQmb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Feb 2020 11:42:31 -0500
X-Greylist: delayed 900 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 11:42:29 EST
Received: from [172.24.30.41] (HELO smtpoutgw1.mclink.it)
  by relaygw4-3.mclink.it (CommuniGate Pro SMTP 6.0.6)
  with ESMTP id 168229636 for linux-mips@vger.kernel.org; Wed, 12 Feb 2020 17:27:28 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DCAQD2JkRe/yslA1cNWBwBAQEBAQcBA?=
 =?us-ascii?q?REBBAQBAYF7gxWBMYQUkQUlg26GAoE+ilGFOwkBAQEBAQEBAQEgCwwEAQGEQAK?=
 =?us-ascii?q?CbTgTAhABAQYBAQEBAQUEhiSFcgEBAQECAQEBIQQLATsQCwkCGAICJgICJwEvB?=
 =?us-ascii?q?gEMBgIBAYMiAYJWBS+QA5sEdX8zhUqDQ4E+gQ4qjH2BQYERJwyCYD6BBIFgAQS?=
 =?us-ascii?q?EcoJeBIE/AQEBrjMBBgKBYlqHTYkrhVMGHINCl1OOaIhujjOGHYF6gUCBHoFOC?=
 =?us-ascii?q?UcljikMC4hkhUBzkWEBAQ?=
Received: from host43-37-dynamic.3-87-r.retail.telecomitalia.it (HELO [192.168.7.101]) ([87.3.37.43])
  by smtpoutgw1.mclink.it with ESMTP; 12 Feb 2020 17:27:27 +0100
Subject: Re: Enabling MMC on MT7628 SoC
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org,
        John Crispin <john@phrozen.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
References: <e6c30f55-5f65-b165-4c5d-1d25a425e744@mclink.it>
 <ae707c5d-3c3c-724d-1eba-adcb1db52eb9@gmail.com>
From:   Mauro Condarelli <mc5686@mclink.it>
Message-ID: <38cf727e-4694-ab09-ab10-04d48660c838@mclink.it>
Date:   Wed, 12 Feb 2020 17:27:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ae707c5d-3c3c-724d-1eba-adcb1db52eb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thanks Matthias,

On 2/11/20 5:15 PM, Matthias Brugger wrote:
> [Adding MIPS people to the loop]
>
> On 01/02/2020 17:06, Mauro Condarelli wrote:
>> Hi,
>> I'm trying to enable MMC/SD access on a VoCore2 SOM (based on MT7628)
>> using mtk_sd driver.
>>
>> Just enabling mtk_sd will bomb wit undefined function `clk_get_parent`;
>> this can be trivially cured with:
>>
>> diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
>> index 2f9d5acb38ea..930c2776f6fd 100644
>> --- a/arch/mips/ralink/clk.c
>> +++ b/arch/mips/ralink/clk.c
>> @@ -85,3 +85,9 @@ void __init plat_time_init(void)
>>         clk_put(clk);
>>         timer_probe();
>>  }
>> +
>> +struct clk *clk_get_parent(struct clk *clk)
>> +{
>> +       return NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(clk_get_parent);
>>
>>
>> Naive implementation fails runtime with ENOENT in
>> devm_clk_get("10130000.mmc", "source") in spite of clock definition in .dts.
>>
>> I traced the problem to CONFIG_COMMON_CLK not being defined for RALINK.
>> It cannot be enabled because it will lead to multiple definition of
>> several clock-related functions (e.g.: `clk_get_rate`).
>> I found completely disabling clock handling in mtk_sd.c leads to a (for
>> me) fully working SD card.
> That's probably because the boot FW already enables the clocks as needed...
>
>> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
>> index 7726dcf48f2c..464f64bea7c6 100644
>> --- a/drivers/mmc/host/mtk-sd.c
>> +++ b/drivers/mmc/host/mtk-sd.c
>> @@ -730,18 +730,22 @@ static void msdc_set_timeout(struct msdc_host
>> *host, u32 ns, u32 clks)
>>  
>>  static void msdc_gate_clock(struct msdc_host *host)
>>  {
>> +#ifdef CONFIG_COMMON_CLK
>>      clk_disable_unprepare(host->src_clk_cg);
>>      clk_disable_unprepare(host->src_clk);
>>      clk_disable_unprepare(host->bus_clk);
>>      clk_disable_unprepare(host->h_clk);
>> +#endif
>>  }
>>  
>>  static void msdc_ungate_clock(struct msdc_host *host)
>>  {
>> +#ifdef CONFIG_COMMON_CLK
>>      clk_prepare_enable(host->h_clk);
>>      clk_prepare_enable(host->bus_clk);
>>      clk_prepare_enable(host->src_clk);
>>      clk_prepare_enable(host->src_clk_cg);
>> +#endif
>>      while (!(readl(host->base + MSDC_CFG) & MSDC_CFG_CKSTB))
>>          cpu_relax();
>>  }
>> @@ -2211,6 +2215,7 @@ static int msdc_drv_probe(struct platform_device
>> *pdev)
>>      if (ret)
>>          goto host_free;
>>  
>> +#ifdef CONFIG_COMMON_CLK
>>      host->src_clk = devm_clk_get(&pdev->dev, "source");
>>      if (IS_ERR(host->src_clk)) {
>>          ret = PTR_ERR(host->src_clk);
>> @@ -2230,6 +2235,12 @@ static int msdc_drv_probe(struct platform_device
>> *pdev)
>>      host->src_clk_cg = devm_clk_get(&pdev->dev, "source_cg");
>>      if (IS_ERR(host->src_clk_cg))
>>          host->src_clk_cg = NULL;
>> +#else
>> +    host->src_clk = NULL;
>> +    host->h_clk = NULL;
>> +    host->bus_clk = NULL;
>> +    host->src_clk_cg = NULL;
>> +#endif
>>  
>>      host->irq = platform_get_irq(pdev, 0);
>>      if (host->irq < 0) {
>>
>>
>> ... but I'm unsure this hack-and-slash approach is the Right Thing to do ;)
>>
> I think the correct approach would be to write a clock driver which supports the
> common clock framework.
I'm afraid writing such a driver from scratch is over my time
allowance (and, most likely, also above my technical skills).
I can't, thus, volunteer for the task, but I'm surely available to help,
both with coding, reviewing and testing, if deemed useful.
Let me know if I can help somehow.

> The arch/mips/ralink/clk.c basically overwrites any calls to this so that things
> somehow work.
I've seen this is an almost-empty shell, but I have only vague
idea about what should actually be needed, sorry.

> Regards,
> Matthias
>
>> As said: this works for me, but I would like to fix it properly and have
>> the fix sent upstream together with my SoM defconfig.
I am cooperating with U-Boot folks to port it to this board (and,
apparently, with some success); I will check if some code can
be ported from there as MMC/SD seems to be working.

>> Any hint welcome
>> Regards
>> Mauro Condarelli
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
Best Regards
Mauro Condarelli

