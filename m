Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5C672F47F
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jun 2023 08:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243062AbjFNGOR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Jun 2023 02:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243054AbjFNGOP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Jun 2023 02:14:15 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5471BC5
        for <linux-mips@vger.kernel.org>; Tue, 13 Jun 2023 23:14:12 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f8d258f203so1571185e9.1
        for <linux-mips@vger.kernel.org>; Tue, 13 Jun 2023 23:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686723251; x=1689315251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xrMiA/tC+fxE5mDARnTcw4ms3upNNvUiArk5dZHjQRk=;
        b=UEu47kI5BYKterLbgXk6yn5h3lFN3p948gwTWT/PhIRzwv83SpBb49D/jS0ykSITA7
         1h/631nx8uRXLal8IBavUCSx3KzLlv3fbEDijTmoNqLy61OosXICTPXimuEd+wbjtY5V
         yW/RHp9NmwTRTmhkbU/n+i8HSxp3bJGw+ljf/jQ9fePGt0N2Rxhesq/6Z2VMlxurZlgE
         q54hLVpA6pRzjY3vS/UFv3aPA5C+k2j5ugmq3VTR0a6O3LTlkLat8K7sK7GNDwe/o/7L
         XaTQ5BVagcyQTZz7dfT5PzAa8HIWGBx6KqHhEp27PijMbE9LIT7CUsDeGV/RKXs/+hzL
         obKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686723251; x=1689315251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xrMiA/tC+fxE5mDARnTcw4ms3upNNvUiArk5dZHjQRk=;
        b=jK7AWijWJ5a0GScGb+7T1go9mo/2H79zGsLB4Cs/K4OsQ/QlGQ3PADr634XDbAoTTI
         iHm9eCuHuAac0QfUh3peFKG74PsOTPpRY68iaElWQ/c30MuMNs8bf9d6nkjw4//3sa55
         WEnr1ZAkxaGmaM9YlgN3wkKNW7FyBKz2ICqRt3BapoHo38NCAJ0vZ6nPl8eTZvGQWeEH
         2j3LJxKsbQW9MT60/Lg0TEXlrDreLOGVEwVspdCjp9QQxb4k+cCQpVL3lT97JKs8kFhb
         AQDsykQM2kFyVkXfgxcx/AmGejzJ+HxAlWOBzvfOOTb82xuBZk4Jdnhf5J6dIhl0VV3P
         ni1g==
X-Gm-Message-State: AC+VfDyVtlt0lMCqZUoVn8SasoixJJtR6HpI+9wJxrariPg7MiR1uhFF
        l7HV/tn/2aAk/L13TFyaENph9Q==
X-Google-Smtp-Source: ACHHUZ5sRS5Fyz/k0P/IDiQ9BD0qSNJ2ZIH5A2yLae6xAaPbBztuD6ZaTrtzPOYbyGo7mO5pBjnUww==
X-Received: by 2002:a05:600c:2059:b0:3f6:2ce:caa8 with SMTP id p25-20020a05600c205900b003f602cecaa8mr8959147wmg.29.1686723251172;
        Tue, 13 Jun 2023 23:14:11 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
        by smtp.gmail.com with ESMTPSA id l7-20020a7bc347000000b003f4248dcfcbsm16551765wmj.30.2023.06.13.23.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 23:14:10 -0700 (PDT)
Message-ID: <75d63a28-bb33-ffd0-a0e5-282ec7c3dbed@linaro.org>
Date:   Wed, 14 Jun 2023 08:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [patch 11/17] init: Remove check_bugs() leftovers
Content-Language: en-US
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Zankel <chris@zankel.net>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
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
        Tom Lendacky <thomas.lendacky@amd.com>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.553215951@linutronix.de>
From:   Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230613224545.553215951@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/14/23 01:39, Thomas Gleixner wrote:
> Everything is converted over to arch_cpu_finalize_init(). Remove the
> check_bugs() leftovers including the empty stubs in asm-generic, alpha,
> parisc, powerpc and xtensa.
> 
> Signed-off-by: Thomas Gleixner<tglx@linutronix.de>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> Cc: "James E.J. Bottomley"<James.Bottomley@HansenPartnership.com>
> Cc: Michael Ellerman<mpe@ellerman.id.au>
> Cc: Chris Zankel<chris@zankel.net>
> ---
>   arch/alpha/include/asm/bugs.h   |   20 --------------------
>   arch/parisc/include/asm/bugs.h  |   20 --------------------
>   arch/powerpc/include/asm/bugs.h |   15 ---------------
>   arch/xtensa/include/asm/bugs.h  |   18 ------------------
>   include/asm-generic/bugs.h      |   11 -----------
>   init/main.c                     |    5 -----
>   6 files changed, 89 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
