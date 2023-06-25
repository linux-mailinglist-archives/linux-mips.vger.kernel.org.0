Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955B173D46A
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jun 2023 23:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjFYVZJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Jun 2023 17:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjFYVZH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 25 Jun 2023 17:25:07 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68151137
        for <linux-mips@vger.kernel.org>; Sun, 25 Jun 2023 14:25:05 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3112c11fdc9so2103568f8f.3
        for <linux-mips@vger.kernel.org>; Sun, 25 Jun 2023 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687728304; x=1690320304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpEvNkmFhBPV/sgQmjmG/u9Az5tks6N1ix3FgBzMzh4=;
        b=XPi3AIP3sHw/BiO9+D1QLKVd26npdK3hmROeMnfMD+84Rh7ecz07cFV1swOBqXg2Jp
         0fYlEdumqqAmZnsD4c0N4E+xYKJGzbqinIAzjIRtEMYWWX8mGRqfd8h4ESKBkfPGFdq8
         YNwatYm5vad4u0IcrGPsfChk+hpNKBJX76sCWZaJEc4+kJuWrzixgLlp5Svn3tE4QbpK
         fXM+FXw1wkuFTFMHVyVo8pTDCh50D0x7kVjvYj6JmD68K8XJJPrAs39LDdbjhhokqL9d
         Rc2iUKAA9C58yEN2oWVJHYJnyuzWkmGbL5KMMDSfIEll9802O22bE8Tz3ElK+l0KZcPI
         247A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728304; x=1690320304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpEvNkmFhBPV/sgQmjmG/u9Az5tks6N1ix3FgBzMzh4=;
        b=McsJQzQbMups+SEJ5N+rycgRvUlNaDo27tF+PUK33XB90cVtJyy7bkyyTi74baXb7I
         m0ri83If9Gia9oPE9wiofQENo+/Ary096Gxynke3QbnGTtZ6TgXF7tf12FgmB61kcg4w
         rGM+nzMPhzU6U/E4Usycl2rg7YkvhpC0vpSMkMEgl8fZdF0PFEgc/tTKpYmr31QWaOaB
         KguU4qQy1iIs3f/1AfmnKZ5PccKx33Q/EwRjaIUGdDS87A4zcLsG0i/8N9Jh64+cKws3
         sLbjsk0l4wQBGdbGtUHihwT0ETDyaenxHUUr5qKtYLCbu+1ZzpOL/kcQsBvhbOl9K3sI
         lNKg==
X-Gm-Message-State: AC+VfDyfGKiLtqnB2msIruNJCJgByGBLzHCknqz3rFIQS5kO1UvOaAMr
        +MQPcvr8Ni5ywKSlw9AopB2YTg==
X-Google-Smtp-Source: ACHHUZ6w/KTem4en6DpoUOTRJpkCeba0iSA1Pbh0dhzDh23gdYN0n6DSJL7HItwPFWno5XUjveDcqg==
X-Received: by 2002:a05:6000:1962:b0:311:9a5:2d63 with SMTP id da2-20020a056000196200b0031109a52d63mr7485836wrb.42.1687728303983;
        Sun, 25 Jun 2023 14:25:03 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.212.184])
        by smtp.gmail.com with ESMTPSA id s25-20020a7bc399000000b003fa96fe2bebsm788890wmj.41.2023.06.25.14.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 14:25:03 -0700 (PDT)
Message-ID: <e8d8ee2b-1faa-1d60-d230-cbef8aecacef@linaro.org>
Date:   Sun, 25 Jun 2023 23:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [patch 05/17] loongarch/cpu: Switch to arch_cpu_finalize_init()
Content-Language: en-US
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org,
        Richard Henderson <richard.henderson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Zankel <chris@zankel.net>,
        Tom Lendacky <thomas.lendacky@amd.com>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.195288218@linutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230613224545.195288218@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/6/23 01:39, Thomas Gleixner wrote:
> check_bugs() is about to be phased out. Switch over to the new
> arch_cpu_finalize_init() implementation.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: loongarch@lists.linux.dev
> ---
>   arch/loongarch/Kconfig            |    1 +
>   arch/loongarch/include/asm/bugs.h |   15 ---------------
>   arch/loongarch/kernel/setup.c     |    4 ++--
>   3 files changed, 3 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

