Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6247DF8D1
	for <lists+linux-mips@lfdr.de>; Thu,  2 Nov 2023 18:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbjKBRhg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Nov 2023 13:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbjKBRhf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Nov 2023 13:37:35 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF6D198
        for <linux-mips@vger.kernel.org>; Thu,  2 Nov 2023 10:37:31 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cc323b2aa3so8913455ad.3
        for <linux-mips@vger.kernel.org>; Thu, 02 Nov 2023 10:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698946651; x=1699551451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN1ssLkZHjDTrGZRWby6miGmTEsoKqfVN3YbqYw1LLA=;
        b=coSNqGSa47J/UZf0Pz9YGwIQ7TBXNp4w0vC+NhbSJdmfM63JiOkcuplyubh+1Bc1Xq
         wDZIUN+2gb4+E0zeGXXCd85Yf8kSu9+YVBg7mENZa8X2Td3Okm1qsYKwdlv1ZIziaahp
         phBKhJnDxgx037qgYQBLTXyDIWs04h12RX0vyIVuFVvywhiLTAp2dUtk4xYwj8sT53Kd
         wak23GwFfRo+wHgAjW8Ifr3xrZf2CDKVvRJ96S0KbOFd3kiUcpPysu6bM4aaMiQbe+Qx
         hptsOZZLoBiRBJmyrnh5Kp6KtkOEMsgVNRtO/71TejvAhuZF/s+jD0uHNwhko4LLUx/t
         wMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698946651; x=1699551451;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uN1ssLkZHjDTrGZRWby6miGmTEsoKqfVN3YbqYw1LLA=;
        b=SM8z70fhLuQsIalo1t6258tsecZo5sKMu2QIWh2WOS4qroy9s14sxAS0yHYleMTsKC
         hPWCpsrZVdMOHElZnOuJVQaUpbQ2odfQCa90bOw0MFBsLMJ8Zr2iva0LhNU0Qnqb/03c
         eq8HQoYRKQvRh20Ynq7FghzQto/O4sWVmkqFHskimYzl0s3BJ6NBwZrX9zD2mkXa8/U7
         xgqKZeGyT2Jz9mbVCCFhVj/cwXgXLTLlh+1V+gLh48J6npC7kWzcoTNAkJPlF/iY4XhV
         uVOlS6oqRdmq6TIFVeJjImHGGLMbPRRJV98ImaLQP/vtDbrQZDI82KcjNfMinFMq+5Lz
         dXZA==
X-Gm-Message-State: AOJu0YysYOv277BY6KTt5JPa6C8vk5yZ4mnfxVDMPgk2hD9j2KPiLWlA
        Sb++oISeVtlMhOLXj0ZA4k8hqylo6qc=
X-Google-Smtp-Source: AGHT+IHO2BmoMwEG0Z4p7dUErvps7DbkHqeEBbdPqNa8vmvQCAafmC1+rihoFOkAVlqXxxzUlxPm8WkwUZU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:25d2:b0:1cc:2ffe:5a27 with SMTP id
 jc18-20020a17090325d200b001cc2ffe5a27mr287356plb.9.1698946650780; Thu, 02 Nov
 2023 10:37:30 -0700 (PDT)
Date:   Thu, 2 Nov 2023 10:37:29 -0700
In-Reply-To: <CALzav=eaVc5rzmHwnQr7aotyTKi9Agdte7NAL0NvBeE+f6zYoA@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com> <ZUFzZf-YmCRYP6qo@google.com>
 <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
 <6642c379-1023-4716-904f-4bbf076744c2@redhat.com> <ZUPIXt1XzZrriswG@google.com>
 <CALzav=eaVc5rzmHwnQr7aotyTKi9Agdte7NAL0NvBeE+f6zYoA@mail.gmail.com>
Message-ID: <ZUPeWTdbMhvMO4QL@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From:   Sean Christopherson <seanjc@google.com>
To:     David Matlack <dmatlack@google.com>
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 02, 2023, David Matlack wrote:
> On Thu, Nov 2, 2023 at 9:03=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
> >
> > On Thu, Nov 02, 2023, Paolo Bonzini wrote:
> > > On 10/31/23 23:39, David Matlack wrote:
> > > > > > Maybe can you sketch out how you see this proposal being extens=
ible to
> > > > > > using guest_memfd for shared mappings?
> > > > > For in-place conversions, e.g. pKVM, no additional guest_memfd is=
 needed.  What's
