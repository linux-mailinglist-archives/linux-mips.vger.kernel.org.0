Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7E12131F4
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2020 05:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgGCDAG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 2 Jul 2020 23:00:06 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36078 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGCDAG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Jul 2020 23:00:06 -0400
Received: by mail-io1-f68.google.com with SMTP id y2so31090621ioy.3
        for <linux-mips@vger.kernel.org>; Thu, 02 Jul 2020 20:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q6YWpX/edcA+ETbRdMidH3dlYw218poo2zXkfknc2UA=;
        b=Ae2IFx5k1tK1/5asq0pZMyuiOBBB/kpqzOb8v7X5snVhcR+MJSyjL/s1BAjfrabh28
         mZSArcw5t6AJOezi3yRLUGLD2B3wytIi/IiUpeboPtqn2kLQpji5mbNXAtkPXYCS3ArG
         z/9ZnA4fAKuQ4/CIWylpBHYqaRByIBm3UDh6AUuWR4oBTd8yONhDR6lprfRYwiWH3aXn
         UeS4DSMQSRi9Yjlya3Bg0IEbZhYhHDzYfRI4sNcNWBCoQOPG9mLjqX7/wM0sf1FY+ADm
         7QlumAraXhX5aa4x5u5LY9G2gGa7ZpqX5qe6vgkHJEges5eJ0X9xOz7Vt/pelJ0DMGkF
         jg6w==
X-Gm-Message-State: AOAM531ydrK/PwTJN+NjMmE8RKO9naZKnhPVKcKNazEj8tVphjunR6iZ
        533I96CFkTgky+mExB401MHCoZrjJvf/FdkVBBfV0qGUoRre8g==
X-Google-Smtp-Source: ABdhPJxis2U1h39iJtDy02eeCT3NmCXLrPYZxzhGNkV8/kjCNhzi5OtW8hX/naZ1s9oJVZPfuprLchLcLsHDfdITCPY=
X-Received: by 2002:a5d:97d9:: with SMTP id k25mr10465144ios.42.1593745205262;
 Thu, 02 Jul 2020 20:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200703000533.1716-1-r@hev.cc> <95165841-879d-c9fc-6628-446899bcd315@flygoat.com>
In-Reply-To: <95165841-879d-c9fc-6628-446899bcd315@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 3 Jul 2020 10:59:54 +0800
Message-ID: <CAAhV-H7QMw3nKy_x9Fyyfnp5Z21d3GAuW39yXijiVpM6i2Cwpw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix ejtag debug buffer address of per cpu
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Heiher <r@hev.cc>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Fri, Jul 3, 2020 at 8:32 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> 在 2020/7/3 上午8:05, Heiher 写道:
> > From: Heiher <r@hev.cc>
> >
> > We can directly calculate pointer type offset of per cpu
> > by shifting SMP_CPUID_PTRSHIFT.
> >
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Cc: Huacai Chen <chenhc@lemote.com>
> > Signed-off-by: Heiher <r@hev.cc>
> > ---
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Btw:
> linux-mips@linux-mips.org have been abandoned, please go to the new
> list: linux-mips@vger.kernel.org.
>
> Thanks.
>
> >   arch/mips/kernel/genex.S | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > index a1b966f3578e..a1ebb94b3626 100644
> > --- a/arch/mips/kernel/genex.S
> > +++ b/arch/mips/kernel/genex.S
> > @@ -369,7 +369,6 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
> >
> >       ASM_CPUID_MFC0 k1, ASM_SMP_CPUID_REG
> >       PTR_SRL k1, SMP_CPUID_PTRSHIFT
> > -     PTR_SLL k1, LONGLOG
> >       PTR_LA  k0, ejtag_debug_buffer_per_cpu
> >       PTR_ADDU k0, k1
> >
> > @@ -392,7 +391,6 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
> >   #ifdef CONFIG_SMP
> >       ASM_CPUID_MFC0 k1, ASM_SMP_CPUID_REG
> >       PTR_SRL k1, SMP_CPUID_PTRSHIFT
> > -     PTR_SLL k1, LONGLOG
> >       PTR_LA  k0, ejtag_debug_buffer_per_cpu
> >       PTR_ADDU k0, k1
> >       LONG_L  k1, 0(k0)
