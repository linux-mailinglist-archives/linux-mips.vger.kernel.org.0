Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF38C32CD74
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 08:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235631AbhCDHTZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 02:19:25 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33248 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236164AbhCDHTQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 02:19:16 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3_K+iUBg4TcUAA--.27040S3;
        Thu, 04 Mar 2021 15:18:24 +0800 (CST)
Subject: Re: [PATCH] MIPS: Fix inline asm input/output type mismatch in
 checksum.h used with Clang
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1611722507-12017-1-git-send-email-yangtiezhu@loongson.cn>
 <20210127210757.GF21002@alpha.franken.de>
 <alpine.DEB.2.21.2102122116230.35623@angie.orcam.me.uk>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Alexander Potapenko <glider@google.com>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <e2b21bdc-e847-cfe8-2c97-e99fcafcb4e8@loongson.cn>
Date:   Thu, 4 Mar 2021 15:18:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102122116230.35623@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx3_K+iUBg4TcUAA--.27040S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGFykXry5try8Aw1fCr43GFg_yoWrWw47pF
        4DKasrKrWqqry8C3s0yr4IgFyYyw48J3s3Zr9agw1UZas0qry8Xr9xKr4Y9F97J3yvy3WS
        grWfWF1Dur1vvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfUeeOJUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/13/2021 04:36 AM, Maciej W. Rozycki wrote:
> On Wed, 27 Jan 2021, Thomas Bogendoerfer wrote:
>
>>> Fix the following build error when make M=samples/bpf used with Clang:
>>>
>>>    CLANG-bpf  samples/bpf/sockex2_kern.o
>>> In file included from samples/bpf/sockex2_kern.c:7:
>>> In file included from ./include/uapi/linux/if_tunnel.h:7:
>>> In file included from ./include/linux/ip.h:16:
>>> In file included from ./include/linux/skbuff.h:28:
>>> In file included from ./include/net/checksum.h:22:
>>> ./arch/mips/include/asm/checksum.h:161:9: error: unsupported inline asm: input with type 'unsigned long' matching output with type '__wsum' (aka 'unsigned int')
>>>          : "0" ((__force unsigned long)daddr),
>>>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> 1 error generated.
>>>
>>> This is a known issue on MIPS [1], the changed code can be compiled
>>> successfully by both GCC and Clang.
>>>
>>> [1] https://lore.kernel.org/linux-mips/CAG_fn=W0JHf8QyUX==+rQMp8PoULHrsQCa9Htffws31ga8k-iw@mail.gmail.com/
>>>
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> ---
>>>   arch/mips/include/asm/checksum.h | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>> applied to mips-next.
>   This is in a performance-critical path (otherwise it wouldn't have been
> in the form of inline assembly).  Has it been verified that it does not
> regress code quality with GCC?
>
>   The semantics is clear here: output is in the same register as in input,
> but the register holds a different local variable in each case.  There's
> nothing odd about that and the variables can obviously be of a different
> type each; that's no different to register usage with code produced by the
> compiler directly itself from a high-level language.
>
>   I seem to remember discussing the issue before, but I can't remember what
> the outcome has been WRT filing this as a Clang bug, and archives are not
> easily available at the moment (I know a mirror exists, but any old links
> are not relevant there).  Would someone be able to fill me in?
>
>   I think ultimately with any critical piece where a Clang workaround does
> regress code produced with GCC we do want to go with `#ifdef __clang__' so
> that good use with GCC is not penalised on one hand and we know the places
> to revert changes at should Clang ever get fixed.
>
>   Otherwise I'll start suspecting that Clang supporters try some kind of an
> unfair game to gain advantage over GCC, by modifying projects such that
> the competing compiler produces worse code than it could if Clang was not
> actively supported.
>
>    Maciej

Hi Maciej,

Thank you very much for your detailed explanation, sorry for the
late response and the poorly considered implementation about the
performance influence with GCC.

I think you are right, so are you OK with the following changes?
If yes, I will send a new patch later.

With the new patch, we can build successfully by both GCC and Clang,
at the same time, we can avoid the potential performance influence
with GCC.

diff --git a/arch/mips/include/asm/checksum.h 
b/arch/mips/include/asm/checksum.h
index 1e6c135..0079a8e 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -130,7 +130,9 @@ static inline __wsum csum_tcpudp_nofold(__be32 
saddr, __be32 daddr,
                                         __u32 len, __u8 proto,
                                         __wsum sum)
  {
+#ifdef CONFIG_CC_IS_CLANG
         unsigned long tmp = (__force unsigned long)sum;
+#endif

         __asm__(
         "       .set    push            # csum_tcpudp_nofold\n"
@@ -159,7 +161,11 @@ static inline __wsum csum_tcpudp_nofold(__be32 
saddr, __be32 daddr,
         "       addu    %0, $1          \n"
  #endif
         "       .set    pop"
+#ifdef CONFIG_CC_IS_CLANG
         : "=r" (tmp)
+#else
+       : "=r" (sum)
+#endif
         : "0" ((__force unsigned long)daddr),
           "r" ((__force unsigned long)saddr),
  #ifdef __MIPSEL__
@@ -169,7 +175,11 @@ static inline __wsum csum_tcpudp_nofold(__be32 
saddr, __be32 daddr,
  #endif
           "r" ((__force unsigned long)sum));

+#ifdef CONFIG_CC_IS_CLANG
         return (__force __wsum)tmp;
+#else
+       return sum;
+#endif
  }
  #define csum_tcpudp_nofold csum_tcpudp_nofold

Thanks,
Tiezhu

