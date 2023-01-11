Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9D666665C
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jan 2023 23:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbjAKWqW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Jan 2023 17:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbjAKWqV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Jan 2023 17:46:21 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314411A3BC
        for <linux-mips@vger.kernel.org>; Wed, 11 Jan 2023 14:46:20 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id g4so16677494ybg.7
        for <linux-mips@vger.kernel.org>; Wed, 11 Jan 2023 14:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7XUNRQSkmgxBwPtlFe+tY4O7Zk2hAxIaFzmJ+ZbBo5g=;
        b=FlburyiZ8GT2QW0nv2OtZ0LUE1v2vF0Y/pHEWD9oGzHjZ4h/FjWKkwyFdBbDcaNnUP
         2Ie9tt3h4rkQPD0tXq/TDTvxnd6ZigemFV6kwDmtr8N+ST9EWS/PCcr60+Ix/1/nGs5f
         AsS3qP6KlbbwLtD/WwC5f8YbOx3QguruaU1rcVfGrW/ie+zf83l970YFUufIsjbNIiUq
         sOpWBWkriYTJY68Ckrn/LOIFaYAJD092cfmRDNVLZVBMwe/94H2PMXzYvDpzZX5913qn
         pafqeUDZuj3eeU+GBKGCKPCf9+dxdSStYgPnHgAplUUBx6hqL3oUwA4GwRhTGZB6hRam
         i74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XUNRQSkmgxBwPtlFe+tY4O7Zk2hAxIaFzmJ+ZbBo5g=;
        b=wVjRkS6WvJDgVxsWvnEhAdLE5q0FnQYyz5pM9kSDR9Bp01HFZPGvcQt59OkURxy56O
         kZ7ukeN1EfobkjAxIBVP2i7oNcII+P8/zVRcSlwskf/x781WkFiwTwReRwQkwpUxF/YZ
         zjMiL5titW3BLegR4fNnoYn/r6B3nsaUL+C3cpnWxnsa0fXfp0IVPqHfMR0L32psp+iB
         h30/ATdWcnKNFzZtgVp/W1zKdnqJpb3hI2gIpu84AVbHg9rdvtd4zcA3idffm6KJarok
         l3Q9KxtV5Q7XxWcwZ9pkTZYKmG/t/Ozj/6q81NRoXms3eGX5bPz5tDX4WsAoie2Jd+LH
         8i0Q==
X-Gm-Message-State: AFqh2kqDFGdu1YJwQRTbClLCQsvz+JZuGfNQF5DLsD4d22JfimV3MvN5
        0UWgJxz6yxUUi0Gdj0Kjq3ucZaxLsZsajka77Pb3dg==
X-Google-Smtp-Source: AMrXdXvjcRQ0s93N60oB4UG+s8wkaJANmmRe0uXkJseN3DOope/rh00sX6ExARGo71QZgK8ljnJFa82hwhnRQq3QYv0=
X-Received: by 2002:a5b:189:0:b0:723:96ad:6761 with SMTP id
 r9-20020a5b0189000000b0072396ad6761mr8600316ybl.326.1673477179137; Wed, 11
 Jan 2023 14:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-5-dmatlack@google.com>
 <b0e8eb55-c2ee-ce13-8806-9d0184678984@redhat.com>
In-Reply-To: <b0e8eb55-c2ee-ce13-8806-9d0184678984@redhat.com>
From:   David Matlack <dmatlack@google.com>
Date:   Wed, 11 Jan 2023 14:45:53 -0800
Message-ID: <CALzav=eQVLAH2coTU1FaOFstFp-AqQBb0JCycrRcP5qjqfMwEg@mail.gmail.com>
Subject: Re: [RFC PATCH 04/37] KVM: x86/mmu: Invert sp->tdp_mmu_page to sp->shadow_mmu_page
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
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 12, 2022 at 3:15 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/8/22 20:38, David Matlack wrote:
> > Invert the meaning of sp->tdp_mmu_page and rename it accordingly. This
> > allows the TDP MMU code to not care about this field, which will be used
> > in a subsequent commit to move the TDP MMU to common code.
> >
> > No functional change intended.
>
> Let's use a bit of the role instead.

Will do in v2, thanks.
