Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09995633BA6
	for <lists+linux-mips@lfdr.de>; Tue, 22 Nov 2022 12:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbiKVLnl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Nov 2022 06:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbiKVLmw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Nov 2022 06:42:52 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B0C62D8
        for <linux-mips@vger.kernel.org>; Tue, 22 Nov 2022 03:41:29 -0800 (PST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NGj1c6gb2zJnm9;
        Tue, 22 Nov 2022 19:38:12 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 19:41:27 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 19:41:27 +0800
Subject: Re: [PATCH v2 1/2] MIPS: vpe-mt: fix possible memory leak while
 module exiting
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>, <dengcheng.zhu@imgtec.com>,
        <Steven.Hill@imgtec.com>, <Qais.Yousef@imgtec.com>,
        <blogic@openwrt.org>, <yangyingliang@huawei.com>
References: <20221104033945.1120044-1-yangyingliang@huawei.com>
 <20221104033945.1120044-2-yangyingliang@huawei.com>
 <20221122112156.GA9396@alpha.franken.de>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <bd044af5-77ca-6e4f-1023-16f0b92302a8@huawei.com>
Date:   Tue, 22 Nov 2022 19:41:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20221122112156.GA9396@alpha.franken.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2022/11/22 19:21, Thomas Bogendoerfer wrote:
> On Fri, Nov 04, 2022 at 11:39:44AM +0800, Yang Yingliang wrote:
>> Afer commit 1fa5ae857bb1 ("driver core: get rid of struct device's
>> bus_id string array"), the name of device is allocated dynamically,
>> it need be freed when module exiting, call put_device() to give up
>> reference, so that it can be freed in kobject_cleanup() when the
>> refcount hit to 0. The vpe_device is static, so remove kfree() from
>> vpe_device_release().
>>
>> Fixes: 1fa5ae857bb1 ("driver core: get rid of struct device's bus_id string array")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   arch/mips/kernel/vpe-mt.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/kernel/vpe-mt.c b/arch/mips/kernel/vpe-mt.c
>> index bad6b0891b2b..84a82b551ec3 100644
>> --- a/arch/mips/kernel/vpe-mt.c
>> +++ b/arch/mips/kernel/vpe-mt.c
>> @@ -313,7 +313,6 @@ ATTRIBUTE_GROUPS(vpe);
>>   
>>   static void vpe_device_release(struct device *cd)
>>   {
>> -	kfree(cd);
>>   }
> as this is empty now, we can IMHO remove the function completly. Same
> for the other patch in this series.
It can not be removed, or it will cause WARNING in device_release() when 
calling
put_device()/device_unregister().

static void device_release(struct kobject *kobj)
{
...

         if (dev->release)
                 dev->release(dev);
         else if (dev->type && dev->type->release)
                 dev->type->release(dev);
         else if (dev->class && dev->class->dev_release)
                 dev->class->dev_release(dev);
         else
                 WARN(1, KERN_ERR "Device '%s' does not have a release() 
function, it is broken and must be fixed. See 
Documentation/core-api/kobject.rst.\n",
                         dev_name(dev));  // WANING here
...
}

Thanks,
Yang
>
> Thomas.
>
