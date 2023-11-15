Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7D57DF726
	for <lists+linux-mips@lfdr.de>; Thu,  2 Nov 2023 16:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbjKBP4t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Nov 2023 11:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjKBP4s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Nov 2023 11:56:48 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0250182
        for <linux-mips@vger.kernel.org>; Thu,  2 Nov 2023 08:56:45 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9cb4de3bf0so1385906276.0
        for <linux-mips@vger.kernel.org>; Thu, 02 Nov 2023 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698940605; x=1699545405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYwIeNUmcSQVXWofeU45UHS4WNGoW8dkX+AiEs9OLu8=;
        b=Y0pCm1U54F6+t54g6ve3O4sKwAusswNVzdo/ZhFSDZYY3fnsTSWwACgBYfOq31uLmZ
         n9liL33D4Z/oeyFN9H7zzXPPuJSyH1Atgliy12chGBSd3rqhpRJSerdZqAUBkkEwvu49
         xJ+bQC3rSFRvzDPE/of8HkJfzitSLMa+slgd8+PaNiVIEi98RiPmSNz1trgu7X0u8d16
         DcHxfic4aChGEeMhHoYjx7XN06VzXWiTSO9GRHyDw433j7RQV4xwPqo8P0ScSeH3p6pr
         Bg5jhSQZ0RyAdW4Uc8W8fXlvZhxX9QSuhVl0yroaBCXIdxltEoflCiVneqVbQLl2q1OW
         lAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698940605; x=1699545405;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sYwIeNUmcSQVXWofeU45UHS4WNGoW8dkX+AiEs9OLu8=;
        b=rkfgzF0ye5OW6+ImL3+Gg3DSCIhpPetzESFCMe55AJ4IN2lsZZXjyuZZQuEwalt4up
         WkBTGlc6fCIuexv9OzM2kNRu+1juyV7OaHG2C2INYmXgd3TQY/NhOkTi3hmw2+18dIRB
         +ozkBC3EnlpkL9OouKTWyaJmqeRs/NVAyIBLqxjF1plWrqLTRdVrFrju29IySRWUSBnz
         MmC8jSDMTijTDkoVb+PdAEgjgvqAoRu0wA7cswLPoIqof/+jRua/4kIXXlD0h5z82AHa
         Vx6Ayn2ShLhWsLhrKNcvvlb3OQ4Sit47lnseh+6OCw125KMiPG5+v6bC/LQvuhEfuTxB
         +7OQ==
X-Gm-Message-State: AOJu0YyoIgj3BzAbS/6g+3QRDwjvuTGHCU6eUQjECqgM8dhsteB7RWkR
        JuRnsUBS1yROGKTR3B3BwuNY+b/P3Xs=
X-Google-Smtp-Source: AGHT+IGZwkk8ZQOm5+11CB83zMzVhzLYncHDWYhyGGxNXJ5R5wT9b6yT+r/XAOkVnZeNHiaSF1GNxI0NkwA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:aae7:0:b0:da0:5a30:6887 with SMTP id
 t94-20020a25aae7000000b00da05a306887mr349504ybi.4.1698940604877; Thu, 02 Nov
 2023 08:56:44 -0700 (PDT)
Date:   Thu, 2 Nov 2023 08:56:43 -0700
In-Reply-To: <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com> <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
Message-ID: <ZUPGu6jroYv3KFPv@google.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From:   Sean Christopherson <seanjc@google.com>
To:     Kai Huang <kai.huang@intel.com>
Cc:     Xiaoyao Li <xiaoyao.li@intel.com>,
        "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
        "mic@digikod.net" <mic@digikod.net>,
        "liam.merwick@oracle.com" <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "david@redhat.com" <david@redhat.com>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "amoorthy@google.com" <amoorthy@google.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "tabba@google.com" <tabba@google.com>,
        "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "michael.roth@amd.com" <michael.roth@amd.com>,
        "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
        "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
        "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        Vishal Annapurve <vannapurve@google.com>,
        "vbabka@suse.cz" <vbabka@suse.cz>,
        "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "maz@kernel.org" <maz@kernel.org>,
        "willy@infradead.org" <willy@infradead.org>,
        "dmatlack@google.com" <dmatlack@google.com>,
        "anup@brainfault.org" <anup@brainfault.org>,
        "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
        Yilun Xu <yilun.xu@intel.com>,
        "qperret@google.com" <qperret@google.com>,
        "brauner@kernel.org" <brauner@kernel.org>,
        "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>,
        "ackerleytng@google.com" <ackerleytng@google.com>,
        "jarkko@kernel.org" <jarkko@kernel.org>,
        "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        Wei W Wang <wei.w.wang@intel.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 02, 2023, Kai Huang wrote:
