Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3B21BDC03
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 14:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgD2MXw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 08:23:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33250 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726930AbgD2MXw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Apr 2020 08:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588163030;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=P8pgV6uMHzNDOfpWIiJdoKMsBBSJGFZq++Qsl0KZjhI=;
        b=VXHnq+tFqe+w/qesSKeLfV/regHTBCMF9k8lcthWPDi4TkZm59CV/Q9zzyYN4a/gKI4i9e
        G3tmdbRyXgfP3ePtACRykRgezZNYQdQOUczYEb5UQQm8F63xJ9LPOTr9/IJ9IYXXeQggvp
        PhoWGhIgOahXuMhPQCKtBpnCyl1G01c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-CbabBfetOoycL_KXH9bgZw-1; Wed, 29 Apr 2020 08:23:47 -0400
X-MC-Unique: CbabBfetOoycL_KXH9bgZw-1
Received: by mail-wm1-f71.google.com with SMTP id t62so1130951wma.0
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2020 05:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=P8pgV6uMHzNDOfpWIiJdoKMsBBSJGFZq++Qsl0KZjhI=;
        b=HeU4q2loSMwT7c7DiGITCa1ACFS2Uu1T27APh2k4r5VgfXkkA0KwTEtPvfMhIC7wmj
         WwdR+7qytzz63iyshmtvNXLYaVmpZwqqa2udgqj+6Ojd5FWsl0kRF3YuyaBjVR46DT2l
         rtAlwxttYdnkvyxpvYty+6RIa0BmE4/CbN5aG8UGHHrJndQ3JXNT+25Ohx+A1yGCH7i1
         77ewJQEJoHILGSl/E2RcN/ToxMuHtYWHDmS8F9aT9L/teKF869ufaZdnWmFiscS3AWD0
         1ewr5RtfEi0zIL78tmc4daSm0P1dZbaz5KaVn8I2yK54Ovip5DxWpz3qfdz8B0687qpz
         XE5A==
X-Gm-Message-State: AGi0PuayfiFJaIxlywgrmiBqZHgfdZr5GJxwtKkQUJEVuC1C4ZmH4+aB
        oZw3SoUEHmK98tcRmJD8G2B1e7/WRAGD23YjWJxS7VxWhzKJpUQOv+YzICeK1ul9UR424a1fAv3
        ONiR7XMW4NkQ/uxTRtafVHw==
X-Received: by 2002:a1c:8106:: with SMTP id c6mr2999768wmd.88.1588163026202;
        Wed, 29 Apr 2020 05:23:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypLEQN/fKbOj2PpKvd2yk8qFu2uTYg65caL+qOuUZqYZNmiqKNZUNV+CX/Wun7VWjygdbXHKLA==
X-Received: by 2002:a1c:8106:: with SMTP id c6mr2999734wmd.88.1588163025929;
        Wed, 29 Apr 2020 05:23:45 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id n6sm32160645wrs.81.2020.04.29.05.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 05:23:45 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
        tianjia.zhang@linux.alibaba.com, pbonzini@redhat.com,
        tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
        benh@kernel.crashing.org, borntraeger@de.ibm.com,
        frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        sean.j.christopherson@intel.com, wanpengli@tencent.com,
        jmattson@google.com, joro@8bytes.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        maz@kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com,
        suzuki.poulose@arm.com, christoffer.dall@arm.com,
        peterx@redhat.com, thuth@redhat.com, chenhuacai@gmail.com
Subject: Re: [PATCH v4 3/7] KVM: PPC: Remove redundant kvm_run from vcpu_arch
In-Reply-To: <20200427043514.16144-4-tianjia.zhang@linux.alibaba.com>
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com> <20200427043514.16144-4-tianjia.zhang@linux.alibaba.com>
Date:   Wed, 29 Apr 2020 14:23:42 +0200
Message-ID: <87lfmeh44x.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Tianjia Zhang <tianjia.zhang@linux.alibaba.com> writes:

> The 'kvm_run' field already exists in the 'vcpu' structure, which
> is the same structure as the 'kvm_run' in the 'vcpu_arch' and
> should be deleted.
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  arch/powerpc/include/asm/kvm_host.h | 1 -
>  arch/powerpc/kvm/book3s_hv.c        | 6 ++----
>  arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
>  3 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 1dc63101ffe1..2745ff8faa01 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -795,7 +795,6 @@ struct kvm_vcpu_arch {
>  	struct mmio_hpte_cache_entry *pgfault_cache;
>  
>  	struct task_struct *run_task;
> -	struct kvm_run *kvm_run;
>  
>  	spinlock_t vpa_update_lock;
>  	struct kvmppc_vpa vpa;
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 93493f0cbfe8..413ea2dcb10c 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2934,7 +2934,7 @@ static void post_guest_process(struct kvmppc_vcore *vc, bool is_master)
>  
>  		ret = RESUME_GUEST;
>  		if (vcpu->arch.trap)
> -			ret = kvmppc_handle_exit_hv(vcpu->arch.kvm_run, vcpu,
> +			ret = kvmppc_handle_exit_hv(vcpu->run, vcpu,
>  						    vcpu->arch.run_task);
>  
>  		vcpu->arch.ret = ret;
> @@ -3920,7 +3920,6 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
>  	spin_lock(&vc->lock);
>  	vcpu->arch.ceded = 0;
>  	vcpu->arch.run_task = current;
> -	vcpu->arch.kvm_run = kvm_run;
>  	vcpu->arch.stolen_logged = vcore_stolen_time(vc, mftb());
>  	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
>  	vcpu->arch.busy_preempt = TB_NIL;
> @@ -3973,7 +3972,7 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
>  			if (signal_pending(v->arch.run_task)) {
>  				kvmppc_remove_runnable(vc, v);
>  				v->stat.signal_exits++;
> -				v->arch.kvm_run->exit_reason = KVM_EXIT_INTR;
> +				v->run->exit_reason = KVM_EXIT_INTR;
>  				v->arch.ret = -EINTR;
>  				wake_up(&v->arch.cpu_run);
>  			}
> @@ -4049,7 +4048,6 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
>  	vc = vcpu->arch.vcore;
>  	vcpu->arch.ceded = 0;
>  	vcpu->arch.run_task = current;
> -	vcpu->arch.kvm_run = kvm_run;
>  	vcpu->arch.stolen_logged = vcore_stolen_time(vc, mftb());
>  	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
>  	vcpu->arch.busy_preempt = TB_NIL;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index dc97e5be76f6..5a3987f3ebf3 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -290,8 +290,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  			r = RESUME_HOST;
>  			break;
>  		}
> -		r = kvmhv_run_single_vcpu(vcpu->arch.kvm_run, vcpu, hdec_exp,
> -					  lpcr);
> +		r = kvmhv_run_single_vcpu(vcpu->run, vcpu, hdec_exp, lpcr);
>  	} while (is_kvmppc_resume_guest(r));
>  
>  	/* save L2 state for return */

FWIW,

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly

