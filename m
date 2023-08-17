Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFF777F24D
	for <lists+linux-mips@lfdr.de>; Thu, 17 Aug 2023 10:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348971AbjHQIkD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Aug 2023 04:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348918AbjHQIjj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Aug 2023 04:39:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2236210EC;
        Thu, 17 Aug 2023 01:39:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A6F56634BD;
        Thu, 17 Aug 2023 08:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03339C433C8;
        Thu, 17 Aug 2023 08:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692261577;
        bh=gMp6O7RtrZswN4fQDVTuF4+KfrQJM+cudroXxhAsVfs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZgoJR7uYCUZlDATqxGYVSz+0U1lPgeLMrIlBdxGBWDF1/i35EtI8booG6hSrz+ykh
         YmbA4whrCn8muyr0h6HW+jwWE3g4GSRi+YWbfXznaw2pHKrqcYrUi7dy/1vUOUljIe
         NXaJmLBvdRpsIy6GYcHuZgUmV50vh76LEapsSfkHdLzfAZbbJJOhIGMbsksQuMQVLA
         1eikKjIJeteWDD1tS/88xT1H/klaBjuQvK34eZq66GTjWFp6Zz7VWBtw+Pdi8czJNg
         EGVZQenILaUDBVgiaRwgthKKI3Bt/mF39TYq1qS2O9yupSu5TNtpxknKcO76xYpz3h
         TJYcs43ZT4E6A==
Received: from 82-132-234-11.dab.02.net ([82.132.234.11] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1qWYXW-005coN-B9;
        Thu, 17 Aug 2023 09:39:34 +0100
Date:   Thu, 17 Aug 2023 09:39:31 +0100
Message-ID: <87a5uqoyf0.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Raghavendra Rao Ananta <rananta@google.com>,
        Oliver Upton <oliver.upton@linux.dev>,
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
Subject: Re: [PATCH v9 05/14] KVM: Allow range-based TLB invalidation from common code
In-Reply-To: <ZNv8cCzI9fMWkGWT@google.com>
References: <20230811045127.3308641-1-rananta@google.com>
        <20230811045127.3308641-6-rananta@google.com>
        <ZNv8cCzI9fMWkGWT@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 82.132.234.11
X-SA-Exim-Rcpt-To: seanjc@google.com, rananta@google.com, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, pbonzini@redhat.com, chenhuacai@kernel.org, yuzenghui@huawei.com, anup@brainfault.org, atishp@atishpatra.org, jingzhangos@google.com, reijiw@google.com, coltonlewis@google.com, dmatlack@google.com, tabba@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, gshan@redhat.com, shahuang@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 15 Aug 2023 23:30:08 +0100,
Sean Christopherson <seanjc@google.com> wrote:
> 
> On Fri, Aug 11, 2023, Raghavendra Rao Ananta wrote:
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index ec169f5c7dce2..00f7bda9202f2 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -278,16 +278,14 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
> >  	return kvm_x86_ops.flush_remote_tlbs_range;
> >  }
> >  
> > -void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
> > -				 gfn_t nr_pages)
> > +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
> >  {
> >  	int ret = -EOPNOTSUPP;
> >  
> >  	if (kvm_x86_ops.flush_remote_tlbs_range)
> > -		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
> > -								   nr_pages);
> > -	if (ret)
> > -		kvm_flush_remote_tlbs(kvm);
> > +		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);
> > +
> > +	return ret;
> 
> Please write this as
> 
> 	if (kvm_x86_ops.flush_remote_tlbs_range)
> 		return static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);
> 
> 	return -EOPNOTSUPP;
> 
> or alternatively
> 
> 	if (!kvm_x86_ops.flush_remote_tlbs_range)
> 		return -EOPNOTSUPP;
> 
> 	return static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);
> 
> Hmm, I'll throw my official vote for the second version.

I've applied the second version locally.

	M.

-- 
Without deviation from the norm, progress is not possible.
