Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA89C7DF53A
	for <lists+linux-mips@lfdr.de>; Thu,  2 Nov 2023 15:41:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjKBOlh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Nov 2023 10:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjKBOlg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Nov 2023 10:41:36 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97970130
        for <linux-mips@vger.kernel.org>; Thu,  2 Nov 2023 07:41:33 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5b1ff96d5b9so14872597b3.1
        for <linux-mips@vger.kernel.org>; Thu, 02 Nov 2023 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698936092; x=1699540892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhBeRDHIuw2MhHJCiZzpmIP+VopsidfcOzvL++iqJMc=;
        b=E8ebSa9c6or9LYXHIbFKFTAuADYgYjM9eje8EFyHBw87GFEdLwCKcJ8i1m5xxy81u1
         CRy05fuVNYjnG8S/xFRYsuF7mdsaYzuwSiFkg18oH0iky8DUUq5R6Z5dgpjX36yCBdD1
         nkH2lDdLXHQXXHluGOv3deTIP/fInRgWG+/X2dyS3jabjNSq6MktO6nIU4sQfTNhsyxv
         z492XWb4v+voUQCfH2CXS+uivzWYdEjTDaxFPf70Xxr9agZjx6YdIJBoSoxp3pEvfIPX
         H7ufQX/vWv5ohN8/0DPI+udxnJG8E7NBGxZT66sCftP7Xj/OOJeV6NJvDIDZ1UP05ULr
         3TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698936092; x=1699540892;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xhBeRDHIuw2MhHJCiZzpmIP+VopsidfcOzvL++iqJMc=;
        b=m/NMs4jQLQw7XYbiIaouuxP1YMfdMwANV9b1huNrkyR4zT3bIU/UTvppY2avjFoTaV
         KoSq1E1HZEwzCoqXWPJ4WpTOe/KQQ2ZMXIUUNKffFhEqxd7b89QnlCi1wU7Miw4QPAT8
         zILiXM4IWXnsmXlNXW8RcwBWI0jU6GwMA3ED2+g0c3fbVKflKOpex2WnY5KXc3rLMSvw
         0EML4w2Znjd0dMQMVr2xABVscOSiYBfIl1DquZ7tA+/f5rKglSPt5a5/t4WlqI0UzPJG
         3sFfO47GZ7AE+x/Km4nEz3AibFSN93sIKhKiMVhAyiJEy5FAAelsSbl7hSnSWTIRjru+
         tLBg==
X-Gm-Message-State: AOJu0YyPOE1YGFDUgAxDgDvE21DWfXZU3iZGHHJPCR2AlD11le3dvgty
        SML6ouNSJqb0MnrqYsrTy/jfvIbazNI=
X-Google-Smtp-Source: AGHT+IGookYXrYm1A+ma3WZO34BPnkwMLXQzWy+6HX4P/l5wwOteWAD0NK2vYdNE8zwnCUE9EMm+eRT161A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2fce:0:b0:d9a:f3dc:7d19 with SMTP id
 v197-20020a252fce000000b00d9af3dc7d19mr331431ybv.11.1698936092597; Thu, 02
 Nov 2023 07:41:32 -0700 (PDT)
Date:   Thu, 2 Nov 2023 07:41:30 -0700
In-Reply-To: <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-13-seanjc@google.com>
 <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com>
Message-ID: <ZUO1Giju0GkUdF0o@google.com>
Subject: Re: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
From:   Sean Christopherson <seanjc@google.com>
To:     Fuad Tabba <tabba@google.com>
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
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 02, 2023, Fuad Tabba wrote:
> Hi,
>=20
> On Fri, Oct 27, 2023 at 7:22=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > Add flags to "struct kvm_gfn_range" to let notifier events target only
> > shared and only private mappings, and write up the existing mmu_notifie=
r
> > events to be shared-only (private memory is never associated with a
> > userspace virtual address, i.e. can't be reached via mmu_notifiers).
> >
> > Add two flags so that KVM can handle the three possibilities (shared,
> > private, and shared+private) without needing something like a tri-state
> > enum.
> >
> > Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  include/linux/kvm_host.h | 2 ++
> >  virt/kvm/kvm_main.c      | 7 +++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 96aa930536b1..89c1a991a3b8 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -263,6 +263,8 @@ struct kvm_gfn_range {
> >         gfn_t start;
> >         gfn_t end;
> >         union kvm_mmu_notifier_arg arg;
> > +       bool only_private;
> > +       bool only_shared;
>=20
> If these flags aren't used in this patch series, should this patch be
> moved to the other series?

If *both* TDX and SNP need this patch, then I think it's probably worth app=
lying
it now to make their lives easier.  But if only one needs the support, then=
 I
completely agree this should be punted to whichever series needs it (this a=
lso
came up in v11, but we didn't force the issue).

Mike, Isaku?

> Also, if shared+private is a possibility, doesn't the prefix "only_"
> confuse things a bit? I.e., what is shared+private, is it when both
> are 0 or when both are 1? I assume it's the former (both are 0), but
> it might be clearer.

Heh, I was hoping that "only_private && only_shared" would be obviously non=
sensical.

The only alternative I can think would be to add an enum, e.g.

	enum {
		PROCESS_PRIVATE_AND_SHARED,
		PROCESS_ONLY_PRIVATE,
		PROCESS_ONLY_SHARED,
	};

because every other way of expressing the flags either results in more conf=
usion
or an unsafe default.  I.e. I want zapping only private or only shared to r=
equire
the caller to explicitly set a non-zero value, which is how I ended up with
"only_{private,shared}" as opposed to "process_{private,shared}".
