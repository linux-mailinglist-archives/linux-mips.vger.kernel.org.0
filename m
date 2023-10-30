Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9717DBFA4
	for <lists+linux-mips@lfdr.de>; Mon, 30 Oct 2023 19:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbjJ3SUS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Oct 2023 14:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjJ3SUR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Oct 2023 14:20:17 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9B69E
        for <linux-mips@vger.kernel.org>; Mon, 30 Oct 2023 11:20:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c5056059e0so69706101fa.3
        for <linux-mips@vger.kernel.org>; Mon, 30 Oct 2023 11:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698690013; x=1699294813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYDArYAPbuwvLuQnLMgYzD5G3hQJ3JuyTKb70j8k5kM=;
        b=vMBjNLJLnNwZ92n0kiLKy/KDvv6bmRWazPVY7EzuCAXijQXOd/L6nvrX2ZWXjw+lNq
         4G5yJaJPhMqxsSmWmQroKSm+2R3tkccCRs0o978wCj0l5sy5+qU6vjM8CCHZZW53vydq
         p5Q03CC8DatEWTV07ALKn+wiFR2o2FRnMzJbqLuMgJ2Ub5QuR13k3/n1s73F50qjfkJW
         jYiv09MpMPkZEbaNGpQQ9n6vWpNk1OHs0sffooFU3t8jPASRTjzGdPCT9bTwlS4yKF0n
         0udHFnJONG3fQytXR4K5Q+c/1vSUxumJ6xHiwhVUu+7gs9M3D3ejbpd+PQJLXSO5jHDJ
         abyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698690013; x=1699294813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYDArYAPbuwvLuQnLMgYzD5G3hQJ3JuyTKb70j8k5kM=;
        b=mTiruKL6fShffe6lb40loc3KpHyc92hj4uMgrputTHd7bTGi8LHmbdQzgPbdZfINxr
         pE0buLhGI85i71d/+13sx6muahZgOLa/oI1GEYgxHwsyvcVYDNDJhRW9sJCBmIkrSgeA
         IlLGlPnuvOdS8l9ENGqDe5FmtOpczX3RuK/RvUhuK/oDBrdoAlMCx4Z9S6z280mre6z5
         2ugHU7PpXVUsn9lQDAcsn0kS+PC3MVgL4nklW5C0JPVi10B3r+jfWIfeK45m/ECIijSx
         +wxfCUKAK8MqUcilFMHDh80lXExUSoY3Tu7GlpK0JAz9rCNryHuWYY5Dhka0VPVwYcjU
         U5Jg==
X-Gm-Message-State: AOJu0Yzh6UEuQ1NvGvLXWjiYn6RlXkUed/uG/Kx12hSel3EDbaPiZGqU
        GE0kJS1aExbbC006J+8QLtC6mGZFPclPridvBYYhaw==
X-Google-Smtp-Source: AGHT+IGWQtTaV5Bzkdlkn1e/3Zt5UNsfNX/Ijo670f/udb747Y9rnFPe4I+UgnAkk/OF+ECMZnUUXa4ItRfh9V5jdaA=
X-Received: by 2002:a05:6512:10cb:b0:507:aaa9:b080 with SMTP id
 k11-20020a05651210cb00b00507aaa9b080mr9836391lfg.33.1698690012887; Mon, 30
 Oct 2023 11:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-4-seanjc@google.com>
 <ZT_fnAcDAvuPCwws@google.com>
In-Reply-To: <ZT_fnAcDAvuPCwws@google.com>
From:   David Matlack <dmatlack@google.com>
Date:   Mon, 30 Oct 2023 11:19:43 -0700
Message-ID: <CALzav=cjq_MbJgi3DMytVWwZLFxEPi1dp7YiBYRBw-sRf2+BLw@mail.gmail.com>
Subject: Re: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
To:     Sean Christopherson <seanjc@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 30, 2023 at 9:53=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> >
> > +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t =
end);
>
> What is the reason to separate range_add() from begin()?

Nevermind, I see how it's needed in kvm_mmu_unmap_gfn_range().
