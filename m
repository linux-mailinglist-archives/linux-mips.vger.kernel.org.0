Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C971E7997
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 11:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgE2Jlh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 05:41:37 -0400
Received: from [115.28.160.31] ([115.28.160.31]:50498 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725821AbgE2Jlh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 05:41:37 -0400
Received: from hanazono.local (unknown [116.236.177.50])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 583C6600B5;
        Fri, 29 May 2020 17:41:31 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590745291; bh=VcWN+q8Jj7hAxPSqzkCtFA6pRPi8htA6nJOu2KYPqKc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VddNvCRk64cGmTSVBcQ8Zu21cRdRfOXESVZ1stCH7BUAzPtOW3hJShj3mwVC0lrXR
         EN8Zadz8UT1QUbjqM3eqPcVIIbynrTBmNafxIqfFjDq00g00F2yN4zGsKA4lVbaF+D
         dBWcIL/ZhFoanvzvPAAKq8yERypx7pHboQH1iDTY=
Subject: Re: [PATCH] function:stacktrace/mips: Fix function:stacktrace for
 mips
To:     yuanjunqing <yuanjunqing66@163.com>, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn
References: <20200528123640.4285-1-yuanjunqing66@163.com>
 <11c90f15-0a25-e628-c8db-53343c351085@163.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <43f35844-f78a-74a2-0e3d-184c3567d74f@xen0n.name>
Date:   Fri, 29 May 2020 17:41:31 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <11c90f15-0a25-e628-c8db-53343c351085@163.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020/5/29 17:29, yuanjunqing wrote:

> May I ask if you have received this email.

At least I have received the complete thread in my inbox, so others may 
well have no problem.

It's not polite to ping maintainers just one day after sending your 
patch BTW; keep the patch submitting guide[1] under your pillow.

Lastly, don't top-post even though your message body is short.


[1]: 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#don-t-get-discouraged-or-impatient


And a bit of review while we're at it...

>
> ÔÚ 2020/5/28 ÏÂÎç8:36, YuanJunQing Ð´µÀ:
>> ftrace_call as global symbol in ftrace_caller(), this
>> will cause function:stacktrace can not work well.
Chinglish. I can't understand this despite being a Chinese myself...
>> i.e. echo do_IRQ:stacktrace > set_ftrace_filte
The commit message is truncated? I can't seem to make sense of this line.
>>
>> Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
>> ---
>>   arch/mips/kernel/mcount.S | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
>> index cff52b283e03..cd5545764e5f 100644
>> --- a/arch/mips/kernel/mcount.S
>> +++ b/arch/mips/kernel/mcount.S
>> @@ -87,8 +87,15 @@ EXPORT_SYMBOL(_mcount)
>>   	PTR_LA   t1, _etext
>>   	sltu     t3, t1, a0	/* t3 = (a0 > _etext) */
>>   	or       t1, t2, t3
>> +	PTR_LA	 t2, stlab-4 	/* t2: "function:stacktrace" return address */
>> +	move	 a1, AT		/* arg2: parent's return address */
>>   	beqz     t1, ftrace_call
>> -	 nop
>> +	 nop			/* "function:stacktrace" return address */
>> +stlab:
>> +	PTR_LA	t2, stlab-4
>> +	/* ftrace_call_end: ftrace_call return address */
>> +	beq	t2,ra, ftrace_call_end
>> +	nop
>>   #if defined(KBUILD_MCOUNT_RA_ADDRESS) && defined(CONFIG_32BIT)
>>   	PTR_SUBU a0, a0, 16	/* arg1: adjust to module's recorded callsite */
>>   #else
>> @@ -98,7 +105,9 @@ EXPORT_SYMBOL(_mcount)
>>   	.globl ftrace_call
>>   ftrace_call:
>>   	nop	/* a placeholder for the call to a real tracing function */
>> -	 move	a1, AT		/* arg2: parent's return address */
>> +	move	ra, t2		/* t2: "function:stacktrace" return address */
>> +
>> +ftrace_call_end:
>>   
>>   #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>>   	.globl ftrace_graph_call
