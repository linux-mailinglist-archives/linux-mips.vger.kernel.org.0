Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1066B321767
	for <lists+linux-mips@lfdr.de>; Mon, 22 Feb 2021 13:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbhBVMr0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 07:47:26 -0500
Received: from linux.microsoft.com ([13.77.154.182]:40572 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbhBVMpz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Feb 2021 07:45:55 -0500
Received: from [192.168.0.114] (unknown [49.207.208.227])
        by linux.microsoft.com (Postfix) with ESMTPSA id D5C6B20B6C40;
        Mon, 22 Feb 2021 04:45:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D5C6B20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1613997914;
        bh=0cItSrOHNyqAnHmYlMTDJGOB4+40TVteNywMP5altWI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=S3opWeTuHjAN4qY/hX6uq5/M2WjhFUhmr0tuz2c0Py7eyP7QBLEFjbQHSe5KTYoEG
         qg2ou051HmRjivkRNBMs5ii9KUYdRE4ur3owyF1Hqr9aqEwUuOQ/yDQZS2cx0CvTy6
         SJTC53nhIk598tm7DvObgpudGc3MEObOHOwwZNzA=
Subject: Re: [PATCH 1/2] optee: fix tee out of memory failure seen during
 kexec reboot
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        allen.lkml@gmail.com, jens.wiklander@linaro.org, zajec5@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        op-tee@lists.trustedfirmware.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com
References: <20210217092714.121297-2-allen.lkml@gmail.com>
 <20210217092714.121297-2-allen.lkml@gmail.com>
From:   Allen Pais <apais@linux.microsoft.com>
Message-ID: <8d87655f-27c6-6a66-6eb0-9244279fbf2c@linux.microsoft.com>
Date:   Mon, 22 Feb 2021 18:15:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217092714.121297-2-allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> On Wed, 17 Feb 2021 14:57:12 +0530, Allen Pais wrote:
>> -	/*
>> -	 * Ask OP-TEE to free all cached shared memory objects to decrease
>> -	 * reference counters and also avoid wild pointers in secure world
>> -	 * into the old shared memory range.
>> -	 */
>> -	optee_disable_shm_cache(optee);
>> +	if (shutdown) {
>> +		optee_disable_shm_cache(optee);
>> +	} else {
>> +		/*
>> +		 * Ask OP-TEE to free all cached shared memory
>> +		 * objects to decrease reference counters and
>> +		 * also avoid wild pointers in secure world
>> +		 * into the old shared memory range.
>> +		 */
>> +		optee_disable_shm_cache(optee);
>   
> Calling optee_disable_shm_cache() in both if and else. It could be
> put in front of if().
> 

   Ideally, I could just use optee_remove for shutdown() too.
But it would not look good. Hence this approach.

- Allen
