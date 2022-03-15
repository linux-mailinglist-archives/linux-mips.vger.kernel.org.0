Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69BE34D98A2
	for <lists+linux-mips@lfdr.de>; Tue, 15 Mar 2022 11:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243390AbiCOKYM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Mar 2022 06:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345367AbiCOKYL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Mar 2022 06:24:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3AEA462E1
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647339778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LjO2FjgMYcDXjzsWvO69h8LISgo2Po4eNzRhF4LMslU=;
        b=SmsgIWJTNCja/MADcXqTWT0Jj1pXz546SpZnMuiVI9MoNxs9molWyHD4xQfsAmP4/oodH2
        MrQoiSHuVj+f/FNuhp+cBCAo1LSiqLwbbl3YJQLjYpsGpogPQ3VyFSJZydEMdhceIfc68p
        R/tGRZy/bL8SZuLdRwKwZZw1mRkRb3Y=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-Ml8Je5eyOkCZiMwTt69tgQ-1; Tue, 15 Mar 2022 06:22:57 -0400
X-MC-Unique: Ml8Je5eyOkCZiMwTt69tgQ-1
Received: by mail-pf1-f198.google.com with SMTP id 16-20020a621910000000b004f783aad863so8544742pfz.15
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 03:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LjO2FjgMYcDXjzsWvO69h8LISgo2Po4eNzRhF4LMslU=;
        b=cy8yOFs0rs2luQD/lDrCaBpAoxJxZFMdfCmq2sWk3deWUtZ/RmE2fECB8bmz0svaJi
         D9/NUYC914fDJ2byDx8063L8XijU5t8iSoAZ1ZnrS4MJLS1acXvDcgh6GWP6TPoWwJR9
         sdE3sQdhmA57cdDIYYyHW+baY6exRSOwI1U2/ZQQsjU843Sl3j4WeKAPDsLTu+PT4GUH
         SiyGzIEV8eoSGhEfcI4Fxjt7jW/9Kfi8jPp4rFhFa7GCPmGp57qLQhOBJRn0ZC05p9Xv
         jSqQkTiKMcywFUXJ6bksJCaGM5t5OngUnzftKere42NdhMR++ulrqyvVtoMV0dnY22I/
         AC4A==
X-Gm-Message-State: AOAM533y+T9ey3HM4zum+HOpCpq19SjDCl80Y+UDsTlU+F2bt3vLuyim
        cJa75nd680k2ipAh32jbdmbLzJxOOHm8Cjk7NPHBTa+axDYdJpHSiUfcQOZ3iNJrc/7hki50Chv
        2saW+28JIztzlIeiPLTxFxg==
X-Received: by 2002:a05:6a00:14c2:b0:4f7:aa97:b5e with SMTP id w2-20020a056a0014c200b004f7aa970b5emr15093593pfu.36.1647339775603;
        Tue, 15 Mar 2022 03:22:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlgZBAANuQaigRsSRxv4DdK0Lzq7N0trNYqbFO7O9+WaQCS1rR26LE1oMF3KmJgCc+f7s88A==
X-Received: by 2002:a05:6a00:14c2:b0:4f7:aa97:b5e with SMTP id w2-20020a056a0014c200b004f7aa970b5emr15093565pfu.36.1647339775342;
        Tue, 15 Mar 2022 03:22:55 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.43])
        by smtp.gmail.com with ESMTPSA id o5-20020a056a00214500b004bd7036b50asm24014757pfk.172.2022.03.15.03.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 03:22:55 -0700 (PDT)
Date:   Tue, 15 Mar 2022 18:22:46 +0800
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
Subject: Re: [PATCH v2 10/26] KVM: x86/mmu: Use common code to free
 kvm_mmu_page structs
Message-ID: <YjBo9iuSBm1hbqXz@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-11-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311002528.2230172-11-dmatlack@google.com>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 11, 2022 at 12:25:12AM +0000, David Matlack wrote:
>  static void tdp_mmu_free_sp(struct kvm_mmu_page *sp)
>  {
> -	free_page((unsigned long)sp->spt);
> -	kmem_cache_free(mmu_page_header_cache, sp);
> +	kvm_mmu_free_shadow_page(sp);
>  }

Perhaps tdp_mmu_free_sp() can be dropped altogether with this?

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

