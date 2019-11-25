Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9389E109700
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 00:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfKYXlx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Nov 2019 18:41:53 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40347 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfKYXlx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Nov 2019 18:41:53 -0500
Received: by mail-pf1-f194.google.com with SMTP id i187so4009155pfc.7
        for <linux-mips@vger.kernel.org>; Mon, 25 Nov 2019 15:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YgJOKesullA0pnJx+YwJphmUVvVxSTVfnWp55quUhBY=;
        b=H/jZbZKI3rXYbmxq+7BT7w94RPHQjDpspAtVdthFKO57/dFO5yUsjrQ7Lc1rAVsNtc
         h0COcvzjY/EAQZdhpSQgvsa7QSDNyUdjwWBx825ny1+JMIQtccjnPUAVz5cSiGEIUQam
         Pk/JCyjHs+R6+K/6DcoquwQkMhGOLECo7oKnG0dnuK+fiySviv8rvapnvoWZ3mRB/pZM
         eQRdSNBcI45eCq/dTPZkmywginUk9iJ+z4Z79tZw8Ay1YCsV+/M/eI2VxRhYfvXNZKZg
         eHjAl/1x9fu+jXXcKHCQZ2teoZY756QzNBd5T6DOpGdegS84Y0Kavh8yIPLFHrXrSem/
         Gdww==
X-Gm-Message-State: APjAAAVigT6oFdajksw+lNoS3x5R4/Hl+b069OaeLSX5vO90Y29BGxEm
        Osn/vRzY8FfYOXh6d3hAzwI=
X-Google-Smtp-Source: APXvYqzq+8U4nkRZ34nHFsqSDNtrTCPBLmjYy/pNY/7/XayVqPDvvLIM94BaTd9Mst84OmFfwpaD9A==
X-Received: by 2002:aa7:9ad0:: with SMTP id x16mr38018078pfp.51.1574725312083;
        Mon, 25 Nov 2019 15:41:52 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id b24sm9490329pgk.93.2019.11.25.15.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 15:41:51 -0800 (PST)
Date:   Mon, 25 Nov 2019 15:42:34 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Subject: Re: [PATCH] MIPS: Make sure ebase address is in KSEG0
Message-ID: <20191125234234.bwoyuxbmwa4jpxwb@lantea.localdomain>
References: <1574335820-15188-1-git-send-email-chenhc@lemote.com>
 <20191122184731.l7ttfg4evgi4tvcp@lantea.localdomain>
 <EAC4F77C-88BE-47FA-83A5-5855A869425A@flygoat.com>
 <3C1D695B-09AA-4C2D-A94F-84DFC05C6F0C@flygoat.com>
 <CAAhV-H4R1LqwLyehnTo89XPCeZo=ka=p29_rHVg=vJ_YiqqNCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4R1LqwLyehnTo89XPCeZo=ka=p29_rHVg=vJ_YiqqNCQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Huacai,

On Sun, Nov 24, 2019 at 12:00:51PM +0800, Huacai Chen wrote:
> On Sat, Nov 23, 2019 at 2:11 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > 于 2019年11月23日 GMT+08:00 下午1:08:38, Jiaxun Yang <jiaxun.yang@flygoat.com> 写到:
> > >于 2019年11月23日 GMT+08:00 上午2:47:31, Paul Burton <paulburton@kernel.org>
> > >写到:
> > >>On Thu, Nov 21, 2019 at 07:30:20PM +0800, Huacai Chen wrote:
> > >>> Dynamically allocated ebase address above 0x20000000 can be
> > >triggered
> > >>> by some special physical memory layout, or just by a "big kernel +
> > >>big
> > >>> initrd + big swiotlb" configuration.
> > >>>
> > >>> For MIPS32, ebase address above 0x20000000 is unusable, for MIPS64
> > >it
> > >>> is usable but this case is warned. However, this warning is useless
> > >>> because it is unfixable in a specific system configuration. So we
> > >>just
> > >>> use CKSEG0 as a fallback.
> > >>
> > >>I'd prefer that we don't assume there's memory at physical address
> > >zero
> > >>- that property doesn't hold for all systems.
> > >>
> > >>How about the change I suggested previously over here:
> > >>
> > >>https://lore.kernel.org/linux-mips/20191108191149.bbq3h4xp4famsh2n@lantea.localdomain/
> > >>
> > >>Would that work for you?
>
> Now this patch has nothing to do with WG bit,

Well, kind of. The 512MB limit is implicitly tied to the lack of a
functional WG bit.

> and also has nothing to do with Loongson, it just a problem with ebase
> address -- on any MIPSr2 platforms where ebase is dynamically
> allocated.

Right, and the patch I proposed ensures that the allocation happens in
the low 512MB for systems without the WG bit, ie. in memory we can
access via kseg0. It just doesn't assume the memory is at physical
address 0 - it might be, but on some systems there might not even be
memory at 0.

In practice we allocate memory bottom-up, so I'm not sure how you're
managing to see problems here anyway - allocations this early should
easily be within the low 512MB. If you could explain step by step what
actually goes wrong on your system that would be helpful.

> In the comments it is said that ebase address above 0x20000000 (which
> should be in XKphys) has problems to handle cache error. However, if
> we really treat it as a problem, we should avoid it (not just a
> warning); and if we don't think it is a problem, then we can remove
> the warning (because the warning is unfixable in a specific system
> configuration).

The warning can probably go away if my patch is applied, since the
allocation is constrained to the right memory region anyway.

Thanks,
    Paul
