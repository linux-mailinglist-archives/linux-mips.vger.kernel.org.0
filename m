Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B335665EA
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jul 2022 11:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiGEJMy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jul 2022 05:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbiGEJMx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jul 2022 05:12:53 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D060DEE1
        for <linux-mips@vger.kernel.org>; Tue,  5 Jul 2022 02:12:52 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-31c8340a6f7so61412237b3.4
        for <linux-mips@vger.kernel.org>; Tue, 05 Jul 2022 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rNfgCc3yCLXG4f0YNRR9AvD14vQhINiZLzedPaTIf9I=;
        b=fMFzd1R/h9ptIi0eWVtG1yiS04l8AtBOczWU5B26FI7Qgq6vBDPrC4OI02valMNslC
         OgLA9cO2/IuX3Vkj5znR//+UIZGu1SpUc94RMkkhGhvuBHxU0f2SKEFX1T7WIeHrz36X
         +np+TMYdRK20KpMUTgIm3QgqDzBgQChl33XuO2WMRAcXng8wVPlQiHlw54KDDgORtkm/
         C8Ge7tVo5eCwvxtdC1xEhGnBsvCKK4Eq1/LwpC9UyzH+kOaLljdyk9oem68H3Wg90fE6
         mfydkzdE8Goc8xU3IyBDA+pR8u4IrctiQR5hYc3FiEA02nxjihuPVr4EbDy8EWK/Q1HA
         Ck6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rNfgCc3yCLXG4f0YNRR9AvD14vQhINiZLzedPaTIf9I=;
        b=pg2/n0xAFgosb1xnTwehn6q0tGZmSteJm1OfTqCnvTxjq7X8FyyehiIa9UFjSOK/ab
         5yR25/pQt50zkb5LC9zmV1L7Z7Ifyv058WNdgXRXcwZSx4I8XAKIACc7B6OAGuM8cdfK
         XxT6sud2SruqhqZeoR4BjDGaySmlt99Qb9fPGt6/ACsld9vC1etzB4v1wDeih5Gtwg9x
         EEior4sf5gfU+dJoSalLpgFqjmz2qxgIZXGD5pSm7Z5m5YpKxQAJoulNYOlPyCpNKDxF
         +qFMoasAskFzKlaTWBjGkn13A8EKLAvP2OaG0gC0CymQBcnjhYtk4Q5VtJBz0TKhzgi5
         o/fA==
X-Gm-Message-State: AJIora9iuiSss3kdCXlq9zvDbU03ASVD8EWczCj2Yy4EThYc5rvymeTr
        aoF4quhYLvYFnn1qow8OD26iJvjjvd70WJlP+XBLZg==
X-Google-Smtp-Source: AGRyM1sbcjhr993M5UN/hKcISXvGQJQZShycW9sF9JvX21iMvRl9030G7E9hqK+I1HH1arRudDZfaWm2jSKWk8efvnE=
X-Received: by 2002:a81:5dd5:0:b0:31b:a0f1:254e with SMTP id
 r204-20020a815dd5000000b0031ba0f1254emr41155573ywb.141.1657012371427; Tue, 05
 Jul 2022 02:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220704112526.2492342-1-chenhuacai@loongson.cn>
 <20220704112526.2492342-5-chenhuacai@loongson.cn> <CAK8P3a2XBGtJMB=Z-W56MLREAr3sAYKqDHo3yg=4hJ4T6x+QdQ@mail.gmail.com>
 <CAAhV-H5djQOzRsW-JaRPzaAnh64WgHiGvHxc1UdAUV43tirukg@mail.gmail.com>
 <CAMZfGtXLxPO3jmkKpF7n9Scb=542yrf1taWHZGdPwK-tZsJXgQ@mail.gmail.com>
 <CAK8P3a14VTkTjRNTWsGmwLDuVm=QPL17_VZ8QkcCYnyQzBjXHA@mail.gmail.com>
 <CAMZfGtU0n_-Bq95X+_rZjcyeK3QhKSq2t5HRvx5Kw5+tR9h+oA@mail.gmail.com> <CAK8P3a1K9fmLK=dh8shHX2y=fOYzr02D9Ek9uQri-u_2MsBXdQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1K9fmLK=dh8shHX2y=fOYzr02D9Ek9uQri-u_2MsBXdQ@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 5 Jul 2022 17:12:14 +0800
Message-ID: <CAMZfGtVQnxEr1gqfMgU1YzFsPXA08aOnR-mu-8cKnuS=LUyLKg@mail.gmail.com>
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

On Tue, Jul 5, 2022 at 4:46 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jul 5, 2022 at 10:38 AM Muchun Song <songmuchun@bytedance.com> wrote:
> > On Tue, Jul 5, 2022 at 4:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Jul 5, 2022 at 9:51 AM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > How about including the static key header in the scope of
> > CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP?
>
> That helps a little, but it means we still pay for it on x86 and
> arm64, which are the
> most common architectures.

Alright. Make sense.

>
>        Arnd
