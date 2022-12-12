Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75AEF64AB88
	for <lists+linux-mips@lfdr.de>; Tue, 13 Dec 2022 00:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbiLLX0l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 18:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiLLX0k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 18:26:40 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11FC17E25
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 15:26:39 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gt4so1502836pjb.1
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 15:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJOQecEGgSp0glbzJ1RpRnPbkp2HAzeJE/NybulD13E=;
        b=LgVzXCUoiKNG9USGHdtxDWk3jXHPhUfF7aC6Jb6oAf8XA1bTwz+AQ/vH//iOu+Txbq
         HtNSM7bobeYY6HNyDm3070/s1Oas0aeVxdQOxg9nHQgvvOSD+HbQky0G3NWU2aHHH9iG
         JVh1AUDnlaepYuer6Ncinshp4+sTBfERSvbRGIUdHuN0fvrTLKzxKu4eop/o7jhMUBSa
         9I1Z1oUAs6TpwbdTo0ilfAV5dpWM/KOAPcjBCaf+Wh+PzYd+4+Je5We3hpfEFSHW2X9B
         XNOJfuewe5Qh+b7VEFMhtgGppnAqVlzsDeqFiGrPyEqs9m8tEG3SEwVL1QUihijPEdBo
         3YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJOQecEGgSp0glbzJ1RpRnPbkp2HAzeJE/NybulD13E=;
        b=loC1vNE0TFS+1og3GHT5I+TI4BBv2F3dFv3cRWNBLIJ0GdRv+ZQqkmisTkRK8EuoJp
         8xthOocOSgClSNUzuzaTj3TxjVVqHNOhq54arNKAnE5L9JHcAgSGTxFbZ8sVVMH95SZA
         JNeRXrvfAoQketiuvzOaA3cOAR0sOojkMpEY8UMbwf+25tNLUq+kYecf6f4FYIoT8cCG
         gLKcXq8Wf97idOJ/jxyfC5rbKIaKyTjRV0HMcGbh7Zmy+154QT3RdmGpQmOMHWZ4PodV
         Mxz6yOEUj8shmAJuZbCz3ORZy0dnLff54NZAd2zoDdGlY30hOsU9hc5sN4O5upOUIYrU
         Y1lQ==
X-Gm-Message-State: ANoB5pnuW4hQV9nD7eUixQy/E3CFaG/LcXP65ZRMoVAfNCigV5lEjCgG
        Oc1E4Jouxw0MBGjFlXKmkACH8Q==
X-Google-Smtp-Source: AA0mqf5Ct9lyTd0t0PIpKHrR2fvGzlGpqd0kxk6VIFCVK4Ckp27HzLLjvycFuCodXJHfa/pjm6FVZg==
X-Received: by 2002:a17:902:da8d:b0:189:3a04:4466 with SMTP id j13-20020a170902da8d00b001893a044466mr16713plx.2.1670887599032;
        Mon, 12 Dec 2022 15:26:39 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id z9-20020a170903018900b00189af02aba4sm6992708plg.3.2022.12.12.15.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 15:26:38 -0800 (PST)
Date:   Mon, 12 Dec 2022 23:26:35 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        David Matlack <dmatlack@google.com>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nadav Amit <namit@vmware.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
        Colin Cross <ccross@google.com>,
        Hugh Dickins <hughd@google.com>,
        Ben Gardon <bgardon@google.com>,
        Mingwei Zhang <mizhang@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Ricardo Koller <ricarkol@google.com>,
        Jing Zhang <jingzhangos@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common
 code
Message-ID: <Y5e4qxjHWoMt8YGs@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <Y5OHVzBSHPmAq2FO@google.com>
 <eb93beee-9d43-1c1e-250c-28ab7e9ebed9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb93beee-9d43-1c1e-250c-28ab7e9ebed9@redhat.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 12, 2022, Paolo Bonzini wrote:
> On 12/9/22 20:07, Oliver Upton wrote:
> > >   - Naming. This series does not change the names of any existing code.
> > >     So all the KVM/x86 Shadow MMU-style terminology like
> > >     "shadow_page"/"sp"/"spte" persists. Should we keep that style in
> > >     common code or move toward something less shadow-paging-specific?
> > >     e.g. "page_table"/"pt"/"pte".
> > 
> > I would strongly be in favor of discarding the shadow paging residue if
> > x86 folks are willing to part ways with it 😄
> 
> Yes, absolutely.  Something like to_shadow_page->to_mmu_data, sp->md,
> spt->hpt, spte->spte, sptep->hptep.

"host" will be confusing if when the primary MMU is involved though, e.g. I always
think of the primary MMU's page tables as the "host page tables".

What if we keep the "S" for SPT(E) and repurpose it to mean Secondary PTE?
