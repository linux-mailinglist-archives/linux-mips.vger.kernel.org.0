Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8FF7E1489
	for <lists+linux-mips@lfdr.de>; Sun,  5 Nov 2023 17:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjKEQUn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Nov 2023 11:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjKEQUm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Nov 2023 11:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A37E0
        for <linux-mips@vger.kernel.org>; Sun,  5 Nov 2023 08:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699201192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5S45DCFEET4FUlleAs+X25SSP8exRtkoxGaiIZR36AY=;
        b=bGiULNe99+YMO8Aj2m6CRRjKCZ3c8nWvvXpAkyqiBTizZXfQor9RR4JUQV5m8smjrO/qLu
        TaqXdD16zxwVVctCwPv0tJLOFn7CSzVSPn1nZb0hMxgW0I+TeqME8BJisy+f9fECjaQbjs
        N9TOiCp8CSlz18X8zzEEV2f/FUSkSaQ=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-dV1oo39TNeuPQo6M23gi_w-1; Sun, 05 Nov 2023 11:19:50 -0500
X-MC-Unique: dV1oo39TNeuPQo6M23gi_w-1
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-4abf1f457c2so964373e0c.3
        for <linux-mips@vger.kernel.org>; Sun, 05 Nov 2023 08:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699201190; x=1699805990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S45DCFEET4FUlleAs+X25SSP8exRtkoxGaiIZR36AY=;
        b=fqkvmlexhQjphRWBpa/brUpq3CMW2X7KRh9M5+d8pRmggKw/QIanIEgdiOjLspTm2z
         cnAo/ftPt/svSROmgU3VKbVkMh4agNhzVgUeHpvjVqfk+TP0y/mh7HY6Of0GLxoiQorn
         /50/oZOv6F+UsMUit6zasBz0rU5LhtMiK+vh/Fq5APnhdI5rCeGpO2J9qGVCosOcsKiJ
         6NJ52OD8ykWbRI1OH3POnHTgzSkGlTEtdM6lK7YpVP9sMvhnb7WANCTmM3GWzWXL/QnZ
         bkWgOCzUgbWWu4/4RXyT9g95tPAcYU8SF6Gq2V6eJIp3UX4DLPnY8dGGV0lNWqQsp3nG
         J/wA==
X-Gm-Message-State: AOJu0YzpvaW66LD2F6/8dNt9emmAABq2aDrHKPoqsBRrFiwUu2c0Gl1v
        0ys5lWrIKNJo8r8zUa2JIHVWRhkUF8bryiEGJjwRPcZO1Jka+MC2ZJjkOnXNzflVnzSvZC2I1iM
        m4hJwnB1iTDBgp56PEg7IT1674EbRL2vM0Hyk5Q==
X-Received: by 2002:a05:6102:4743:b0:45d:8f83:e10f with SMTP id ej3-20020a056102474300b0045d8f83e10fmr5351484vsb.4.1699201189796;
        Sun, 05 Nov 2023 08:19:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9PY/ps/exIZhJtEiBPcrHL5I4MFvN3fWtoZJg4K/o1jMHEXmGlTLfpUZIUzDcxTZUf1dOb3c60KPU/ucxafo=
X-Received: by 2002:a05:6102:4743:b0:45d:8f83:e10f with SMTP id
 ej3-20020a056102474300b0045d8f83e10fmr5351461vsb.4.1699201189503; Sun, 05 Nov
 2023 08:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-21-seanjc@google.com>
 <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
In-Reply-To: <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
From:   Paolo Bonzini <pbonzini@redhat.com>
Date:   Sun, 5 Nov 2023 17:19:36 +0100
Message-ID: <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
Subject: Re: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private memory
To:     Xu Yilun <yilun.xu@linux.intel.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
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
        David Matlack <dmatlack@google.com>,
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 5, 2023 at 2:04=E2=80=AFPM Xu Yilun <yilun.xu@linux.intel.com> =
wrote:
>
> > +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > +                                           struct kvm_page_fault *faul=
t)
> > +{
> > +     kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> > +                                   PAGE_SIZE, fault->write, fault->exe=
c,
> > +                                   fault->is_private);
> > +}
> > +
> > +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > +                                struct kvm_page_fault *fault)
> > +{
> > +     int max_order, r;
> > +
> > +     if (!kvm_slot_can_be_private(fault->slot)) {
> > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > +             return -EFAULT;
> > +     }
> > +
> > +     r =3D kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault=
->pfn,
> > +                          &max_order);
> > +     if (r) {
> > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > +             return r;
>
> Why report KVM_EXIT_MEMORY_FAULT here? even with a ret !=3D -EFAULT?

The cases are EFAULT, EHWPOISON (which can report
KVM_EXIT_MEMORY_FAULT) and ENOMEM. I think it's fine
that even -ENOMEM can return KVM_EXIT_MEMORY_FAULT,
and it doesn't violate the documentation.  The docs tell you "what
can you do if error if EFAULT or EHWPOISON?"; they don't
exclude that other errnos result in KVM_EXIT_MEMORY_FAULT,
it's just that you're not supposed to look at it

Paolo

