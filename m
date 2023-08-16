Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0F377D5FA
	for <lists+linux-mips@lfdr.de>; Wed, 16 Aug 2023 00:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240201AbjHOWaU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Aug 2023 18:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240276AbjHOWaN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Aug 2023 18:30:13 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115791FEE
        for <linux-mips@vger.kernel.org>; Tue, 15 Aug 2023 15:30:11 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d65201b777dso10327430276.0
        for <linux-mips@vger.kernel.org>; Tue, 15 Aug 2023 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692138610; x=1692743410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1sZ2KVcNcsekfiyOLDchFCWiNwVhcB+6K151wSFXsRU=;
        b=Sdk8hg1CZo0UZyPRUXVdkK75UBWBJbL5ssV4qfSNcJ0yLv5eoBjQS4ikTylrgvjRg5
         fAMh6d0O8KCRFHTNCYjLyKwda9Worh9IOHwLdjyjr43jpwYw1T/I0j2MIMowNRlDO5I8
         seJUbGeGRi1534R52LzEYYDDd5ijl0Ycakp7SKP7ACJxBKwO5q+1sd6EI3OyWGK24CgX
         jnL6doBdY30gIbx8RPMUELSJ79bpzsOBy12TJfrWjd52P0gtLnjQyB6B7osJCqozOqtW
         mlUSNNG5Lq0KPPvS7OkMRg41GasfSw3x8Ne19ql/oMstCF4KKqyTw1HO8U30XcK6asyE
         9NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692138610; x=1692743410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1sZ2KVcNcsekfiyOLDchFCWiNwVhcB+6K151wSFXsRU=;
        b=Kk6tz0xDzevZNV22zK5TBTlr+53qTyXGMG8/DpfIc2yzhsw7dclKSNKx0X7jsalEaG
         ZNqP2deXJs8ns+OE0dFrwbJbe7azgDEYBQ9qlvsrgWbpVoBEFi7I/tQ2yq8lZTTDV38t
         7mPY0gTHimfjuAQUT/w0j0+QXoXsVKXHQBS72ow6BYxxL9+3pAlx+xbX6tkRwonZb7XS
         fiuuQ80kRpd+rsI6cKUrhZUmC9NXY+87P57aes6hV8tb1CdKHibXFWbe89jT09tGD0lP
         t+P9OiNrEwD6cE/RR4Q3Um8Ih+ZD8j120XXqLR36FKP/CGfJQ5ZyPKRUp8heXdWSoiPa
         cV2A==
X-Gm-Message-State: AOJu0Yz+EbQYRGpjbVwBC7en9tF40LbpeCe0H2rTSRN6hvMTjQDm7uys
        OSyO1vTe/PScLHjShk7/Hc6GfL+znTw=
X-Google-Smtp-Source: AGHT+IG84S1z3EOk6278E7swEnxMzcYiiiMN3uMBAf/Zzr7Ij9WLl4fIHdZlEc+ZYkT7nZQXafm39o4AAu0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:24cc:0:b0:d10:a33d:36b6 with SMTP id
 k195-20020a2524cc000000b00d10a33d36b6mr55769ybk.0.1692138610358; Tue, 15 Aug
 2023 15:30:10 -0700 (PDT)
Date:   Tue, 15 Aug 2023 15:30:08 -0700
In-Reply-To: <20230811045127.3308641-6-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com> <20230811045127.3308641-6-rananta@google.com>
Message-ID: <ZNv8cCzI9fMWkGWT@google.com>
Subject: Re: [PATCH v9 05/14] KVM: Allow range-based TLB invalidation from
 common code
From:   Sean Christopherson <seanjc@google.com>
To:     Raghavendra Rao Ananta <rananta@google.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Reiji Watanabe <reijiw@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        Fuad Tabba <tabba@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>,
        Shaoqin Huang <shahuang@redhat.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 11, 2023, Raghavendra Rao Ananta wrote:
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index ec169f5c7dce2..00f7bda9202f2 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -278,16 +278,14 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
>  	return kvm_x86_ops.flush_remote_tlbs_range;
>  }
>  
> -void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
> -				 gfn_t nr_pages)
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
>  {
>  	int ret = -EOPNOTSUPP;
>  
>  	if (kvm_x86_ops.flush_remote_tlbs_range)
> -		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
> -								   nr_pages);
> -	if (ret)
> -		kvm_flush_remote_tlbs(kvm);
> +		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);
> +
> +	return ret;

Please write this as

	if (kvm_x86_ops.flush_remote_tlbs_range)
		return static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);

	return -EOPNOTSUPP;

or alternatively

	if (!kvm_x86_ops.flush_remote_tlbs_range)
		return -EOPNOTSUPP;

	return static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);

Hmm, I'll throw my official vote for the second version.

The local "ret" is unnecessary and is suprisingly dangerous.  I screwed up the
conflict resolution when cherry-picking my CONFIG_HYPERV change to see what the
conflict looked like and ended up with a double flush:

	int ret = -EOPNOTSUPP;

	if (kvm_x86_ops.flush_remote_tlbs_range)
		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);

	if (ret)
		kvm_flush_remote_tlbs(kvm);

	return ret;

Dropping "ret" makes it much harder to get trigger happy when resolving conflicts.

No need for a new version to fix the above, assuming Marc/Oliver is ok doing
fixup when applying.

Nit aside, looks good for x86, and I know of no conflicts, so take 'er away!

Acked-by: Sean Christopherson <seanjc@google.com>
