Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19504397D0
	for <lists+linux-mips@lfdr.de>; Mon, 25 Oct 2021 15:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhJYNut (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Oct 2021 09:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26917 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230267AbhJYNut (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Oct 2021 09:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635169706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rAI1rvJIZVwx71e91km04CwkX5jtmNRsQSKYM+y4LQM=;
        b=RcUN7h3/KVcwB6CG2nyXxa0de24df0g3VfDOZrfqH/ynGLyLyDFmXnYkvZkf3l/Xy192Bw
        RupD1Y+KicOlz2O5kjHiwx3bttaThZ8ePhvcgYr++8Hf/XUpwmyXUFODZ+DX+NCwXtd/Hm
        eQB4dxnagmpWvuZtwsyzT1JmL8TEMXs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-sKvtMOy-OkyxDaJh8WN3jw-1; Mon, 25 Oct 2021 09:48:24 -0400
X-MC-Unique: sKvtMOy-OkyxDaJh8WN3jw-1
Received: by mail-wm1-f72.google.com with SMTP id k5-20020a7bc3050000b02901e081f69d80so3686106wmj.8
        for <linux-mips@vger.kernel.org>; Mon, 25 Oct 2021 06:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rAI1rvJIZVwx71e91km04CwkX5jtmNRsQSKYM+y4LQM=;
        b=doiTRR1W5q6wpatQH+AvqzAgy5i5yvbAIhPcEneqLvZ0QXHqfRgEqF7XiePMkD2HvR
         J75iNpfHGIDYiyK2RghnzMc57XPLkEMQZKE6fl4iSVivF65yJyhHYjpN9FePV9OowxmX
         h6c/lMkW1WN6nTAmQ7GvNNvMkCDiJDLWo5H1VnGGAfZNI/Ld+ZEc4JQK4OUCvs6nmeJQ
         2EWNZIqUZ1SXU5JM/V3bLmK9l7fAhZNMbWWaibBFiEwuze+JhUn3Aio8H5mzTNmZ8VEJ
         fFLq9UwiJ6ZUua0uVM4qPxpJzJKGGQkxRWYe+Eh0xwgLzZek9Od7sh3Lbd6ocFAtrRLg
         A1zQ==
X-Gm-Message-State: AOAM532JAV0b+HdVDIUdL1squpkDT+Rl2FkiCZpCfzjF+dcr95g5ZXfv
        BdRUxZ49CPqN41nMTE3TMsaDo7zyc/5aSciZ6H2nGf4BIrjsUVUopE2wq/xUYXlmfha+edzzpXS
        fwg3a+HrSFHLk+XrLVnI0Tg==
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr24355623wrd.264.1635169703586;
        Mon, 25 Oct 2021 06:48:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvh4UiZag1iqCL0Yxmhmh7ghHaPzeCY1G7nZe+NYuublJxNb7HJYi3GJafbpt4P4VqHirR5w==
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr24355558wrd.264.1635169703285;
        Mon, 25 Oct 2021 06:48:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id m12sm3661638wrq.69.2021.10.25.06.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 06:48:22 -0700 (PDT)
Message-ID: <1537b693-80ee-4f9e-2c4e-6e1c62ccca92@redhat.com>
Date:   Mon, 25 Oct 2021 15:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 20/43] KVM: VMX: Skip Posted Interrupt updates if APICv
 is hard disabled
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Matlack <dmatlack@google.com>,
        Oliver Upton <oupton@google.com>,
        Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-21-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-21-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/10/21 04:12, Sean Christopherson wrote:
> +	/* Nothing to do if PI.SN==0 and the vCPU isn't being migrated. */
>   	if (!pi_test_sn(pi_desc) && vcpu->cpu == cpu)
>   		return;

This does not quite say "why", so:

         /* Nothing to do if PI.SN and PI.NDST both have the desired value. */

Paolo

