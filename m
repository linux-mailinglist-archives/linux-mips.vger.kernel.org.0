Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6234F5344
	for <lists+linux-mips@lfdr.de>; Wed,  6 Apr 2022 06:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243096AbiDFDsf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Apr 2022 23:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573314AbiDESwq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Apr 2022 14:52:46 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9593B1AB6
        for <linux-mips@vger.kernel.org>; Tue,  5 Apr 2022 11:50:46 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id n6-20020a17090a670600b001caa71a9c4aso365815pjj.1
        for <linux-mips@vger.kernel.org>; Tue, 05 Apr 2022 11:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bII+JPpo5IH9mgrwvjzQUo8tjQFZBMZQwRPuej7AAhI=;
        b=JhnKFhyHjciKLHFUxXi/UkE6P1dEsxlHONapSmJt19/k29RmjgUAVYbH3BesEwxHrM
         nuNIoh8Ght/verLVCcyudWRbTuK5FB5gudUG6wfh5V1VAuQWy9TBV6zzGwym1GiydR03
         vnd3aH+JrjMQfwQrsbFC9hq8xLKanduVOA/IqxyyGsIa5ifLQOmP1D8O/cYStr7eSdbC
         YVTaw4fYG41B2EiuL56o5RPNJ7vL2GVgZKtRNqqIw+9SAl7p/3ivqlUyj/V5mSoe0bUG
         hEZiL1xXFGX9YMwU5eHmsKruNMmxDqBv4xNEYyIZlXU9AWWlJscq27gS+fVn5TWRnDI1
         gfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bII+JPpo5IH9mgrwvjzQUo8tjQFZBMZQwRPuej7AAhI=;
        b=as2yLjpT0F2CtPTv4bzLOssOcioCfvT0/0pOsUdXMHi5P++usmkhnaoUCQzr/K2/Dk
         Vkw7KBhW1x1x3az+sxKuUsXT4H1iix6DOGRpZfIgsLFd9tjv9f1MWkd71AhT3DooCENL
         Zbn4xeBqi4vo4wh1g2n3mMHGMjCZCZ1NKap3gRTAp1D28FH0sAgtdcQQ6Ua2VNSQ2bTB
         Hq25cmorg0Qa0OXmsaG6OujeEW+y7lQCxDXWu4eRKvAjPV2IsMfgVZhRoQWdNwuGbmuZ
         +P9C8ndiYELb/liHLnqBG/iU3SanIITnb5NkxfW+pOEMZKcqc88ZQ/lnxH02GrRYaG6M
         FHUw==
X-Gm-Message-State: AOAM531Go1TT9GnNSOqV3jDwCttOUBBh/FIKScYnN+ll0tGRk6wvNz35
        qCWi20RqvThDi6NPt4ryIxs1ZDjffm7ISFnez9sZuw==
X-Google-Smtp-Source: ABdhPJzAdZ+bLj6sxMy6NCkl3KdGndxeFm7oJtsBN+yYBEgdhfx+bLXHx0hNFl6alDAGRZ4eV0ogNMdiDO3mkNfNJ6k=
X-Received: by 2002:a17:902:8b88:b0:156:2b14:cb6e with SMTP id
 ay8-20020a1709028b8800b001562b14cb6emr4908764plb.14.1649184645775; Tue, 05
 Apr 2022 11:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220404234154.1251388-1-yosryahmed@google.com> <YkyOJqTeGRUjtuX1@google.com>
In-Reply-To: <YkyOJqTeGRUjtuX1@google.com>
From:   Yosry Ahmed <yosryahmed@google.com>
Date:   Tue, 5 Apr 2022 11:50:09 -0700
Message-ID: <CAJD7tkYqSMk5UO5A46sR1cOviDeww0=JsR6QRMO9ZRF_7NLXBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] KVM: mm: count KVM page table pages in pagetable stats
To:     Sean Christopherson <seanjc@google.com>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, mizhang@google.com,
        David Matlack <dmatlack@google.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+Johannes Weiner  +Michal Hocko  +Roman Gushchin

On Tue, Apr 5, 2022 at 11:45 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Apr 04, 2022, Yosry Ahmed wrote:
> > We keep track of several kernel memory stats (total kernel memory, page
> > tables, stack, vmalloc, etc) on multiple levels (global, per-node,
> > per-memcg, etc). These stats give insights to users to how much memory
> > is used by the kernel and for what purposes.
> >
> > Currently, memory used by kvm for its page tables is not accounted in
> > the pagetable stats. This patch series accounts the memory pages used by
> > KVM for page tables in those stats.
>
> It's still not obvious to me that piggybacking NR_PAGETABLE is desirable, probably
> because I am quite clueless as to how these stats are used on the backend.  E.g.
> why not have a NR_SECONDARY_PAGETABLE entry to track pages used for secondary MMU
> page tables?

We can add NR_SECONDARY_PAGETABLE or even NR_KVM_PAGETABLE, but I am
not sure whether this separation is desired on the MM side. Let's see
what MM folks think about this.
