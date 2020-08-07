Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D267423F042
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 17:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgHGPzc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 11:55:32 -0400
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:38881 "EHLO
        out28-173.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgHGPzb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 11:55:31 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436521|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.0144054-0.000982358-0.984612;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03267;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.IE4cuQu_1596815718;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IE4cuQu_1596815718)
          by smtp.aliyun-inc.com(10.147.41.137);
          Fri, 07 Aug 2020 23:55:20 +0800
Subject: Re: [PATCH] MIPS: CI20: Update defconfig for EFUSE.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, keescook@chromium.org,
        hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
References: <20200723071950.130007-1-zhouyanjie@wanyeetech.com>
 <20200723071950.130007-2-zhouyanjie@wanyeetech.com>
 <V2ZWDQ.DNM4EVLAB6YN3@crapouillou.net>
 <b1de1e95-9ce3-1324-346d-07196aa30637@wanyeetech.com>
 <PIR6EQ.G22CDHRT7D5O@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <d8b28bac-8995-23db-816e-31ba1f8d02f3@wanyeetech.com>
Date:   Fri, 7 Aug 2020 23:55:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <PIR6EQ.G22CDHRT7D5O@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

在 2020/7/28 下午11:40, Paul Cercueil 写道:
> Hi Zhou,
>
> Le sam. 25 juil. 2020 à 16:02, Zhou Yanjie <zhouyanjie@wanyeetech.com> 
> a écrit :
>> Hi Paul,
>>
>> 在 2020/7/23 下午4:47, Paul Cercueil 写道:
>>> Hi Zhou,
>>>
>>> Le jeu. 23 juil. 2020 à 15:19, 周琰杰 (Zhou Yanjie) 
>>> <zhouyanjie@wanyeetech.com> a écrit :
>>>> The commit 19c968222934 ("MIPS: DTS: CI20: make DM9000 Ethernet
>>>> controller use NVMEM to find the default MAC address") add EFUSE
>>>> node for DM9000 in CI20, however, the EFUSE driver is not selected,
>>>> which will cause the DM9000 to fail to read the MAC address from
>>>> EFUSE, causing the following issue:
>>>>
>>>> [FAILED] Failed to start Raise network interfaces.
>>>>
>>>> Fix this problem by select CONFIG_JZ4780_EFUSE by default in the
>>>> ci20_defconfig.
>>>
>>> Does it actually fix it on a clean 5.8-rc kernel?
>>>
>>> From what I know, the efuse driver cannot probe, because the nemc 
>>> driver requests the complete memory resource, so the efuse driver's 
>>> devm_platform_ioremap_resource() fails.
>>>
>>> I did send a patch to fix this 
>>> (https://lore.kernel.org/lkml/551a8560261543c1decb1d4d1671ec4b7fa52fdb.1582905653.git.hns@goldelico.com/),
>>> but it's hard to have somebody merge it, because nobody maintains 
>>> drivers/memory/.
>>>
>> You are right, I cleaned up the changes made to support X1000's EFUSE 
>> and rebase to clean 5.8-RC6, it still does not work properly, I think 
>> we should drop this fix patch.
>
> The patch I mentioned was merged, so starting from 5.9-rc1 the efuse 
> driver should work. Please resend this patch after 5.9-rc1 then.
>

Sure, I will resent when 5.9-rc1 is released.

Thanks and best regards!

> Thanks,
> -Paul
>
>>
>>>> Fixes: 19c968222934 ("MIPS: DTS: CI20: make DM9000 Ethernet
>>>> controller use NVMEM to find the default MAC address").
>>>
>>> That shouldn't be a fix IMHO - the devicetree was updated in one 
>>> commit, the config should be updated in another. The "bug" here is 
>>> that it wasn't done right away.
>>>
>> Okay.
>>>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>>
>>> Btw - when you add a Fixes: tag to fix a commit that is not for the 
>>> kernel currently in RC phase, you need to Cc linux-stable as well.
>>>
>> Sure, I will pay attention next time.
>>
>> Thanks and best regards!
>>
>>
>>> Cheers,
>>> -Paul
>>>
>>>> ---
>>>>  arch/mips/configs/ci20_defconfig | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/mips/configs/ci20_defconfig 
>>>> b/arch/mips/configs/ci20_defconfig
>>>> index f433fad16073..ba26ba4de09a 100644
>>>> --- a/arch/mips/configs/ci20_defconfig
>>>> +++ b/arch/mips/configs/ci20_defconfig
>>>> @@ -140,6 +140,7 @@ CONFIG_INGENIC_OST=y
>>>>  CONFIG_MEMORY=y
>>>>  CONFIG_PWM=y
>>>>  CONFIG_PWM_JZ4740=m
>>>> +CONFIG_JZ4780_EFUSE=y
>>>>  CONFIG_EXT4_FS=y
>>>>  # CONFIG_DNOTIFY is not set
>>>>  CONFIG_AUTOFS_FS=y
>>>> -- 
>>>> 2.11.0
>>>>
>>>
>
