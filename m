Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B65423DB605
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 11:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238136AbhG3Je3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jul 2021 05:34:29 -0400
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:52543 "EHLO
        out28-221.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238089AbhG3Je2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jul 2021 05:34:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1378147|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.104343-0.0010973-0.894559;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.Kt13.RU_1627637659;
Received: from 192.168.88.131(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kt13.RU_1627637659)
          by smtp.aliyun-inc.com(10.147.43.95);
          Fri, 30 Jul 2021 17:34:21 +0800
Subject: Re: [PATCH 2/2] USB: dwc2: Add OTG support for Ingenic SoCs.
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     robh+dt@kernel.org, hminas@synopsys.com, paul@crapouillou.net,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        =?UTF-8?Q?Dragan_=c4=8ce=c4=8davac?= <dragancecavac@yahoo.com>
References: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627116521-124612-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YQAXt1pCFZqRm2ud@kroah.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <01db0ee3-8c80-1df6-e351-8bc944035c25@wanyeetech.com>
Date:   Fri, 30 Jul 2021 17:34:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <YQAXt1pCFZqRm2ud@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Greg,

On 2021/7/27 下午10:27, Greg KH wrote:
> On Sat, Jul 24, 2021 at 04:48:41PM +0800, 周琰杰 (Zhou Yanjie) wrote:
>> Add OTG support for the JZ4775 SoC, the JZ4780 SoC, the X1000
>> SoC, the X1600 SoC, the X1830 SoC, and the X2000 SoC. Introduce
>> support for disable Ingenic overcurrent detection, once selected
>> it enables GOTGCTL register bits VbvalidOvEn and VbvalidOvVal to
>> disable the VBUS overcurrent detection.
>>
>> This patch is derived from Dragan Čečavac (in the kernel 3.18.3
>> tree of CI20). It is very useful for the MIPS Creator CI20 (r1).
>> Without this patch, OTG port of CI20 has a great probability to
>> face overcurrent warning, which breaks the OTG functionality.
>>
>> Signed-off-by: Dragan Čečavac <dragancecavac@yahoo.com>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>   drivers/usb/dwc2/core.c   |  9 +++++++++
>>   drivers/usb/dwc2/core.h   |  5 +++++
>>   drivers/usb/dwc2/params.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++-
>>   3 files changed, 62 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
>> index 272ae57..c35b2e2 100644
>> --- a/drivers/usb/dwc2/core.c
>> +++ b/drivers/usb/dwc2/core.c
>> @@ -1153,6 +1153,7 @@ static void dwc2_set_turnaround_time(struct dwc2_hsotg *hsotg)
>>   int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
>>   {
>>   	u32 usbcfg;
>> +	u32 otgctl;
>>   	int retval = 0;
>>   
>>   	if ((hsotg->params.speed == DWC2_SPEED_PARAM_FULL ||
>> @@ -1187,6 +1188,14 @@ int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
>>   		dwc2_writel(hsotg, usbcfg, GUSBCFG);
>>   	}
>>   
>> +	if (hsotg->params.deactivate_ingenic_overcurrent_detection) {
>> +		if (dwc2_is_host_mode(hsotg)) {
>> +			otgctl = readl(hsotg->regs + GOTGCTL);
>> +			otgctl |= GOTGCTL_VBVALOEN | GOTGCTL_VBVALOVAL;
>> +			writel(otgctl, hsotg->regs + GOTGCTL);
>> +		}
>> +	}
>> +
>>   	return retval;
>>   }
>>   
>> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
>> index ab6b815..e026d13 100644
>> --- a/drivers/usb/dwc2/core.h
>> +++ b/drivers/usb/dwc2/core.h
>> @@ -418,6 +418,10 @@ enum dwc2_ep0_state {
>>    *			detection using GGPIO register.
>>    *			0 - Deactivate the external level detection (default)
>>    *			1 - Activate the external level detection
>> + * @deactivate_ingenic_overcurrent_detection: Deactivate Ingenic overcurrent
>> + *			detection.
>> + *			0 - Activate the overcurrent detection (default)
> Having 0 as "active" is rough to handle over time.
>
> All of the other options are "activate", so please, keep them the same
> if at all possible.


Sure, I will try.


Thanks and best regards!


>
> thanks,
>
> greg k-h
