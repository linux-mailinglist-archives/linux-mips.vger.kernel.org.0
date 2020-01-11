Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2E9137C83
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2020 10:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgAKJHb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Jan 2020 04:07:31 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:26873 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728558AbgAKJHb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 11 Jan 2020 04:07:31 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47vvBS1rZkz9v0BR;
        Sat, 11 Jan 2020 10:07:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=PZ/2te1r; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id l5ql95pznsJ6; Sat, 11 Jan 2020 10:07:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47vvBS0XFxz9v0BQ;
        Sat, 11 Jan 2020 10:07:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578733648; bh=bzOO0eq3rPteSRK7r1Clp2BTCK6IVyXURFdIfOWjM7Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PZ/2te1rXwcImLHBiGUYH375uKtRYemPt4v+iRuxl6k/JHCycxcGM1a9Oqdm6wft+
         CLlSsirB8Q5YGyW4i7Xhji5Mvba50sQTB7yCRn0cePdvJpatZO9zydNx+5JGqCRxBv
         mtjRFb/aM0zNoZ+98zneA3O+sjg9ZOMBTaXiig7g=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 18B7C8B78F;
        Sat, 11 Jan 2020 10:07:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id DxJwS8svO6HZ; Sat, 11 Jan 2020 10:07:28 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 401D38B752;
        Sat, 11 Jan 2020 10:07:28 +0100 (CET)
Subject: Re: [RFC PATCH v2 05/10] lib: vdso: inline do_hres()
To:     Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <d0f8dfb26c025d3e3eee1b5f610161ca19b942df.1577111367.git.christophe.leroy@c-s.fr>
 <CAK8P3a36OgFuY72b_i6+0xBNGnaxS1SsRid+HrgQHPZtUJp3LQ@mail.gmail.com>
 <87o8vbrpej.fsf@nanos.tec.linutronix.de>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8cdb8a09-b1b6-c0a4-8b30-da095a9a660c@c-s.fr>
Date:   Sat, 11 Jan 2020 09:06:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87o8vbrpej.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 01/10/2020 09:07 PM, Thomas Gleixner wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
>> On Mon, Dec 23, 2019 at 3:31 PM Christophe Leroy
>> <christophe.leroy@c-s.fr> wrote:
>>>
>>> do_hres() is called from several places, so GCC doesn't inline
>>> it at first.
>>>
>>> do_hres() takes a struct __kernel_timespec * parameter for
>>> passing the result. In the 32 bits case, this parameter corresponds
>>> to a local var in the caller. In order to provide a pointer
>>> to this structure, the caller has to put it in its stack and
>>> do_hres() has to write the result in the stack. This is suboptimal,
>>> especially on RISC processor like powerpc.
>>>
>>> By making GCC inline the function, the struct __kernel_timespec
>>> remains a local var using registers, avoiding the need to write and
>>> read stack.
>>>
>>> The improvement is significant on powerpc.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>
>> Good idea, I can see how this ends up being an improvement
>> for most of the callers.
>>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
>    https://lore.kernel.org/r/20191112012724.250792-3-dima@arista.com
> 
> On the way to be applied.
> 

Oh nice, I get even better result with the way it is done by Dmitry 
compared to my own first patch.

On an mpc8xx at 132Mhz (32bits powerpc), before the patch I have
gettimeofday:    vdso: 1256 nsec/call
clock-gettime-monotonic-raw:    vdso: 1449 nsec/call
clock-gettime-monotonic-coarse:    vdso: 768 nsec/call
clock-gettime-monotonic:    vdso: 1390 nsec/call

With the patch I have:
gettimeofday:    vdso: 947 nsec/call
clock-gettime-monotonic-raw:    vdso: 1156 nsec/call
clock-gettime-monotonic-coarse:    vdso: 638 nsec/call
clock-gettime-monotonic:    vdso: 1094 nsec/call

So that's a 20-25% improvement.

I modified it slightly as follows:

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 9e474d54814f..b793f211bca8 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -37,8 +37,8 @@ u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, 
u32 mult)
  }
  #endif

-static int do_hres(const struct vdso_data *vd, clockid_t clk,
-		   struct __kernel_timespec *ts)
+static __always_inline int do_hres(const struct vdso_data *vd, 
clockid_t clk,
+				   struct __kernel_timespec *ts)
  {
  	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
  	u64 cycles, last, sec, ns;
@@ -67,8 +67,8 @@ static int do_hres(const struct vdso_data *vd, 
clockid_t clk,
  	return 0;
  }

-static void do_coarse(const struct vdso_data *vd, clockid_t clk,
-		      struct __kernel_timespec *ts)
+static __always_inline int do_coarse(const struct vdso_data *vd, 
clockid_t clk,
+				     struct __kernel_timespec *ts)
  {
  	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
  	u32 seq;
@@ -78,6 +78,8 @@ static void do_coarse(const struct vdso_data *vd, 
clockid_t clk,
  		ts->tv_sec = vdso_ts->sec;
  		ts->tv_nsec = vdso_ts->nsec;
  	} while (unlikely(vdso_read_retry(vd, seq)));
+
+	return 0;
  }

  static __maybe_unused int
@@ -95,15 +97,16 @@ __cvdso_clock_gettime_common(const struct vdso_data 
*vd, clockid_t clock,
  	 * clocks are handled in the VDSO directly.
  	 */
  	msk = 1U << clock;
-	if (likely(msk & VDSO_HRES)) {
-		return do_hres(&vd[CS_HRES_COARSE], clock, ts);
-	} else if (msk & VDSO_COARSE) {
-		do_coarse(&vd[CS_HRES_COARSE], clock, ts);
-		return 0;
-	} else if (msk & VDSO_RAW) {
-		return do_hres(&vd[CS_RAW], clock, ts);
-	}
-	return -1;
+	if (likely(msk & VDSO_HRES))
+		vd += CS_HRES_COARSE;
+	else if (msk & VDSO_COARSE)
+		return do_coarse(&vd[CS_HRES_COARSE], clock, ts);
+	else if (msk & VDSO_RAW)
+		vd += CS_RAW;
+	else
+		return -1;
+
+	return do_hres(vd, clock, ts);
  }

  static __maybe_unused int

---

Christophe
