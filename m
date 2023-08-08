Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A485774CBD
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 23:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236325AbjHHVQL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 17:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236343AbjHHVP7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 17:15:59 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB1F73D7
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 12:43:14 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-40fd2f6bd7cso43695101cf.1
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 12:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691523794; x=1692128594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwTW8jMAvb28UYV1FUItUKqid8JOjmIOyZrGcsVwlKo=;
        b=oMxO4eANXqG9sAN6mUyyciSDGBCzt4MgCaJQ+SAfLL5T54hffXF2uw8g2gQDnPESyN
         X56xeYrgUTETbtTN2Cif9VbhiBI/xnSz0pU3HTA9zDZGVhV9j6h2LDaQZ7G3B1gZTQNu
         cZD51oF5+di9GT+dKRC/nAvasWCdBLiBI1XczXTcO94WAYaBbFPVKKhiwoap0TkxzGlO
         5ESFp5jUi4S4iPkRWE0AVzGqJ/MBQDdwug3eN20BjDP7lCzQohuAp0T7qXIlARl+sZHT
         sVwmXppPl+vM1YRKnBPuZ5dJCMehIboEuPVIH/G4FDVgy3oOfRMicpPJfGT22dnUNBkd
         cnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691523794; x=1692128594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwTW8jMAvb28UYV1FUItUKqid8JOjmIOyZrGcsVwlKo=;
        b=l5ajPqeN8HmXPR5DcZTb4SbfwJv3fRpJYsyzYzEMlDbsvPOILHGBSopH8VNDjS/SJX
         SllsidVno+7nTZmplZZYU43oHRJjXSKeUIKJ0mBJzNgESxnbvKEKwYFQFFiR+FWoWxHc
         GclRxOqyEeA+LdLQlrgCcsMeJo4wSdsBeLEIpc2LhwMKMJ5CmnAB1KGrIeRbwV0p+/7b
         soosA4uuSlOJIiiFLRcJ6JKA1wzYqMAOFJNrrewpOsMwwihYIm5X9qhGPYc4Bb/wmeGL
         8eBhrhejjLZLNsrF9DoJCe5V30maDT0hLz4ra3/3wjqmtdsz1Q/nALMbIY7NQPlrk6H+
         IwSA==
X-Gm-Message-State: AOJu0YwdH/ORtYoSDRMB24ZSXpYuJKYiFKhN1vcsJyDKwVT30WXrAsG6
        mOP8jvwcZtadfAX6yP/wA14=
X-Google-Smtp-Source: AGHT+IG4Q0EsLyCSlI4Vpnzf1Wx+x/HKK8CMYbYlCMGlJf45n/cxw/shz4xZt5+DfscPAsa0p17q+g==
X-Received: by 2002:a05:622a:1906:b0:406:a592:756c with SMTP id w6-20020a05622a190600b00406a592756cmr957979qtc.58.1691523793503;
        Tue, 08 Aug 2023 12:43:13 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id v8-20020ac87488000000b0040fd6dfeca9sm3550092qtq.68.2023.08.08.12.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 12:43:12 -0700 (PDT)
Message-ID: <e161f63c-e573-7bb6-b988-d949c8ef0ac4@gmail.com>
Date:   Tue, 8 Aug 2023 12:43:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: soft and hard float n32 and n64 binaries getting illegal
 instructions on Cobalt Qube2
Content-Language: en-US
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>
References: <733b4eec-6297-e72e-0803-a32a25d83072@gmail.com>
 <alpine.DEB.2.21.2308051412570.38537@angie.orcam.me.uk>
 <3afb0b00-e4f2-15a7-c68f-8b2475dc9f77@gmail.com>
 <alpine.DEB.2.21.2308081027580.38537@angie.orcam.me.uk>
 <alpine.DEB.2.21.2308081153240.38537@angie.orcam.me.uk>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2308081153240.38537@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/8/23 04:07, Maciej W. Rozycki wrote:
> On Tue, 8 Aug 2023, Maciej W. Rozycki wrote:
> 
>>> Looks like GDB is not too happy with the core file I obtained, see below. Is
>>> this a known issue with gdb-12.1? gdb-11.x was not faring any better
>>> unfortunately. The core dump is attached (hope it makes it to the mailing
>>> list).
>>
>>   Sigh.  Back in 2017 I fixed numerous issues with MIPS core file handling
>> in GDB, which was then well-tested, and I haven't looked at it since.  So
>> it must be a regression, either in GDB or in the producer (Linux kernel).
>>
>>   I can reproduce it and I'll see if I can debug this.  I may ask you for
>> the corresponding binary and shared libraries at one point.
>>
>>   NB I note that the core file is ELF32 and does not have the EF_MIPS_ABI2
>> flag set in its file header, so it looks like an o32 core file to me.
>> Since your subject mentions n32/n64, can you please check what kind of
>> binary your `iperf3' is (e.g. `file iperf3', `readelf -h iperf3', etc.)?

