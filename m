Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 115FD7A4B73
	for <lists+linux-mips@lfdr.de>; Mon, 18 Sep 2023 17:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbjIRPQu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Sep 2023 11:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbjIRPQt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 Sep 2023 11:16:49 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CB7106
        for <linux-mips@vger.kernel.org>; Mon, 18 Sep 2023 08:16:40 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-41214998fc2so27335341cf.0
        for <linux-mips@vger.kernel.org>; Mon, 18 Sep 2023 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695050199; x=1695654999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ucvab0+WYvq4UufE5S4SV2ca9jdWUsP9GGHLs6BCgo=;
        b=Yt+fVUsRMeORje6bqjAG46AN7VUYwHvk4anPaOKB66pzIfsa7eGN7PwwGYazw/Ml4G
         zSJDa2fRaak6DQ/2yDdUGrk/jJfT7gqXnEfglMmlEHHM6QHOhKUoHu/JuJtoUPkSf3gZ
         bXzhhINWlQwAEpfO2I/jpm/Yf0X6kgykhzvZVtEHdtQLop7zWQYyXg8e55+4hoUS+Nv1
         3Nvt1SloiwIIA2fREypyrGT1qo+Nk5fCWKtTBNewRRc9j09t+3B9QhG2h24hoHSTtPec
         Vbd8eRyFh+MJ5I+I7Yz+QIpc+iC1aOF6XmzN1DLY5zUvsy6kn9Wy7C3j3qUq5WVFEl/r
         Ls3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050199; x=1695654999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ucvab0+WYvq4UufE5S4SV2ca9jdWUsP9GGHLs6BCgo=;
        b=sLYZBL1dth+ctGd4NIAnWfreuwehRymJENkwDmpHVFlzZ8UvkA8skC0Xelyb0nuWsb
         mmGGm6k4BpazhJRDuyMLg5TeEnDjP38E+/rxyfRZxkOeGGuqgpfLyomCa5d/FRMDT+g9
         AzI0ZoYZaqtEoW/GZORFguNx1UR/C9Ss8OM1c+n1udGgLOxTkzr+xT10kUwCIEDnT09O
         ++7Q7UTsY0dt/sHac1WUGYalUbLYjd15uPOhk3eNgO1Iy3HbmNQ8hwjmK1zDH8I7O32i
         9ZLQtwp3t6uM/ih0wNRbgMCkoGQBPfN+gwSfsTCeB6TldIjAPe+4XTKZ9pTQfdlvwwjJ
         Rxmw==
X-Gm-Message-State: AOJu0YwfQxACozM76rImNfs08HXyej28NkCpbs+3LrszgQZB5v2AsAZA
        jQKEpQ2BlCGVBcifYg2owGNRxg==
X-Google-Smtp-Source: AGHT+IE1nILLKPaFxe5im/MfVjUE0HuRytyibnYnzCmrjBnu/bqUhqldLHu9krEWO371lIWoHdHJrg==
X-Received: by 2002:ac8:5ac9:0:b0:403:ef0a:ac69 with SMTP id d9-20020ac85ac9000000b00403ef0aac69mr11892621qtd.62.1695050199490;
        Mon, 18 Sep 2023 08:16:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id z22-20020ac87116000000b004108f6788a6sm3081779qto.41.2023.09.18.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 08:16:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1qiFzJ-0005Nh-7L;
        Mon, 18 Sep 2023 12:16:37 -0300
Date:   Mon, 18 Sep 2023 12:16:37 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        Anish Ghulati <aghulati@google.com>,
        Venkatesh Srinivas <venkateshs@chromium.org>,
        Andrew Thornton <andrewth@google.com>
Subject: Re: [PATCH 01/26] vfio: Wrap KVM helpers with CONFIG_KVM instead of
 CONFIG_HAVE_KVM
Message-ID: <20230918151637.GF13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-2-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916003118.2540661-2-seanjc@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 15, 2023 at 05:30:53PM -0700, Sean Christopherson wrote:
> Wrap the helpers for getting references to KVM instances with a check on
> CONFIG_KVM being enabled, not on CONFIG_HAVE_KVM being defined.  PPC does
> NOT select HAVE_KVM, despite obviously supporting KVM, and guarding code
> to get references to KVM based on whether or not the architecture supports
> KVM is nonsensical.
> 
> Drop the guard around linux/kvm_host.h entirely, conditionally including a
> generic headers is completely unnecessary.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio.h      | 2 +-
>  drivers/vfio/vfio_main.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
