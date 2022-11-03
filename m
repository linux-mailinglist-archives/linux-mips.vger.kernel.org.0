Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFCE161825C
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 16:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbiKCPSx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Nov 2022 11:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbiKCPSv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 11:18:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FEB1571F
        for <linux-mips@vger.kernel.org>; Thu,  3 Nov 2022 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667488669;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ayp5B1FtOoX/awXyyNk+Et491AUBiGcW44dxue5Nqxo=;
        b=O2J/vwkWuYcIlCax1IKXc9CZTrJf1qDy6dKOw1KVev1a/R1ifF6EKnE1PvHjodtNs8fUJb
        XIaa/RIJmjeYu9qwUte86O1qXj29lcT51bSH9tognRBSXqBIo5ycz57+jBxjCvyLtkom17
        yIKrrWt6WuYlgh5hGnS4XGjH4RWKNI8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-jq_mASyQNT-sMKpvPJGcWQ-1; Thu, 03 Nov 2022 11:17:47 -0400
X-MC-Unique: jq_mASyQNT-sMKpvPJGcWQ-1
Received: by mail-ed1-f69.google.com with SMTP id f20-20020a0564021e9400b00461ea0ce17cso1602341edf.16
        for <linux-mips@vger.kernel.org>; Thu, 03 Nov 2022 08:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ayp5B1FtOoX/awXyyNk+Et491AUBiGcW44dxue5Nqxo=;
        b=YiUO36YgmUYQAmArB1OwN0+5lwTMnrWIgv4URKGG/uFF2hon/qFa08ctWkk+7jLrGJ
         12GpLyOrGgLbEUvd+x7Zx+bFX52CpQ59qisJVQMSEECENL0a/tIc8tVMbNu8dEx3M0G1
         tld/USCbKV+esCrokQ9ERez8GW/8FAkyierAFPQctmd1erBkmEznlTjA4XefnLpqheNl
         7KJmW1oXCf2BEbIRdfXXuMLQswP7wOPLT2j/xm2i/vKRplKqfgdrTd2MfAYN/jR2Fd5t
         Q2bcB4p/QQPT2pGv16jT0ADrpqTeBbduE29FUq0E67UZ0SXTJnHw1Uhoz3q0E9HXxgLO
         A8pQ==
X-Gm-Message-State: ACrzQf1QtNpB4yoLKLF10iwDp3y91SZ1FxHErZKtwEQ9TS/79dR7hY2I
        zOUUf6USD9TLCos678dl8tdUMKoV+5WKHhoBWOVATyoN5Y/0u6vOClsZ1F+xNGVPIYjx+b5P/0Y
        V0rLpRx7oSxfsL818yPeQxA==
X-Received: by 2002:a05:6402:204d:b0:463:153d:6790 with SMTP id bc13-20020a056402204d00b00463153d6790mr27934902edb.293.1667488666690;
        Thu, 03 Nov 2022 08:17:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM630sytXvddVtAZaAJHdRqOOceHpoBMlPyO4dZ3HgeOBssiaNPhkaiASNbBs9VIOouVbrocUg==
X-Received: by 2002:a05:6402:204d:b0:463:153d:6790 with SMTP id bc13-20020a056402204d00b00463153d6790mr27934856edb.293.1667488666443;
        Thu, 03 Nov 2022 08:17:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id 1-20020a170906210100b007317f017e64sm595545ejt.134.2022.11.03.08.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 08:17:45 -0700 (PDT)
Message-ID: <23bfd709-f99a-5a74-e4b9-1381b88453f1@redhat.com>
Date:   Thu, 3 Nov 2022 16:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
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
 <20221102231911.3107438-37-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221102231911.3107438-37-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/3/22 00:19, Sean Christopherson wrote:
> From: Chao Gao<chao.gao@intel.com>
> 
> Do compatibility checks when enabling hardware to effectively add
> compatibility checks when onlining a CPU.  Abort enabling, i.e. the
> online process, if the (hotplugged) CPU is incompatible with the known
> good setup.

This paragraph is not true with this patch being before "KVM: Rename and 
move CPUHP_AP_KVM_STARTING to ONLINE section".

Paolo