file target/usr/bin/iperf3
target/usr/bin/iperf3: ELF 32-bit LSB pie executable, MIPS, N32 MIPS64 
version 1 (SYSV), dynamically linked, interpreter 
/lib/ld-musl-mipsn32el.so.1, stripped
readelf -h target/usr/bin/iperf3
ELF Header:
   Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
   Class:                             ELF32
   Data:                              2's complement, little endian
   Version:                           1 (current)
   OS/ABI:                            UNIX - System V
   ABI Version:                       0
   Type:                              DYN (Position-Independent 
Executable file)
   Machine:                           MIPS R3000
   Version:                           0x1
   Entry point address:               0xa90
   Start of program headers:          52 (bytes into file)
   Start of section headers:          66084 (bytes into file)
   Flags:                             0x60000027, noreorder, pic, cpic, 
abi2, mips64
   Size of this header:               52 (bytes)
   Size of program headers:           32 (bytes)
   Number of program headers:         10
   Size of section headers:           40 (bytes)
   Number of section headers:         24
   Section header string table index: 23

> 
>   I tweaked the core file and set the EF_MIPS_ABI2 flag by hand.  This has
> let GDB proceed:
> 
> [...]
> warning: File "/usr/lib/debug/.build-id" has no build-id, file skipped
> Core was generated by `iperf3 -c 192.168.254.3'.
> Program terminated with signal SIGILL, Illegal instruction.
> #0  0x77eb3190 in ?? (
> [...]
> 
> but this is a partial core file only and I have no corresponding binaries,
> so I can't tell more at this stage, i.e. what code there is at 0x77eb3190
> (the PC address is suspiciously high in the 32-bit address space BTW, is
> that a PIE run with address space randomisation?).

Yes, this is the case, PIC/PIE is enabled, -fstack-protector-strong as 
well as FULL RelRO are enabled. You can find the kernel, root 
filesystem, GCC -dumpspecs and core dump here:

https://github.com/ffainelli/cobalt-crash/

> 
>   Of course GDB shouldn't have hit an internal error with a broken core
> file anyway, it should complain and handle the situation gracefully.  But
> in any case it's an issue with the Linux kernel producing a core file in
> the wrong format.
> 
>   Is this the most recent Linux kernel version you have obtained this with?
> There used to be a bug (regression) in Linux with n32 core files, but I
> fixed it also in 2017, with commit 547da673173d ("MIPS: Fix an n32 core
> file generation regset support regression").  So if it has stopped working
> again, then it's a new regression.  Would you be able to bisect it?

Looks like this core dump was collected with Linux 4.14 which did not 
include your commit. Tried again with Linus' tip of the tree 
(v6.5-rc5-50-g02aee814d37c) and GDB had no problems loading the core 
dump this time. At least that part seems to be checked out.

Now GDB tells me the faulting instruction is the following:

#0  0x77dcf190 in _dlstart_data () from target/lib/ld-musl-mipsn32el.so.1
#1  0x77e28bfc in ?? () from target/lib/ld-musl-mipsn32el.so.1
(gdb) display/i $pc
2: x/i $pc
=> 0x77dcf190 <_dlstart_data+17976>:    dclz    v1,a0
(gdb) info reg
                   zero               at               v0               v1
  R0   0000000000000000 ffffffff9400ece0 0000000014000000 0000000004000004
                     a0               a1               a2               a3
  R4   0000000014000000 0000000004000004 0001000000000000 0000000004000004
                     a4               a5               a6               a7
  R8   0000000000000000 0000000000000000 000000007fc45b78 0000000000000000
                     t0               t1               t2               t3
  R12  0000000000000000 0000000000000000 0000005000000000 0000000000000000
                     s0               s1               s2               s3
  R16  0000000000000002 000000007fc47b90 401b400000000000 0000000000000004
                     s4               s5               s6               s7
  R20  0000000000000000 0000000077e7a781 0000000000000066 0000000000000000
                     t8               t9               k0               k1
  R24  0000000000000000 0000000077dcf180 0000000000000000 0000000000000000
                     gp               sp               s8               ra
  R28  0000000077ea0290 000000007fc45b10 000000007fc45b78 0000000077e28bfc
                     sr               lo               hi              bad
       ffffffffa400ecf3 0000000000000000 0000000000000000 000000007fc45b58
                  cause               pc
       0000000000800028 0000000077dcf190
                    fsr              fir
               00800004         000028a0
(gdb) display/i 0x14000000
2: x/i 0x14000000
    0x14000000:  <error: Cannot access memory at address 0x14000000>

curious...
-- 
Florian

