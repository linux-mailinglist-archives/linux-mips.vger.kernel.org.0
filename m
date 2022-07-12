Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37AA5727B6
	for <lists+linux-mips@lfdr.de>; Tue, 12 Jul 2022 22:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbiGLUuu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Jul 2022 16:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiGLUut (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Jul 2022 16:50:49 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E233252B6
        for <linux-mips@vger.kernel.org>; Tue, 12 Jul 2022 13:50:48 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id n9so5571765ilq.12
        for <linux-mips@vger.kernel.org>; Tue, 12 Jul 2022 13:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sudomaker-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=R9swCrtBFgsXtgZiDFwdqTPfiM6rXwAm5jk2u0q6gjw=;
        b=d1GpFJDfs3eO87jV11haNskwb0ckPxkN9yq4o5/aQ9JpUtpYFyjnAKg3Y3yeTXoH4p
         dW/Uc41qLO4foP2bVKF2ywJZlbb4o88ylKxAdFagCS0GlnIgVL6mSTOKPl84ZtVczNlO
         dFqlSPhDoI4vLC0RbCqeJuC8AOom7TjjXKWcY3uKcH1h00OL7QcUGOAmoDPkb+BoOYW5
         gxj87tW/Td0dQAs7fTF5Yr8nWcPjjLoAU6Ywp04AeybnyQDsmdkiJXH85rYpyskabYze
         ZnD1yEAPYEybj5gxS4+Y4bQ/VksNLQGRLST2QJJIeFa6sMFIgd/9gn+LGjP8eqK9+WIA
         IPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R9swCrtBFgsXtgZiDFwdqTPfiM6rXwAm5jk2u0q6gjw=;
        b=215dfY+9liG5nLoimLz1yh8sU2Xr/04gnQRz3X0qHpiae0IFLzoG4z97GfdU2vye6Q
         8wpO369LWuyU76eTcYWoehPEe/TtNjW0FxMqf+SI1/iKI53aQZJP3R5BMKFNHtKpsoGL
         SSXCK5CVTFidV0jZjq8r91MkseiKIQ1onBVYWD4Fe0pL6q3iTE8oWkEfaidIJkIqAOJs
         z6dEXJJOldSeRAmFPUYt7qb+EKW6vv2X+5lBcLwuhLx37vCoRZSxLc/V662lYuBQg/XC
         vnLCXyIck8pti9HYQO0VsjB1zhu1z4yZSepl+lIFsnuAyCY3m8aiFTo54LA1+RNeonhA
         Yycg==
X-Gm-Message-State: AJIora8xUQEqVUBSASzJMxVa0MEEIX4UG2/dVm1rGaaLc8h0Ys9C4lQB
        cNFY1S3w19jxeHBSNefrXbGfpQ==
X-Google-Smtp-Source: AGRyM1v9sHxSWjEmqSD+a2TBCgd/f+/XTkcx0ZwOdp5d7OETw9utjmquQuX2Nina9poV1nbFvA7lfQ==
X-Received: by 2002:a05:6e02:1c8b:b0:2dc:9d8d:b03c with SMTP id w11-20020a056e021c8b00b002dc9d8db03cmr33243ill.176.1657659047933;
        Tue, 12 Jul 2022 13:50:47 -0700 (PDT)
Received: from [172.16.24.11] ([185.230.126.10])
        by smtp.gmail.com with ESMTPSA id x22-20020a056638027600b0033efe711a37sm4472327jaq.35.2022.07.12.13.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 13:50:47 -0700 (PDT)
Message-ID: <41070648-3651-a6c4-4888-c142408f3e85@sudomaker.com>
Date:   Wed, 13 Jul 2022 04:51:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-mips@vger.kernel.org,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        aidanmacdonald.0x0@gmail.com
References: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
 <FVCXER.DV642VYMZNVS1@crapouillou.net>
From:   Mike Yang <reimu@sudomaker.com>
In-Reply-To: <FVCXER.DV642VYMZNVS1@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

Thanks for the information.


On 7/13/22 04:28, Paul Cercueil wrote:
> Hi Mike,
> 
> Le mer., juil. 13 2022 at 03:19:32 +0800, Mike Yang <reimu@sudomaker.com> a écrit :
>> The suspend-to-ram implementation of Ingenic SoCs in the current kernel is nowhere near usable, especially for the X series SoCs. Since it involves turning off CPU core power and putting DRAM into self-refresh mode, things are a bit complicated. Turning off CPU core power means all register files and cache contents are lost. Putting DRAM into self-refresh mode means it will no longer respond to bus transactions.
> 
> Suspend-to-RAM is well-tested and has been working fine for ages on all JZ SoCs, so I wouldn't call it "nowhere near usable". Zhou also implemented it on X-series SoCs.

With the vanilla 5.18 kernel, the system will simply become unresponsive after typing "echo mem > /sys/power/state". It won't respond to WKUP and other interrupt-enabled GPIO pins. The power consumption is a bit lower, but nowhere near 0.045W. The behavior is the same for X1000(E) and X1501.

I asked Dr. Zhou about this in person and he said he never tested the suspend-to-ram, nor he confirmed it working.

> 
>> I ported the implementation from Ingenic's 3.10 kernel to 5.18, and it worked. But it involves a separate piece of executable code, and apparently there's no way to eliminate it. During pm_enter(), various CPM registers are configured to turn off CPU core and put DRAM into self-refresh upon issuing the "wait" instruction, this piece of executable code will be copied to the on-chip SRAM, and its entry address will be written into the CPM.SLPC register. Then, cache will be flushed and CPU register files (incl. CP0, CP1 stuff) will also be saved in the SRAM. Finally, the "wait" instruction will be issued, and the suspend procedure completed. When any external events trigger a resume, the CPU is powered on, and immediately jumps to the PC stored in CPM.SLPC, and starts executing the piece of code. The code will perform the usual crt0 stuff on MIPS machines, reconfigure the DRAM into normal mode, and finally restore the register files. Then the control flow goes back to
>> pm_enter(), and the resume procedure is completed.
> 
> This sounds extremely complex and way overkill. But you don't need any of this.
> 
>> The suspend-to-ram really saves a lot of power. For my particular board, the idle power consumption is about 0.24W (1.25V Vcore, 1.2GHz, 1000Hz, preempt). After suspend-to-ram, it drops to only 0.045W.
> 
> Yes, doesn't surprise me. The RG-350 (JZ4770 based) can last about ~6 hours of up-time, and when put  to sleep it will survive a few weeks.
> 
>> So here are my questions:
>> 1. I don't see a way to eliminate the piece of executable code in SRAM. Is there any other ways?
> 
> There is what's already implemented, yes. When triggering a suspend, the CPM.LCR.LPM setting is set to SLEEP mode (drivers/clk/ingenic/pm.c), then the ingenic_pm_enter() function (arch/mips/generic/board-ingenic.c) just executes the "wait" CPU instruction to put the CPU to sleep. All clocks but the RTC one are disabled until an interrupt is raised.
> 
>> 2. If we can't eliminate the code in SRAM, what's the accepted way of integrating it into the kernel tree?
> 
> Already upstream :)
> 
>> 3. If the hardware doesn't have 32k crystal connected, or the RTC is stripped off (e.g. X1501), some CPM registers need to be configured differently. How could we provide this configuration?
> 
> It's already supported. The RTC clock can be re-parented (in device tree) to the EXT/512 clock, which is (as its name suggests) derived from the external EXT oscillator.
> 
> Hopefully I answered all your questions.
> 
> Cheers,
> -Paul
> 
> 

I'm afraid the above didn't work for me. Have you tested suspend-to-ram in person on a X series SoC?


Regards,
Mike


