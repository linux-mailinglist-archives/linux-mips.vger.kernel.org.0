Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DB23EE6FC
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 09:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234625AbhHQHII (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 03:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234741AbhHQHII (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Aug 2021 03:08:08 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DB7C061764;
        Tue, 17 Aug 2021 00:07:35 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1629184053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=M5vEOrmUZ/7iiA0ok5cYoWGZ9p/fqiIXSRXLn17nevs=;
        b=st61vqpH3pL+9MJflwlR7TQy0tnRliq2uR+V9XK3bBqW9Z9jdsXF3/FbX5bVIVws6GTMzb
        uiESRbTZhFdXKGJ9SMI7nJJBVMMKYetWA+ygAE0TVYrtYrCr11K7vKEcyJITXTiZD3e5Vg
        jAMnRi4J486RYRod6n3P94oRcNvINos1qCAbwud1JxkW28NB7zFLbihmlJ/ZSfjcDYk7Q+
        iEKLa6WDZYH9bBcRhsuTa0jiaUORj9nhB7tGdaPKvtTFZSXWM6tGgqYHf9SBaFwdBRGAL8
        aIKNxiyKTQ/devHkMZjTyiz7ncInKxgWH9avXmNmGdNiODKmzXNn/dtZOT+nQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1629184053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=M5vEOrmUZ/7iiA0ok5cYoWGZ9p/fqiIXSRXLn17nevs=;
        b=NY81Fugu1nR0drMuAiGUREJu1drIDB4eyyd2n5uuMm7itDE9MilnIxHWx10ykWH3/4Xs1i
        Oq/Qfmc58i0DTPAw==
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     Davidlohr Bueso <dave@stgolabs.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hongchen Zhang <zhanghongchen@loongson.cn>
Subject: Re: [PATCH] futex: Fix fault_in_user_writeable()
In-Reply-To: <CAAhV-H5TKLMi0GSQmh9RFK_k5eNRwx8AE8MjMKjJfbnyVYP-+w@mail.gmail.com>
References: <20210816065417.3987596-1-chenhuacai@loongson.cn>
 <20210816182750.26i535ilc6nef5k6@offworld> <874kbpp5zd.ffs@tglx>
 <CAAhV-H5TKLMi0GSQmh9RFK_k5eNRwx8AE8MjMKjJfbnyVYP-+w@mail.gmail.com>
Date:   Tue, 17 Aug 2021 09:07:32 +0200
Message-ID: <871r6spn0r.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 17 2021 at 09:53, Huacai Chen wrote:
> On Tue, Aug 17, 2021 at 3:03 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>> That's surely one way to fix that. If that does not work for whatever
>> reason, then we really don't want this find_vma() hack there, but rather
>> something like:
> I don't know why find_vma() is unacceptable here, there is also
> find_vma() in fixup_user_fault().

Wrong. find_extend_vma() != find_vma(). Aside of that fixup_user_fault()
does way more than that.

>>     if (IS_ENABLED(CONFIG_ARCH_USER_FAULT_VOODOO) && get_user(&tmp, uaddr))
>>         return -EFAULT;
>
> get_user() may be better than find_vma(), but can we drop
> CONFIG_ARCH_USER_FAULT_VOODOO here? On those "W implies R" archs,
> get_user() always success, this can simplify the logic.

For architectures which imply R fixup_user_fault() is way more
effinicient than taking the fault on get_user() and then invoking
fixup_user_fault() to ensure that the mapping is writeable.

No, we are not making stuff less efficient just because of MIPS.

Thanks,

        tglx
