Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533ED2A5C88
	for <lists+linux-mips@lfdr.de>; Wed,  4 Nov 2020 03:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgKDCAY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 21:00:24 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:39434 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgKDCAY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Nov 2020 21:00:24 -0500
Received: by mail-io1-f65.google.com with SMTP id p7so20634616ioo.6;
        Tue, 03 Nov 2020 18:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q7LFjEeJrDM+Fx+leScIeW6KxbYUSuFa1TzeyDsXSiA=;
        b=YtVU1aqch+v9kSIpUxRVjsCVTLFGGpZ8gBcQ+k02JITJStbpI+jeRdIdxejVKtFp0H
         qrvSNli06QigfAOhLQJ/2ObK+LhHPTXIuZwlQv30eHb7kKU9njVwLx+MpHUOw2oKf0rS
         K9etz/N28ULhl3Cq0/7SON67t3B/672qILI5Gaf3Ys1yHzPe3ZxCM0zbtVGa3BAjLpsv
         GlhdeNBrlFlFay01s/nO7BVxq0S6MLUsCJSJ41u+dIyslt1Z17QMPxgTjfAkN/V6gYko
         0GxhCXdQ0nSM9IOkoBwcFbpgrb1G8XHJpx9ixL5KFP3HtXGHY+u5vAaoXfitHnWlYTuJ
         kI9A==
X-Gm-Message-State: AOAM531vNZDfWlL+tOj612UdeaY4h2s6/bi1GdPWrMDNKan5qcoa/9h8
        qBcSGIYegPnlUvn7qX54ulJUX6qt2hxW84eQqW9Kee4D8Z0qKw==
X-Google-Smtp-Source: ABdhPJxeigkHoKzdirZZzu0ZiPn/fWy8le1kZl9BwU/cad6newK3owJHQ7FnCSbKbHRWFyT2GOJDKmMuJBOtmzwPzNs=
X-Received: by 2002:a6b:dc0f:: with SMTP id s15mr15979794ioc.180.1604455222049;
 Tue, 03 Nov 2020 18:00:22 -0800 (PST)
MIME-Version: 1.0
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn> <1604387525-23400-2-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1604387525-23400-2-git-send-email-yangtiezhu@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 4 Nov 2020 10:00:10 +0800
Message-ID: <CAAhV-H4WfaCLuCzvCJx-UriqgPAz2b0H6LGwMhyhRaxvuSAMwQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] MIPS: Loongson64: Do not write the read only field
 LPA of CP0_CONFIG3
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Tiezhu,

On Tue, Nov 3, 2020 at 3:13 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> The field LPA of CP0_CONFIG3 register is read only for Loongson64, so the
> write operations are meaningless, remove them.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>
> v2: No changes
> v3: No changes
>
>  arch/mips/include/asm/mach-loongson64/kernel-entry-init.h | 8 --------
>  arch/mips/loongson64/numa.c                               | 3 ---
>  2 files changed, 11 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> index 87a5bfb..e4d77f4 100644
> --- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> +++ b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> @@ -19,10 +19,6 @@
>         .macro  kernel_entry_setup
>         .set    push
>         .set    mips64
> -       /* Set LPA on LOONGSON3 config3 */
> -       mfc0    t0, CP0_CONFIG3
> -       or      t0, (0x1 << 7)
> -       mtc0    t0, CP0_CONFIG3
Sorry for the late response, I have the same worry as Jiaxun. As you
know, Loongson's user manuals are not always correct, but the original
code comes from Loongson are usually better. So, my opinion is "Don't
change it if it doesn't break anything".

Huacai

>         /* Set ELPA on LOONGSON3 pagegrain */
>         mfc0    t0, CP0_PAGEGRAIN
>         or      t0, (0x1 << 29)
> @@ -54,10 +50,6 @@
>         .macro  smp_slave_setup
>         .set    push
>         .set    mips64
> -       /* Set LPA on LOONGSON3 config3 */
> -       mfc0    t0, CP0_CONFIG3
> -       or      t0, (0x1 << 7)
> -       mtc0    t0, CP0_CONFIG3
>         /* Set ELPA on LOONGSON3 pagegrain */
>         mfc0    t0, CP0_PAGEGRAIN
>         or      t0, (0x1 << 29)
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index cf9459f..c7e3cced 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -40,9 +40,6 @@ static void enable_lpa(void)
>         unsigned long value;
>
>         value = __read_32bit_c0_register($16, 3);
> -       value |= 0x00000080;
> -       __write_32bit_c0_register($16, 3, value);
> -       value = __read_32bit_c0_register($16, 3);
>         pr_info("CP0_Config3: CP0 16.3 (0x%lx)\n", value);
>
>         value = __read_32bit_c0_register($5, 1);
> --
> 2.1.0
>
