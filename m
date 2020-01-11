Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B788F137C45
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2020 09:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbgAKIGQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Jan 2020 03:06:16 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:46800 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728540AbgAKIGP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 11 Jan 2020 03:06:15 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47vsqm5ykfz9tyFs;
        Sat, 11 Jan 2020 09:06:12 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=ggWIklQc; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id PcX4nicAFbTS; Sat, 11 Jan 2020 09:06:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47vsqm4v6Gz9tyDq;
        Sat, 11 Jan 2020 09:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578729972; bh=iX+t5k/wf9Y5JLs3/fwGtLqMUkb6XwIvyDjT5v/Phek=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ggWIklQcspMBoPTRyd17oZsfer6f9LSMGzkHw/KdQLeit8iEZSJm7LYUBsM/G66xt
         XTmIkiMujZoxHFaKQNJ0N1cUykdITzkeOXnePgGU5sZHrkdKEoF6sOd2TrdoQc/tV8
         gxtjq32yFtuoc5vIxnOjGZ1J2s9pM8GijaL0GbUE=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id A14258B78F;
        Sat, 11 Jan 2020 09:06:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id bVOLD0hrPkja; Sat, 11 Jan 2020 09:06:13 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id CAE8F8B752;
        Sat, 11 Jan 2020 09:06:12 +0100 (CET)
Subject: Re: [RFC PATCH v2 07/10] lib: vdso: don't use READ_ONCE() in
 __c_kernel_time()
To:     Thomas Gleixner <tglx@linutronix.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <fc1ff722c7cbe63a63ae02ade3a714d2049d54a5.1577111367.git.christophe.leroy@c-s.fr>
 <87lfqfrp7d.fsf@nanos.tec.linutronix.de>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a995445f-9b00-ca13-d23a-1aea3b345718@c-s.fr>
Date:   Sat, 11 Jan 2020 08:05:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87lfqfrp7d.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 01/10/2020 09:12 PM, Thomas Gleixner wrote:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>
>> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
>> index 17b4cff6e5f0..5a17a9d2e6cd 100644
>> --- a/lib/vdso/gettimeofday.c
>> +++ b/lib/vdso/gettimeofday.c
>> @@ -144,7 +144,7 @@ __cvdso_gettimeofday(const struct vdso_data *vd, struct __kernel_old_timeval *tv
>>   static __maybe_unused __kernel_old_time_t
>>   __cvdso_time(const struct vdso_data *vd, __kernel_old_time_t *time)
>>   {
>> -	__kernel_old_time_t t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
>> +	__kernel_old_time_t t = vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec;
>>   
>>   	if (time)
>>   		*time = t;
> 
> Allows the compiler to load twice, i.e. the returned value might be different from the
> stored value. So no.
> 

With READ_ONCE() the 64 bits are being read:

00000ac8 <__c_kernel_time>:
  ac8:	2c 03 00 00 	cmpwi   r3,0
  acc:	81 44 00 20 	lwz     r10,32(r4)
  ad0:	81 64 00 24 	lwz     r11,36(r4)
  ad4:	41 82 00 08 	beq     adc <__c_kernel_time+0x14>
  ad8:	91 63 00 00 	stw     r11,0(r3)
  adc:	7d 63 5b 78 	mr      r3,r11
  ae0:	4e 80 00 20 	blr

Without the READ_ONCE() only 32 bits are read. That's the most optimal.

00000ac8 <__c_kernel_time>:
  ac8:	7c 69 1b 79 	mr.     r9,r3
  acc:	80 64 00 24 	lwz     r3,36(r4)
  ad0:	4d 82 00 20 	beqlr
  ad4:	90 69 00 00 	stw     r3,0(r9)
  ad8:	4e 80 00 20 	blr

Without READ_ONCE() but with a barrier() after the read, we should get 
the same result but GCC (GCC 8.1) does less good:

00000ac8 <__c_kernel_time>:
  ac8:	81 24 00 24 	lwz     r9,36(r4)
  acc:	2f 83 00 00 	cmpwi   cr7,r3,0
  ad0:	41 9e 00 08 	beq     cr7,ad8 <__c_kernel_time+0x10>
  ad4:	91 23 00 00 	stw     r9,0(r3)
  ad8:	7d 23 4b 78 	mr      r3,r9
  adc:	4e 80 00 20 	blr

Assuming both part of the 64 bits data will fall into a single 
cacheline, the second read is in the noise.

So agreed to drop this change.

Christophe
