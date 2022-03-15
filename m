Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86CAB4D98B4
	for <lists+linux-mips@lfdr.de>; Tue, 15 Mar 2022 11:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239455AbiCOK2g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Mar 2022 06:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234042AbiCOK2g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Mar 2022 06:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 689C146154
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647340043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DiRHDgSxXyEgzQ/1H6WEmoIcoAybwpIARKWXa7C6zmE=;
        b=fNjokV+U6b6n3aOktTDO8v2FbMJVtNJzrF9EQuIcrZdCI0Herjg/f3C1UQL9mQKaMGnjPj
        ny93Xc0IlFfIOYCcP0GeCILY+oKzdojYPW4DpxEeGDrX/UPOa+V9+4ipY7NZYAr+k5AoJv
        V96yE+c0ixZK65UusCNmMglcafnMINM=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-jseuMRnBO2GJ-bRUadQKvw-1; Tue, 15 Mar 2022 06:27:22 -0400
X-MC-Unique: jseuMRnBO2GJ-bRUadQKvw-1
Received: by mail-pf1-f198.google.com with SMTP id x123-20020a626381000000b004f6fc50208eso11592081pfb.11
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 03:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DiRHDgSxXyEgzQ/1H6WEmoIcoAybwpIARKWXa7C6zmE=;
        b=QZMQBujFId5I4C2oOA6wPWjoivD36eOCZCAJMAAG95VL5If5eCdZ/rZY22Iwxjyvep
         Ys3prsNrIMEOvR3/FQrvE0TBESV+oX29I477J+6dHkpgX0i9nYeoQegSvpFt+9yJ8oiy
         /4NHjoVA32fnMfYMenV2w5GXQK9cr8k7H/lDVqRros+iPMnnOt4fRDGgSyUWv/g8j8XH
         O7I6yFlooe0bXOpwfzWewCUDI2ah0ecFa+MAgmiA2+jgEBfZKzOUWw3YT0UTZ2HkYj9s
         a4J3y98+JMr4T1YtpybG3YF0vfcgVBFLkbmTAGJdY8/ECmBkxdvWhG4B2WGoYqbR9SIO
         HX/g==
X-Gm-Message-State: AOAM531jZQSjDXqNHLpk0dG6UTDd8bMTjr4TNW0fz21H5LWMZ7ZAYjeP
        kLiqZwLSDFVB9w7jMUF2DGVc/SYtIsUc5JIp+j4J+cqP4RIbeZGrpF+S+pa/zlSqOWvYwsIyLLU
        Ehxd4Q0nVYBjoQhZ6KSs4kw==
X-Received: by 2002:a17:90a:dd45:b0:1bc:9466:9b64 with SMTP id u5-20020a17090add4500b001bc94669b64mr3777682pjv.23.1647340041323;
        Tue, 15 Mar 2022 03:27:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzh2WwWxCZLGIqwAfZcs1dEgUiakwT/1eroDl5Gkt3WkAGN7vYYYLwox9cKA4UNqkAcC0R1w==
X-Received: by 2002:a17:90a:dd45:b0:1bc:9466:9b64 with SMTP id u5-20020a17090add4500b001bc94669b64mr3777656pjv.23.1647340041068;
        Tue, 15 Mar 2022 03:27:21 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.43])
        by smtp.gmail.com with ESMTPSA id j13-20020a056a00130d00b004f1025a4361sm25697622pfu.202.2022.03.15.03.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 03:27:20 -0700 (PDT)
Date:   Tue, 15 Mar 2022 18:27:12 +0800
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
Subject: Re: [PATCH v2 11/26] KVM: x86/mmu: Use common code to allocate
 kvm_mmu_page structs from vCPU caches
Message-ID: <YjBqAL+bPmcQpTgM@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-12-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311002528.2230172-12-dmatlack@google.com>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 11, 2022 at 12:25:13AM +0000, David Matlack wrote:
>  static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
>  {
> -	struct kvm_mmu_page *sp;
> -
> -	sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
> -	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
> -	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
> -
> -	return sp;
> +	return kvm_mmu_alloc_shadow_page(vcpu, true);
>  }

Similarly I had a feeling we could drop tdp_mmu_alloc_sp() too.. anyway:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

