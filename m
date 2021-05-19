Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3B638907D
	for <lists+linux-mips@lfdr.de>; Wed, 19 May 2021 16:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354184AbhESORu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 19 May 2021 10:17:50 -0400
Received: from aposti.net ([89.234.176.197]:60920 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354180AbhESOQ1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 May 2021 10:16:27 -0400
Date:   Wed, 19 May 2021 15:14:47 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] arch/mips/boot/compressed/string.c: Fix build warnings
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     zhaoxiao <zhaoxiao@uniontech.com>, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <N8YCTQ.J6CD851ZEGJ73@crapouillou.net>
In-Reply-To: <8d01b52e-6687-a624-6a76-97b4b71d999e@flygoat.com>
References: <20210519084405.27364-1-zhaoxiao@uniontech.com>
        <8d01b52e-6687-a624-6a76-97b4b71d999e@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le mer., mai 19 2021 at 22:00:07 +0800, Jiaxun Yang 
<jiaxun.yang@flygoat.com> a écrit :
> 
> 
> 在 2021/5/19 16:44, zhaoxiao 写道:
>> Fixes the following W=1 kernel build warning(s):
>> arch/mips/boot/compressed/string.c:11:7: warning: no previous 
>> prototype for 'memcpy' [-Wmissing-prototypes]
>>   void *memcpy(void *dest, const void *src, size_t n)
>>         ^~~~~~
>> arch/mips/boot/compressed/string.c:22:7: warning: no previous 
>> prototype for 'memset' [-Wmissing-prototypes]
>>   void *memset(void *s, int c, size_t n)
>>         ^~~~~~
>> arch/mips/boot/compressed/string.c:32:15: warning: no previous 
>> prototype for 'memmove' [-Wmissing-prototypes]
>>   void * __weak memmove(void *dest, const void *src, size_t n)
> Hi Xiao,
> 
> Are you sure you know what you're doing?
> 
> They're supposed to be called by external reference in vmlinuz.
> Marking them static makes no sense.

I was wondering that too.

I suppose including <asm/string.h> should be enough to fix the warnings.

Cheers,
-Paul

>>                 ^~~~~~~
>> 
>> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
>> ---
>>   arch/mips/boot/compressed/string.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/arch/mips/boot/compressed/string.c 
>> b/arch/mips/boot/compressed/string.c
>> index 0b593b709228..d28996509f91 100644
>> --- a/arch/mips/boot/compressed/string.c
>> +++ b/arch/mips/boot/compressed/string.c
>> @@ -8,7 +8,7 @@
>>   #include <linux/compiler_attributes.h>
>>   #include <linux/types.h>
>>   -void *memcpy(void *dest, const void *src, size_t n)
>> +static void *memcpy(void *dest, const void *src, size_t n)
>>   {
>>   	int i;
>>   	const char *s = src;
>> @@ -19,7 +19,7 @@ void *memcpy(void *dest, const void *src, size_t n)
>>   	return dest;
>>   }
>>   -void *memset(void *s, int c, size_t n)
>> +static void *memset(void *s, int c, size_t n)
>>   {
>>   	int i;
>>   	char *ss = s;
>> @@ -29,7 +29,7 @@ void *memset(void *s, int c, size_t n)
>>   	return s;
>>   }
>>   -void * __weak memmove(void *dest, const void *src, size_t n)
>> +static void * __weak memmove(void *dest, const void *src, size_t n)
>>   {
>>   	unsigned int i;
>>   	const char *s = src;
> 


