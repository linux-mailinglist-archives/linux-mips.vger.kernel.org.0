Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F0673D47B
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jun 2023 23:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjFYV2Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Jun 2023 17:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjFYV2Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 25 Jun 2023 17:28:24 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E43184
        for <linux-mips@vger.kernel.org>; Sun, 25 Jun 2023 14:28:23 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-311099fac92so3761460f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 25 Jun 2023 14:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687728501; x=1690320501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMexNiIRy9oTUPu+gxyIQBAQ495HkmhaJAzybvKUJRI=;
        b=papCXwz4FQ+rLuJHibopRsi98zD0kIYG0DOxn6ywfikL/uYFQ+MfDBvWgm3cHnA/lP
         PVJwSnw++RjnC9pZJ36Kcb1Dn9tOT69N2tCEMwM7tVzBv88TXkhppogwCz1RY6W3YvVe
         Gl7K0nJEHXdJYQBVoi2pQGhTBgpoOZbDeMfs4/NiRUv9E7QznLGzWwRQ1Ou+X7tcblU3
         4yiO9GFqu44/QpUAKHHtYjvOXtdgm0yu4g3o2Om0KNrksywhZPAWiYW7FEm4elDyXv5o
         BMvkjoxmdvSA1ZNrWSkgQa2nxDlnouHPz6jy7JPoPIFmd50JN+jOycdowBFgMEw2UbUH
         X+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728501; x=1690320501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMexNiIRy9oTUPu+gxyIQBAQ495HkmhaJAzybvKUJRI=;
        b=LD9LyT8HZBewk/b7yl6I4NSmIpwWeRn5EFSYOUpgLAImQx+0n5wtMpkOrgLqZg64ov
         H+IvJdVZ9IwN24gUxAlmiLS/zsKj80UxGHYaQjqNDnKGd21Xt9rvKjdUdC5g2lcDwLRX
         KMjYsafpHdwiXqZ3ZDvob4QZ2sS1XIXkZNo6egekLbURefuwcOUGmeQcAC6VztAYlbxU
         VQBnG2q6wZg2qMHFvbN/f/qNeSf952l8BE01XvxYP7iUSTY111Rs5Y4OkNNan+cMn+oG
         zg7VJFmrX/4ysboVA1K0T7UaHi1KdE10S9S5rd4/vQbj4D237FsPGuFWoDjO6KVXRcjS
         FbEg==
X-Gm-Message-State: AC+VfDzRsK7bOEMd6eTPc5DUwqxA3fIFkvfPTM+FTby/vOCg9Yr/TOwF
        EMsNxgAkIVWWUr/oxMOGz/pPTw==
X-Google-Smtp-Source: ACHHUZ773Gc1VRsoALOlLX+eTKJvNy9FMYEhjB0U9nB/aZKzSBP7vPbMNT7BTLVf01D/i+3QzXdclg==
X-Received: by 2002:a5d:6ad1:0:b0:30a:e69d:7219 with SMTP id u17-20020a5d6ad1000000b0030ae69d7219mr22239047wrw.65.1687728501664;
        Sun, 25 Jun 2023 14:28:21 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.212.184])
        by smtp.gmail.com with ESMTPSA id oz31-20020a170906cd1f00b0098860721959sm2459759ejb.198.2023.06.25.14.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 14:28:21 -0700 (PDT)
Message-ID: <a0eec475-cfc0-f298-d370-aae0c0a7a3da@linaro.org>
Date:   Sun, 25 Jun 2023 23:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [patch 10/17] um/cpu: Switch to arch_cpu_finalize_init()
Content-Language: en-US
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
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
        sparclinux@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Zankel <chris@zankel.net>,
        Tom Lendacky <thomas.lendacky@amd.com>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.493148694@linutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230613224545.493148694@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: linux-um@lists.infradead.org
> ---
>   arch/um/Kconfig            |    1 +
>   arch/um/include/asm/bugs.h |    7 -------
>   arch/um/kernel/um_arch.c   |    3 ++-
>   3 files changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

