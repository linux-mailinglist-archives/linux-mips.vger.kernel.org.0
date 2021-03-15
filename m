Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050E033B248
	for <lists+linux-mips@lfdr.de>; Mon, 15 Mar 2021 13:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhCOMLO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Mar 2021 08:11:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45076 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229870AbhCOMKt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Mar 2021 08:10:49 -0400
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxWdW4Tk9gJsMZAA--.1109S3;
        Mon, 15 Mar 2021 20:10:33 +0800 (CST)
Subject: Re: [PATCH v2] MIPS: Check __clang__ to avoid performance influence
 with GCC in csum_tcpudp_nofold()
To:     Alexander Lobakin <alobakin@pm.me>
References: <1615263493-10609-1-git-send-email-yangtiezhu@loongson.cn>
 <20210315102346.10227-1-alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        David Laight <David.Laight@ACULAB.COM>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <204cc2bb-cc4e-b639-e02b-1dd2dbcf7333@loongson.cn>
Date:   Mon, 15 Mar 2021 20:10:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210315102346.10227-1-alobakin@pm.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxWdW4Tk9gJsMZAA--.1109S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW7Ar4DtF15GF48uw17KFg_yoW8KrWfpF
        48tayqgrW0qryUGasrArZI9FyYvw4rGF92qrnIg3Wjva98XwnxWryfKw13Wry8Z3ykAa4S
        gFWfWwn5Crs2v3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
        IFyTuYvjfUn0eHDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/15/2021 06:24 PM, Alexander Lobakin wrote:
> From: Tiezhu Yang <yangtiezhu@loongson.cn>
> Date: Tue, 9 Mar 2021 12:18:13 +0800
>
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
>>   arch/mips/include/asm/checksum.h | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
>> index 1e6c135..80eddd4 100644
>> --- a/arch/mips/include/asm/checksum.h
>> +++ b/arch/mips/include/asm/checksum.h
>> @@ -128,9 +128,13 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
>>
>>   static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
>>   					__u32 len, __u8 proto,
>> -					__wsum sum)
>> +					__wsum sum_in)
>>   {
>> -	unsigned long tmp = (__force unsigned long)sum;
>> +#ifdef __clang__
> Why not rely on CONFIG_CC_IS_CLANG here?

Hi,

Thanks for your suggestion, I once considered that way:
https://lore.kernel.org/patchwork/patch/1371666/#1587127

But it still occurs build error under CC_IS_GCC when
make M=samples/bpf which used with Clang compiler,
so use __clang__ is better.

Thanks,
Tiezhu

>
>> +	unsigned long sum = (__force unsigned long)sum_in;
>> +#else
>> +	__wsum sum = sum_in;
>> +#endif
>>
>>   	__asm__(
>>   	"	.set	push		# csum_tcpudp_nofold\n"
>> @@ -159,7 +163,7 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
>>   	"	addu	%0, $1		\n"
>>   #endif
>>   	"	.set	pop"
>> -	: "=r" (tmp)
>> +	: "=r" (sum)
>>   	: "0" ((__force unsigned long)daddr),
>>   	  "r" ((__force unsigned long)saddr),
>>   #ifdef __MIPSEL__
>> @@ -169,7 +173,7 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
>>   #endif
>>   	  "r" ((__force unsigned long)sum));
>>
>> -	return (__force __wsum)tmp;
>> +	return (__force __wsum)sum;
>>   }
>>   #define csum_tcpudp_nofold csum_tcpudp_nofold
>>
>> --
>> 2.1.0
> Al

