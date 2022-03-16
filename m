Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38D7B4DACB8
	for <lists+linux-mips@lfdr.de>; Wed, 16 Mar 2022 09:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237397AbiCPIpf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Mar 2022 04:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbiCPIpf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Mar 2022 04:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C7FFF344D4
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647420261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1ZQesErDQxJhbNTlel7Pn8Vb/5JIOEBvnS29Fn8zDoI=;
        b=Rb+w4n88FtXg3OUil9rMLQVmoxaIHEb3eG9Bu4BfeYomrSm1HOjZ8fE+8JiL/ZRbamJOHu
        l8Yrm7ozWEc6T1Jt/+vM1sNQw78RRpE6Su7aOx/DjIjm8dhvjsdHr6TRGWpgzWIygrkTlS
        yphtammQ34UiMj+vElDUNiNrpthxKbw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-Zm_Z-A14N82wMdv_HR1Mow-1; Wed, 16 Mar 2022 04:44:19 -0400
X-MC-Unique: Zm_Z-A14N82wMdv_HR1Mow-1
Received: by mail-pl1-f198.google.com with SMTP id w24-20020a170902a71800b001538d7b076dso969546plq.16
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 01:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1ZQesErDQxJhbNTlel7Pn8Vb/5JIOEBvnS29Fn8zDoI=;
        b=QjzTBQC/bLUaCKiPyaZUzZcqKaXd3D3V+d+TbCS4U2LU2NR/odS3tR3Db15/3LyoLH
         hJBql+q/vMx3aI4daGPtqO6pYLBUst7WQycf6bqE8MJHcMkmWSvclrXkOGfmrF7RRfie
         GS6d3J2z21Ss4Lf7t/s9QKm56Q+fz04zkkMtA3eSD2L+d/7f3rHnrpuDPdPiWA2YzGG9
         HthC0XA6pLLnyi5FSTL7lNd4P88eo1pTA3yumJAyRUSXY90crd+D66jwh2qSfldh/7SK
         6hXdxgM5k3kgYSFrqlJIuCspooi5J6K0AneqFb3Brv5lFywgjMZIvjHzA4N/ZJcec64O
         bqog==
X-Gm-Message-State: AOAM530OYR7vVR+5elncV2WELhz0WY7ktHBGLFvA0m82Qa0WusGxwhR9
        B8e8IGf2okl4WSSoqj+dVGNgrcbutor5ArIPZ+cOe6LLr0arwad40evGHDVIXEkoOtY2MEf4IPY
        lQF2zIe+2nwwnDFiWbeiWgw==
X-Received: by 2002:a05:6a00:170c:b0:4f7:658d:77a2 with SMTP id h12-20020a056a00170c00b004f7658d77a2mr33249761pfc.60.1647420258148;
        Wed, 16 Mar 2022 01:44:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf5n0IdTCbTV5mIpfQa8fPfAwUPw+X6hCobMzk5jCneFEdxWl5Yk9KwxIn4gIMUVJ5GpzGRg==
X-Received: by 2002:a05:6a00:170c:b0:4f7:658d:77a2 with SMTP id h12-20020a056a00170c00b004f7658d77a2mr33249747pfc.60.1647420257911;
        Wed, 16 Mar 2022 01:44:17 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.128])
        by smtp.gmail.com with ESMTPSA id o5-20020a056a0015c500b004f76735be68sm2185059pfu.216.2022.03.16.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 01:44:17 -0700 (PDT)
Date:   Wed, 16 Mar 2022 16:44:09 +0800
From:   Peter Xu <peterx@redhat.com>
To:     David Matlack <dmatlack@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>
Subject: Re: [PATCH v2 17/26] KVM: x86/mmu: Pass access information to
 make_huge_page_split_spte()
Message-ID: <YjGjWcmn+7sZPjNX@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-18-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311002528.2230172-18-dmatlack@google.com>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 11, 2022 at 12:25:19AM +0000, David Matlack wrote:
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 85b7bc333302..541b145b2df2 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1430,7 +1430,7 @@ static int tdp_mmu_split_huge_page(struct kvm *kvm, struct tdp_iter *iter,
>  	 * not been linked in yet and thus is not reachable from any other CPU.
>  	 */
>  	for (i = 0; i < PT64_ENT_PER_PAGE; i++)
> -		sp->spt[i] = make_huge_page_split_spte(huge_spte, level, i);
> +		sp->spt[i] = make_huge_page_split_spte(huge_spte, level, i, ACC_ALL);

Pure question: is it possible that huge_spte is RO while we passed in
ACC_ALL here (which has the write bit set)?  Would it be better if we make
it a "bool exec" to be clearer?

-- 
Peter Xu

