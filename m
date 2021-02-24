Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0732B3242A1
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 17:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234910AbhBXQzx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 11:55:53 -0500
Received: from linux.microsoft.com ([13.77.154.182]:57816 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235762AbhBXQy3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 11:54:29 -0500
Received: from [192.168.0.114] (unknown [49.207.206.154])
        by linux.microsoft.com (Postfix) with ESMTPSA id 70D7320B6C40;
        Wed, 24 Feb 2021 08:53:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 70D7320B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1614185620;
        bh=8YbxFx9Hocxmd6u3Eq78VVDiouONns5HyeEedD7A2HU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kMq11BtNKsvhQGtuYMUpR5yK7YNhjYofyHUhgYloHkmWl9wsOQwWELn1DMa8gwW+I
         /iNsyGAc2l5/wXLxAktg6W8KzgRlF9fmcW4M1Z9w4+4DaJ6Ru/FPHQ8xhViFGVyfGK
         sE5dixBwUAGcZsOCGIB4dJhxkhwWxg351zSRxG74=
Subject: Re: [PATCH 1/2] optee: fix tee out of memory failure seen during
 kexec reboot
To:     Jens Wiklander <jens.wiklander@linaro.org>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        allen.lkml@gmail.com, zajec5@gmail.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        op-tee@lists.trustedfirmware.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com
References: <20210217092714.121297-2-allen.lkml@gmail.com>
 <20210217092714.121297-2-allen.lkml@gmail.com>
 <8d87655f-27c6-6a66-6eb0-9244279fbf2c@linux.microsoft.com>
 <20210223081948.GA1836717@jade>
 <cbc963d5-6c4b-7e69-4a9b-3d66b95affab@linux.microsoft.com>
 <20210224081553.GB2653493@jade>
From:   Allen Pais <apais@linux.microsoft.com>
Message-ID: <9f4b44c1-cf86-a061-a9c6-726c4e23f99b@linux.microsoft.com>
Date:   Wed, 24 Feb 2021 22:23:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224081553.GB2653493@jade>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


>>>>>> -	/*
>>>>>> -	 * Ask OP-TEE to free all cached shared memory objects to decrease
>>>>>> -	 * reference counters and also avoid wild pointers in secure world
>>>>>> -	 * into the old shared memory range.
>>>>>> -	 */
>>>>>> -	optee_disable_shm_cache(optee);
>>>>>> +	if (shutdown) {
>>>>>> +		optee_disable_shm_cache(optee);
>>>>>> +	} else {
>>>>>> +		/*
>>>>>> +		 * Ask OP-TEE to free all cached shared memory
>>>>>> +		 * objects to decrease reference counters and
>>>>>> +		 * also avoid wild pointers in secure world
>>>>>> +		 * into the old shared memory range.
>>>>>> +		 */
>>>>>> +		optee_disable_shm_cache(optee);
>>>>> Calling optee_disable_shm_cache() in both if and else. It could be
>>>>> put in front of if().
>>>>>
>>>>
>>>>     Ideally, I could just use optee_remove for shutdown() too.
>>>> But it would not look good. Hence this approach.
>>>
>>> What is the problem with using optee_remove() for shutdown()?
>>>
>>
>>   There is no problem, I just thought it would be more cleaner/readable
>> with this approach. If you'd like to keep it simple by just calling
>> optee_remove() for shutdown() too, I could quickly send out V2.
> 
> In the patch you posted it looks like you'd like to call
> only optee_disable_shm_cache() in the case of shutdown. Like:
> 
> static void optee_shutdown(struct platform_device *pdev)
> {
>          optee_disable_shm_cache(platform_get_drvdata(pdev));
> }
> 
> and optee_remove() kept as it was before this patch.
> 

  Sure, Will have it fixed and send out V2.

Thanks.
