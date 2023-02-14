Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6004695E21
	for <lists+linux-mips@lfdr.de>; Tue, 14 Feb 2023 10:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbjBNJHN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Feb 2023 04:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbjBNJG7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Feb 2023 04:06:59 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D116244B0
        for <linux-mips@vger.kernel.org>; Tue, 14 Feb 2023 01:06:09 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id n33so4463441wms.0
        for <linux-mips@vger.kernel.org>; Tue, 14 Feb 2023 01:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lGDtk89XYKXto3T46jdYJS4baOVf8wKH+bEbt2a13A=;
        b=EXGAKwqdwp45M55oyQEpZ9s11tIxJVKDmyxfqRpvLJ7iwHOMdleuZVIpZf+bKKyPLr
         WUmLzZkawn8dDugm0+h+Q8ZztTAJOf1O7RBwABByNfudNg39nvhjEZOsLMdComtJkvIa
         mOOACAo1ti2X0i/R+p5qH9s2EuWERiT4zROiXcWcmiZbyHZPXjCCE1gXI/suledcbnSO
         s58Z5QMsqj5quNavEg/vVJJ+jxlYMkAW8M4TmJ/UyxO8tMShf9afsiCM+8VlZQw98Tky
         i7/1rC5LDixGnMLStzpUQU6pXp9qisKPVZ0aJqBQKPI5FELYesfgWZu690GNKAT9DMLM
         t++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lGDtk89XYKXto3T46jdYJS4baOVf8wKH+bEbt2a13A=;
        b=phnmBw9+CkK3eXPkHP2xINkSsC+ywsHayDpCJ9GYTFeuyTBmWfKCntbNLcGliK8HW2
         xwXgpgVUwlE/6ELhHvr9+MLsKZg9r15Ajn/7wM9JPuYGxJOVQTiXB+Gcx2JKZypEll63
         cG2m2EDqhIPopPBnF9azrpOFgo0+YyiJvB3Bjc3eY8cp3DFuRaDMXMeXEfzjEMqIxcQ5
         b3QhzZ5ZN8X6sOC9oeC7xC4lh4qwFyCkdr8LwWG2SSvIs+IIQosZbdAkVCsrg1Y2R0oM
         SUdSTBJa2k4U0S/a4ugk30qIqRAWpzoiNttMAq0bR2+EGz4pQ82q/TjfUSKGhzc9kceB
         CD+g==
X-Gm-Message-State: AO0yUKXF8IOilFblt4jfWsR4khN7Ze4UHP6BlY0I/f5QnPdUQ8+Heoc8
        H3Xtm0J/onvFUCP5dz7LTSbK1A==
X-Google-Smtp-Source: AK7set8b+gc17B9aLvg2W9QWD8SjR16ECHsQicot+4Ai+Gvau6Qhz0rnes/7lNYL7+rM27ct6ais4g==
X-Received: by 2002:a05:600c:548c:b0:3e1:11bd:f577 with SMTP id iv12-20020a05600c548c00b003e111bdf577mr1957731wmb.26.1676365564223;
        Tue, 14 Feb 2023 01:06:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003dc1d668866sm19174017wmc.10.2023.02.14.01.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:06:03 -0800 (PST)
Message-ID: <84bde3ef-4701-431c-3ae0-3f5793e1e13a@linaro.org>
Date:   Tue, 14 Feb 2023 10:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 14/24] arc: Remove empty <uapi/asm/setup.h>
Content-Language: en-US
To:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-15-alexghiti@rivosinc.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-15-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/2/23 08:49, Alexandre Ghiti wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   arch/arc/include/asm/setup.h      | 1 -
>   arch/arc/include/uapi/asm/setup.h | 6 ------
>   2 files changed, 7 deletions(-)
>   delete mode 100644 arch/arc/include/uapi/asm/setup.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

