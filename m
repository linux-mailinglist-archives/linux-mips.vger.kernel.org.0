Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3F877785F1
	for <lists+linux-mips@lfdr.de>; Fri, 11 Aug 2023 05:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbjHKDTW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Aug 2023 23:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbjHKDTV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Aug 2023 23:19:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCA12703
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 20:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691723913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PiI+QsxMTBs9vA9vlC+ZyswANJfDDGFtsPp4BYCBVbg=;
        b=StEEFzzG3862GLAF7SiQthLuoO7p7Aio1jiXwNF1oFey2icr81eEA4461RMWpaLYR2sFRY
        tByJwjf7OxT1nzkSe4gdQ24NL4U3mOPHV6vu7uHPhVogz94p99jPp1sqmE/OHLX0B+zcfu
        RHVa9uWgE3J63dhpcEQE8jeFwVSTEhI=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-UXGexXwjPZ2nvZEVuHdjAQ-1; Thu, 10 Aug 2023 23:18:31 -0400
X-MC-Unique: UXGexXwjPZ2nvZEVuHdjAQ-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-563de65ac5dso306030a12.1
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 20:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691723910; x=1692328710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiI+QsxMTBs9vA9vlC+ZyswANJfDDGFtsPp4BYCBVbg=;
        b=OJX46u03T47BeE9S6LHiV8p1nbEkFl9uuVmdNnrkrBiJD3QoMF9ktZ/WxeZi2ku/Ip
         eEFNyfqSAeQwwdJqQ09KKRvikKiRm5MQjyHyhKo84RooJrRZswj+Ts052KaHeu52QuY6
         44BsN38Yj+25wRbymsjOOaO9QvPGi2zr3+schvaPawMY74RWhLs3OlMd0qJ9ppUrhhyS
         NvDmJi46qGOZLf1T6ufkqxt9D08XwZX3SVuEc0mtN/iOM3dw1aWIVp/hYJ8SI9kjCwAr
         l6/LyL6mryldJWtMYGWeYSg7B98WtoPdIfBE0xkqhkjunj4Hi1EyRV9XLXnF6WhyXnxS
         5JSg==
X-Gm-Message-State: AOJu0Yzb49A6liT1dsNeejTj/O4dsrdi8ymVs55DgU/wA/ULfW+NfOeC
        LISa6qjhQw1iyppJQahP+c/5D44Vmyit5PSi+w14o5ACxz47YgbIKkBz24//a/jBCydy6NEZ+lG
        POa3HTZW56WIo8TL00ZpbsA==
X-Received: by 2002:a17:903:11c8:b0:1b8:17e8:547e with SMTP id q8-20020a17090311c800b001b817e8547emr828125plh.1.1691723910731;
        Thu, 10 Aug 2023 20:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHID5R08qiLj5A7MSG7B2ILJx/BX/BiDQni1fswd5I7LC3NtLSpgFqmDqjcNklr7RUUka6Afw==
X-Received: by 2002:a17:903:11c8:b0:1b8:17e8:547e with SMTP id q8-20020a17090311c800b001b817e8547emr828095plh.1.1691723910468;
        Thu, 10 Aug 2023 20:18:30 -0700 (PDT)
Received: from [10.72.112.92] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id q22-20020a170902b11600b001bb24cb9a40sm2547142plr.39.2023.08.10.20.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 20:18:30 -0700 (PDT)
Message-ID: <60d1a498-2815-2465-ccc9-e4464791a3fb@redhat.com>
Date:   Fri, 11 Aug 2023 11:18:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs()
 globally
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
        Fuad Tabba <tabba@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
References: <20230808231330.3855936-1-rananta@google.com>
 <20230808231330.3855936-3-rananta@google.com>
From:   Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230808231330.3855936-3-rananta@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/9/23 07:13, Raghavendra Rao Ananta wrote:
> There's no reason for the architectures to declare
> kvm_arch_flush_remote_tlbs() in their own headers. Hence to
> avoid this duplication, make the declaration global, leaving
> the architectures to define only __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> as needed.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/mips/include/asm/kvm_host.h | 1 -
>   include/linux/kvm_host.h         | 2 ++
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 9b0ad8f3bf327..54a85f1d4f2c8 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -897,6 +897,5 @@ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>   static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>   
>   #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> -int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
>   
>   #endif /* __MIPS_KVM_HOST_H__ */
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index e3f968b38ae97..ade5d4500c2ce 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1484,6 +1484,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   {
>   	return -ENOTSUPP;
>   }
> +#else
> +int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
>   #endif
>   
>   #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA

-- 
Shaoqin

