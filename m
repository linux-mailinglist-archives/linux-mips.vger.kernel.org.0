Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC031408304
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 04:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237098AbhIMDBI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 12 Sep 2021 23:01:08 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:46965 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237085AbhIMDBG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Sep 2021 23:01:06 -0400
Received: by mail-vs1-f52.google.com with SMTP id s15so7108116vst.13
        for <linux-mips@vger.kernel.org>; Sun, 12 Sep 2021 19:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZXCnMen8sTM7GtrylkAMpbBi3TayvQrWceWltbN75YY=;
        b=HvwfqGFM39Z5tUMbUvcfuePL28RzN3O6lbdXdec4HLQvfJSMTapzqGZxrD7pGCcSn0
         VEjIDrEbm+M8kE/niQPS7mhXD+s0N92y4ccHP10czs/d8+lV0co6ot2wu4uW9NqEijg0
         5/3IX+/Zjtq31chz4xCIX6wwJlZ2jcsEjBwxSFPPEkG5vXSI1/nWwg4VgIaZWKZiQjPw
         KMyEDqtmqEbsTByt0xCJiOR6g7f0dNJhwkYwIcZVNBXSbe9lQV1WlB3U1CKhYuwTNg/7
         UyMrUDcU0s3ct3QkLoCKoiagzkWBiy9jSuatJ+rPhKR2b/ERQydOdm5zIG1Z8wRsg+W/
         HUfQ==
X-Gm-Message-State: AOAM532/As0eT+ScYGlnqKFCCGYivPTRl7eq0V+we8cUg3RcclR6krg5
        oih8v/68zVVrGuJZ/pgEJDMi2QxSTjbztoiIaV4J5M+vf+s=
X-Google-Smtp-Source: ABdhPJw+/3f9n9StDT5nKUnV1XLpNXu1NTrGcRgB3D6s5lDTiV4FdYdc8R18bLZh3bG5xQ4wKlDWuqXPHx73dww9HJU=
X-Received: by 2002:a67:441:: with SMTP id 62mr3639912vse.54.1631501990719;
 Sun, 12 Sep 2021 19:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210913024113.220893-1-liu.yun@linux.dev>
In-Reply-To: <20210913024113.220893-1-liu.yun@linux.dev>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 13 Sep 2021 10:59:38 +0800
Message-ID: <CAAhV-H4=JGWencuHrYmFTC1Dh1KFapawW-UZdhZGM0gu-h3Akw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: loongson64: make LOONGSON64 depends on MIPS_FP_SUPPORT
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jackie,

On Mon, Sep 13, 2021 at 10:42 AM Jackie Liu <liu.yun@linux.dev> wrote:
>
> From: Jackie Liu <liuyun01@kylinos.cn>
>
> mach/loongson64 fails to build when the FPU support is disabled:
>
> arch/mips/loongson64/cop2-ex.c:45:15: error: implicit declaration of function ‘__is_fpu_owner’; did you mean ‘is_fpu_owner’? [-Werror=implicit-function-declaration]
> arch/mips/loongson64/cop2-ex.c:98:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:99:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:131:43: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:137:38: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:203:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:219:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:283:38: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:301:38: error: ‘struct thread_struct’ has no member named ‘fpu’
>
> Fixes: ef2f826c8f2f ("MIPS: Loongson-3: Enable the COP2 usage")
I suggest moving this config option to CPU_LOONGSON64.

Huacai

> Reported-by: k2ci robot <kernel-bot@kylinos.cn>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>  arch/mips/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 24e374266fdc..1164c32fd87b 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -487,6 +487,7 @@ config MACH_LOONGSON64
>         select ISA
>         select I8259
>         select IRQ_MIPS_CPU
> +       select MIPS_FP_SUPPORT
>         select NO_EXCEPT_FILL
>         select NR_CPUS_DEFAULT_64
>         select USE_GENERIC_EARLY_PRINTK_8250
> --
> 2.25.1
>