> > > > > missing there is the ability to (safely) mmap() guest_memfd, e.g.=
 KVM needs to
> > > > > ensure there are no outstanding references when converting back t=
o private.
> > > > >
> > > > > For TDX/SNP, assuming we don't find a performant and robust way t=
o do in-place
> > > > > conversions, a second fd+offset pair would be needed.
> > > > Is there a way to support non-in-place conversions within a single =
guest_memfd?
> > >
> > > For TDX/SNP, you could have a hook from KVM_SET_MEMORY_ATTRIBUTES to =
guest
> > > memory.  The hook would invalidate now-private parts if they have a V=
MA,
> > > causing a SIGSEGV/EFAULT if the host touches them.
> > >
> > > It would forbid mappings from multiple gfns to a single offset of the
> > > guest_memfd, because then the shared vs. private attribute would be t=
ied to
> > > the offset.  This should not be a problem; for example, in the case o=
f SNP,
> > > the RMP already requires a single mapping from host physical address =
to
> > > guest physical address.
> >
> > I don't see how this can work.  It's not a M:1 scenario (where M is mul=
tiple gfns),
> > it's a 1:N scenario (wheren N is multiple offsets).  The *gfn* doesn't =
change on
> > a conversion, what needs to change to do non-in-place conversion is the=
 pfn, which
> > is effectively the guest_memfd+offset pair.
> >
> > So yes, we *could* support non-in-place conversions within a single gue=
st_memfd,
> > but it would require a second offset,
>=20
> Why can't KVM free the existing page at guest_memfd+offset and
> allocate a new one when doing non-in-place conversions?

Oh, I see what you're suggesting.  Eww.

It's certainly possible, but it would largely defeat the purpose of why we =
are
adding guest_memfd in the first place.

For TDX and SNP, the goal is to provide a simple, robust mechanism for isol=
ating
guest private memory so that it's all but impossible for the host to access=
 private
memory.  As things stand, memory for a given guest_memfd is either private =
or shared
(assuming we support a second guest_memfd per memslot).  I.e. there's no ne=
ed to
track whether a given page/folio in the guest_memfd is private vs. shared.

We could use memory attributes, but that further complicates things when in=
trahost
migration (and potentially other multi-user scenarios) comes along, i.e. wh=
en KVM
supports linking multiple guest_memfd files to a single inode.  We'd have t=
o ensure
that all "struct kvm" instances have identical PRIVATE attributes for a giv=
en
*offset* in the inode.  I'm not even sure how feasible that is for intrahos=
t
migration, and that's the *easy* case, because IIRC it's already a hard req=
uirement
that the source and destination have identical gnf=3D>guest_memfd bindings,=
 i.e. KVM
can somewhat easily reason about gfn attributes.

But even then, that only helps with the actual migration of the VM, e.g. we=
'd still
have to figure out how to deal with .mmap() and other shared vs. private ac=
tions
when linking a new guest_memfd file against an existing inode.

I haven't seen the pKVM patches for supporting .mmap(), so maybe this is al=
ready
a solved problem, but I'd honestly be quite surprised if it all works corre=
ctly
if/when KVM supports multiple files per inode.

And I don't see what value non-in-place conversions would add.  The value a=
dded
by in-place conversions, aside from the obvious preservation of data, which=
 isn't
relevant to TDX/SNP, is that it doesn't require freeing and reallocating me=
mory
to avoid double-allocating for private vs. shared.  That's especialy quite =
nice
when hugepages are being used because reconstituing a hugepage "only" requi=
res
zapping SPTEs.

But if KVM is freeing the private page, it's the same as punching a hole, p=
robably
quite literally, when mapping the gfn as shared.  In every way I can think =
of, it's
worse.  E.g. it's more complex for KVM, and the PUNCH_HOLE =3D> allocation =
operations
must be serialized.

Regarding double-allocating, I really, really think we should solve that in=
 the
guest.  I.e. teach Linux-as-a-guest to aggressively convert at 2MiB granula=
rity
and avoid 4KiB conversions.  4KiB conversions aren't just a memory utilizat=
ion
problem, they're also a performance problem, e.g. shatters hugepages (which=
 KVM
doesn't yet support recovering) and increases TLB pressure for both stage-1=
 and
stage-2 mappings.
