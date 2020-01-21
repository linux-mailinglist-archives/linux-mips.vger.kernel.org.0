Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADDB6143BA9
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jan 2020 12:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbgAULIJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jan 2020 06:08:09 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37279 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727817AbgAULIJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Jan 2020 06:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579604887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x7jZw/H2y5zeqQuje6kJm5arA3TA0C7bKtuRivqDv8Y=;
        b=OF6cHrE17mRhhzRqdCGGV665WKU9jAcbHWfdytXrkkiXYy3xoWFIMbOG415iCjLnITKfdL
        Yc0HCp3DhQ5SutO9Y3pLXmPGek7sjiofFNnLBVBRaRz7GXxprrWXs7ITeXBXt0xe0RbPUL
        AoY1BMcxA59336j3HRCl3VHAY3c9Jpc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-b0CJ4AFoPH-LJROcgvTcpg-1; Tue, 21 Jan 2020 06:08:06 -0500
X-MC-Unique: b0CJ4AFoPH-LJROcgvTcpg-1
Received: by mail-wr1-f71.google.com with SMTP id b13so1137100wrx.22
        for <linux-mips@vger.kernel.org>; Tue, 21 Jan 2020 03:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x7jZw/H2y5zeqQuje6kJm5arA3TA0C7bKtuRivqDv8Y=;
        b=rU28FXtRj/vJpouPTbMXllmSpA2kixGTOIRsBngUDmKsA8jD1Md/9uDUXexcZKCylb
         WazxyPo+EoRmP7B3u+BIPV1MMJYUudnumbw0xJh293rr6GlHB1bt1HDhtxd78h9ilz2R
         DfG/yZ0mSJ7n/Ii2fTT53ugWpTWv1f2uFI+lgj41D4v77i2mraTghQBImIW/jUZ8BwRR
         E5qp3g6Ae2C8aJ3c5kjBABnfZE8gTPmip3MDiNTRYbDD0XZaStpUa4ZgKIfb39OITrO6
         FXLt6rE9Gzk+CpvLtD9jo1Z3uz04K/Ze9POlpdI8qCJkCeRtxFHstuhJ9Dz/Amko1+P7
         Dylg==
X-Gm-Message-State: APjAAAXqrdZkKEa3+QE9RLc7ZQEBBlxZlHaH/VQsQ+4VKkQ/mIBB168k
        CUVswt9Am/jqvvcq5ITKSO095zyAKBauTNE53zqKhVW/bTvMEdIuhK4dRwG4J9Ea3NMVmnIe2tv
        VMlFbGvmZso1d95mAucJszA==
X-Received: by 2002:a5d:5091:: with SMTP id a17mr4584305wrt.362.1579604884296;
        Tue, 21 Jan 2020 03:08:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqyrSJw1xVD8KtI/DVSDHhO4SUvtdN2Xqf5CmpjkIe8Jj2CEEstdjLnJnkKwuFepClVNL9qC7A==
X-Received: by 2002:a5d:5091:: with SMTP id a17mr4584254wrt.362.1579604883939;
        Tue, 21 Jan 2020 03:08:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b509:fc01:ee8a:ca8a? ([2001:b07:6468:f312:b509:fc01:ee8a:ca8a])
        by smtp.gmail.com with ESMTPSA id l15sm49716775wrv.39.2020.01.21.03.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 03:08:03 -0800 (PST)
Subject: Re: [PATCH v2 15/45] KVM: PPC: Move kvm_vcpu_init() invocation to
 common code
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
 <20191218215530.2280-16-sean.j.christopherson@intel.com>
 <20200120033402.GC14307@blackberry>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <07329402-25a3-874a-5e79-d35900668f1d@redhat.com>
