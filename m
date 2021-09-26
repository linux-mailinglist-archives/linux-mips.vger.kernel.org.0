Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05A14185A8
	for <lists+linux-mips@lfdr.de>; Sun, 26 Sep 2021 04:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhIZCbz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Sep 2021 22:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhIZCby (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Sep 2021 22:31:54 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D954C061570;
        Sat, 25 Sep 2021 19:30:18 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id l13so13439103qtv.3;
        Sat, 25 Sep 2021 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4CptpZWxpa9AD5XHSfeYvB2U2B9avHF1fdTnjBAOMds=;
        b=SRinvHFKkR0Ezmdi+M/tbKzA3ip48XbpFvrTMmMc46ACmi/kSbbQFWVAYYOsCty2v8
         lnWuma34k27fXugCE0q7JzOwcWCq40MZrckwjPyTTJ713gTQzO9idTpKpPDl1VBo3BwG
         OddSavRsJFuDJt+nLgSoIX66dUC4IYJC8btojoYb1Ilw+bkfXa65NrQuMeCSilcHIXO0
         FZNwj9QgkKyU6eHxMNM2l/O09vnRRaOJON9Wn7VBKMDsFDR0TRa0g2Znh97PyHcKMKjX
         F6EtpJoHGhSLQ18iLOBKYDu3TiV6mgzLg7pNifeg1YRswRZLiQNrg/XzGkZ8yGSwB7Wp
         C8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4CptpZWxpa9AD5XHSfeYvB2U2B9avHF1fdTnjBAOMds=;
        b=NNHZgJzVfjvgOUlE/HO7F8bzrZVvkP3FHb4J2qV4FhUIrbxz6gzkcVD766lKcOBEwY
         nKK3y+iVu82apMeGlTZyYKIswrNKCqNvPFxgTkKtYTMRfpM4380TAq7DMonwB1Amexa0
         KJwT/fTXGL+TvajDGW/RZQne8Y2BWrqVRiPTo3laHZthFBvFsQHRMZRXED54TOWTHrLO
         G+ncpeRxMJ1V3HyOq1xk+Vc4wCrcta0TY3xeHlFk3F7vOQvUD2trIidGnSHRxI9XjdoI
         fMG2xyJRwlxBXEtcihUJTDAkYlrZgWTLzJcFbhd+bDKTmXgDwgm1UWh/Qera5iGL+yNY
         /Eig==
X-Gm-Message-State: AOAM531s32DbOhjfvkzbJs16ThhOzCOVQmfV/VJZlDE6q081Ia+MSpyG
        EEqHijX9guQj6VISxdu2bqw=
X-Google-Smtp-Source: ABdhPJyv30VxeyPInxpyVrn8tv0GNTeDXZ5047MhsEGitAeotshJWlaZZ+L2U+fV+qBObxFxENc4Sw==
X-Received: by 2002:a05:622a:650:: with SMTP id a16mr11959713qtb.157.1632623417715;
        Sat, 25 Sep 2021 19:30:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:dfe0:49f0:a90f:da5:ff6e:aa3e? ([2600:1700:dfe0:49f0:a90f:da5:ff6e:aa3e])
        by smtp.gmail.com with ESMTPSA id 13sm9428930qka.56.2021.09.25.19.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Sep 2021 19:30:17 -0700 (PDT)
Message-ID: <087d0551-25be-984c-ee89-acad4c80e00e@gmail.com>
Date:   Sat, 25 Sep 2021 19:30:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 06/11] genirq: Export
 irq_gc_{unmask_enable,mask_disable}_reg
Content-Language: en-US
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Russell King <linux@armlinux.org.uk>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
 <20210924170546.805663-7-f.fainelli@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210924170546.805663-7-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 9/24/2021 10:05 AM, Florian Fainelli wrote:
> In order to allow drivers/irqchip/irq-brcmstb-l2.c to be built as a
> module we need to export: irq_gc_unmask_enable_reg() and
> irq_gc_mask_disable_reg().

Note to self: this needs to come before patch 5 to avoid a modular build 
  linking failure.
-- 
Florian
