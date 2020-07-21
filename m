Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C6C227B5F
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 11:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgGUJHk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jul 2020 05:07:40 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:38955 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUJHj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jul 2020 05:07:39 -0400
Received: by mail-il1-f193.google.com with SMTP id k6so15771881ili.6
        for <linux-mips@vger.kernel.org>; Tue, 21 Jul 2020 02:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cW76FZzbkxujw9jwSEJYIyPFXYXLBrO85XQWP4G0mD4=;
        b=YatJRLVr1ibA3dLSyClReLsN+UKflObVZdXwrGWQLXo1yuaF9YscdGSWdFfzQkIprU
         LTkF8S3ztcl0yevGW5u1YmNSzSTI6dDIHz2vQO+KmxiB2R+4RoWY5/VGAIlvGLjHSz5O
         v8LXg/aTseUoQJ0QYyjDbQ6C7dnytHTPHlUbqLKNUPUlhkvtvT3VHlUSCoJG6nU0MsLo
         f3p6PttuWbO9QTxcf7ya7emrlD0D0IGw5/5ucjWCUkpwOeX313H5cWyq5PYY87yynyuJ
         5bqDDl6w04T9TZZbdxcWGdUwQekeAobPZ6TSygTcLgi67EtlxUfsStQXq4LspkEyROxQ
         c1uA==
X-Gm-Message-State: AOAM532LKpGUs+TyvDTPG6soocDdceNUcn6qyEOkBKBj4uip7KL4DrrZ
        KejYlUe7su3ghBgpBy/OBN+LW52ULqr+Rq/SirM=
X-Google-Smtp-Source: ABdhPJyQCENtFAASd8hOKRYC2SwdboGoKTIOjBShgWdvGMS7saIh0ZtLshQc/kfU0WkLKafbkFs8c0CE5nWZPdFF6L4=
X-Received: by 2002:a92:4a08:: with SMTP id m8mr27789254ilf.208.1595322458791;
 Tue, 21 Jul 2020 02:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <1594977035-27899-1-git-send-email-chenhc@lemote.com> <20200721083215.GB9399@alpha.franken.de>
In-Reply-To: <20200721083215.GB9399@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Tue, 21 Jul 2020 17:07:27 +0800
Message-ID: <CAAhV-H5EVKZLVwiwxMrShh56OmN8cv=AU5_6CHp_QfXBP+J-6Q@mail.gmail.com>
Subject: Re: [PATCH V2] MIPS: Loongson64: Reserve legacy MMIO space according
 to bridge type
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Tue, Jul 21, 2020 at 4:40 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, Jul 17, 2020 at 05:10:35PM +0800, Huacai Chen wrote:
> > Define MMIO_LOWER_RESERVED as a constant is incorrect, because different
> > PCHs (bridge types) have different legacy MMIO space size. According to
> > the datasheets, the legacy MMIO space size of LS7A is 0x20000, and which
> > of other PCHs is 0x4000. So it is necessary to reserve legacy MMIO space
> > according to the bridge type.
> >
> > Currently IO_SPACE_LIMIT is defined as 0xffff which is too small for the
> > LS7A bridge, so increase it to 0xfffff for LOONGSON64.
> >
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >  arch/mips/include/asm/io.h                     |  2 --
> >  arch/mips/include/asm/mach-generic/spaces.h    |  4 ++++
> >  arch/mips/include/asm/mach-loongson64/spaces.h |  3 +--
> >  arch/mips/loongson64/init.c                    | 18 ++++++++++++++----
> >  4 files changed, 19 insertions(+), 8 deletions(-)
>
> thank you for the changes. With the new patchset from Jiaxun I'm wondering
> which way you want to go ? Should I apply this patch or should I wait
> until the new patchset is finalized ?
I prefer Jiaxun's patches.

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
