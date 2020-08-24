Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D4324F2FE
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 09:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgHXHTv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 03:19:51 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40459 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgHXHTs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Aug 2020 03:19:48 -0400
Received: by mail-io1-f67.google.com with SMTP id t187so6205349iod.7
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2020 00:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HSoxBqiatdKGA4ArfaKuWypHDOvLL4zqqw0BsxbCWVI=;
        b=sAH0U+Inc7okk3vEgv2VUEb3M/e9G1j2esTib6oXbjS17YTY6QEtBCm8PeHMIBrJBY
         TmKRlyw9Kzz6LngK7v3hueYhW4DmFXaJHB4TCYMbHiD7DMXv+hrtOLyZiIWKdFYVIGrt
         8WGnHHPJIgxQzyVlA9GkS3vF1Zv1yG4qoxF9WZgYeadFGcSUe0yWbE/lT6HyTA5TBm2o
         pGT+A05mXnsZzZ/WR4WYArQoHU6CXJNwXgXiCbJcbfCsiZIloRembdTSvMjcvJJ3VRdJ
         jJjb43S1AFgewsSwOfJvZiONdTzn9PRFDbowzhq7eRzreFD6xIvjHvtPsDFzEY0AO4Y2
         8MVA==
X-Gm-Message-State: AOAM531QzzC+CAFE1dEWjyH8AgiljKLclqpUrCmcIO/R03MH0FViNcD2
        0cc6bT7Hsp+mFqL9LqMIzEBDdLW1Cn4ghB+Wf0USz21in8WCePGN
X-Google-Smtp-Source: ABdhPJxz/cye2z3iecDqGwiqhVqiP4GEImPS66IZYEIpYoA//wyRRkQSf2hCesJscOFT3kMkeBo5ulk4kaQV9wwpo+o=
X-Received: by 2002:a02:950e:: with SMTP id y14mr4434515jah.106.1598253587635;
 Mon, 24 Aug 2020 00:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200821072329.18006-1-huangpei@loongson.cn>
In-Reply-To: <20200821072329.18006-1-huangpei@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 24 Aug 2020 15:19:36 +0800
Message-ID: <CAAhV-H5Yu5V=NHosssCjT6B3a0+TdQNCJZ_1dxruNDwAftrsyA@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: add missing MSACSR and upper MSA initialization
To:     Huang Pei <huangpei@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Ambrose <ambrosehua@gmail.com>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Pei,

On Fri, Aug 21, 2020 at 3:26 PM Huang Pei <huangpei@loongson.cn> wrote:
>
> own_fp_inatomic() does not restore/initialize MSACSR and upper MSA regs, so
> MSACSR and MSA upper regs's value from previous task on current cpu can leak
> into current task and cause unpredictable behavior when MSA context not
> initialized.
>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/kernel/traps.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 38aa07ccdbcc..99a8f1b7b522 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -1287,6 +1287,8 @@ static int enable_restore_fp_context(int msa)
>                 err = own_fpu_inatomic(1);
>                 if (msa && !err) {
>                         enable_msa();
> +                       write_msa_csr(current->thread.fpu.msacsr);
> +                       init_msa_upper();
I think write_msa_csr(current->thread.fpu.msacsr) is needed here, but
I don't know whether init_msa_upper() is also needed. Maybe you should
investegate cc97ab235f3fe32401ca198cebe6f42642e9 ("MIPS: Simplify FP
context initialization") which removes init_msa_upper().

Huacai
>                         set_thread_flag(TIF_USEDMSA);
>                         set_thread_flag(TIF_MSA_CTX_LIVE);
>                 }
> --
> 2.17.1
>
