Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 978CE6187E4
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 19:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbiKCSrb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Nov 2022 14:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbiKCSra (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 14:47:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7C211172
        for <linux-mips@vger.kernel.org>; Thu,  3 Nov 2022 11:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667501188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KUvqpmismHtbPDi1RWOVBVQOlTCkIOX4rr6fY8m3qi8=;
        b=EabJpTwfu8tjjAfHEkBVi7bBq+lrfUWFHawhyEB1UMCeQZXnLUaK5P9HsuBOfU3j6e6noZ
        SJRT20RiiiB+HpCjpj0Hhrm05HM7kb7Wpu9MwqIEstj4N4izzUjgBuNbbsO4PblKrwrYHN
        iuCVN8/aEt7ngeIDwuH4QtswA1pOwKY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-A9vMUIFGOJC1EZ1Vfd2LGw-1; Thu, 03 Nov 2022 14:46:27 -0400
X-MC-Unique: A9vMUIFGOJC1EZ1Vfd2LGw-1
Received: by mail-ej1-f72.google.com with SMTP id oz34-20020a1709077da200b007adc8d68e90so1826397ejc.11
        for <linux-mips@vger.kernel.org>; Thu, 03 Nov 2022 11:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUvqpmismHtbPDi1RWOVBVQOlTCkIOX4rr6fY8m3qi8=;
        b=lJjOUVoKKXVLUi3Y4fn+8l2TTdQbplbfsm3OmUSMp+V1qIji6Xfe/s5kSj76ybznpn
         lpCbyhRxi6ng09GcEZhsyFXtNeStvrxZWvhgQ8pPyZW6La3rcrom+++J1iNBfHdsnm6f
         fYGmVrlHgDfNWSIlbgB7fK9zlecNcGyCSbaNNjbck2g4RTXvJnNYvmtV1SMxNbC/ltBf
         Vbi+2qStD/PaB3SPSgOemEIIFNXBR6lwrNCiTTfWDTW+jhd+c3tguUdxw9XHaybaDzqE
         IfN29ly81E6H1JavVJPH8bP8iX8l11WVRr8vL4hJQujyd9vsV07icZSmMyEqbQRGzzQ2
         QALw==
X-Gm-Message-State: ACrzQf0dquOhHUus1hPU97lt28q9+pHUxEpWckz1FWlhxof51/RAGjd5
        djBvXcqOdcYMTXWpy1tc3BNPgMyT79mbuRBPXg7NEgZW08Pz6j9NH7Zza1kZTNC0T1r8Ik9Y2Y/
        lNx/l4C0ABKS7tOOtjowROA==
X-Received: by 2002:a17:907:31c9:b0:740:ef93:2ffd with SMTP id xf9-20020a17090731c900b00740ef932ffdmr30301700ejb.584.1667501186286;
        Thu, 03 Nov 2022 11:46:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jngiF1WMeYDLzQRcIfcwEai0RoBStUb1QJ9IQKOY38atIN4TLSIas8P4CJc6XubwxUck1WA==
X-Received: by 2002:a17:907:31c9:b0:740:ef93:2ffd with SMTP id xf9-20020a17090731c900b00740ef932ffdmr30301665ejb.584.1667501186012;
        Thu, 03 Nov 2022 11:46:26 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id 2-20020a170906218200b0078246b1360fsm799044eju.131.2022.11.03.11.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 11:46:25 -0700 (PDT)
Message-ID: <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
Date:   Thu, 3 Nov 2022 19:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
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
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        James Morse <james.morse@arm.com>,
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
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y2QJ2TuyZImbFFvi@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/3/22 19:35, Sean Christopherson wrote:
> It's technically required.  IA32_FEAT_CTL and thus KVM_INTEL depends on any of
> CPU_SUP_{INTEL,CENATUR,ZHAOXIN}, but init_ia32_feat_ctl() is invoked if and only
> if the actual CPU type matches one of the aforementioned CPU_SUP_*.
> 
> E.g. running a kernel built with
> 
>    CONFIG_CPU_SUP_INTEL=y
>    CONFIG_CPU_SUP_AMD=y
>    # CONFIG_CPU_SUP_HYGON is not set
>    # CONFIG_CPU_SUP_CENTAUR is not set
>    # CONFIG_CPU_SUP_ZHAOXIN is not set
> 
> on a Cenatur or Zhaoxin CPU will leave X86_FEATURE_VMX set but not set
> X86_FEATURE_MSR_IA32_FEAT_CTL.  If VMX isn't enabled in MSR_IA32_FEAT_CTL, KVM
> will get unexpected #UDs when trying to enable VMX.

Oh, I see.  Perhaps X86_FEATURE_VMX and X86_FEATURE_SGX should be moved 
to one of the software words instead of using cpuid.  Nothing that you 
should care about for this series though.

Paolo

