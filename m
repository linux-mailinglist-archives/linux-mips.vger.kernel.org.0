Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694641B6AAF
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 03:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgDXBKW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 21:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725888AbgDXBKW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Apr 2020 21:10:22 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367D0C09B042
        for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2020 18:10:22 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id f3so8699556ioj.1
        for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2020 18:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oSGx6A1KIda6bEQ9R3KmalJUq1noI1nWwSQp38SZchQ=;
        b=i+XlQ0LuDjxtD2KeZw0o1JSd4pbKutuMPWMxGNvJ9dDGas5dAPl3mOJyAYjIOHY9SH
         Q62vrs6FYiykYZjLg2dpm2ZJ8YgWT2KXPrvbZqrul1RpASz2kvJsHuk5eaznxJoPT40v
         43WoTCv4l6kvkMrHdgl2Nt8BaWDruVScxKpCz3P1WD7m4kSc2LMvfqa1U+/Iosk318Pd
         n9TXNtQ6EHw9ZAIHz3Q7cgKERDXI5U7XQLQr4O7xXucZP9+qWECdis66XOyUYec+e5GE
         34nejy4sO33J1mt0oNhQ2SZeJhSU9sfkUEqdy/JitsuBz3SLB7PumkHxh1q/Vppmpetp
         Nd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oSGx6A1KIda6bEQ9R3KmalJUq1noI1nWwSQp38SZchQ=;
        b=JOUloR2V+SUxkaixaT4MgGcQsw+BS2HxE77FWM2QEQNcArr4cRKOarFiJrkMm9HkdX
         7H1wJ+Op1Q8xCJ1MfuOrTMdyh5fnRA/UTqJf1RaF7r2S9Fm8PfMslCBv7J2/6++it0gq
         4asUS7iP7vdxjC/nS47vp+jAUrU8X0MqZW/FXrPZuqT44iPL+BVItqDZ3bXgUkQglbyH
         m5ljfqMdQjrZHJxHoFD8JJ/5u+37PRdGYgW8Q9WGSuZwF2h5H5uAmA9KkEhZbTeSZ45o
         u06mYF0ctE3D8aHi4rh4B79cp5DlYVdfwlIKD9U5zPYFx6zjBBlvwUtrlMx1Jc1+QBzj
         Xwlg==
X-Gm-Message-State: AGi0PuZVcEF1Ck6AzdH1fYQqqfEz9OuZfCyAGMwbsMDuNWA6qPI8P4s7
        Pz0T4zQ3CIPu6yJNZuvt/YLBJiZwgEQRAyyxtDBLN/G5
X-Google-Smtp-Source: APiQypK2I8rmzbnCM5QIH3bIAZNh08cNmI/q4xVCUjT76SLlgbhrY4g9GAP8y+5iRWhSXHCF+CZ1yUPJij3BaCYNd4g=
X-Received: by 2002:a02:966a:: with SMTP id c97mr6074763jai.106.1587690621598;
 Thu, 23 Apr 2020 18:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200423234421.13805-1-huangll@lemote.com>
In-Reply-To: <20200423234421.13805-1-huangll@lemote.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Fri, 24 Apr 2020 09:17:45 +0800
Message-ID: <CAAhV-H4=AO04amww+jXXD21o2RLqimwQKOo98ujeZeC+L+RP0Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: arch_send_call_function_single_ipi() calling
 conventions change
To:     Liangliang Huang <huanglllzu@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Liangliang Huang <huangll@lemote.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Thu, Apr 23, 2020 at 7:45 PM Liangliang Huang <huanglllzu@gmail.com> wrote:
>
> Use mp_ops->send_ipi_single() instead of mp_ops->send_ipi_mask() in
> arch_send_call_function_single_ipi(). send_ipi_single() can send
> IPI signal to a special cpu more efficiently.
>
> Signed-off-by: Liangliang Huang <huangll@lemote.com>
> ---
>  arch/mips/include/asm/smp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
> index 7990c1c..5d9ff61 100644
> --- a/arch/mips/include/asm/smp.h
> +++ b/arch/mips/include/asm/smp.h
> @@ -125,7 +125,7 @@ static inline void arch_send_call_function_single_ipi(int cpu)
>  {
>         extern const struct plat_smp_ops *mp_ops;       /* private */
>
> -       mp_ops->send_ipi_mask(cpumask_of(cpu), SMP_CALL_FUNCTION);
> +       mp_ops->send_ipi_single(cpu, SMP_CALL_FUNCTION);
>  }
>
>  static inline void arch_send_call_function_ipi_mask(const struct cpumask *mask)
> --
> 2.7.0
>
