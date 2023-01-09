Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CFD662F96
	for <lists+linux-mips@lfdr.de>; Mon,  9 Jan 2023 19:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236994AbjAIS4P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Jan 2023 13:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235359AbjAIS4O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Jan 2023 13:56:14 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CED14087
        for <linux-mips@vger.kernel.org>; Mon,  9 Jan 2023 10:56:12 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 16so9501561ybc.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Jan 2023 10:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=npK1pVWS9Y7zSvO0nWYdwcAA7TbeGlnyEckY5HPb/Qg=;
        b=EHKm0/F2buMoOsKhjWg0lWsOuJldy/zfoO9SoYjwOUBjEtYFI7vDu+I5lwSpjMbW6Z
         3ObtFaGnVjmdcg2O2Aret0FZO2bn7yqTJbEhANZLCO7TmNFgRBE+1H+8TwiSfzm06+sv
         NoXn+BRIUqVauOHPZ13p93njC8trw+pKMvKGKG+JOay5G96uMzNCvp6yocnoligPU/KG
         nsT5KAmMgHERAldXeigMGDd8xVH2mvsfpS/FV/+f0V+6HxueWNzcx2CaGaqz8pAq/Qe/
         1IhIl/jFSe8NXCzMDt2iiVq0nAJOXzbL0gSR4VpeaFp+Z0f01ufRbR7OxltlcKWyJfdN
         GLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npK1pVWS9Y7zSvO0nWYdwcAA7TbeGlnyEckY5HPb/Qg=;
        b=l/dC1E5Q7TxWDG17Z7sZBXjihWezEk0TfHyMylDE8FfJjKvy0PJCNsGtJpynWiEYRk
         Wn3QuWfAQe3WWeDLKaT3U9eSAqXW2/Y02u1h/A00t1oPEUjhWILZ6dIHI/TxSwYoPZI8
         njd3KCrIHoRYzKZtYjm/l7s1UAmSD92XoslCsyQ7fZ+JeypIYq2Cm3vtit1c/cVwirRS
         MphHh9TUJmMH0sgR9WqcLrd4AUJ3iYv7uhuaB7BsgzBYGLdm1ClJYebEG3LzlwNeg0sW
         iZ4weWFYn2tbXPoZMdXrlpMijclqX1XA4uiWz8mM9TrzLM8NH8OaYved/VzwHTWoZHTZ
         S6rw==
X-Gm-Message-State: AFqh2kq4VyoQKcalL+m60MMpsCpl8MDovBaoz/E/EMUFkvgqKlw1J0GU
        Sagfn5VEblNB9gSZMCBOexqQKPOyVJWgyMUKYHav3g==
X-Google-Smtp-Source: AMrXdXuGuwlSiliqUzNPwuP95duqjm2wzwipEY34JM0d62JWS00zM7bbMqGhGQDGetcNhy7upYl68Cx0Wdx6BZEJfKU=
X-Received: by 2002:a5b:1c8:0:b0:6fe:46c9:7479 with SMTP id
 f8-20020a5b01c8000000b006fe46c97479mr7514517ybp.191.1673290571936; Mon, 09
 Jan 2023 10:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-11-dmatlack@google.com>
 <ce1ea196-d854-18bd-0e60-91985ed5aaea@redhat.com>
In-Reply-To: <ce1ea196-d854-18bd-0e60-91985ed5aaea@redhat.com>
From:   David Matlack <dmatlack@google.com>
Date:   Mon, 9 Jan 2023 10:55:45 -0800
Message-ID: <CALzav=fVbvKQMhSBD0AdrRTH+jDyRG0Hf5M-H7vCtRCR1Lk9sw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/37] KVM: MMU: Move struct kvm_page_fault to common code
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

On Mon, Dec 12, 2022 at 2:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/8/22 20:38, David Matlack wrote:
> > +
> > +     /* Derived from mmu and global state.  */
> > +     const bool is_tdp;
>
> I think this could stay in the architecture-independent part.

I agree but until there's a use case for accessing it in common code
I'm inclined to leave it in x86's kvm_page_fault_arch.
