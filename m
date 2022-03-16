Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDDC4DACD3
	for <lists+linux-mips@lfdr.de>; Wed, 16 Mar 2022 09:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350601AbiCPIu5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Mar 2022 04:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235424AbiCPIu4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Mar 2022 04:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 359B964BEB
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 01:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647420582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4icPmxzgJzoNfLGIPEaiu3EGs4DB/AfIqWIUwU4iOPM=;
        b=Sq4CeFH7dboTS4xLn78pzUBEGzIOPN7eQAF81MQ5LviDsPcFmG/ejGVF9cZ/uDH3ST7Ict
        rGgpG8prBmhxHN3wM8G18QeWeWhWqkYREaXTgIGMYPiC0Y7rhh+eEf6JjtE6k3+jNdF9nD
        un5b85Lym7KK/+6Ri2nIShXu7Kt9pMM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-zuifonzFPcudVKQmnJctfQ-1; Wed, 16 Mar 2022 04:49:41 -0400
X-MC-Unique: zuifonzFPcudVKQmnJctfQ-1
Received: by mail-pj1-f69.google.com with SMTP id c7-20020a17090a674700b001beef0afd32so1329274pjm.2
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 01:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4icPmxzgJzoNfLGIPEaiu3EGs4DB/AfIqWIUwU4iOPM=;
        b=D8J7BgdCCxRwCjZTW/Lv953LfTw7uXodLOqZ11W+xD1P7bD9WIz4KXTqAKCYJopnm0
         9lf268CSgc3rdGNdvJwKd5qnvScLtEUYRyiKediNiK1nQrMk4OwA9NPuu+xzUAi2Aqo8
         e1rVpc4T/awS3B3N0KCj5bpI4y8UGRrO4XZI2N/JOfkYShC2D1SmG+Z6qPDiPkMe6kJK
         DeC0TihEkaKGusqpwqEDxBBpvqAWLoW6Bkts8XmgeqOnyRL3EYcWwh0DVhJOnus0KNpv
         rg8J64LG3eggeJqBKZwSvmwG8t+/1UKkcHe0H+rxubuzZjP6Ge3dou5KcYv5+OXGMO+g
         DFgA==
X-Gm-Message-State: AOAM5309pPMNOkZoTtn0BfpMNrlA8ewVdvP5/e8BUPVdp90byBEUS9xQ
        NW7RxmuyFrwpFHLKz6ruxDD5Q2YXHGxAxUkFIksCH3XiNuC2yPmmwSaIsNTRimAfEZuXRc7iIe/
        q/y+42xOmIIquONxmRYMihw==
X-Received: by 2002:a17:90a:6903:b0:1c6:492:7cad with SMTP id r3-20020a17090a690300b001c604927cadmr8971470pjj.241.1647420579959;
        Wed, 16 Mar 2022 01:49:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfu8xjnOwLJ2DUAYIdjwL8+oeBFXOUhILAgGJ8izXd1dK+cnJhjNgDsFw8fcJAqon+h3ZuZQ==
X-Received: by 2002:a17:90a:6903:b0:1c6:492:7cad with SMTP id r3-20020a17090a690300b001c604927cadmr8971439pjj.241.1647420579692;
        Wed, 16 Mar 2022 01:49:39 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.128])
        by smtp.gmail.com with ESMTPSA id ca9-20020a17090af30900b001c658fd7b47sm1716181pjb.36.2022.03.16.01.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 01:49:39 -0700 (PDT)
Date:   Wed, 16 Mar 2022 16:49:31 +0800
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
Subject: Re: [PATCH v2 18/26] KVM: x86/mmu: Zap collapsible SPTEs at all
 levels in the shadow MMU
Message-ID: <YjGkmwBIwe64TjqA@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-19-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311002528.2230172-19-dmatlack@google.com>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 11, 2022 at 12:25:20AM +0000, David Matlack wrote:
> Currently KVM only zaps collapsible 4KiB SPTEs in the shadow MMU (i.e.
> in the rmap). This is fine for now KVM never creates intermediate huge
> pages during dirty logging, i.e. a 1GiB page is never partially split to
> a 2MiB page.
> 
> However, this will stop being true once the shadow MMU participates in
> eager page splitting, which can in fact leave behind partially split
> huge pages. In preparation for that change, change the shadow MMU to
> iterate over all necessary levels when zapping collapsible SPTEs.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 89a7a8d7a632..2032be3edd71 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -6142,18 +6142,30 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
>  	return need_tlb_flush;
>  }
>  
> +static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
> +					   const struct kvm_memory_slot *slot)
> +{
> +	bool flush;
> +
> +	/*
> +	 * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1 since there's no need to zap
> +	 * pages that are already mapped at the maximum possible level.
> +	 */
> +	flush = slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
> +				  PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1,
> +				  true);
> +
> +	if (flush)
> +		kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
> +
> +}

Reviewed-by: Peter Xu <peterx@redhat.com>

IMHO it looks cleaner to write it in the old way (drop the flush var).
Maybe even unwrap the helper?

Thanks,

-- 
Peter Xu

