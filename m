Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B078C1B859C
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2020 12:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgDYKYd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Apr 2020 06:24:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41858 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgDYKYc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 25 Apr 2020 06:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587810271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AiiGjxMSfR/3HcuLZdv0rh/BGKXUkSP2JfWB96AlEV4=;
        b=R5UEs3rfkcxmFXqmegr8xxrcqVDr8feMITNUPcLwj3NjGw4GcL3NNWcDNrW8in4iLtLwHY
        gM4jQ5BF6buHS7MR995yMOFddELpY8Vb/xdpNr0hJdtX/u9qs/o6BxLUsP6Zn1YhNOejRp
        duvokAL4teBYLz1Bx1BtDug7CnYpmbs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-DXVV-Eh3Oj-ZT-gh6NAkMg-1; Sat, 25 Apr 2020 06:24:29 -0400
X-MC-Unique: DXVV-Eh3Oj-ZT-gh6NAkMg-1
Received: by mail-wr1-f70.google.com with SMTP id r11so6489291wrx.21
        for <linux-mips@vger.kernel.org>; Sat, 25 Apr 2020 03:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AiiGjxMSfR/3HcuLZdv0rh/BGKXUkSP2JfWB96AlEV4=;
        b=WqZYwA6lxSkCNMgrfBotBovPC599VBEQyu9vNF0Z7yVnjBfpd5EAJDpOtZimCTKvx6
         UgZGCxAkaINJqok3f0ucpnVnZwJm4RRpoPA6Wory183MoEgN1kYmAOaQMxbVp3rMfFPJ
         VfBnADXTvqRYbal7FcOy3u3KGO16yjMTGQ/gjJXDvCZOt2FDBHqxwzRRD7nA07cgOeBP
         tyQWxRV+/W6fWsYgyg2Td/cEMai5Ut22jLlZz1sV7sf4EPnx7JXpAIlDAt4m61++CYRl
         EzyyXtuV08uglR+MbGh090idHN9+dKoxOwdiWwgcripcJr3oM5W+KMLqoHViy2tnC1KU
         kGaw==
X-Gm-Message-State: AGi0PuaTT+fxix5jI6B4NgLpSff80MS4lwBypp/4jR2kR2+C3ctjWCty
        v7RvXT+HIv7y8hYEskzuZELLOqAccCsSGVei7KNL3zuZo+hKECtsq9Uyt+a4YDYPJwfsV5IWi6F
        lPzxyUNHU/tUaln5P0Q9QFg==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr17541299wrw.351.1587810268502;
        Sat, 25 Apr 2020 03:24:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypJCsnbfHqFriQbI24TXuIAXrqXN8iqz6uh+Ag2xVYIfCBS/H8oNA4RK58IzO9hfko5vLHJ96Q==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr17541287wrw.351.1587810268284;
        Sat, 25 Apr 2020 03:24:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d0a0:f143:e9e4:2926? ([2001:b07:6468:f312:d0a0:f143:e9e4:2926])
        by smtp.gmail.com with ESMTPSA id t17sm11580360wro.2.2020.04.25.03.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 03:24:27 -0700 (PDT)
Subject: Re: [PATCH 5/5] kvm: Replace vcpu->swait with rcuwait
To:     Davidlohr Bueso <dave@stgolabs.net>, tglx@linutronix.de
Cc:     peterz@infradead.org, maz@kernel.org, bigeasy@linutronix.de,
        rostedt@goodmis.org, torvalds@linux-foundation.org,
        will@kernel.org, joel@joelfernandes.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        Paul Mackerras <paulus@ozlabs.org>,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        Davidlohr Bueso <dbueso@suse.de>
References: <20200424054837.5138-1-dave@stgolabs.net>
 <20200424054837.5138-6-dave@stgolabs.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <69af54bb-8632-fbf7-d774-da9a954ff1b7@redhat.com>
Date:   Sat, 25 Apr 2020 12:24:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200424054837.5138-6-dave@stgolabs.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I'm squashing this in to keep the changes compared to the current code minimal,
and queuing the series.

Thanks,

Paolo

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index bbefa2a7f950..feca3118b17f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -230,10 +230,10 @@ static bool kvmppc_ipi_thread(int cpu)
 static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
 {
 	int cpu;
-	struct rcuwait *wait;
+	struct rcuwait *waitp;
 
-	wait = kvm_arch_vcpu_get_wait(vcpu);
-	if (rcuwait_wake_up(wait))
+	waitp = kvm_arch_vcpu_get_wait(vcpu);
+	if (rcuwait_wake_up(waitp))
 		++vcpu->stat.halt_wakeup;
 
 	cpu = READ_ONCE(vcpu->arch.thread_cpu);
@@ -3814,7 +3814,10 @@ static void kvmppc_vcore_blocked(struct kvmppc_vcore *vc)
 		}
 	}
 
+	prepare_to_rcuwait(&vc->wait);
+	set_current_state(TASK_INTERRUPTIBLE);
 	if (kvmppc_vcore_check_block(vc)) {
+		finish_rcuwait(&vc->wait);
 		do_sleep = 0;
 		/* If we polled, count this as a successful poll */
 		if (vc->halt_poll_ns)
@@ -3827,8 +3830,8 @@ static void kvmppc_vcore_blocked(struct kvmppc_vcore *vc)
 	vc->vcore_state = VCORE_SLEEPING;
 	trace_kvmppc_vcore_blocked(vc, 0);
 	spin_unlock(&vc->lock);
-	rcuwait_wait_event(&vc->wait,
-			   kvmppc_vcore_check_block(vc), TASK_INTERRUPTIBLE);
+	schedule();
+	finish_rcuwait(&vc->wait);
 	spin_lock(&vc->lock);
 	vc->vcore_state = VCORE_INACTIVE;
 	trace_kvmppc_vcore_blocked(vc, 1);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7c2d18c12d87..c671de51a753 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2737,10 +2737,10 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_block);
 
 bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu)
 {
-	struct rcuwait *wait;
+	struct rcuwait *waitp;
 
-	wait = kvm_arch_vcpu_get_wait(vcpu);
-	if (rcuwait_wake_up(wait)) {
+	waitp = kvm_arch_vcpu_get_wait(vcpu);
+	if (rcuwait_wake_up(waitp)) {
 		WRITE_ONCE(vcpu->ready, true);
 		++vcpu->stat.halt_wakeup;
 		return true;

