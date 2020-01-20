Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F466142E2F
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2020 15:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgATO4q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jan 2020 09:56:46 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:56792 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726860AbgATO4q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Jan 2020 09:56:46 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 481ZWC44c9z9v1xD;
        Mon, 20 Jan 2020 15:56:39 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=iuBLQmw4; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id kzvItXeAdApu; Mon, 20 Jan 2020 15:56:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 481ZWC2dgDz9v1xC;
        Mon, 20 Jan 2020 15:56:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1579532199; bh=7a7pH0OuPJ37Tokg90N9GbyIEViwQm3IBxxlGbRco4U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iuBLQmw4SdLFu8wXBuDZ2Hk+qOZ7RlDsSCIdnPQ/fwTAZttl5QD/WEybExnxVKYpn
         zKGmHcCaDYFBT0aF1DolPqjYevZoXPMFPjzQfN5g9anMJruv0gr2/LYX0xiPvp2Wln
         Wbfm7ED4pN8P0a3f4DeDkE6qqIZRKgkXlMJlv6SY=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 50E548B7CA;
        Mon, 20 Jan 2020 15:56:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 7yXE7xArml9v; Mon, 20 Jan 2020 15:56:44 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr [172.25.230.100])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id F37C98B7BD;
        Mon, 20 Jan 2020 15:56:43 +0100 (CET)
Subject: Re: [RFC PATCH v4 00/11] powerpc: switch VDSO to C implementation.
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
        luto@kernel.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
 <20200117085851.GS3191@gate.crashing.org>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3027b6d2-47a9-a871-7c52-050a5f9c6ab7@c-s.fr>
Date:   Mon, 20 Jan 2020 14:56:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200117085851.GS3191@gate.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi

On 01/17/2020 08:58 AM, Segher Boessenkool wrote:
> Hi!
> 
> On Thu, Jan 16, 2020 at 05:58:24PM +0000, Christophe Leroy wrote:
>> On a powerpc8xx, with current powerpc/32 ASM VDSO:
>>
>> gettimeofday:    vdso: 907 nsec/call
>> clock-getres-realtime:    vdso: 484 nsec/call
>> clock-gettime-realtime:    vdso: 899 nsec/call
>>
>> The first patch adds VDSO generic C support without any changes to common code.
>> Performance is as follows:
>>
>> gettimeofday:    vdso: 1211 nsec/call
>> clock-getres-realtime:    vdso: 722 nsec/call
>> clock-gettime-realtime:    vdso: 1216 nsec/call
>>
>> Then a few changes in the common code have allowed performance improvement. At
>> the end of the series we have:
>>
>> gettimeofday:    vdso: 974 nsec/call
>> clock-getres-realtime:    vdso: 545 nsec/call
>> clock-gettime-realtime:    vdso: 941 nsec/call
>>
>> The final result is rather close to pure ASM VDSO:
>> * 7% more on gettimeofday (9 cycles)
>> * 5% more on clock-gettime-realtime (6 cycles)
>> * 12% more on clock-getres-realtime (8 cycles)
> 
> Nice!  Much better.
> 
> It should be tested on more representative hardware, too, but this looks
> promising alright :-)
> 

mpc832x (e300c2 core) at 333 MHz:

Before:

gettimeofday:    vdso: 235 nsec/call
clock-getres-realtime-coarse:    vdso: 1668 nsec/call
clock-gettime-realtime-coarse:    vdso: 1338 nsec/call
clock-getres-realtime:    vdso: 135 nsec/call
clock-gettime-realtime:    vdso: 244 nsec/call
clock-getres-boottime:    vdso: 1232 nsec/call
clock-gettime-boottime:    vdso: 1935 nsec/call
clock-getres-tai:    vdso: 1257 nsec/call
clock-gettime-tai:    vdso: 1898 nsec/call
clock-getres-monotonic-raw:    vdso: 1229 nsec/call
clock-gettime-monotonic-raw:    vdso: 1541 nsec/call
clock-getres-monotonic-coarse:    vdso: 1699 nsec/call
clock-gettime-monotonic-coarse:    vdso: 1477 nsec/call
clock-getres-monotonic:    vdso: 135 nsec/call
clock-gettime-monotonic:    vdso: 283 nsec/call

With the series:

gettimeofday:    vdso: 271 nsec/call
clock-getres-realtime-coarse:    vdso: 159 nsec/call
clock-gettime-realtime-coarse:    vdso: 184 nsec/call
clock-getres-realtime:    vdso: 163 nsec/call
clock-gettime-realtime:    vdso: 281 nsec/call
clock-getres-boottime:    vdso: 169 nsec/call
clock-gettime-boottime:    vdso: 274 nsec/call
clock-getres-tai:    vdso: 163 nsec/call
clock-gettime-tai:    vdso: 277 nsec/call
clock-getres-monotonic-raw:    vdso: 166 nsec/call
clock-gettime-monotonic-raw:    vdso: 302 nsec/call
clock-getres-monotonic-coarse:    vdso: 159 nsec/call
clock-gettime-monotonic-coarse:    vdso: 184 nsec/call
clock-getres-monotonic:    vdso: 166 nsec/call
clock-gettime-monotonic:    vdso: 274 nsec/call

Christophe
