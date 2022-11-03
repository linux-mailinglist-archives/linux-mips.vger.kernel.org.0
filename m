Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E92D617755
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 08:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbiKCHMI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Nov 2022 03:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbiKCHLw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 03:11:52 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499BB11807
        for <linux-mips@vger.kernel.org>; Thu,  3 Nov 2022 00:11:03 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso543045wmo.1
        for <linux-mips@vger.kernel.org>; Thu, 03 Nov 2022 00:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CvhsZshQWEcVMeUTUtOp+ihfqDRpu56SkXuVG8Len34=;
        b=kHZDPyIo8df19dqlQHWniGoyDch8A+hISU8X6gd7fp1VbScHETGhbytjJYmkhLQHKf
         fwi1nthEtQPwse9uctHll81mNdW31rmNNRadEcJOVs4CiYzIp2cFwfJ+eDzavRkFrV7o
         df5jmaTAaQvLc9v1sSmbABx4C5Rzw1nTgw7iXi1sO9xpDPFNsNp3LKzpz90wTIQNwZ1t
         Ho+YhWAPx1xMmOMWNMoEs/sIV1YU/vXuH0Fvy5rAwr8dsko79NvLMAybJkyUdKsceRMO
         iXCBxeebKyqxkZinLCfgL7TweGZd1asuEGHKg2vBla0voczqpexKdljfuec7O93BtHaM
         wjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvhsZshQWEcVMeUTUtOp+ihfqDRpu56SkXuVG8Len34=;
        b=PTV4TeDDU/O1+4LegO5hK/3d2/tI4kIaQbPp2LNrOtz7//OUsEJIT0nUAFOZIg5MFn
         e9sW7SxP4jNqMc8402Ui3wI4o7JguSAQj365P2XlWPUaXUoibO2MsU0VHIxV4z7LTmau
         89YPkKpioRjmBFgZJLzkYLkwcCM9PqT7kLEGRXn/pzomtwohZn5Q0HQNz3X1/d1FZLPj
         RgpRtot2h1TqZnLAU92/cHZQqy5qmhFCe+uoeKr8Dd/a5Cg95Dd7HV/E7nE+0XynMENi
         jJlu1aVyVC61jKeOm5xcU66utvA//OUwyKEL0ZO7ItrbKT6ZaepPrdooxrQwEWjWQSRd
         7EDQ==
X-Gm-Message-State: ACrzQf0GKlM2KLUqAyfZW3aaVVFwd55ewnl1tllXivWDVlWQbm00OuIf
        KZ8Su90BS9fHJOOx1pDVErScaA==
X-Google-Smtp-Source: AMsMyM6OzoP+QUJ8ptlTPBD8IHWudpkYNFjUBgo6cbOLfKoB/+Q6j9ksVTjQt2XeCIsVj6BjOQ3zrw==
X-Received: by 2002:a05:600c:1:b0:3c6:c456:f07a with SMTP id g1-20020a05600c000100b003c6c456f07amr18797697wmc.158.1667459461681;
        Thu, 03 Nov 2022 00:11:01 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id y16-20020adff6d0000000b0023647841c5bsm17017wrp.60.2022.11.03.00.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:11:01 -0700 (PDT)
Message-ID: <e844905b-3775-b89d-8b19-0a1c2e916432@linaro.org>
Date:   Thu, 3 Nov 2022 08:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 20/44] KVM: MIPS: Setup VZ emulation? directly from
 kvm_mips_init()
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Atish Patra <atishp@atishpatra.org>,
        David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chao Gao <chao.gao@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Yuan Yao <yuan.yao@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-21-seanjc@google.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-21-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/11/22 00:18, Sean Christopherson wrote:
> Invoke kvm_mips_emulation_init() directly from kvm_mips_init() instead
> of bouncing through kvm_init()=>kvm_arch_init().  Functionally, this is
> a glorified nop as invoking kvm_arch_init() is the very first action
> performed by kvm_init().
> 
> Emptying kvm_arch_init() will allow dropping the hook entirely once all
> architecture implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/mips/kvm/mips.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