Date:   Tue, 21 Jan 2020 12:08:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200120033402.GC14307@blackberry>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 20/01/20 04:34, Paul Mackerras wrote:
> On Wed, Dec 18, 2019 at 01:55:00PM -0800, Sean Christopherson wrote:
>> Move the kvm_cpu_{un}init() calls to common PPC code as an intermediate
>> step towards removing kvm_cpu_{un}init() altogether.
>>
>> No functional change intended.
>>
>> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> This doesn't compile:
> 
>   CC [M]  arch/powerpc/kvm/book3s.o
> /home/paulus/kernel/kvm/arch/powerpc/kvm/book3s.c: In function ‘kvmppc_core_vcpu_create’:
> /home/paulus/kernel/kvm/arch/powerpc/kvm/book3s.c:794:9: error: ‘kvm’ undeclared (first use in this function)
>   return kvm->arch.kvm_ops->vcpu_create(vcpu);
>          ^
> /home/paulus/kernel/kvm/arch/powerpc/kvm/book3s.c:794:9: note: each undeclared identifier is reported only once for each function it appears in
> /home/paulus/kernel/kvm/arch/powerpc/kvm/book3s.c:795:1: warning: control reaches end of non-void function [-Wreturn-type]
>  }
>  ^
> make[3]: *** [/home/paulus/kernel/kvm/scripts/Makefile.build:266: arch/powerpc/kvm/book3s.o] Error 1
> 
>> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
>> index 13385656b90d..5ad20fc0c6a1 100644
>> --- a/arch/powerpc/kvm/book3s.c
>> +++ b/arch/powerpc/kvm/book3s.c
>> @@ -789,10 +789,9 @@ void kvmppc_decrementer_func(struct kvm_vcpu *vcpu)
>>  	kvm_vcpu_kick(vcpu);
>>  }
>>  
>> -int kvmppc_core_vcpu_create(struct kvm *kvm, struct kvm_vcpu *vcpu,
>> -			    unsigned int id)
>> +int kvmppc_core_vcpu_create(struct kvm_vcpu *vcpu)
>>  {
>> -	return kvm->arch.kvm_ops->vcpu_create(kvm, vcpu, id);
>> +	return kvm->arch.kvm_ops->vcpu_create(vcpu);
> 
> Needs s/kvm/vcpu->kvm/ here.
> 
> You also need to change the declaration of the vcpu_create function
> pointer in the kvmppc_ops struct in kvm_ppc.h to have just the vcpu
> parameter instead of 3 parameters.

Squashed:

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 374e4b835ff0..bc2494e5710a 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -273,8 +273,7 @@ struct kvmppc_ops {
 	void (*inject_interrupt)(struct kvm_vcpu *vcpu, int vec, u64 srr1_flags);
 	void (*set_msr)(struct kvm_vcpu *vcpu, u64 msr);
 	int (*vcpu_run)(struct kvm_run *run, struct kvm_vcpu *vcpu);
-	int (*vcpu_create)(struct kvm *kvm, struct kvm_vcpu *vcpu,
-			   unsigned int id);
+	int (*vcpu_create)(struct kvm_vcpu *vcpu);
 	void (*vcpu_free)(struct kvm_vcpu *vcpu);
 	int (*check_requests)(struct kvm_vcpu *vcpu);
 	int (*get_dirty_log)(struct kvm *kvm, struct kvm_dirty_log *log);
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 5ad20fc0c6a1..3f7adcb0ff63 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -791,7 +791,7 @@ void kvmppc_decrementer_func(struct kvm_vcpu *vcpu)
 
 int kvmppc_core_vcpu_create(struct kvm_vcpu *vcpu)
 {
-	return kvm->arch.kvm_ops->vcpu_create(vcpu);
+	return vcpu->kvm->arch.kvm_ops->vcpu_create(vcpu);
 }
 
 void kvmppc_core_vcpu_free(struct kvm_vcpu *vcpu)
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index dd7440e50c7a..d41765157f0e 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -2116,7 +2116,7 @@ int kvmppc_core_init_vm(struct kvm *kvm)
 
 int kvmppc_core_vcpu_create(struct kvm_vcpu *vcpu)
 {
-	return kvm->arch.kvm_ops->vcpu_create(vcpu);
+	return vcpu->kvm->arch.kvm_ops->vcpu_create(vcpu);
 }
 
 void kvmppc_core_vcpu_free(struct kvm_vcpu *vcpu)

