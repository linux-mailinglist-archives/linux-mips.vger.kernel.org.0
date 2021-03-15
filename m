Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F36833B2B2
	for <lists+linux-mips@lfdr.de>; Mon, 15 Mar 2021 13:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhCOM0y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Mar 2021 08:26:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48182 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229729AbhCOM0R (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Mar 2021 08:26:17 -0400
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf9deUk9gscQZAA--.15749S3;
        Mon, 15 Mar 2021 20:26:06 +0800 (CST)
Subject: Re: [PATCH v2] MIPS: Check __clang__ to avoid performance influence
 with GCC in csum_tcpudp_nofold()
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <1615263493-10609-1-git-send-email-yangtiezhu@loongson.cn>
 <alpine.DEB.2.21.2103142140000.33195@angie.orcam.me.uk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        David Laight <David.Laight@ACULAB.COM>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bdfe753d-0ef2-8f66-7716-acadfc3917a5@loongson.cn>
Date:   Mon, 15 Mar 2021 20:26:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103142140000.33195@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxf9deUk9gscQZAA--.15749S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKFWrurW8KFy8XrykKrW7Jwb_yoW7Cw1fpr
        W8Jr4UZFsIvry8WFy5Gry5urW5tr1DC3WUAFnxJw15ZF9xWrnrJryrJa97CrnrJr15AF12
        qFyDKr4kJw45KaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUjsjjDUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/15/2021 04:49 AM, Maciej W. Rozycki wrote:
> On Tue, 9 Mar 2021, Tiezhu Yang wrote:
>
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
>> +	unsigned long sum = (__force unsigned long)sum_in;
>> +#else
>> +	__wsum sum = sum_in;
>> +#endif
>   This looks much better to me, but I'd keep the variable names unchanged
> as `sum_in' isn't used beyond the initial assignment anyway (you'll have
> to update the references with asm operands accordingly of course).
>
>   Have you verified that code produced by GCC remains the same with your
> change in place as it used to be up to commit 198688edbf77?  I can see no
> such information in the commit description whether here or in the said
> commit.
>
>    Maciej

Hi Maciej,

Thanks for your reply.

gcc --version
gcc (Debian 10.2.1-6) 10.2.1 20210110

net/ipv4/tcp_ipv4.c
tcp_v4_send_reset()
   csum_tcpudp_nofold()

objdump -d vmlinux > vmlinux.dump

(1) Before commit 198688edbf77
("MIPS: Fix inline asm input/output type mismatch in checksum.h used 
with Clang"):

ffffffff80aa835c:       00004025        move    a4,zero
ffffffff80aa8360:       92020012        lbu     v0,18(s0)
ffffffff80aa8364:       de140030        ld      s4,48(s0)
ffffffff80aa8368:       0064182d        daddu   v1,v1,a0
ffffffff80aa836c:       304200ff        andi    v0,v0,0xff
ffffffff80aa8370:       9c64000c        lwu     a0,12(v1)
ffffffff80aa8374:       9c660010        lwu     a2,16(v1)
ffffffff80aa8378:       afa70038        sw      a3,56(sp)
ffffffff80aa837c:       24071a00        li      a3,6656
ffffffff80aa8380:       0086202d        daddu   a0,a0,a2
ffffffff80aa8384:       0087202d        daddu   a0,a0,a3
ffffffff80aa8388:       0088202d        daddu   a0,a0,a4
ffffffff80aa838c:       0004083c        dsll32  at,a0,0x0
ffffffff80aa8390:       0081202d        daddu   a0,a0,at
ffffffff80aa8394:       0081082b        sltu    at,a0,at
ffffffff80aa8398:       0004203f        dsra32  a0,a0,0x0
ffffffff80aa839c:       00812021        addu    a0,a0,at

(2) After commit 198688edbf77
("MIPS: Fix inline asm input/output type mismatch in checksum.h used 
with Clang"):

ffffffff80aa836c:       00004025        move    a4,zero
ffffffff80aa8370:       92040012        lbu     a0,18(s0)
ffffffff80aa8374:       de140030        ld      s4,48(s0)
ffffffff80aa8378:       0062182d        daddu   v1,v1,v0
ffffffff80aa837c:       308400ff        andi    a0,a0,0xff
ffffffff80aa8380:       9c62000c        lwu     v0,12(v1)
ffffffff80aa8384:       9c660010        lwu     a2,16(v1)
ffffffff80aa8388:       afa70038        sw      a3,56(sp)
ffffffff80aa838c:       24071a00        li      a3,6656
ffffffff80aa8390:       0046102d        daddu   v0,v0,a2
ffffffff80aa8394:       0047102d        daddu   v0,v0,a3
ffffffff80aa8398:       0048102d        daddu   v0,v0,a4
ffffffff80aa839c:       0002083c        dsll32  at,v0,0x0
ffffffff80aa83a0:       0041102d        daddu   v0,v0,at
ffffffff80aa83a4:       0041082b        sltu    at,v0,at
ffffffff80aa83a8:       0002103f        dsra32  v0,v0,0x0
ffffffff80aa83ac:       00411021        addu    v0,v0,at

(3) With this patch:

ffffffff80aa835c:       00004025        move    a4,zero
ffffffff80aa8360:       92020012        lbu     v0,18(s0)
ffffffff80aa8364:       de140030        ld      s4,48(s0)
ffffffff80aa8368:       0064182d        daddu   v1,v1,a0
ffffffff80aa836c:       304200ff        andi    v0,v0,0xff
ffffffff80aa8370:       9c64000c        lwu     a0,12(v1)
ffffffff80aa8374:       9c660010        lwu     a2,16(v1)
ffffffff80aa8378:       afa70038        sw      a3,56(sp)
ffffffff80aa837c:       24071a00        li      a3,6656
ffffffff80aa8380:       0086202d        daddu   a0,a0,a2
ffffffff80aa8384:       0087202d        daddu   a0,a0,a3
ffffffff80aa8388:       0088202d        daddu   a0,a0,a4
ffffffff80aa838c:       0004083c        dsll32  at,a0,0x0
ffffffff80aa8390:       0081202d        daddu   a0,a0,at
ffffffff80aa8394:       0081082b        sltu    at,a0,at
ffffffff80aa8398:       0004203f        dsra32  a0,a0,0x0
ffffffff80aa839c:       00812021        addu    a0,a0,at

(4) With the following changes based on commit 198688edbf77
("MIPS: Fix inline asm input/output type mismatch in checksum.h used 
with Clang"):

diff --git a/arch/mips/include/asm/checksum.h 
b/arch/mips/include/asm/checksum.h
index 1e6c135..e1f80407 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -130,7 +130,11 @@ static inline __wsum csum_tcpudp_nofold(__be32 
saddr, __be32 daddr,
                      __u32 len, __u8 proto,
                      __wsum sum)
  {
+#ifdef __clang__
      unsigned long tmp = (__force unsigned long)sum;
+#else
+    __wsum tmp = sum;
+#endif

      __asm__(
      "    .set    push        # csum_tcpudp_nofold\n"

ffffffff80aa835c:       00004025        move    a4,zero
ffffffff80aa8360:       92020012        lbu     v0,18(s0)
ffffffff80aa8364:       de140030        ld      s4,48(s0)
ffffffff80aa8368:       0064182d        daddu   v1,v1,a0
ffffffff80aa836c:       304200ff        andi    v0,v0,0xff
ffffffff80aa8370:       9c64000c        lwu     a0,12(v1)
ffffffff80aa8374:       9c660010        lwu     a2,16(v1)
ffffffff80aa8378:       afa70038        sw      a3,56(sp)
ffffffff80aa837c:       24071a00        li      a3,6656
ffffffff80aa8380:       0086202d        daddu   a0,a0,a2
ffffffff80aa8384:       0087202d        daddu   a0,a0,a3
ffffffff80aa8388:       0088202d        daddu   a0,a0,a4
ffffffff80aa838c:       0004083c        dsll32  at,a0,0x0
ffffffff80aa8390:       0081202d        daddu   a0,a0,at
ffffffff80aa8394:       0081082b        sltu    at,a0,at
ffffffff80aa8398:       0004203f        dsra32  a0,a0,0x0
ffffffff80aa839c:       00812021        addu    a0,a0,at

The code produced by GCC remains the same between (1), (3) and (4),
the last changes looks like better (with less changes based on commit
198688edbf77), so I will send v3 later.

Thanks,
Tiezhu