> On Wed, 2023-11-01 at 10:36 -0700, Sean Christopherson wrote:
> > On Wed, Nov 01, 2023, Kai Huang wrote:
> > >=20
> > > > +7.34 KVM_CAP_MEMORY_FAULT_INFO
> > > > +------------------------------
> > > > +
> > > > +:Architectures: x86
> > > > +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> > > > +
> > > > +The presence of this capability indicates that KVM_RUN will fill
> > > > +kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-E=
xit, e.g. if
> > > > +there is a valid memslot but no backing VMA for the corresponding =
host virtual
> > > > +address.
> > > > +
> > > > +The information in kvm_run.memory_fault is valid if and only if KV=
M_RUN returns
> > > > +an error with errno=3DEFAULT or errno=3DEHWPOISON *and* kvm_run.ex=
it_reason is set
> > > > +to KVM_EXIT_MEMORY_FAULT.
> > >=20
> > > IIUC returning -EFAULT or whatever -errno is sort of KVM internal
> > > implementation.
> >=20
> > The errno that is returned to userspace is ABI.  In KVM, it's a _very_ =
poorly
> > defined ABI for the vast majority of ioctls(), but it's still technical=
ly ABI.
> > KVM gets away with being cavalier with errno because the vast majority =
of errors
> > are considered fatal by userespace, i.e. in most cases, userspace simpl=
y doesn't
> > care about the exact errno.
> >=20
> > A good example is KVM_RUN with -EINTR; if KVM were to return something =
other than
> > -EINTR on a pending signal or vcpu->run->immediate_exit, userspace woul=
d fall over.
> >=20
> > > Is it better to relax the validity of kvm_run.memory_fault when
> > > KVM_RUN returns any -errno?
> >=20
> > Not unless there's a need to do so, and if there is then we can update =
the
> > documentation accordingly.  If KVM's ABI is that kvm_run.memory_fault i=
s valid
> > for any errno, then KVM would need to purge kvm_run.exit_reason super e=
arly in
> > KVM_RUN, e.g. to prevent an -EINTR return due to immediate_exit from be=
ing
> > misinterpreted as KVM_EXIT_MEMORY_FAULT.  And purging exit_reason super=
 early is
> > subtly tricky because KVM's (again, poorly documented) ABI is that *som=
e* exit
> > reasons are preserved across KVM_RUN with vcpu->run->immediate_exit (or=
 with a
> > pending signal).
> >=20
> > https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf@google.com
> >=20
> >=20
>=20
> Agreed with not to relax to any errno.  However using -EFAULT as part of =
ABI
> definition seems a little bit dangerous, e.g., someone could accidentally=
 or
> mistakenly return -EFAULT in KVM_RUN at early time and/or in a completely
> different code path, etc. =C2=A0-EINTR has well defined meaning, but -EFA=
ULT (which
> is "Bad address") seems doesn't but I am not sure either. :-)

KVM has returned -EFAULT since forever, i.e. it's effectively already part =
of the
ABI.  I doubt there's a userspace that relies precisely on -EFAULT, but use=
rspace
definitely will be confused if KVM returns '0' where KVM used to return -EF=
AULT.
And so if we want to return '0', it needs to be opt-in, which means forcing
userspace to enable a capability *and* requires code in KVM to conditionall=
y return
'0' instead of -EFAULT/-EHWPOISON.

> One example is, for backing VMA with VM_IO | VM_PFNMAP, hva_to_pfn() retu=
rns
> KVM_PFN_ERR_FAULT when the kernel cannot get a valid PFN (e.g. when SGX v=
epc
> fault handler failed to allocate EPC) and kvm_handle_error_pfn() will jus=
t
> return -EFAULT.  If kvm_run.exit_reason isn't purged early then is it pos=
sible
> to have some issue here?

Well, yeah, but that's exactly why this series has a patch to reset exit_re=
ason.
The solution to "if KVM is buggy then bad things happen" is to not have KVM=
 bugs :-)
