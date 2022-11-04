Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7517A6190DF
	for <lists+linux-mips@lfdr.de>; Fri,  4 Nov 2022 07:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiKDGU7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Nov 2022 02:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbiKDGU5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Nov 2022 02:20:57 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE9B28E03
        for <linux-mips@vger.kernel.org>; Thu,  3 Nov 2022 23:20:55 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N3Vqg6Kvrz15MJf;
        Fri,  4 Nov 2022 14:20:47 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 14:20:53 +0800
Message-ID: <d9132431-76c4-fa04-84a8-7cf9fa67be07@huawei.com>
Date:   Fri, 4 Nov 2022 14:20:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ingenic: Fix missing platform_driver_unregister()
 call in ingenic_drm_init()
To:     Paul Cercueil <paul@crapouillou.net>
CC:     <airlied@gmail.com>, <daniel@ffwll.ch>, <sam@ravnborg.org>,
        <linux-mips@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20221103140148.76385-1-yuancan@huawei.com>
 <5B1SKR.FZ7TSOMCSE4N2@crapouillou.net>
From:   Yuan Can <yuancan@huawei.com>
In-Reply-To: <5B1SKR.FZ7TSOMCSE4N2@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

在 2022/11/3 22:52, Paul Cercueil 写道:
> Hi Yuan,
>
> Le jeu. 3 nov. 2022 à 14:01:48 +0000, Yuan Can <yuancan@huawei.com> a 
> écrit :
>> A problem about modprobe ingenic-drm failed is triggered with the 
>> following
>> log given:
>>
>>  [  303.561088] Error: Driver 'ingenic-ipu' is already registered, 
>> aborting...
>>  modprobe: ERROR: could not insert 'ingenic_drm': Device or resource 
>> busy
>>
>> The reason is that ingenic_drm_init() returns platform_driver_register()
>> directly without checking its return value, if 
>> platform_driver_register()
>> failed, it returns without unregistering ingenic_ipu_driver_ptr, 
>> resulting
>> the ingenic-drm can never be installed later.
>> A simple call graph is shown as below:
>>
>>  ingenic_drm_init()
>>    platform_driver_register() # ingenic_ipu_driver_ptr are registered
>>    platform_driver_register()
>>      driver_register()
>>        bus_add_driver()
>>          priv = kzalloc(...) # OOM happened
>>    # return without unregister ingenic_ipu_driver_ptr
>>
>> Fixing this problem by checking the return value of
>> platform_driver_register() and do platform_unregister_drivers() if
>> error happened.
>>
>> Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
>> Signed-off-by: Yuan Can <yuancan@huawei.com>
>
> Missing a Cc: to linux-stable, no?
>
> Cheers,
> -Paul
Ok, I will cc to linux-stable in the v2 patch, thanks for the review.

-- 
Best regards,
Yuan Can

