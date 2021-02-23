Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1157322EB1
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 17:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbhBWQ1B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 11:27:01 -0500
Received: from linux.microsoft.com ([13.77.154.182]:45978 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhBWQ1B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 11:27:01 -0500
Received: from [192.168.0.114] (unknown [49.207.208.227])
        by linux.microsoft.com (Postfix) with ESMTPSA id 5988820B6C40;
        Tue, 23 Feb 2021 08:26:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5988820B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1614097579;
        bh=rgm+/skqLaNd7iHFRgkr7ujP2+6UCRA1yFShyxec1jY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lf4sWGLLPk44GWLVBceyKSvrSqpY3QJTFmZuXPgN8DBoeCzp3w5f34tPLcES1g2+9
         40MDhiURkmlff0O75wrSP3dW0uFIvOi/TUTtAO0YQBOJwQ1/eXhwOA3zoHgzRfNMib
         dbeMQSJvu0iCpjo74UV4Osgyl0RtvS+6JozOqh20=
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
From:   Allen Pais <apais@linux.microsoft.com>
Message-ID: <cbc963d5-6c4b-7e69-4a9b-3d66b95affab@linux.microsoft.com>
Date:   Tue, 23 Feb 2021 21:56:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223081948.GA1836717@jade>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



>>>> -	/*
>>>> -	 * Ask OP-TEE to free all cached shared memory objects to decrease
>>>> -	 * reference counters and also avoid wild pointers in secure world
>>>> -	 * into the old shared memory range.
>>>> -	 */
>>>> -	optee_disable_shm_cache(optee);
>>>> +	if (shutdown) {
>>>> +		optee_disable_shm_cache(optee);
>>>> +	} else {
>>>> +		/*
>>>> +		 * Ask OP-TEE to free all cached shared memory
>>>> +		 * objects to decrease reference counters and
>>>> +		 * also avoid wild pointers in secure world
>>>> +		 * into the old shared memory range.
>>>> +		 */
>>>> +		optee_disable_shm_cache(optee);
>>> Calling optee_disable_shm_cache() in both if and else. It could be
>>> put in front of if().
>>>
>>
>>    Ideally, I could just use optee_remove for shutdown() too.
>> But it would not look good. Hence this approach.
> 
> What is the problem with using optee_remove() for shutdown()?
> 

  There is no problem, I just thought it would be more cleaner/readable
with this approach. If you'd like to keep it simple by just calling
optee_remove() for shutdown() too, I could quickly send out V2.

Thanks for the review.

- Allen
