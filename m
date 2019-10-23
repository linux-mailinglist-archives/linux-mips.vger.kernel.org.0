Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C28AE0F8A
	for <lists+linux-mips@lfdr.de>; Wed, 23 Oct 2019 03:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731234AbfJWBDf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Oct 2019 21:03:35 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:45688 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731059AbfJWBDf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Oct 2019 21:03:35 -0400
Received: by mail-il1-f195.google.com with SMTP id u1so17278570ilq.12
        for <linux-mips@vger.kernel.org>; Tue, 22 Oct 2019 18:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mlK1Wo+TNmNH1mERlUdLHq+JXRw2QDe2LNUJYQYlQRw=;
        b=cETwgcHiAWCNJMeS+DnzGeuZylWu6QOzGgyZfsLpBC0waBJ2ULg3rPpGzwcFm04sU3
         qk48uV1cpGLb/Ccdycd/dNvaVI0z94qu8QFaySOFt3d77EcG8+vaQIQQHESagVbBuYpg
         hLf6YQkJj+rQ0jnKWMiVFQerZ89x2bOi6H3QnmMQtYzrIwvVlvX13PWeJ+szQ9Ukladd
         D9KheK51PmhUFtITAFdJzNBzEit6B+upMRq283ixbd/J1zH2rOplZRRnj6cNxXSP551V
         e7cZinjw/28L/j9U9PqEJwuKk7CKueE+9g98BduHJbpFFfyTNPoEm+cgYUiIrPNA7xUf
         KNpQ==
X-Gm-Message-State: APjAAAWHCqowdmOKHT3qbiilh46gPv4rzuBGaTXvrkqsd/D2a//20ZlR
        es94+dcFX6K4yhg7DBplneRpb5BYVuYNtVRd1vw=
X-Google-Smtp-Source: APXvYqzaOJDV9cbr/RLrU3M2qT0cab4TjnTDMheRbLTPKRDLPsQHBNF2p6gftkcTCIIpGzYB+t4NjU0sqw7APm6Kbcw=
X-Received: by 2002:a92:360b:: with SMTP id d11mr34910999ila.143.1571792612961;
 Tue, 22 Oct 2019 18:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <1569073828-13019-1-git-send-email-chenhc@lemote.com> <20191022192547.480095-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20191022192547.480095-1-rikard.falkeborn@gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 23 Oct 2019 09:09:01 +0800
Message-ID: <CAAhV-H5aTTcwBVQrVOuQ_0FZ=6q0paZ=5bAyijnRshJVdESg+w@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson: Fix GENMASK misuse
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        wu zhangjin <wuzhangjin@gmail.com>,
        zhangfx <zhangfx@lemote.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewd-by: Huacai Chen <chenhc@lemote.com>

Hi, Paul,

I remember that the original patch has a typo "CFUCFG", and you said
that you don't want to rewrite the history to just fix a typo. But now
Rikard has found a real bug, could rewrite be possible?

Huacai

On Wed, Oct 23, 2019 at 3:26 AM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:
>
> Arguments are supposed to be ordered high then low.
>
> Fixes: 6a6f9b7dafd50efc1b2 ("MIPS: Loongson: Add CFUCFG&CSR support")
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  arch/mips/include/asm/mach-loongson64/loongson_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> index 6e3569ab8936..363a47a5d26e 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> @@ -86,7 +86,7 @@ static inline u32 read_cpucfg(u32 reg)
>  #define LOONGSON_CFG2_LGFTP    BIT(19)
>  #define LOONGSON_CFG2_LGFTPREV GENMASK(22, 20)
>  #define LOONGSON_CFG2_LLFTP    BIT(23)
> -#define LOONGSON_CFG2_LLFTPREV GENMASK(24, 26)
> +#define LOONGSON_CFG2_LLFTPREV GENMASK(26, 24)
>  #define LOONGSON_CFG2_LCSRP    BIT(27)
>  #define LOONGSON_CFG2_LDISBLIKELY      BIT(28)
>
> --
> 2.23.0
>
