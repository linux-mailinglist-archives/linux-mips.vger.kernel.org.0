Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5EC736CEF
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jun 2023 15:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbjFTNSD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jun 2023 09:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjFTNR7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Jun 2023 09:17:59 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 763371984
        for <linux-mips@vger.kernel.org>; Tue, 20 Jun 2023 06:17:28 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.43])
        by gateway (Coremail) with SMTP id _____8CxPuvbppFkbTcHAA--.14775S3;
        Tue, 20 Jun 2023 21:17:15 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx7d7appFkpAcAAA--.128S3;
        Tue, 20 Jun 2023 21:17:14 +0800 (CST)
Message-ID: <3d988dda-b17a-3699-d718-a85a8d5edf32@loongson.cn>
Date:   Tue, 20 Jun 2023 21:17:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] MIPS: Loongson64: loongson3_defconfig: Enable amdgpu drm
 driver
Content-Language: en-US
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230611055903.802801-1-suijingfeng@loongson.cn>
 <20230620124948.GA10520@alpha.franken.de>
From:   Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230620124948.GA10520@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Bx7d7appFkpAcAAA--.128S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GFW8JF15CF15ur1fCrWDKFX_yoWkAFb_tr
        sFk3WUur4YyFWxuF97X39Yv3s0k34UXF1fArnxAry8Z3ySyrsxXr97AryrGFn8Ww1DKFW3
        Za95Ar9rCF1SqosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
        s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
        cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
        vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
        w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
        W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
        Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
        kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
        twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
        CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
        6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
        0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
        v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
        wI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU7G-eUUUUU
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2023/6/20 20:49, Thomas Bogendoerfer wrote:
> On Sun, Jun 11, 2023 at 01:59:03PM +0800, Sui Jingfeng wrote:
>> As it's usuable on LS3A4000 platform. Tested with RX550, glmark2
>> got about 4235 score.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   arch/mips/configs/loongson3_defconfig | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
>> index 6f4a52608ea4..3087e64e6ebe 100644
>> --- a/arch/mips/configs/loongson3_defconfig
>> +++ b/arch/mips/configs/loongson3_defconfig
>> @@ -276,6 +276,13 @@ CONFIG_MEDIA_SUPPORT=m
>>   CONFIG_MEDIA_USB_SUPPORT=y
>>   CONFIG_USB_VIDEO_CLASS=m
>>   CONFIG_DRM=y
>> +CONFIG_DRM_AMDGPU=m
>> +CONFIG_DRM_AMDGPU_SI=y
>> +CONFIG_DRM_AMDGPU_CIK=y
>> +CONFIG_DRM_AMDGPU_USERPTR=y
>> +CONFIG_DRM_AMD_ACP=y
>> +CONFIG_DRM_AMD_DC=y
>> +CONFIG_DRM_AMD_DC_SI=y
>>   CONFIG_DRM_RADEON=m
>>   CONFIG_DRM_QXL=y
>>   CONFIG_DRM_VIRTIO_GPU=y
>> -- 
>> 2.25.1
> applied to mips-next.


Thanks a lot!


> Thomas.
>
-- 
Jingfeng

