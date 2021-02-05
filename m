Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76563105F1
	for <lists+linux-mips@lfdr.de>; Fri,  5 Feb 2021 08:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbhBEHgZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Feb 2021 02:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbhBEHgX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Feb 2021 02:36:23 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AEC0C0613D6;
        Thu,  4 Feb 2021 23:35:42 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id p20so10281549ejb.6;
        Thu, 04 Feb 2021 23:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wv36x8mtHzmEU9YPki70QUxQfyr8hVegQBKr9eSudfs=;
        b=jfnYXYEvdfI4h7/UWIZHtNkFsQeIwZ0vVf96h7Ea1vEREN7GDyJQjNQTziqsyK93SM
         SrllI6oEXxIdij2KhlPTlOCloXdrV9V3GN68mlUKfHyR2LJNUi7MeQJ5Q+xUucB0Dug3
         7IWh6T+8XVQdN06sCVefljeOC4iw84lxJ/lnMM3/RGswlYicE2Mv2iYHx/9/uQ4h5Pi7
         HWfw8qx9SYrBVGnSDuzry+FMQQaRFE+t9+hfgqr02iH2nxF+eS3Ma0WN+LmVvM81HTe4
         29u+psiO3lmg/kVK/18SINZgUCqAsMN3vfUb3UxyKgLsEtTRxr285NAmrFCTlI0RZy+R
         qWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wv36x8mtHzmEU9YPki70QUxQfyr8hVegQBKr9eSudfs=;
        b=rPA2D1LshGLgjeOpQbPqhxu5wVI7X3cHp9sFRCXBG97AEVNE1om4TeYbsKgkarTDkw
         5i1/hA2zHeGD/jUVBQsMFaT+NZU4EzYobL7oZbrzG81oy0agvlbOtAJAEloseYHW9Qt4
         LXoFi/VbuISl/AtShtruT9P6RoKaaC7D0/Q0RVAQ1Cv+L6E0AW8AAM6UHZqflhjNSNWv
         N3ZYIMK7fyaxULs9zN199JT+JHOgwzfmdpii9reT2fra+3vdKwGHiAVGBou1Rm8f5u1t
         zTvOHypb5XXiELtRaSM6wTC19b8gB+R129pOA8NVjEbHqgF23dvnPUIrFLVzPxxl+ZWV
         lG0g==
X-Gm-Message-State: AOAM531zFz1FJ0iKtUWHCvdYO1rDnuIs//SvDXW8WuQlHNBzirJAbJ6o
        /zssMG4eqXyl99S1iPdWV4NMGyGpsO8sxsRG/Xs=
X-Google-Smtp-Source: ABdhPJwiJI3Hop+xvVQbRaPOon5GbNAbJYLAlRrdHwA+vovQOBasmWF2Yp4Dn9sup2NiIomv4GSH52Fi+5x0Lse0lcE=
X-Received: by 2002:a17:906:780c:: with SMTP id u12mr2807943ejm.125.1612510541275;
 Thu, 04 Feb 2021 23:35:41 -0800 (PST)
MIME-Version: 1.0
References: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Thu, 4 Feb 2021 23:35:29 -0800
Message-ID: <CAMo8BfLXaycXgy-F=TaWzpEZZJKEhbZecxwvBVd6jTo0RJ8atQ@mail.gmail.com>
Subject: Re: [PATCH] mm/memtest: Add ARCH_USE_MEMTEST
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 4, 2021 at 8:10 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> early_memtest() does not get called from all architectures. Hence enabling
> CONFIG_MEMTEST and providing a valid memtest=[1..N] kernel command line
> option might not trigger the memory pattern tests as would be expected in
> normal circumstances. This situation is misleading.
>
> The change here prevents the above mentioned problem after introducing a
> new config option ARCH_USE_MEMTEST that should be subscribed on platforms
> that call early_memtest(), in order to enable the config CONFIG_MEMTEST.
> Conversely CONFIG_MEMTEST cannot be enabled on platforms where it would
> not be tested anyway.
>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v5.11-rc6 and has been tested on arm64 platform. But
> it has been just build tested on all other platforms.
>
>  arch/arm/Kconfig     | 1 +
>  arch/arm64/Kconfig   | 1 +
>  arch/mips/Kconfig    | 1 +
>  arch/powerpc/Kconfig | 1 +
>  arch/x86/Kconfig     | 1 +
>  arch/xtensa/Kconfig  | 1 +
>  lib/Kconfig.debug    | 9 ++++++++-
>  7 files changed, 14 insertions(+), 1 deletion(-)

Anshuman, entries in arch/*/Konfig files are sorted in alphabetical order,
please keep them that way.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
