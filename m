Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011DB759C70
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jul 2023 19:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjGSRfJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Jul 2023 13:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjGSRfI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Jul 2023 13:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CD91735
        for <linux-mips@vger.kernel.org>; Wed, 19 Jul 2023 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689788068;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FcSmUlnfPR5r9QDVWlDed1kmwKvJ4NFeMyH/cuBuG7c=;
        b=Cvh+tragkf+T0rHRmvwpvoEMk9zEO8CgA4qftNJW85sfIdE39bzgvFDQSK4mZ/I4ehg103
        kQxFnVQau3YdpDyzNPqMiVVCyoBj7IwXQRUaMOEL/TQQ1l4wjAGXFe6XwW8Zwhovi6e2do
        es0X1RSM+OPpa0IYFwUW50dcFLTOkPw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-MyMbmWOvMU-guQWjMPvByQ-1; Wed, 19 Jul 2023 13:34:26 -0400
X-MC-Unique: MyMbmWOvMU-guQWjMPvByQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-978a991c3f5so421417566b.0
        for <linux-mips@vger.kernel.org>; Wed, 19 Jul 2023 10:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689788065; x=1692380065;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcSmUlnfPR5r9QDVWlDed1kmwKvJ4NFeMyH/cuBuG7c=;
        b=IKgYTNsQuwrUpeAvtLnFxxzOT6iwlHsO/Q6gms62pgvAQ2DQA9WZQX1XvX4htwAaEh
         rMshgZciAa4fcfxq8o3bVZuFlAC+MmCrD6vmaruIn8CQwAQG63rm5rXY2LW3lThWc5Sg
         DxJ53HdPHv/q2+JQOYvQwKnecaDxVrIES/Q/Cd31bxCCaSBm6ImAiFSdRVjouCaBm3t4
         PtyQpHDiQEDrf/pWi4d8IN7YcsqquI0m4arbbroFVMqfbwjeVp8IFgq7wSp1bmWhD3E3
         IK8Zt3kC0iCZDxYteYUgSQ1SAF0V94vNM/tB5a+phCgY7KFLmdXryt/8P8Pr1lN7CKiP
         eiGA==
X-Gm-Message-State: ABy/qLaNosr0ZyqOBytQAB/oUwzdGUvCU3v/6fTWhGgaiw6IG//Fgh04
        O7kANw+D8LWZWzCrZ6wRnWttDqZs46L3eKIN2vh0cgAeggzoSeinlpSN6Takc49w4AmXkCjHnUE
        EQOUu9YJk8TsC1goh0y0Tyg==
X-Received: by 2002:a17:906:2c9:b0:987:6372:c31f with SMTP id 9-20020a17090602c900b009876372c31fmr2869620ejk.37.1689788065623;
        Wed, 19 Jul 2023 10:34:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE859wKxHT5sx+ykGb2dhB/IoiUODuwlK2Yw9t+Sd2xKiIGoiM0e7JvZWSr4FhhJlM9v/AU5Q==
X-Received: by 2002:a17:906:2c9:b0:987:6372:c31f with SMTP id 9-20020a17090602c900b009876372c31fmr2869597ejk.37.1689788065328;
        Wed, 19 Jul 2023 10:34:25 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id gz18-20020a170906f2d200b00991faf3810esm2633958ejb.146.2023.07.19.10.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 10:34:24 -0700 (PDT)
Message-ID: <cd866d4c-839a-8606-2931-063cca4df514@redhat.com>
Date:   Wed, 19 Jul 2023 19:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Alexander Graf <graf@amazon.de>,
        Nicholas Piggin <npiggin@gmail.com>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-5-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v11 04/29] KVM: PPC: Drop dead code related to
 KVM_ARCH_WANT_MMU_NOTIFIER
In-Reply-To: <20230718234512.1690985-5-seanjc@google.com>
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

On 7/19/23 01:44, Sean Christopherson wrote:
> Signed-off-by: Sean Christopherson<seanjc@google.com>
> ---
>   arch/powerpc/kvm/powerpc.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 7197c8256668..5cf9e5e3112a 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -634,10 +634,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_SYNC_MMU:
>   #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>   		r = hv_enabled;

This could actually be unnecessarily conservative.  Even book3s_pr.c 
knows how to do unmap and set_spte, so it should be able to support 
KVM_CAP_SYNC_MMU.  Alex, Nick, do you remember any of this?  This would 
mean moving KVM_CAP_SYNC_MMU to virt/kvm/kvm_main.c, which is nice.

Paolo

> -#elif defined(KVM_ARCH_WANT_MMU_NOTIFIER)
> -		r = 1;
>   #else
> -		r = 0;
> +#ifndef KVM_ARCH_WANT_MMU_NOTIFIER
> +		BUILD_BUG();
> +#endif
> +		r = 1;
>   #endif
>   		break;
>   #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE

