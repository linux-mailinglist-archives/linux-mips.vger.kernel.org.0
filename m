Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714ED48C93D
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jan 2022 18:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355569AbiALRVh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Jan 2022 12:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355564AbiALRVb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Jan 2022 12:21:31 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE792C061756
        for <linux-mips@vger.kernel.org>; Wed, 12 Jan 2022 09:21:30 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so6188865pjp.0
        for <linux-mips@vger.kernel.org>; Wed, 12 Jan 2022 09:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TYHRM7+kADwOp9diBRrPGp4L0N1LoYL1IUvHa0nGaUc=;
        b=UOi9kIvtR/IrJwzo5niwxDtXudsV6IxInf5Xux8zgZWocQk2IEmaYc0XSVBraMOzip
         1p6oktTDeAT0Xo0Y1Hv38DXQkmSLxGT3a21Lcwuzm9HPptZ8CwyjAsbDUolqExCQJBvI
         3/Ilf2Jr3LSRwS8m0x3JSZhofT299fDyux/e4JRm1BTZb8xRszyzcX2IlMX1MSEgYjMT
         4xhdcYSj8HE0lJizFcqyvQ1F0sIsor9GOdwCIFkIY/f5YjDSO/UpiSWU7FnrM6Aap0Ov
         XAwRUtuXNr7yYBD4h8SO2lxl+txc3ZtlyhAeUA7I20RlONuBzpovIUUx1rYk6w6DmC66
         icRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TYHRM7+kADwOp9diBRrPGp4L0N1LoYL1IUvHa0nGaUc=;
        b=jIrygCXMrYy7M1dInYq4JxmoDMFLUkyKb60URopKk1x1pEiklUEpu3CH5HogqsJM9y
         h9AzHoI5XsTwV11YFSC5bO1MspW5et+niRZaSK7+bd9kqas+TBDm9lQSGV0UeexOOagZ
         pxE1o9x0fqqnEidy9z3GzIBj/43GC8rs0rtFRbw0TWTG0149K4TtavvDJYJ6MvrY0HNY
         /cvM62nxhJXfOsgufYFtVN1xWn9OjboD7LQYxmsbN95jaIbsoaWsalihuUL7Q270cXe2
         S2NtCl6rL3BhjJiZWkOwFSdra1E9iRT8LKZNR1Dpr5Qlfy5cjoIrYhmj4lEAmLA08H5F
         yHfg==
X-Gm-Message-State: AOAM5330/IPOPDKIWO7a0vIF3AHbKmDTXq45SQGUvSOVYrJBxOj+dXUl
        GQOKHzP6dA9Cnnjdi4hgnwCtIQ==
X-Google-Smtp-Source: ABdhPJzFOOljTybPaAkOSjlPQwykizLUTnzjLoFkEgLqIZkrqe/Ahlwi51dGj1hKKqsANfiIKGdNKw==
X-Received: by 2002:a63:7845:: with SMTP id t66mr576433pgc.103.1642008090029;
        Wed, 12 Jan 2022 09:21:30 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id qe10sm7011428pjb.5.2022.01.12.09.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 09:21:29 -0800 (PST)
Date:   Wed, 12 Jan 2022 17:21:25 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Chao Gao <chao.gao@intel.com>
Cc:     kvm@vger.kernel.org, pbonzini@redhat.com, kevin.tian@intel.com,
        tglx@linutronix.de, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
        =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
        Bharata B Rao <bharata@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 3/6] KVM: Remove opaque from
 kvm_arch_check_processor_compat
Message-ID: <Yd8OFT80exMeCMVA@google.com>
References: <20211227081515.2088920-1-chao.gao@intel.com>
 <20211227081515.2088920-4-chao.gao@intel.com>
 <Ydy8BCfE0jhJd5uE@google.com>
 <20220111031933.GB2175@gao-cwp>
 <Yd8N7PFqZbACzh2r@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd8N7PFqZbACzh2r@google.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 12, 2022, Sean Christopherson wrote:
> On Tue, Jan 11, 2022, Chao Gao wrote:
> > On Mon, Jan 10, 2022 at 11:06:44PM +0000, Sean Christopherson wrote:
> > >On Mon, Dec 27, 2021, Chao Gao wrote:
> > >> No arch implementation uses this opaque now.
> > >
> > >Except for the RISC-V part, this can be a pure revert of commit b99040853738 ("KVM:
> > >Pass kvm_init()'s opaque param to additional arch funcs").  I think it makes sense
> > >to process it as a revert, with a short blurb in the changelog to note that RISC-V
> > >is manually modified as RISC-V support came along in the interim.
> > 
> > commit b99040853738 adds opaque param to kvm_arch_hardware_setup(), which isn't
> > reverted in this patch. I.e., this patch is a partial revert of b99040853738
> > plus manual changes to RISC-V. Given that, "process it as a revert" means
> > clearly say in changelog that this commit contains a partial revert of commit
> > b99040853738 ("KVM: Pass kvm_init()'s opaque param to additional arch funcs").
> > 
> > Right?
> 
> What I meant is literally do
> 
>   git revert -s b99040853738
> 
> and then manually handle RISC-V.

Doh, to be clear, "manually handle RISC-V _in the same commit_".
