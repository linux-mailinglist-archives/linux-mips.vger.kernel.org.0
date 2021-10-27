Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CF543CE3C
	for <lists+linux-mips@lfdr.de>; Wed, 27 Oct 2021 18:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242890AbhJ0QHP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Oct 2021 12:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237613AbhJ0QHL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Oct 2021 12:07:11 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7CDC061767
        for <linux-mips@vger.kernel.org>; Wed, 27 Oct 2021 09:04:45 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id lx5-20020a17090b4b0500b001a262880e99so2418731pjb.5
        for <linux-mips@vger.kernel.org>; Wed, 27 Oct 2021 09:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dcpH/p742iSNJ4bZTW0zt1TGCcBsOCFOjXwA1nHOArQ=;
        b=Tm86IoMHOyj+zpaOtCSE4VFzqAdP+9ruKNcRadlOsFvChh7ill13kZR5jWD9NHE65h
         64jvZDMu9kIVfatwV9NqtMoLtCasfA5hteZXUvebb1KfemQP+3PqYeGQAgGx9M3p7bU8
         qNPAFnYhitn+E30o4EXNDe5pTB+zWAuxmiSCE4KEPuXZlCuroSJybkJylXO0PsvVFrn8
         WHatzxWVbSvDonjRBU4GlRNXf74WN3TzY8Vqi6OJ+Ctj4jxWd/Ui1c+kFiATf0mtE0jn
         ZZyVyj8OcnNeewioZwWE0jsQa9pZSUdW+6oR7be9c4lXCDaENvCYDfdnIza70+cJL6Io
         dmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dcpH/p742iSNJ4bZTW0zt1TGCcBsOCFOjXwA1nHOArQ=;
        b=2rYd9piuYcYxU2c6Yiym7xPiL6ls8Dr/7MAuLIY1XHyeeTGZQJdOPxyZ+NBoN/IStE
         GQYfly8Kn5ZcVv49eQF9r1C9DhOg+HbcHFWJb4kFRzwJkDvxmk2wEDUKRGQhr6pBAx1e
         5I946ICkfHO+96jCLk60BFn668eV3oG5FYSsdpvnCjSjEQxk09yTVcv/zK3QPVQtMEGf
         EDzzTG/VfBZVAJp3mSSEVTGt1AVeYh2PNduexz58EpcwH9BNRLpkf8H4LpVTChBrED/s
         dToQnSaLNgSli1sBT6QFOvSdrhLzzf9Z5EbyWlP2j9vvZNYkhJ/v2zZeaxond5DGo+P/
         4CnA==
X-Gm-Message-State: AOAM533ZHnUayCK/3rWKPybZY3HuhdTrC+03ZZRvksV3SQUXdY1IIjJZ
        gZERK7hVIR3BdMtI4aWxMZoC6w==
X-Google-Smtp-Source: ABdhPJywTswkNFY7FXvXu6HG//R1t5yx+yTwPulg5ieqikJtUBQKOiC63rBPbvuvCOKHk/yZoLtKWg==
X-Received: by 2002:a17:90b:1b46:: with SMTP id nv6mr6766883pjb.162.1635350684192;
        Wed, 27 Oct 2021 09:04:44 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id z15sm242123pga.16.2021.10.27.09.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 09:04:43 -0700 (PDT)
Date:   Wed, 27 Oct 2021 16:04:40 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
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
Subject: Re: [PATCH v2 39/43] KVM: VMX: Don't do full kick when triggering
 posted interrupt "fails"
Message-ID: <YXl4mK7CyUBnPaQV@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-40-seanjc@google.com>
 <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> On 09/10/21 04:12, Sean Christopherson wrote:
> > +		/*
> > +		 * The smp_wmb() in kvm_make_request() pairs with the smp_mb_*()
> > +		 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU
> > +		 * is guaranteed to see the event request if triggering a posted
> > +		 * interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
> 
> This explanation doesn't make much sense to me.  This is just the usual
> request/kick pattern explained in Documentation/virt/kvm/vcpu-requests.rst;
> except that we don't bother with a "kick" out of guest mode because the
> entry always goes through kvm_check_request (in the nVMX case) or
> sync_pir_to_irr (if non-nested) and completes the delivery itself.
> 
> In other word, it is a similar idea as patch 43/43.
> 
> What this smp_wmb() pair with, is the smp_mb__after_atomic in
> kvm_check_request(KVM_REQ_EVENT, vcpu).

I don't think that's correct.  There is no kvm_check_request() in the relevant path.
kvm_vcpu_exit_request() uses kvm_request_pending(), which is just a READ_ONCE()
without a barrier.  The smp_mb__after_atomic ensures that any assets that were
modified prior to making the request are seen by the vCPU handling the request.
It does not provide any guarantees for a different vCPU/task making a request
and checking vcpu->mode versus the target vCPU setting vcpu->mode and checking
for a pending request.

> Setting the interrupt in the PIR orders before kvm_make_request in this
> thread, and orders after kvm_make_request in the vCPU thread.
>
> Here, instead:
> 
> > +	/*
> > +	 * The implied barrier in pi_test_and_set_on() pairs with the smp_mb_*()
> > +	 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU is
> > +	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
> > +	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
> > +	 */
> >  	if (vcpu != kvm_get_running_vcpu() &&
> >  	    !kvm_vcpu_trigger_posted_interrupt(vcpu, false))
> > -		kvm_vcpu_kick(vcpu);
> > +		kvm_vcpu_wake_up(vcpu);
> 
> it pairs with the smp_mb__after_atomic in vmx_sync_pir_to_irr().  As
> explained again in vcpu-requests.rst, the ON bit has the same function as
> vcpu->request in the previous case.

Same as above, I don't think that's correct.  The smp_mb__after_atomic() ensures
that there's no race between the IOMMU writing vIRR and setting ON, and KVM
clearing ON and processing the vIRR.

pi_test_on() is not an atomic operation, and there's no memory barrier if ON=0.
It's the same behavior as kvm_check_request(), but again the ordering with respect
to vcpu->mode isn't being handled by PID.ON/kvm_check_request().

AIUI, this is the barrier that's paired with the PI barriers.  This is even called
out in (2).

	vcpu->mode = IN_GUEST_MODE;

	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);

	/*
	 * 1) We should set ->mode before checking ->requests.  Please see
	 * the comment in kvm_vcpu_exiting_guest_mode().
	 *
	 * 2) For APICv, we should set ->mode before checking PID.ON. This
	 * pairs with the memory barrier implicit in pi_test_and_set_on
	 * (see vmx_deliver_posted_interrupt).
	 *
	 * 3) This also orders the write to mode from any reads to the page
	 * tables done while the VCPU is running.  Please see the comment
	 * in kvm_flush_remote_tlbs.
	 */
	smp_mb__after_srcu_read_unlock();
