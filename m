Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FECF7DCEAE
	for <lists+linux-mips@lfdr.de>; Tue, 31 Oct 2023 15:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjJaOE6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Oct 2023 10:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbjJaOE4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Oct 2023 10:04:56 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62953DE
        for <linux-mips@vger.kernel.org>; Tue, 31 Oct 2023 07:04:53 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da033914f7cso5397200276.0
        for <linux-mips@vger.kernel.org>; Tue, 31 Oct 2023 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698761092; x=1699365892; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsemryN+7v+wOBolNu7Hy0wHrULeaB9eFsfVkGp1/e8=;
        b=FrCK2BdFm4j45mpD+yVokt411jGTt+mhy/sd2Vi1orDmdUK8qPAg6Jm9kdANvFkCjX
         D442v8pY1sA/+tReHxcAfbkggmdQRySJHmw3dTDtt9FzVamFAh2sclv3iu1KjT281u72
         7OuE3iL6KlaPE3tSJOcImXWWHQaTRoacU/ptNs1BHPkG77XA6Bw0RcLbLqKCAeiMEx7Q
         8mt4dKfkx4h/coDYAysMLp5puGQCmD7YT6/nDvz6i+9Nya+wAS0B2PwzR10/ytE10XVW
         damMDw/uLdR0ixdVowm64jHzCLEN7U/q9ybNbp3O+mIRh/VfbCYgW3gtAP5+mBumgGnY
         MPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761092; x=1699365892;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsemryN+7v+wOBolNu7Hy0wHrULeaB9eFsfVkGp1/e8=;
        b=LiWejroD5E2xNXqxmVbfoJ06NSSiBPg2cqbiQqoJer0TAxVWOeXNmFJaOeOLjkX9Y8
         vBN+17ckoLZfh2k3ofAc4/xTUbC/0fURakxPnoHRyu5LQQZCQVCncpu3Uc7ok4xmivA0
         /2MIKoSeF5rsvn6+CGdZGkc5oVtaSJ9uXx7jnV/lnIGL78LyKvbMbOWHduG9IpIzPdCk
         VKQ3t+a9Xca++MgABeKUEusIy/TgDAxBlr3Xua06uiUS6e+ZdWH02RSZu2pqmA47Q3Kc
         NfseauwS+d4HyzEPdcDpvTgaXGwwyOy9QLb/qvYzZGNlDS3jY1mesWddNCi85D9eNR4u
         00mQ==
X-Gm-Message-State: AOJu0YwsFqMyRX4dx7g4NDvnPJYsQOcbxHTEgVYhr518e1bmROUhYIHu
        8eBcEF9moSuaRGV2gONZA2+iB9wkyls=
X-Google-Smtp-Source: AGHT+IGMRYf422gsAhq04hJnKRMCzmHg+RO6tAl4JuMhPFGeve1lxsPBrReypZbUvK9g95iFN5O303NMZlw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c3b8:4274 with SMTP id
 v3-20020a056902108300b00d9ac3b84274mr301710ybu.7.1698761092559; Tue, 31 Oct
 2023 07:04:52 -0700 (PDT)
Date:   Tue, 31 Oct 2023 07:04:51 -0700
In-Reply-To: <2edd908a-9699-4d8e-9063-c655f1fc9712@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-9-seanjc@google.com>
 <2edd908a-9699-4d8e-9063-c655f1fc9712@intel.com>
Message-ID: <ZUEJg_rBf35NyCG3@google.com>
Subject: Re: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
From:   Sean Christopherson <seanjc@google.com>
To:     Xiaoyao Li <xiaoyao.li@intel.com>
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
        linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
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
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 31, 2023, Xiaoyao Li wrote:
> On 10/28/2023 2:21 AM, Sean Christopherson wrote:
> > Introduce a "version 2" of KVM_SET_USER_MEMORY_REGION so that additional
> > information can be supplied without setting userspace up to fail.  The
> > padding in the new kvm_userspace_memory_region2 structure will be used to
> > pass a file descriptor in addition to the userspace_addr, i.e. allow
> > userspace to point at a file descriptor and map memory into a guest that
> > is NOT mapped into host userspace.
> > 
> > Alternatively, KVM could simply add "struct kvm_userspace_memory_region2"
> > without a new ioctl(), but as Paolo pointed out, adding a new ioctl()
> > makes detection of bad flags a bit more robust, e.g. if the new fd field
> > is guarded only by a flag and not a new ioctl(), then a userspace bug
> > (setting a "bad" flag) would generate out-of-bounds access instead of an
> > -EINVAL error.
> > 
> > Cc: Jarkko Sakkinen <jarkko@kernel.org>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   Documentation/virt/kvm/api.rst | 21 +++++++++++++++++++
> >   arch/x86/kvm/x86.c             |  2 +-
> >   include/linux/kvm_host.h       |  4 ++--
> >   include/uapi/linux/kvm.h       | 13 ++++++++++++
> >   virt/kvm/kvm_main.c            | 38 +++++++++++++++++++++++++++-------
> >   5 files changed, 67 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 21a7578142a1..ace984acc125 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6070,6 +6070,27 @@ writes to the CNTVCT_EL0 and CNTPCT_EL0 registers using the SET_ONE_REG
> >   interface. No error will be returned, but the resulting offset will not be
> >   applied.
> > +4.139 KVM_SET_USER_MEMORY_REGION2
> > +---------------------------------
> > +
> > +:Capability: KVM_CAP_USER_MEMORY2
> > +:Architectures: all
> > +:Type: vm ioctl
> > +:Parameters: struct kvm_userspace_memory_region2 (in)
> > +:Returns: 0 on success, -1 on error
> > +
> > +::
> > +
> > +  struct kvm_userspace_memory_region2 {
> > +	__u32 slot;
> > +	__u32 flags;
> > +	__u64 guest_phys_addr;
> > +	__u64 memory_size; /* bytes */
> > +	__u64 userspace_addr; /* start of the userspace allocated memory */
> 
> missing
> 
> 	__u64 pad[16];

I can't even copy+paste correctly :-(
