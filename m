Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F0775EED6
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jul 2023 11:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjGXJOv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jul 2023 05:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232197AbjGXJOn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jul 2023 05:14:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7901AA
        for <linux-mips@vger.kernel.org>; Mon, 24 Jul 2023 02:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690190034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2oPDYvwpZtu0Ko50jtkdQDGuMOTIWCRCGf2FetUqVmk=;
        b=VGJkn90QFxetVFTML/KZga4fs3BGD1RZk9y1LAfU7qjzF+26SqRuXPJ6ZtU1Z9K4zZuGDf
        ud7iwTVHepqxYqkG2vaui1JdH2NRhow0HcjpszzUbz6H1j8V7GY0A5JiQzJCLIjMeyoW+Q
        jyFHViDNfJ6FTWCt+BqOjbAJq5sQ1Tg=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-j-mhWjWTOxy_8eEyU5vzFw-1; Mon, 24 Jul 2023 05:13:52 -0400
X-MC-Unique: j-mhWjWTOxy_8eEyU5vzFw-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-19fa053d958so860880fac.1
        for <linux-mips@vger.kernel.org>; Mon, 24 Jul 2023 02:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690190032; x=1690794832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oPDYvwpZtu0Ko50jtkdQDGuMOTIWCRCGf2FetUqVmk=;
        b=R7sSksfFgZ66uhWZHU4tbU/j2NHyXgA42fn0CC0EHTbdQl4Ge+lGZVuuHlXMAKBXVI
         +tf1GhLzpSey1l/FM3EB24fk0i+/HcZGzCQ1CbrxyKgxOwfTzE8Sidr/aetY9TMmk3EE
         +3Zxk9gCKgpzk5WUjbdyQtWi48XpQ1upXPXQbqlSC2VAnM9IFZmtM7rcWoUhyYcv4oO2
         lm4eGtKugE9tnl+khCHQcPuxfzMJVgMYZIpLxxsK0S5fAxuyxytFapENbHQ0ddRd9eul
         g3wdDspHr4y/VgzZlEf7QFfvbS9cpY3+6dWocCn+U3j7sMeIiNUlRv0f0VEk7olXNbor
         9n1w==
X-Gm-Message-State: ABy/qLbOBK2D3c3SbxZrtDXDt410u5lm9CORjeC03UVlhecQJ9LB10tP
        Y3UwvQg/FSoZDE8d36I0osfJXqUxdC9NiFIXVilTwxgpysO2X7OXPOQ0mPLJHpbVZr1KXWqkrtk
        RfqXJi20NGFigh+iYlxYhdw==
X-Received: by 2002:a05:6870:568e:b0:1b7:613c:2e30 with SMTP id p14-20020a056870568e00b001b7613c2e30mr7564460oao.2.1690190032057;
        Mon, 24 Jul 2023 02:13:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGz31tvB+wfj4JC9JljpAdnVVugjKH/UFomLvpFW9yVXyN8NXs0fQCdMnGqdTxGWM2Ywaca6g==
X-Received: by 2002:a05:6870:568e:b0:1b7:613c:2e30 with SMTP id p14-20020a056870568e00b001b7613c2e30mr7564429oao.2.1690190031838;
        Mon, 24 Jul 2023 02:13:51 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id w6-20020a63af06000000b0050f85ef50d1sm7977675pge.26.2023.07.24.02.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:13:51 -0700 (PDT)
Message-ID: <c28915ad-d10c-a5f4-9b95-4ab644139780@redhat.com>
Date:   Mon, 24 Jul 2023 17:13:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 03/12] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
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
        Reiji Watanabe <reijiw@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
References: <20230722022251.3446223-1-rananta@google.com>
 <20230722022251.3446223-4-rananta@google.com>
From:   Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230722022251.3446223-4-rananta@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 7/22/23 10:22, Raghavendra Rao Ananta wrote:
> kvm_arch_flush_remote_tlbs() or CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
> are two mechanisms to solve the same problem, allowing
> architecture-specific code to provide a non-IPI implementation of
> remote TLB flushing.
> 
> Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> all architectures on kvm_arch_flush_remote_tlbs() instead of
> maintaining two mechanisms.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   virt/kvm/Kconfig    | 3 ---
>   virt/kvm/kvm_main.c | 2 --
>   2 files changed, 5 deletions(-)
> 
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index b74916de5183..484d0873061c 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -62,9 +62,6 @@ config HAVE_KVM_CPU_RELAX_INTERCEPT
>   config KVM_VFIO
>          bool
>   
> -config HAVE_KVM_ARCH_TLB_FLUSH_ALL
> -       bool
> -
>   config HAVE_KVM_INVALID_WAKEUPS
>          bool
>   
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 70e5479797ac..d6b050786155 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -345,7 +345,6 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
>   }
>   EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
>   
> -#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
>   void kvm_flush_remote_tlbs(struct kvm *kvm)
>   {
>   	++kvm->stat.generic.remote_tlb_flush_requests;
> @@ -366,7 +365,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
>   		++kvm->stat.generic.remote_tlb_flush;
>   }
>   EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
> -#endif
>   
>   static void kvm_flush_shadow_all(struct kvm *kvm)
>   {

-- 
Shaoqin

