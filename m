Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4999064AA9F
	for <lists+linux-mips@lfdr.de>; Mon, 12 Dec 2022 23:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbiLLWuv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 17:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbiLLWuI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 17:50:08 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E525F7E
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:50:01 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-3b10392c064so168781217b3.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=emGR11sDGj23bwB4iDGKY/Jt07F7a624TvyLlINCb/4=;
        b=iIA/1zCE2/PdX7UwUpsCHVx2/4soMLJq+umSYNq1TIMKZ3vYOufggcHfzl2zpb3L95
         3KzRsMM6KMDNwv2INU26jqyRM70qj97aTjffNJqHOpklQjdDCkuFG/H5HyjOFryrkHsC
         WuUbOIXYNWL4NRA6iZCQSLbRHyxsEBOt+Yw5NkOMax5mZSsMG+NRAdlVCNMmHaLUJBr6
         RC6kxVfoGDnQ5XX0CU2kxeJuCxvyy75M74Im9VLDAzaDFpiYYonazefbFsiv+O87XQTC
         OANFKz6exzf3vgq07bR18r0zHtd6tggWQPlgrfF8L6R2GCpm+TNCBwJ2GvYSdlpZvSIY
         NaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emGR11sDGj23bwB4iDGKY/Jt07F7a624TvyLlINCb/4=;
        b=Kx6cB7Y6Zk+2d3rrB8ThlmeRa9zHUHlRrpsrDYE5vvQPgUpxaGZ8qyTXUhHh5B8Fmb
         7/QhQ0LkmZJ1lHzBtrUEESEM55zdaXqQfKGu4ZuIfumMyZoVtsgkTnSS8WjPct+fNYAG
         gkJE0wSl3J2EuGGYN0TQ+sGrVPIWKtfMWWOkUi7iFf+6quxQAW40+/91hBHcij+SmZxn
         y9nn6hUHFKYjMN5ZDPtHEnxtAvk0W7wOYRjVXCcAbt/2KEcG+IL6IdYendXR4NMw1H8S
         x7MaRl3os/CHV+I+af4k8FwxBEGPouzXHmvp4VE6jW8ZMLPwSdnDphZiQf0GdjYnc2QT
         pr2Q==
X-Gm-Message-State: ANoB5pn6EeSckZvCF0CTf1R0/1NzSEr3JBiGECfBtVNuPOvDKOphT0g/
        Eo0kfJU0X7Ks1Aca79A3v8jk2qOUPg3fS5LHrfwJgw==
X-Google-Smtp-Source: AA0mqf7BLbzUXAWE3wffbmFiHSNF9Kd+b9tfc4w51Pba8kylanBVygPwVEaOBfOQoKTOkaa76ZxA34hsT2ZYbKl8ZbE=
X-Received: by 2002:a0d:df0a:0:b0:35f:9c14:144a with SMTP id
 i10-20020a0ddf0a000000b0035f9c14144amr26607842ywe.209.1670885401042; Mon, 12
 Dec 2022 14:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-7-dmatlack@google.com>
 <0e159e42-ebca-c0d5-f2ae-29fa2344e720@redhat.com>
In-Reply-To: <0e159e42-ebca-c0d5-f2ae-29fa2344e720@redhat.com>
From:   David Matlack <dmatlack@google.com>
Date:   Mon, 12 Dec 2022 14:49:35 -0800
Message-ID: <CALzav=efGBpf7joCwRjkF2B2VOmauuktSzRdoyWTRwVkQr1Tbw@mail.gmail.com>
Subject: Re: [RFC PATCH 06/37] KVM: MMU: Move struct kvm_mmu_page to common code
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 12, 2022 at 2:32 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/8/22 20:38, David Matlack wrote:
> > This commit increases the size of struct kvm_mmu_page by 64 bytes on
> > x86_64 (184 bytes -> 248 bytes). The size of this struct can be reduced
> > in future commits by moving TDP MMU root fields into a separate struct
> > and by dynamically allocating fields only used by the Shadow MMU.
>
> I think it's already possible to use a union like
>
>         union {
>                 struct kvm_mmu_page_arch arch;
>                 struct {
>                         struct work_struct work;
>                         void *data;
>                 };
>         };

That would potentially corrupt
kvm_mmu_page_arch.nx_huge_page_disallowed and
possible_nx_huge_page_link, both of which still need to be used by the
TDP MMU on x86.
