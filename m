Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA1644F5660
	for <lists+linux-mips@lfdr.de>; Wed,  6 Apr 2022 08:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243685AbiDFDsO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Apr 2022 23:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573286AbiDESq5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Apr 2022 14:46:57 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340F580227
        for <linux-mips@vger.kernel.org>; Tue,  5 Apr 2022 11:44:59 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id z16so294100pfh.3
        for <linux-mips@vger.kernel.org>; Tue, 05 Apr 2022 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BSTfu4XeI/ClhpJnOxug8bNrs6bcd1vbhIByuk9Td5A=;
        b=FZ7CzdGv5IqR9igsKF5aVHLB8MfCD2UE6mGhWdabuDVB/PY75CERc0oW45pyoiFFsx
         HLCOiljgUTbziKvTX7wZRoZqJ+RJ1Dea8AguoZhgeta2AWxRKKUV2iRUL0l0yDbf+TTN
         ZiAbWnMeeHTkwk1JvBEs7xviif99t4lQdP3rhF94xjjOWUyQ5IYn9ZUuKyguEbSTvM9X
         MpsV3tSkSRKbWT/1P6uf6AhXj04ePeO0yF7csRuDTu6ucoAxMuJ3t81XHgVFCM4FFTG+
         SjX4Baa/CoEtOFP/F5srI+LydtG/vNCqkGlkcYX/sxjcplhmbQiJkxNjpWBgFSDO+Pmx
         Gc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BSTfu4XeI/ClhpJnOxug8bNrs6bcd1vbhIByuk9Td5A=;
        b=E7k35mfDyO+dTkiGcplKT0OzLV2BbK4gHJi5tm8ilBGoqT1y8c/vY23rntoQPjPcDr
         i1P/v3WGBthEjn6Ls42+mL4kDsS1n7queq62BAOUtuoY8Vu3Tk190SAAnX+NwfmllCwf
         v7WytbOavNpyrByQnOb5qQh+KQ0gz/Dmyk5p40pW4h5qdavRkOI6E8+KGCncKIzg8MlQ
         pW63K+EcGKO7Wl4HpYR7w07U0USuxETiqVW7Y4d93TWIULVRYJYF1igtQEI5uD6j0Qcb
         s5AJDQXw4vGZ0IL4FaAAKBJHekmLcFcxeJYCTOEvjmgLbitcNvVmbqfOyvQu/MbLyPvD
         IskA==
X-Gm-Message-State: AOAM532ihRjZfb0/yJ0boTVyg7RxUV4aLZNIOE6Fa21MEnGanMGQfW0P
        KVPvOUYyOio2KSy3xsyJfUN05A==
X-Google-Smtp-Source: ABdhPJxqBsHYYYQ3r6tsKfeQNVI4VssdMtHw5QBcT84h3Z9HkLEDAYYEQ3XVRsYGURacbMDknChXvg==
X-Received: by 2002:a65:57ca:0:b0:381:ea8d:4d1f with SMTP id q10-20020a6557ca000000b00381ea8d4d1fmr4102933pgr.143.1649184298506;
        Tue, 05 Apr 2022 11:44:58 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id j70-20020a638b49000000b003985b5ddaa1sm13887990pge.49.2022.04.05.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 11:44:57 -0700 (PDT)
Date:   Tue, 5 Apr 2022 18:44:54 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Yosry Ahmed <yosryahmed@google.com>
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
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/5] KVM: mm: count KVM page table pages in pagetable
 stats
Message-ID: <YkyOJqTeGRUjtuX1@google.com>
References: <20220404234154.1251388-1-yosryahmed@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404234154.1251388-1-yosryahmed@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 04, 2022, Yosry Ahmed wrote:
> We keep track of several kernel memory stats (total kernel memory, page
> tables, stack, vmalloc, etc) on multiple levels (global, per-node,
> per-memcg, etc). These stats give insights to users to how much memory
> is used by the kernel and for what purposes.
> 
> Currently, memory used by kvm for its page tables is not accounted in
> the pagetable stats. This patch series accounts the memory pages used by
> KVM for page tables in those stats.

It's still not obvious to me that piggybacking NR_PAGETABLE is desirable, probably
because I am quite clueless as to how these stats are used on the backend.  E.g.
why not have a NR_SECONDARY_PAGETABLE entry to track pages used for secondary MMU
page tables?
