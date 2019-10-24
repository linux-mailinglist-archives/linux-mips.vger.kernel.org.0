Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6B4E2935
	for <lists+linux-mips@lfdr.de>; Thu, 24 Oct 2019 05:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406665AbfJXD5I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Oct 2019 23:57:08 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46655 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403951AbfJXD5I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Oct 2019 23:57:08 -0400
Received: by mail-pg1-f195.google.com with SMTP id e15so13362775pgu.13
        for <linux-mips@vger.kernel.org>; Wed, 23 Oct 2019 20:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jn/dBA40tcorY8vJjaZMuUuSUOVgm6My2jgwoIx8dZs=;
        b=lzK8LDBBza+KdL4NYD1Lc02reBGZ/jX7cSJWyy5kZC5vpo+4tC70G052VILIBRQZHI
         6IILnX5ZhSrqEY+zmVOsoLZfK/79R0MIltnz4bCpdgJp8MFJY92l+etQtMNPr/lqYtIP
         yAFiSf/wwJTvk7tQcLYNYAjbO/IY6nOlqVpEqDcjlUt3b8SbMH8ScaBasI1Fhr2Aff7g
         xChUSDe95A4cAfQxkXiiYvKVMEXpsaPeE9Ks4H7HpdR8B4o0n6ZO1KLVa6DPVABihx0J
         U/7DvBY4OonYwzAOZtfPk8bwqIdoFXnGcat9HFiFBghxJ5yaYaulGkg+e6UyslqT/7C3
         CETw==
X-Gm-Message-State: APjAAAWh0TAalX3VxQjj0ptxKrcEbCJZTEz4E8/guMg+MCEEa2xGI5Qr
        DBdtcUljpyGboW2SbA2fJfY=
X-Google-Smtp-Source: APXvYqxy4T8FEu/xdso1PZpTDcsHjs4KTiuteWJtc70sU9N3mGL7vQ7Rol9J3LW98Uwt/7+sSs9d+A==
X-Received: by 2002:aa7:97b3:: with SMTP id d19mr2591760pfq.50.1571889427101;
        Wed, 23 Oct 2019 20:57:07 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id u7sm24018944pfn.61.2019.10.23.20.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 20:57:06 -0700 (PDT)
Date:   Wed, 23 Oct 2019 20:57:23 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        wu zhangjin <wuzhangjin@gmail.com>,
        zhangfx <zhangfx@lemote.com>
Subject: Re: [PATCH] MIPS: Loongson: Fix GENMASK misuse
Message-ID: <20191024035723.nkcyao5egjl6pcc7@lantea.localdomain>
References: <1569073828-13019-1-git-send-email-chenhc@lemote.com>
 <20191022192547.480095-1-rikard.falkeborn@gmail.com>
 <CAAhV-H5aTTcwBVQrVOuQ_0FZ=6q0paZ=5bAyijnRshJVdESg+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAhV-H5aTTcwBVQrVOuQ_0FZ=6q0paZ=5bAyijnRshJVdESg+w@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Huacai,

On Wed, Oct 23, 2019 at 09:09:01AM +0800, Huacai Chen wrote:
> Reviewd-by: Huacai Chen <chenhc@lemote.com>

Thanks for the review (and as has been said many times, please stop top
posting).

> Hi, Paul,
> 
> I remember that the original patch has a typo "CFUCFG", and you said
> that you don't want to rewrite the history to just fix a typo. But now
> Rikard has found a real bug, could rewrite be possible?

No - I'm still not going to rewrite history.

Yes, this LLFTPREV macro is wrong but it's also never even used so it's
still not a big deal. When I said I'd only consider rewriting history
for a major issue I meant it - something would need to be seriously
broken for me to consider it, and even then I'm not promising I'd
actually do it.

Thanks,
    Paul

> Huacai
> 
> On Wed, Oct 23, 2019 at 3:26 AM Rikard Falkeborn
> <rikard.falkeborn@gmail.com> wrote:
> >
> > Arguments are supposed to be ordered high then low.
> >
> > Fixes: 6a6f9b7dafd50efc1b2 ("MIPS: Loongson: Add CFUCFG&CSR support")
> > Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> > ---
> >  arch/mips/include/asm/mach-loongson64/loongson_regs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> > index 6e3569ab8936..363a47a5d26e 100644
> > --- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> > +++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> > @@ -86,7 +86,7 @@ static inline u32 read_cpucfg(u32 reg)
> >  #define LOONGSON_CFG2_LGFTP    BIT(19)
> >  #define LOONGSON_CFG2_LGFTPREV GENMASK(22, 20)
> >  #define LOONGSON_CFG2_LLFTP    BIT(23)
> > -#define LOONGSON_CFG2_LLFTPREV GENMASK(24, 26)
> > +#define LOONGSON_CFG2_LLFTPREV GENMASK(26, 24)
> >  #define LOONGSON_CFG2_LCSRP    BIT(27)
> >  #define LOONGSON_CFG2_LDISBLIKELY      BIT(28)
> >
> > --
> > 2.23.0
> >
