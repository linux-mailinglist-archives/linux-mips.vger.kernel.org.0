Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5884C258977
	for <lists+linux-mips@lfdr.de>; Tue,  1 Sep 2020 09:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgIAHn2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Sep 2020 03:43:28 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:45875 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbgIAHn1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Sep 2020 03:43:27 -0400
Received: by mail-il1-f195.google.com with SMTP id q6so356646ild.12
        for <linux-mips@vger.kernel.org>; Tue, 01 Sep 2020 00:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+hx9EcMk9bM0obY8UGdA932fnjPoRe1BWIv65aI+aP0=;
        b=WESR76T1UNSE1gPpY3B1H0+c/KltdN2Iy1L8JMfmPJL/LXns9s3OFqik+ZZh7lAWJ+
         VLGZEO6M1LxR3vyqopbGfIwM7nLnGM48Kqc/yY+QGdXLVMXXczKAjPPAV8fscEuplwd5
         4s/seAVogjHLCaxwR0IYrVs/IX7yyNet5+4p6+EO2vzAsjDSyC17OdOcVlH08KKvzuXn
         bCEGpEvmHY02x2IR0eRSicjy3DBzko3FdC9AofTQfZnM6i2svPYWSJFBoGJ8S4BpWJ2o
         We60dtUaUY+0P4jFAyElmiG1lg+t6hZtsB3bbefbeWro/cUsYt78kE0mw/0PyVuj2HBM
         UXwA==
X-Gm-Message-State: AOAM531H1wTviIrt44KQ6oM0d0454ESYvwstEYBvl4qlBipafHsxIuY6
        I2KtSxD+Cnq2Ayf3+Jk2ItzqgLb9Hp+tJnREaLs=
X-Google-Smtp-Source: ABdhPJxN55nlBysWSRAJtYnY48YWtc4cclwYq52SFNbgldHYNU4oGWW2aBUyuRoj6sZzjV7X8Dgj8upkV3+T+sW9iV0=
X-Received: by 2002:a92:1b0b:: with SMTP id b11mr259756ilb.287.1598946206082;
 Tue, 01 Sep 2020 00:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200901065309.5952-1-huangpei@loongson.cn>
In-Reply-To: <20200901065309.5952-1-huangpei@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Tue, 1 Sep 2020 15:43:15 +0800
Message-ID: <CAAhV-H4ZzPD46OBrKhO-9UaJT-eyZooTarsLj_-h-tNGWfa5gQ@mail.gmail.com>
Subject: Re: [PATCH v4] MIPS: add missing MSACSR and upper MSA initialization
To:     Huang Pei <huangpei@loongson.cn>,
        Paul Burton <paulburton@kernel.org>
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

Hi, all,

On Tue, Sep 1, 2020 at 2:53 PM Huang Pei <huangpei@loongson.cn> wrote:
>
> In cc97ab235f ("MIPS: Simplify FP context initialization), init_fp_ctx
> just initialize the fp/msa context, and own_fp_inatomic just restore
> FCSR and 64bit FP regs from it, but miss MSACSR and upper MSA regs for
> MSA, so MSACSR and MSA upper regs's value from previous task on current
> cpu can leak into current task and cause unpredictable behavior when MSA
> context not initialized.
>
I still think this needs an ACK from Paul Burton.

Huacai

> Fixes: cc97ab235f ("MIPS: Simplify FP context initialization")
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/kernel/traps.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 38aa07ccdbcc..cf788591f091 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -1287,6 +1287,18 @@ static int enable_restore_fp_context(int msa)
>                 err = own_fpu_inatomic(1);
>                 if (msa && !err) {
>                         enable_msa();
> +                       /*
> +                        * with MSA enabled, userspace can see MSACSR
> +                        * and MSA regs, but the values in them are from
> +                        * other task before current task, restore them
> +                        * from saved fp/msa context
> +                        */
> +                       write_msa_csr(current->thread.fpu.msacsr);
> +                       /*
> +                        * own_fpu_inatomic(1) just restore low 64bit,
> +                        * fix the high 64bit
> +                        */
> +                       init_msa_upper();
>                         set_thread_flag(TIF_USEDMSA);
>                         set_thread_flag(TIF_MSA_CTX_LIVE);
>                 }
> --
> 2.17.1
>
