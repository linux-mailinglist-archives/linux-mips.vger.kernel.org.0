Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2617054FBBB
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jun 2022 18:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382790AbiFQQ4S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jun 2022 12:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382080AbiFQQ4S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jun 2022 12:56:18 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1427195A9
        for <linux-mips@vger.kernel.org>; Fri, 17 Jun 2022 09:56:16 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id i64so4648239pfc.8
        for <linux-mips@vger.kernel.org>; Fri, 17 Jun 2022 09:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EArAgQNHoiHIS8I/ZApL03IuPB6zV8pnr3Tul9Qb4MA=;
        b=b05d1gKW6mYhXbruL2fyLtjmEA1GqVi1lTwTxPVkPVLuTfSdqq5m9T6gsUerOispOz
         GncQw5oSnE33n7yZ9QdMGjb2zBcmU5qp4sqQGYqEyrArd+dm12PIp9tNBw+pY11Bpsho
         VRmYa4FU94LtWTzGBUd/U1q4SvyhZ4VWiiGsORsiaolgKg34GXKRfBNZjiHHFnVq+zBr
         L3v4eiOGcP5LMru62F+f9fycIx+VXfh9t3Rp2HTfrLLgH8WmDRzgqspCo0KZMRTHS1h3
         QxZOOOz58CWG8UNyOazZDWZOUViiQPoOF7HnyBzDtgvtWAIeo8EufclXiIelAwlueBNS
         17fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EArAgQNHoiHIS8I/ZApL03IuPB6zV8pnr3Tul9Qb4MA=;
        b=Em51kCfEO+y0KZ7P6sw7SdFBoxm+CqRRUtB55PFlZZPP+U7BbS6uMQDef6moWwhWhF
         P5XFCv6AfMhbjoyoN264tqfUqRRdqtNXPVcwE6WgPS504LY8YTeQaVgnXhNoYUuQ/c9B
         m/mAJFgF1c5lGgg8e8WMjEzyLjTU95VEqquTKK/d4Zo0at0Yosu6BEnROudOYcDPfRTe
         5alV2zC2jY7S7hPpc54sWSvCOqJVyvZVr9JOhanBuig50zFsYizWAR/i91BlYnZyv6Ie
         T2QlP3DVxCg6kzbbZWwUNuWTTjW/HWyudRzgSjOC/oRRMgZhi32VMM3GeDyGIhPcS7IM
         hPpw==
X-Gm-Message-State: AJIora9waRRNYwawqsYZRWciNF6XANSkMPLm7yUFBwQmuM/EAhfXX13O
        TrxDtURuxtQ+5NnuVjnt7KDTmg==
X-Google-Smtp-Source: AGRyM1szxMq8pcE45URHtBmbN5333qjIc6FM+zGUcOUachog0Av+tjeuGo1MIwJ5XrnGY8xO/l76lg==
X-Received: by 2002:a63:89c1:0:b0:3fc:6001:e871 with SMTP id v184-20020a6389c1000000b003fc6001e871mr10020666pgd.14.1655484975342;
        Fri, 17 Jun 2022 09:56:15 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a8c8e00b001eab4b8383csm5776963pjo.5.2022.06.17.09.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 09:56:14 -0700 (PDT)
Date:   Fri, 17 Jun 2022 16:56:11 +0000
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
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH v6 18/22] KVM: x86/mmu: Extend
 make_huge_page_split_spte() for the shadow MMU
Message-ID: <YqyyK5C1PaByJur2@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-19-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516232138.1783324-19-dmatlack@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 16, 2022, David Matlack wrote:
> Currently make_huge_page_split_spte() assumes execute permissions can be
> granted to any 4K SPTE when splitting huge pages. This is true for the
> TDP MMU but is not necessarily true for the shadow MMU, since KVM may be
> shadowing a non-executable huge page.
> 
> To fix this, pass in the role of the child shadow page where the huge
> page will be split and derive the execution permission from that.  This
> is correct because huge pages are always split with direct shadow page
> and thus the shadow page role contains the correct access permissions.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
