Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86527617774
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 08:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiKCHRJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Nov 2022 03:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiKCHQz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 03:16:55 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14235F40
        for <linux-mips@vger.kernel.org>; Thu,  3 Nov 2022 00:16:54 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so537415wmq.4
        for <linux-mips@vger.kernel.org>; Thu, 03 Nov 2022 00:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhVVFU4gv+0KPdkJhZ6Bsgp0nMXVzSegBp2GVEhxHuI=;
        b=h9I23FTp6GIOXmio03YkEg/XABkIyK7okfyOacacDCySEptlxLcYcKstMetIpqEjVI
         AJxxtkE/wdXbgKxacBRTI0vKPMD7Lrwttr/WvlHH6ej0kR33MU05lAqiRuHOXS6eYgUi
         5D/WB/7tpxiogfi3huBIVAcoj+aw5jR0iw+raivB9st+zpUrHhjUaefLK8xl1XeXGROT
         jIYtNJVpBXb1lhi22kZeWS2z2s2scGKIObYA8G99yKRsKrD7Waw2HL3AJk86rNi+kcwk
         ldYfFW2HEUS0Ngd3K7BW6C8SpUqOYnm44amyRmlRCLpiKmxp0dOvOZKAUgifFtw1/6bS
         zu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hhVVFU4gv+0KPdkJhZ6Bsgp0nMXVzSegBp2GVEhxHuI=;
        b=Z0HZ4lYbIIVsxRTAhwIr7Bevz4pIWGD7iXYZSzri03EKrtwVzV6w7Mne7pX9M5f5B8
         RdlUgtJerVINLLtQpOoD/YVQvHwQ/FlbXIEJaQTIUxWpEo8CV5yp/k814tFp2uEP64Oh
         LEfaqFTAlu0IdZJF4LAI1E13Lc2qj1qD1fkc7qZpatHBOP2oUtveOxyZ3cFIle1EeJeg
         rJ/vJqYwNvFT7o2KjGiXpERPSxBPSpL0pTAIPpPMG9Y+F4/HdK6DQAcFKPHDLg0fwgM4
         k5RjDBS/l0adbeKSXdWa7ZQ0/IQHglGpNtWephUkN1WOF4vUWqgj5ZnF8Hki3zlXODyy
         Gnfg==
X-Gm-Message-State: ACrzQf0yVTlFIa/8I+5rHoowZpVcvZdy0YJMDaKE2KDtkt6rI1jB4OBs
        UfAMr4xaAKm187fdI8wcHGUkRg==
X-Google-Smtp-Source: AMsMyM5U5tWVDdkP8vx2CGlIc4Tyh8xELM0VfMzpr/hFq4D4kTE8+riEzXzUJzEDmk/itTcMkiPp1A==
X-Received: by 2002:a05:600c:22c6:b0:3cf:88bb:3a95 with SMTP id 6-20020a05600c22c600b003cf88bb3a95mr4075812wmg.71.1667459812670;
        Thu, 03 Nov 2022 00:16:52 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c359600b003c6b9749505sm4601041wmq.30.2022.11.03.00.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:16:51 -0700 (PDT)
Message-ID: <5aaa19b8-da75-9a3c-634b-d4c26f77943b@linaro.org>
Date:   Thu, 3 Nov 2022 08:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 25/44] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
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
 <20221102231911.3107438-26-seanjc@google.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-26-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/11/22 00:18, Sean Christopherson wrote:
> Move the guts of kvm_arch_init() into a new helper, __kvm_s390_init(),
> and invoke the new helper directly from kvm_s390_init() instead of
> bouncing through kvm_init().  Invoking kvm_arch_init() is the very
> first action performed by kvm_init(), i.e. this is a glorified nop.
> 
> Moving setup to __kvm_s390_init() will allow tagging more functions as
> __init, and emptying kvm_arch_init() will allow dropping the hook
> entirely once all architecture implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/s390/kvm/kvm-s390.c | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

