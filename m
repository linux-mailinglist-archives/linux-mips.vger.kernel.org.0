Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1996B4A6110
	for <lists+linux-mips@lfdr.de>; Tue,  1 Feb 2022 17:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240881AbiBAQL0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Feb 2022 11:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240871AbiBAQLY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Feb 2022 11:11:24 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EB5C061744
        for <linux-mips@vger.kernel.org>; Tue,  1 Feb 2022 08:11:24 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id e2so33064069wra.2
        for <linux-mips@vger.kernel.org>; Tue, 01 Feb 2022 08:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DUcPfG2jvk8soPrh/GXSOclq4tBhWSCtwAZfbfPfsxI=;
        b=Q39c2YdTI6tt8Mw9qweDpEUlYSsHqIy+Aj9hBDLyopqZWjD1N9HO4MNtFEGyKEShRw
         s6vHsgbK3CIrTZ7cEq4bjXDQgRcZ4DJUv2B5ylPjzFQTfnZNwni5kZZM+mwkGHymGYWD
         +KK+YVnOK61brOsQEwZ2Hv2T7Usz/dKjg8KlDCmNz98g2UGkt351ZVCbDAKCLGjx/wYP
         Zfb5Uyum8DJ1pizAWMHv1uU2Zg7Gdjx3H6Z9PF5EfQisOsO3MNW5sgYc6VMiytZXZGvL
         NB7QGOlXeVHr/VUMxLbVj7a/A8P88NZy5rCD5bIga2SgmncsXNxFRzHJTJ6nV6kCmuu2
         h7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DUcPfG2jvk8soPrh/GXSOclq4tBhWSCtwAZfbfPfsxI=;
        b=5vzsG/46Od8QJu1jRAu/TWVqLBjwiCQ2y7bdRC3fLlqCs3E3r0Y6Ga4WbqDurABAsn
         x4huRMfbRq0YSjykEf35HrZ8A4+Se2vNdtOgLGD49XOa9rGrp+YOXhyK025nh1Pxs2zj
         JGxSqKCr8viznNZe3V+3oHi8s70JFcXPyRghHV9XrmPaK/Hl0pMidR/F9JdjnJ/1oif2
         YJELbb48hx4Bw/yG3LMPJdrpf2zJNwJvghlg3y5vwZLX70jJYRGiuSzacVPX22PFdSSm
         l3UFL8PG6Smobfwd9ganM2vNH1KSqMEXWk9FtOOOgj0W1ZodTrEMyfWDpB5vN2M7oxHg
         VeWw==
X-Gm-Message-State: AOAM532GxPpN4yglbZClKOrrjcmuhNG0xY8il3GyRXPNXcL5tkDElfJN
        ja3/Cqoeyd8A4mgB9DB24YP6TrDs/vLKu5ebjrsoBQ==
X-Google-Smtp-Source: ABdhPJxRdu3koNSPRx51iMYR6D0s+iKeotnR/bbkjDDTVNuZlVppZz9dPxmoqMgZz1gJ1RxiMb7ruVkHSMMs7QbxGSk=
X-Received: by 2002:adf:d08c:: with SMTP id y12mr22519591wrh.346.1643731882701;
 Tue, 01 Feb 2022 08:11:22 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org> <20220201150545.1512822-22-guoren@kernel.org>
 <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com> <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
In-Reply-To: <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Tue, 1 Feb 2022 21:41:11 +0530
Message-ID: <CAAhSdy0U+41OWG_0C=820U+07accLsHxNYENtp=ZZsy6K4mJ0g@mail.gmail.com>
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
        Drew Fustini <drew@beagleboard.org>,
        Wang Junqiang <wangjunqiang@iscas.ac.cn>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>,
        kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 1, 2022 at 9:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 2/1/22 16:44, Anup Patel wrote:
> > +Paolo
> >
> > On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
> >>
> >> From: Guo Ren <guoren@linux.alibaba.com>
> >>
> >> Current riscv doesn't support the 32bit KVM API. Let's make it
> >> clear by not selecting KVM_COMPAT.
> >>
> >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> Signed-off-by: Guo Ren <guoren@kernel.org>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: Anup Patel <anup@brainfault.org>
> >
> > This looks good to me.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Hi Anup,
>
> feel free to send this via a pull request (perhaps together with Mark
> Rutland's entry/exit rework).

Sure, I will do like you suggested.

Regards,
Anup

>
> Paolo
>
