Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343E6566530
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jul 2022 10:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiGEIjV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jul 2022 04:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiGEIjU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jul 2022 04:39:20 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1857163BE
        for <linux-mips@vger.kernel.org>; Tue,  5 Jul 2022 01:39:19 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id l144so8105072ybl.5
        for <linux-mips@vger.kernel.org>; Tue, 05 Jul 2022 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wZnyPsEVZX6HmXQzS1Foy24/qSSliAvcCxVhRkBUcHs=;
        b=SEYfGEtMxhAMfqAivJTEH2Kz8wbyh2XsCXYeFtFb1I28PpU+lCPk12AA4R9K6dl/bY
         woHhjBEVabd/bI0pHf8zsBRzuKo9ccK4QyVnqR4OQOMtx1LaA2a9AxK3wkuZNul/LzQV
         UM51yjWWue6IUw1bK29hDbsh4AwqTyWZZsxAMqbjOcfiIX594dSUkrN1Z+LfE+LXYOW9
         WbVktB4yHG4/CR/IBsxUfDoZP5ktqV4FqwcpaZcINT18MM4gCszCXnUDZekNhyzuGtua
         P2dMbvegXbnzzkLO7dP9z3PzUbofUX0Fv15BJ+c44vzBFlDQt4v4kPDl83LagrfGLi9C
         xQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wZnyPsEVZX6HmXQzS1Foy24/qSSliAvcCxVhRkBUcHs=;
        b=u8cIcv+EGGdvmniz7BQOTWCUlE2i/1OCrOtrUjYXHnay/BL5XxiW0RuML3Zi5ECfWT
         pyNSsoGPfQIWm0r1rlM7Pt+13FdVLu4nkSsbDg8ZFplde8yHMTbOHYZw0Bw/HevFMtWI
         05ko8/lbYt4Z8eKZH9XAuGAEBzvAiRw2jKXqhOfxwhu7UGkJcuaHU7Ld9zToZZvFJJx1
         asSppbngvmogqQtOOq+3gXs0yuizIx+i2d42RQiAzW81lvssQIUmycyaaBJpzjJIbCz2
         YOMJHQmOWF+576w1odjOUOBf9+sYGUERgIsJtdR3Vt8yb/V78DYLeNRvujPWgZFhi9Ae
         L1iw==
X-Gm-Message-State: AJIora+Fo2V/qFBK0A3iMYwqRzec/wHntTVMmp/UJKFKJfrRxN1Aq9Ez
        76Q4EmqcCBX5G4ybb5oWwZOxq5AKS4FwOk/niG0lQg==
X-Google-Smtp-Source: AGRyM1sb7EaZDlA3TlP6vCkKVLuCtGyEFUyGiDkCzrHwcXTE7yLWJhhYPQxkfnh364COElsTV8UMrZRX8TXd5VzakYY=
X-Received: by 2002:a25:8388:0:b0:66e:3afd:9299 with SMTP id
 t8-20020a258388000000b0066e3afd9299mr12223142ybk.246.1657010358371; Tue, 05
 Jul 2022 01:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220704112526.2492342-1-chenhuacai@loongson.cn>
 <20220704112526.2492342-5-chenhuacai@loongson.cn> <CAK8P3a2XBGtJMB=Z-W56MLREAr3sAYKqDHo3yg=4hJ4T6x+QdQ@mail.gmail.com>
 <CAAhV-H5djQOzRsW-JaRPzaAnh64WgHiGvHxc1UdAUV43tirukg@mail.gmail.com>
 <CAMZfGtXLxPO3jmkKpF7n9Scb=542yrf1taWHZGdPwK-tZsJXgQ@mail.gmail.com> <CAK8P3a14VTkTjRNTWsGmwLDuVm=QPL17_VZ8QkcCYnyQzBjXHA@mail.gmail.com>
In-Reply-To: <CAK8P3a14VTkTjRNTWsGmwLDuVm=QPL17_VZ8QkcCYnyQzBjXHA@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 5 Jul 2022 16:38:41 +0800
Message-ID: <CAMZfGtU0n_-Bq95X+_rZjcyeK3QhKSq2t5HRvx5Kw5+tR9h+oA@mail.gmail.com>
Subject: Re: [PATCH V4 4/4] LoongArch: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, loongarch@lists.linux.dev,
        linux-arch <linux-arch@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 5, 2022 at 4:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jul 5, 2022 at 9:51 AM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > On Tue, Jul 5, 2022 at 2:22 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > Hi, Arnd,
> > >
> > > On Mon, Jul 4, 2022 at 8:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > On Mon, Jul 4, 2022 at 1:25 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > > > To avoid the following build error on LoongArch we should include linux/
> > > > > static_key.h in page-flags.h.
> > > > >
> > > > > In file included from ./include/linux/mmzone.h:22,
> > > > > from ./include/linux/gfp.h:6,
> > > > > from ./include/linux/mm.h:7,
> > > > > from arch/loongarch/kernel/asm-offsets.c:9:
> > > > > ./include/linux/page-flags.h:208:1: warning: data definition has no
> > > > > type or storage class
> > > > > 208 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
> > > > > | ^~~~~~~~~~~~~~~~~~~~~~~~
> > > > > ./include/linux/page-flags.h:208:1: error: type defaults to 'int' in
> > > > > declaration of 'DECLARE_STATIC_KEY_MAYBE' [-Werror=implicit-int]
> > > > > ./include/linux/page-flags.h:209:26: warning: parameter names (without
> > > > > types) in function declaration
> > > >
> > > > I wonder if page_fixed_fake_head() should be moved out of line to avoid
> > > > this, it's already nontrivial here, and that would avoid the static key
> > > > in a central header.
> > > I have some consideration here. I think both inline function and
> > > static key are instruments to make things faster, in other words,
> > > page_fixed_fake_head() is a performance critical function. If so, it
> > > is not suitable to move it out of line.
> >
> > +1
> >
> > The static key is an optimization when HVO is disabled.
>
> How about splitting up linux/page_flags.h so the static_key header is
> only included
> in those places that use one of the inline functions that depend on it?
>

How about including the static key header in the scope of
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP?

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 465ff35a8c00..4dd005ad43fc 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -205,6 +205,8 @@ enum pageflags {
 #ifndef __GENERATING_BOUNDS_H

 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#include <linux/static_key.h>
+
 DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);

 /*
