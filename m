Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F23A264ACD3
	for <lists+linux-mips@lfdr.de>; Tue, 13 Dec 2022 02:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbiLMBLM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 20:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233895AbiLMBLJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 20:11:09 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEB61BE91
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 17:11:08 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id 17so6502058pll.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 17:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hinRxz3gZAj3ZK/aMCsc0q1wjnPrltO2NY/c3Ugkfq0=;
        b=BNMWSdc+G8UMrGiE9cfwTCPOtvSd4SGR5xx9j3KogRRggicjQJNSWnM6KzvI+ruZLT
         Z5/+c4GRAmzfjVgnsKmZRqnzwxy3jUi/VmUYCAee+psZ2RDnJgcc1z+MUbcUtpmBqhIZ
         n2Xll8zjiyxpmJ3nyLDrFyGmzI72Dw1KgllTInw6mNRJPlPPq+xSIjWfB9YG8CN/8PRG
         r3MG2HeXYjSqtpUEiCGlGf9/Jk4XWxaXIBwinsPc1K0QooX+vTYegu4v2wV32ww/FxE5
         7U3ovhcjmqh4WLC5088r7J3ACzaSHYWslRMcTvYMNLnN6V4ac7AvMNHAI+noZZdCx3Mm
         2p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hinRxz3gZAj3ZK/aMCsc0q1wjnPrltO2NY/c3Ugkfq0=;
        b=Apgf41zBDL92H3iuRRLH6I6SdrAEVkCXL5Am5nbYytIYeFu+T/jQYpkCIjScJ67sX9
         lRf1qn74nBXwKVBTDPikXl1KNL39dHuuIFxoNK1VPtw92sA5TTGA6qWskZtQ4XPov6gJ
         BEH+zgCgaeS0otJUm2TLKO2YxxBtLdOZ6uN6QIOQnFegRqBOOIa8Ny4Y567Ui8+PCjuE
         L5RLR074ZIdk5QCax6AAoP+FL2t6o1s9Ef31bY9LoIEhcERjluR7McW+ksCqDWpGO8TH
         +168SBcNGV2F8Fcs+zL65voNtIDS4vTNYIetTl9ZBjIDtLnii0n+j+h0f+JHaE/AowCV
         fNuw==
X-Gm-Message-State: ANoB5pkKTYQrct7PpKDavGVcuuVDiPf7hVcDtZ19em5eTt5FES5ezH6y
        /GG1NUcvQiAhwaqWtuVj9cQYDA==
X-Google-Smtp-Source: AA0mqf4K7zeWWztu3csfWQBbFCCVxqGsIhKZt6mbUg55HAzsJAXNVoEUxec6VV36cFbnYl7q+RITOA==
X-Received: by 2002:a17:902:7001:b0:189:a208:d130 with SMTP id y1-20020a170902700100b00189a208d130mr18915329plk.31.1670893867860;
        Mon, 12 Dec 2022 17:11:07 -0800 (PST)
Received: from google.com (223.103.125.34.bc.googleusercontent.com. [34.125.103.223])
        by smtp.gmail.com with ESMTPSA id l11-20020a170903120b00b0017f72a430adsm7043661plh.71.2022.12.12.17.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 17:11:07 -0800 (PST)
Date:   Mon, 12 Dec 2022 17:11:02 -0800
From:   David Matlack <dmatlack@google.com>
To:     Oliver Upton <oliver.upton@linux.dev>
Cc:     Sean Christopherson <seanjc@google.com>,
        "Yang, Weijiang" <weijiang.yang@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
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
        "Amit, Nadav" <namit@vmware.com>,
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
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
Message-ID: <Y5fRJr34/BnsE+Dv@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
 <Y5dnWgJ0ine55/hN@google.com>
 <Y5dwQEJHNiTPE+jz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5dwQEJHNiTPE+jz@google.com>
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

On Mon, Dec 12, 2022 at 06:17:36PM +0000, Oliver Upton wrote:
> On Mon, Dec 12, 2022 at 05:39:38PM +0000, Sean Christopherson wrote:
> > On Fri, Dec 09, 2022, David Matlack wrote:
> > > On Fri, Dec 9, 2022 at 9:25 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> > My preference would be to leave .smm in x86's page role.  IMO, defining multiple
> > address spaces to support SMM emulation was a mistake that should be contained to
> > SMM, i.e. should never be used for any other feature.  And with CONFIG_KVM_SMM,
> > even x86 can opt out.
> 
> +1
> 
> I don't think something is architecture-neutral by virtue of it existing
> in virt/kvm/*.

Put another way, just because something exists in virt/kvm/* doesn't
mean it is used (or will be useful) to more than one architecture.
Totally agree.  In this case, there never turned out to be any other
usecases for memslot address spaces.

As for role.arch.smm vs role.as_id, I'll post my response on the other
thread with Paolo. Juggling these threads is hard.
