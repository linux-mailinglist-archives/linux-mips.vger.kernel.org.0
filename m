Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6717D331CEA
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 03:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhCICXa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 21:23:30 -0500
Received: from mail.loongson.cn ([114.242.206.163]:43788 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229599AbhCICXA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 21:23:00 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD_P620ZgwjQXAA--.30714S3;
        Tue, 09 Mar 2021 10:22:50 +0800 (CST)
Subject: Re: [PATCH] MIPS: Check __clang__ to avoid performance influence with
 GCC in csum_tcpudp_nofold()
To:     David Laight <David.Laight@ACULAB.COM>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1615207807-29972-1-git-send-email-yangtiezhu@loongson.cn>
 <8d61574e815a4cf098d21eb4d749be0f@AcuMS.aculab.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0e07b9bf-03b7-64d4-1989-cba7abc5edeb@loongson.cn>
Date:   Tue, 9 Mar 2021 10:22:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8d61574e815a4cf098d21eb4d749be0f@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxD_P620ZgwjQXAA--.30714S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWkuw4fCr43WF1xKryUJrb_yoW5WF47pF
        4jkas2q3yvqryUKF9Ivr4S9r98Kr4rGF92vrnIg3Wjva45Xr13Wr93Kw15Gry8JaykAa4S
        9FWfWr1kCrs2vaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
        73UjIFyTuYvjfU0GYLUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/09/2021 12:52 AM, David Laight wrote:
> From: Tiezhu Yang
>> Sent: 08 March 2021 12:50
>>
>> The asm code in csum_tcpudp_nofold() is performance-critical, I am sorry
>> for the poorly considered implementation about the performance influence
>> with GCC in the commit 198688edbf77 ("MIPS: Fix inline asm input/output
>> type mismatch in checksum.h used with Clang").
>>
>> With this patch, we can build successfully by both GCC and Clang,
>> at the same time, we can avoid the potential performance influence
>> with GCC.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   arch/mips/include/asm/checksum.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
>> index 1e6c135..64d353e 100644
>> --- a/arch/mips/include/asm/checksum.h
>> +++ b/arch/mips/include/asm/checksum.h
>> @@ -130,7 +130,9 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
>>   					__u32 len, __u8 proto,
>>   					__wsum sum)
>>   {
>> +#ifdef __clang__
>>   	unsigned long tmp = (__force unsigned long)sum;
>> +#endif
> What happens if you make the above:
> #ifdef __clang__
> 	unsigned long tmp = (__force unsigned long)sum;
> #else
> 	__wsum tmp = sum;
> #endif
> 	
> and then leave the rest of the function the same for both compilers.
> Maybe do s/sum/sum_in/,s/tmp/sum/ to reduce the changes.

Hi David,

Thank you very much.

As you suggested, the following changes looks much better,
I will test it and then send v2 later.

diff --git a/arch/mips/include/asm/checksum.h 
b/arch/mips/include/asm/checksum.h
index 1e6c135..80eddd4 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -128,9 +128,13 @@ static inline __sum16 ip_fast_csum(const void *iph, 
unsigned int ihl)

  static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
                                         __u32 len, __u8 proto,
-                                       __wsum sum)
+                                       __wsum sum_in)
  {
-       unsigned long tmp = (__force unsigned long)sum;
+#ifdef __clang__
+       unsigned long sum = (__force unsigned long)sum_in;
+#else
+       __wsum sum = sum_in;
+#endif

         __asm__(
         "       .set    push            # csum_tcpudp_nofold\n"
@@ -159,7 +163,7 @@ static inline __wsum csum_tcpudp_nofold(__be32 
saddr, __be32 daddr,
         "       addu    %0, $1          \n"
  #endif
         "       .set    pop"
-       : "=r" (tmp)
+       : "=r" (sum)
         : "0" ((__force unsigned long)daddr),
           "r" ((__force unsigned long)saddr),
  #ifdef __MIPSEL__
@@ -169,7 +173,7 @@ static inline __wsum csum_tcpudp_nofold(__be32 
saddr, __be32 daddr,
  #endif
           "r" ((__force unsigned long)sum));

-       return (__force __wsum)tmp;
+       return (__force __wsum)sum;
  }
  #define csum_tcpudp_nofold csum_tcpudp_nofold

Thanks,
Tiezhu

>
> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

