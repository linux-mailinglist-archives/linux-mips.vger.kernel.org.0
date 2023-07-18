Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C083757A4A
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jul 2023 13:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbjGRLSY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Jul 2023 07:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbjGRLST (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Jul 2023 07:18:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4943110EF
        for <linux-mips@vger.kernel.org>; Tue, 18 Jul 2023 04:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689679055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OtPAFim1cDpcp/PLXUaQwLiMk8Vxwyxo/NiSi3JW/f0=;
        b=TjVjCONXNajXgq5t1XpGWWJwqQE3zgXQjCg0K8E+SWHmIxEnOwq4QE6xQ9T6ov3dnKM26S
        pFKwtlZH559Cbh0V8UIaezc9Kxd+hXAuJ5ZTu1478VQg1xefgwE42jCOUzfeOHM8W5PPMq
        rhrvzYxbt/XtWrIZPffGjlRoEzuj9oE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-R_kOfkh_PzGzaf4K7MuIag-1; Tue, 18 Jul 2023 07:17:34 -0400
X-MC-Unique: R_kOfkh_PzGzaf4K7MuIag-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-543c2538071so769015a12.1
        for <linux-mips@vger.kernel.org>; Tue, 18 Jul 2023 04:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689679053; x=1692271053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OtPAFim1cDpcp/PLXUaQwLiMk8Vxwyxo/NiSi3JW/f0=;
        b=TmD8WMUjBmVC2X8FX7iDQ+IbE0wi3ytdNwuvMg3sQzcqQqdySSkJCGXcLbkFg3s1Rs
         QYSs21x0WrC/wc9gCj8g+iJaG36DT12eQRbFGH/B92Q1YUpJATzzje5KE82oMf6Cht6t
         ll/m0YTBoLIEO9vj1WUeTADGWxMglB/Wv3UvLIVxLfbfV8R90zHINwh7H8ZQ2s/PtoUS
         hMiQElNsrIAXzm4TzxjoQ+Qs0/QuKtRMJyK69uuZtiLg1ND1PtJVpicQw26K6hmkrkx3
         NXDDAJ5ET9K5nS4IjT+q0RlqKJyyy1v2T/2Y7n0wExl74pRVpQQNJONVuS0xVxkZGjti
         ASfQ==
X-Gm-Message-State: ABy/qLb25kkoBItwNnc5z1Y6gJhL844JTlYfqvPxdFpG0iIpta1ciVWN
        LaJQiBsreVmPNTINKh4u7CzOw7u8eJPBT5nm5qZRpUW1ngjYM1kTVd3MwEB6sj1QRUkK0uy1e2H
        u/z5gjrK3PmNJSQa5V15v+g==
X-Received: by 2002:a05:6a20:3d07:b0:133:89e:bf1a with SMTP id y7-20020a056a203d0700b00133089ebf1amr12988293pzi.4.1689679053261;
        Tue, 18 Jul 2023 04:17:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGlX4aGknKfPCjhtPs4zbhCwYUKXUWNkmQcI4lBrRW+0354cqKkBfpbN1eJEAJfM+P9UQWRbQ==
X-Received: by 2002:a05:6a20:3d07:b0:133:89e:bf1a with SMTP id y7-20020a056a203d0700b00133089ebf1amr12988260pzi.4.1689679052990;
        Tue, 18 Jul 2023 04:17:32 -0700 (PDT)
Received: from [10.72.112.40] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id k22-20020aa792d6000000b00682868714fdsm1369203pfa.95.2023.07.18.04.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:17:32 -0700 (PDT)
Message-ID: <a8a43069-ca4c-07e6-3b65-de749f295365@redhat.com>
Date:   Tue, 18 Jul 2023 19:17:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 10/11] KVM: arm64: Invalidate the table entries upon a
 range
Content-Language: en-US
To:     Raghavendra Rao Ananta <rananta@google.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>
References: <20230715005405.3689586-1-rananta@google.com>
 <20230715005405.3689586-11-rananta@google.com>
From:   Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230715005405.3689586-11-rananta@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 7/15/23 08:54, Raghavendra Rao Ananta wrote:
> Currently, during the operations such as a hugepage collapse,
> KVM would flush the entire VM's context using 'vmalls12e1is'
> TLBI operation. Specifically, if the VM is faulting on many
> hugepages (say after dirty-logging), it creates a performance
> penalty for the guest whose pages have already been faulted
> earlier as they would have to refill their TLBs again.
> 
> Instead, leverage kvm_tlb_flush_vmid_range() for table entries.
> If the system supports it, only the required range will be
> flushed. Else, it'll fallback to the previous mechanism.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/kvm/hyp/pgtable.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 5d14d5d5819a..5ef098af1736 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -806,7 +806,8 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
>   		 * evicted pte value (if any).
>   		 */
>   		if (kvm_pte_table(ctx->old, ctx->level))
> -			kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
> +			kvm_tlb_flush_vmid_range(mmu, ctx->addr,
> +						kvm_granule_size(ctx->level));
>   		else if (kvm_pte_valid(ctx->old))
>   			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu,
>   				     ctx->addr, ctx->level);

-- 
Shaoqin

