Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC43B46273F
	for <lists+linux-mips@lfdr.de>; Mon, 29 Nov 2021 23:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236296AbhK2XBm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Nov 2021 18:01:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235774AbhK2XAw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Nov 2021 18:00:52 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F380C1EB41A
        for <linux-mips@vger.kernel.org>; Mon, 29 Nov 2021 10:55:19 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so15046878pjb.1
        for <linux-mips@vger.kernel.org>; Mon, 29 Nov 2021 10:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TYbgQqCpCmOsVo/Ud6S4W0dWbGKnEHCC/sbfSrxRU2Q=;
        b=V9NdrM9IGQ8TORtVAjZzUck1RI7UtY24/5ryhbIDx46VwTLIEKKddxeNbMrV6TQpIl
         KTCIPozOyBw/wCgOEJPsKU3C9LENDNILuHldgqEm6W55x2AEOVy9zbC+oB0Q8kNXcib2
         utENfqKkezcYzZnD0pmUAjWeJ/cGQai7wseSy0Tb7+ezAyGs24Tiec69FywheOS97WPw
         hiOKPwklIAtqAAVwW+TVa82nOI4oJHItJIs2sHILKArSIy33/Br5zlJSRUemG17TIymQ
         2z90v41HGfafPsWOqjYsVFIk8gpVXUcAMJTfJevG+nopt2huTRvy9U+7v5siSDcfSs81
         05ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TYbgQqCpCmOsVo/Ud6S4W0dWbGKnEHCC/sbfSrxRU2Q=;
        b=GomaujY/aMVp/a/DoZWa6wum6GntvC34tcbNrBf8PTl8aHe1c2ZRRJoOSn2yievw0l
         M9pJnH5vD4fx7P3hO5guY27YqVMkuCeL3hilyiUhyyPncfW+TrAr9T60zksEu9oy4OzU
         6AqJR2b5eeTFibW2nPAFP9hpy1BdtEAi4FGI0X9gpuadH3K86WSwCIdmCsrspQB5Muju
         8xseWUdKTeU0RW3QcZToDsdPzGb3X/DPSkT7aa4Pfkz+ZB9jc+AtSEsaUxQdSL9ydZWl
         5iD3wRpKrPvo+K6sx0NBjFBY2k1le01HrN9RhYjPDIPqJjmoShN4hZ+Dmnp/beqwQVU/
         4JtQ==
X-Gm-Message-State: AOAM532sR/AgaQ5ca84TYy65vSSYDv5Vjip051H7Z4/cMqznjHg5MA2A
        DJQrPJQ8JJ0IqqC+saUhLb5zoA==
X-Google-Smtp-Source: ABdhPJzGwlSa9NgpBenMt4CKt9Ftf4k4qsHL0lT0KjuZVEYivrfeFPAQn3AoVSiAs1eAB5ezweh9DQ==
X-Received: by 2002:a17:90b:2251:: with SMTP id hk17mr189639pjb.31.1638212118683;
        Mon, 29 Nov 2021 10:55:18 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d17sm17979027pfj.215.2021.11.29.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 10:55:18 -0800 (PST)
Date:   Mon, 29 Nov 2021 18:55:14 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        James Morse <james.morse@arm.com>,
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
Subject: Re: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
Message-ID: <YaUiEquKYi5eqWC0@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 29, 2021, Paolo Bonzini wrote:
> On 11/29/21 18:25, Sean Christopherson wrote:
> > If a posted interrupt arrives after KVM has done its final search through the vIRR,
> > but before avic_update_iommu_vcpu_affinity() is called, the posted interrupt will
> > be set in the vIRR without triggering a host IRQ to wake the vCPU via the GA log.
> > 
> > I.e. KVM is missing an equivalent to VMX's posted interrupt check for an outstanding
> > notification after switching to the wakeup vector.
> 
> BTW Maxim reported that it can break even without assigned devices.
> 
> > For now, the least awful approach is sadly to keep the vcpu_(un)blocking() hooks.
> 
> I agree that the hooks cannot be dropped but the bug is reproducible with
> this patch, where the hooks are still there.

...

> Still it does seem to be a race that happens when IS_RUNNING=true but
> vcpu->mode == OUTSIDE_GUEST_MODE.  This patch makes the race easier to
> trigger because it moves IS_RUNNING=false later.

Oh!  Any chance the bug only repros with preemption enabled?  That would explain
why I don't see problems, I'm pretty sure I've only run AVIC with a PREEMPT=n.

svm_vcpu_{un}blocking() are called with preemption enabled, and avic_set_running()
passes in vcpu->cpu.  If the vCPU is preempted and scheduled in on a different CPU,
avic_vcpu_load() will overwrite the vCPU's entry with the wrong CPU info.
