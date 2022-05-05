Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0F6651CBB9
	for <lists+linux-mips@lfdr.de>; Thu,  5 May 2022 23:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380512AbiEEWCi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 May 2022 18:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbiEEWCh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 May 2022 18:02:37 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98F55C748
        for <linux-mips@vger.kernel.org>; Thu,  5 May 2022 14:58:56 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id w17-20020a17090a529100b001db302efed6so5257540pjh.4
        for <linux-mips@vger.kernel.org>; Thu, 05 May 2022 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eAKJ/icQ2pJarmVikk6ugi8Bvpa8Rc3R9Y/ObEeqjH8=;
        b=M3ZzJgDT9ekyNJ96FH0MMSzeB14ns1BDlk016eZT1S0ep/cD4p1f1RTvih2cYmfuI6
         vFHrqU+9vIndYuNNK3AH4Dgm7kuFxZWZJkhyzMR4YOGjxZkYm1Z0EMXaLClIa8P7IVwL
         QtyC+BFeYTLUFomnyGMTCsLedrWhZCqZ/iU5JEbvABbUYTbxAczSe3AxtOSaTXAdovrL
         gXSYBjiw/rhbl7qw1z1JlCdnFZNzo1cOnflppFA0mTKn0HVdVUWqg4ori73GbSGNuRUY
         Q0QxlbRs+rt1HWOWCDy8/jExhZUX/p+D3mWU5Dz1V6JSaLpCcsd9QEMbSyHxxECeDk4v
         uA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eAKJ/icQ2pJarmVikk6ugi8Bvpa8Rc3R9Y/ObEeqjH8=;
        b=O7PviHSwVAfZmZYbpWP/kdfni7MhSZbV5OKcSAWhwIlP/jPeCbA9039Hz975OP7x7+
         nBJ6DYevE0+8BQQwhIK3oq5s/LH7anS8fbFpcZJnJrVLFZH6ftMpMlxPJAZqcQJ2jldy
         6gYtGKYlC6BslW25OzxP03YK3dmZflHl7TMmgOqkABwGxwrm3wvy9r7/HcsmItRjYjwK
         MEG5Uvih/glyfvbbQuoAZ4mqpLwC9SShzbt6IbUw/FzLN78cfkYsfuRsWhF05YF+0BVo
         Kyh5Z8UHQ5s1opEvswuAnKEN5Y2fwZQVKAnZVWUIIugW5FVGFINb4ef7414biUXFILkO
         iJxQ==
X-Gm-Message-State: AOAM533AS0UP5+TcWB2BveEiiefOnrUW1Azrgxufv3oIiED92s3zPYDR
        lWdmfMw/FRkhxETlJBke/C5ioA==
X-Google-Smtp-Source: ABdhPJy4viwkpqIW9TUUZ8Fu3CuE6qIgT5lnM973mXUD1A/F1HkwRsjvVk5v2hTKHhjIcHpWlHRYYQ==
X-Received: by 2002:a17:902:cf05:b0:156:8445:ce0f with SMTP id i5-20020a170902cf0500b001568445ce0fmr178549plg.99.1651787936011;
        Thu, 05 May 2022 14:58:56 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902900300b0015e8d4eb1e7sm128177plp.49.2022.05.05.14.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 14:58:55 -0700 (PDT)
Date:   Thu, 5 May 2022 21:58:52 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     David Matlack <dmatlack@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>
Subject: Re: [PATCH v4 04/20] KVM: x86/mmu: Decompose kvm_mmu_get_page() into
 separate functions
Message-ID: <YnRInPVAd7BEBpk6@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-5-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422210546.458943-5-dmatlack@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 22, 2022, David Matlack wrote:
> Decompose kvm_mmu_get_page() into separate helper functions to increase
> readability and prepare for allocating shadow pages without a vcpu
> pointer.
> 
> Specifically, pull the guts of kvm_mmu_get_page() into 2 helper
> functions:
> 
> kvm_mmu_find_shadow_page() -
>   Walks the page hash checking for any existing mmu pages that match the
>   given gfn and role.
> 
> kvm_mmu_alloc_shadow_page()
>   Allocates and initializes an entirely new kvm_mmu_page. This currently
>   requries a vcpu pointer for allocation and looking up the memslot but
>   that will be removed in a future commit.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Nice!

Reviewed-by: Sean Christopherson <seanjc@google.com>
