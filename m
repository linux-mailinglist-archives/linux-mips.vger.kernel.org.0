Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17D48178F82
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2020 12:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387398AbgCDLWn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Mar 2020 06:22:43 -0500
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:44833 "EHLO
        out28-194.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgCDLWn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Mar 2020 06:22:43 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08880497|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.103441-0.00660654-0.889953;DS=CONTINUE|ham_system_inform|0.00489006-0.000231126-0.994879;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03301;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.Gw2Hmn-_1583320951;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gw2Hmn-_1583320951)
          by smtp.aliyun-inc.com(10.147.41.199);
          Wed, 04 Mar 2020 19:22:32 +0800
Subject: Re: [PATCH 4/4] irqchip: Ingenic: Add support for TCU of X1000.
To:     Marc Zyngier <maz@kernel.org>
References: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1582100974-129559-6-git-send-email-zhouyanjie@wanyeetech.com>
 <cf9434a075ee7efa6430bc39877c416c@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        tglx@linutronix.de, jason@lakedaemon.net, sboyd@kernel.org,
        mturquette@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E5F8F76.6060803@wanyeetech.com>
Date:   Wed, 4 Mar 2020 19:22:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cf9434a075ee7efa6430bc39877c416c@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Marc,

On 2020年03月04日 18:58, Marc Zyngier wrote:
> On 2020-02-19 08:29, 周琰杰 wrote:
>> X1000 has a different TCU containing OST, since X1000, OST has been
>> independent of TCU. This patch is prepare for later OST driver.
>
> You keep on talking about OST (whatever that is), but never deals with 
> it.

Sorry, I didn't make it clear. My intention was to explain why we need 
to add an IRQCHIP_DECLARE to x1000 separately.

> Why don't you just say
>
> "Enable TCU support for Ingenic X1000, which can be supported by
> the existing driver."
>
> as this is what the patch is doing?

Yes, this patch is to ensure that TCU can be used normally when the new 
OST driver is merged, thank you for your suggestion.

Thanks and best regards!

>
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>  drivers/irqchip/irq-ingenic-tcu.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/irqchip/irq-ingenic-tcu.c
>> b/drivers/irqchip/irq-ingenic-tcu.c
>> index 6d05cef..7a7222d 100644
>> --- a/drivers/irqchip/irq-ingenic-tcu.c
>> +++ b/drivers/irqchip/irq-ingenic-tcu.c
>> @@ -180,3 +180,4 @@ static int __init ingenic_tcu_irq_init(struct
>> device_node *np,
>>  IRQCHIP_DECLARE(jz4740_tcu_irq, "ingenic,jz4740-tcu", 
>> ingenic_tcu_irq_init);
>>  IRQCHIP_DECLARE(jz4725b_tcu_irq, "ingenic,jz4725b-tcu", 
>> ingenic_tcu_irq_init);
>>  IRQCHIP_DECLARE(jz4770_tcu_irq, "ingenic,jz4770-tcu", 
>> ingenic_tcu_irq_init);
>> +IRQCHIP_DECLARE(x1000_tcu_irq, "ingenic,x1000-tcu", 
>> ingenic_tcu_irq_init);
>
> Otherwise,
>
> Acked-by: Marc Zyngier <maz@kernel.org>
>
> I expect this to go via the MIPS tree as a series.
>
> Thanks,
>
>         M.

