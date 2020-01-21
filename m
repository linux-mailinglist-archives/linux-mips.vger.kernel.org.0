Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56197143B98
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jan 2020 12:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbgAULFG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jan 2020 06:05:06 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40315 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727255AbgAULFG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Jan 2020 06:05:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579604705;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d9MsVbaNk7uS2Z+64id6QtYbk8dUZDS6e1+y0CQGu/U=;
        b=ZKp24iBGCt+3zyrHYZVdp2H73Ixhe5CSWfXp10IsdJrFXXOENfm7ywZcdThMBa8KllAcwm
        GbW65C+VNcPmsOK59916ruWQRbjJoVXuA6TJXarJhYXO5DpvIgEcsKeEQ5U6w5hoZ1r4SQ
        WEANir1A9KoluhZmjlPE7Bs0SOOlj3c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-_loRk99eMnmyZ3cRSSAdVg-1; Tue, 21 Jan 2020 06:05:04 -0500
X-MC-Unique: _loRk99eMnmyZ3cRSSAdVg-1
Received: by mail-wr1-f70.google.com with SMTP id 90so1151885wrq.6
        for <linux-mips@vger.kernel.org>; Tue, 21 Jan 2020 03:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d9MsVbaNk7uS2Z+64id6QtYbk8dUZDS6e1+y0CQGu/U=;
        b=PNcpTj53/szJ/IQBPpES9giqoopZtf/Rvsp5O2GbnDtx0ajEnk5elUuMruToHChbOq
         1XmXzsNu5MX5QSsQq5S710pO1thZT9SB14ZQU4HSXHau8KXAIvpiIy2kGqveUlH/L4S3
         XViogdXudgsvogO4mvYyxFLTgDhFxUXbIW0hWk7qwoLtVL2ijwA0I+S0LLaVAMUJhEVq
         XQqhKLENWsnTIxyhK3bTpRWGT1ZPUxHMu30RmEUHsv9s/EkoZnssbFH+OUcLnsj7E6fF
         P6oA9Y7s68s5IWCyO5+OVYBEhFGPnyNoyqzMKud5c8BO44hsSeRURJMkjYmpMLyyapF2
         5MLg==
X-Gm-Message-State: APjAAAW0nK440/yMzlyo4mUJUd3HHB9wWfJ3XZXCOrJ87StaPrM4cJ6p
        YqYbFOqS0BZkBwq5xnwJhHK6DFtojj/nLQoN17VD5qcW9NXe/gQE+3DGvYEgjWwpUoiwFTWgjmP
        p6ccFEtROkxsHAQlaCLIIbA==
X-Received: by 2002:adf:978c:: with SMTP id s12mr4583936wrb.408.1579604702660;
        Tue, 21 Jan 2020 03:05:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxC6B3CUIhPHui5yyVc53K8mg8DvgmB+n/aXEy4G4Rxw9ic8vDj4v06pAmlaTd9zgfxWEA28g==
X-Received: by 2002:adf:978c:: with SMTP id s12mr4583882wrb.408.1579604702280;
        Tue, 21 Jan 2020 03:05:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b509:fc01:ee8a:ca8a? ([2001:b07:6468:f312:b509:fc01:ee8a:ca8a])
        by smtp.gmail.com with ESMTPSA id s8sm50551793wrt.57.2020.01.21.03.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 03:05:01 -0800 (PST)
Subject: Re: [PATCH v2 12/45] KVM: PPC: Allocate vcpu struct in common PPC
 code
To:     Paul Mackerras <paulus@ozlabs.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, James Hogan <jhogan@kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kurz <groug@kaod.org>
References: <20191218215530.2280-1-sean.j.christopherson@intel.com>
 <20191218215530.2280-13-sean.j.christopherson@intel.com>
 <20200120040412.GF14307@blackberry>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fcd2aaf1-6f6e-303a-d7c6-f6b0c0a4555c@redhat.com>
Date:   Tue, 21 Jan 2020 12:05:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200120040412.GF14307@blackberry>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 20/01/20 05:04, Paul Mackerras wrote:
> On Wed, Dec 18, 2019 at 01:54:57PM -0800, Sean Christopherson wrote:
>> Move allocation of all flavors of PPC vCPUs to common PPC code.  All
>> variants either allocate 'struct kvm_vcpu' directly, or require that
>> the embedded 'struct kvm_vcpu' member be located at offset 0, i.e.
>> guarantee that the allocation can be directly interpreted as a 'struct
>> kvm_vcpu' object.
>>
>> Remove the message from the build-time assertion regarding placement of
>> the struct, as compatibility with the arch usercopy region is no longer
>> the sole dependent on 'struct kvm_vcpu' being at offset zero.
>>
>> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> This fails to compile for Book E configs:
> 
>   CC      arch/powerpc/kvm/e500.o
> /home/paulus/kernel/kvm/arch/powerpc/kvm/e500.c: In function ‘kvmppc_core_vcpu_create_e500’:
> /home/paulus/kernel/kvm/arch/powerpc/kvm/e500.c:464:9: error: return makes integer from pointer without a cast [-Werror=int-conversion]
>   return vcpu;
>          ^
> cc1: all warnings being treated as errors
> make[3]: *** [/home/paulus/kernel/kvm/scripts/Makefile.build:266: arch/powerpc/kvm/e500.o] Error 1
> 
> There is a "return vcpu" statement in kvmppc_core_vcpu_create_e500(),
> and another in kvmppc_core_vcpu_create_e500mc(), which both need to be
> changed to "return 0".
> 
> (By the way, I do appreciate you fixing the PPC code, even if there
> are some errors.)

Squashed:

diff --git a/arch/powerpc/kvm/e500.c b/arch/powerpc/kvm/e500.c
index 96d9cde3d2e3..f5dd2c7adcd4 100644
--- a/arch/powerpc/kvm/e500.c
+++ b/arch/powerpc/kvm/e500.c
@@ -461,7 +461,7 @@ static int kvmppc_core_vcpu_create_e500(struct kvm *kvm, struct kvm_vcpu *vcpu,
 		goto uninit_tlb;
 	}
 
-	return vcpu;
+	return 0;
 
 uninit_tlb:
 	kvmppc_e500_tlb_uninit(vcpu_e500);
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index aea588f73bf7..7c0d392f667a 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -327,7 +327,7 @@ static int kvmppc_core_vcpu_create_e500mc(struct kvm *kvm, struct kvm_vcpu *vcpu
 		goto uninit_tlb;
 	}
 
-	return vcpu;
+	return 0;
 
 uninit_tlb:
 	kvmppc_e500_tlb_uninit(vcpu_e500);


