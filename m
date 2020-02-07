Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F95C156146
	for <lists+linux-mips@lfdr.de>; Fri,  7 Feb 2020 23:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgBGWfc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Feb 2020 17:35:32 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54789 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727484AbgBGWfc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Feb 2020 17:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581114931;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nbFuDNqXWxYaO1U3b7e5Dk8u+2RlyLNa/H+l9wnHCjY=;
        b=HbkddziikS6pRakwr71b/9CxfUmxcnahygKIzkAuCnI6m3oXphQsvc1M2DqXyv0j4GMXrg
        ZYUm4PYdmQNUflTVQJ2geOGB8B+4Cke9o3wK6F/ohnhlKga1UP80UnPQCVg7H51Io8oA7W
        EokJKur+jV+P1L3KrY3VIZrN1WVh3k8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-DrKDu6HtOX-XBWJ-WhG91g-1; Fri, 07 Feb 2020 17:35:29 -0500
X-MC-Unique: DrKDu6HtOX-XBWJ-WhG91g-1
Received: by mail-qv1-f72.google.com with SMTP id z9so487127qvo.10
        for <linux-mips@vger.kernel.org>; Fri, 07 Feb 2020 14:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbFuDNqXWxYaO1U3b7e5Dk8u+2RlyLNa/H+l9wnHCjY=;
        b=s1aaoAsLX+x/Z5o9IEtUgXDAeU/T61u5k1yPCz7+JIbU9mgbJlKdb4DzT7nMqv1tut
         2q5DLMp3kju94z8hJaS9/Ma1Z9vAJzBpcEuTt+BP/oQ2vU38IIgL/ilkZd3uibIq45pI
         GjJMWKpz0iHHXLN9RzGg7JeKdzvp7KEj+7Jion+CyEUyJwOnOeoWwmnGK1inwPAmsjZA
         hh+nbobzmNI6YEYSpDUcqojdpnBqgIG5d5jX3j/RfZzBL+Y2etAvjOwsc1DqHiCJ58Pt
         RONWOL7p7ya9NttpkEo/F+/0S40aOwenO/5UbqFw0yQnSTn5aLuObOd7JYWw7y56JYNJ
         IdjA==
X-Gm-Message-State: APjAAAWYhJ5N3q9siH3TTd49IhXPnz8ij3KEKgxEJp72wPesZzQAbqaN
        Guj8xyiyoLB5rT6/Y91r6/6w6eMjkbQOkkek77w3P07b3+gsIjEPCojK/Tj3WYeeLFhInjT0RNY
        Eo/TlMVALjO3upAyYGPvrqA==
X-Received: by 2002:ac8:70d3:: with SMTP id g19mr564427qtp.209.1581114929006;
        Fri, 07 Feb 2020 14:35:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOrsIOK2qFxwanpIc4DdFHwxuCz+v4A8f7plovFbmLVtbkNX/2LPWpBFah+G+L0x+fURCmIg==
X-Received: by 2002:ac8:70d3:: with SMTP id g19mr564402qtp.209.1581114928759;
        Fri, 07 Feb 2020 14:35:28 -0800 (PST)
Received: from xz-x1.redhat.com ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id u12sm2178736qtj.84.2020.02.07.14.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 14:35:28 -0800 (PST)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-mips@vger.kernel.org, peterx@redhat.com,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PATCH RFC 3/4] KVM: MIPS: Replace all the kvm_flush_remote_tlbs() references
Date:   Fri,  7 Feb 2020 17:35:19 -0500
Message-Id: <20200207223520.735523-4-peterx@redhat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207223520.735523-1-peterx@redhat.com>
References: <20200207223520.735523-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace kvm_flush_remote_tlbs() calls in MIPS code into
kvm_flush_remote_tlbs_common().  This is to prepare that MIPS will
define its own kvm_flush_remote_tlbs() soon.

The only three references are all in the flush_shadow_all() hooks.
One of them can be directly dropped because it's exactly the
kvm_flush_remote_tlbs_common().  Since at it, refactors the other one
a bit.

No functional change expected.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/mips/kvm/trap_emul.c | 8 +-------
 arch/mips/kvm/vz.c        | 7 ++-----
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/mips/kvm/trap_emul.c b/arch/mips/kvm/trap_emul.c
index 2ecb430ea0f1..ced481c963be 100644
--- a/arch/mips/kvm/trap_emul.c
+++ b/arch/mips/kvm/trap_emul.c
@@ -697,12 +697,6 @@ static int kvm_trap_emul_vcpu_setup(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
-static void kvm_trap_emul_flush_shadow_all(struct kvm *kvm)
-{
-	/* Flush GVA page tables and invalidate GVA ASIDs on all VCPUs */
-	kvm_flush_remote_tlbs(kvm);
-}
-
 static u64 kvm_trap_emul_get_one_regs[] = {
 	KVM_REG_MIPS_CP0_INDEX,
 	KVM_REG_MIPS_CP0_ENTRYLO0,
@@ -1285,7 +1279,7 @@ static struct kvm_mips_callbacks kvm_trap_emul_callbacks = {
 	.vcpu_init = kvm_trap_emul_vcpu_init,
 	.vcpu_uninit = kvm_trap_emul_vcpu_uninit,
 	.vcpu_setup = kvm_trap_emul_vcpu_setup,
-	.flush_shadow_all = kvm_trap_emul_flush_shadow_all,
+	.flush_shadow_all = kvm_flush_remote_tlbs_common,
 	.gva_to_gpa = kvm_trap_emul_gva_to_gpa_cb,
 	.queue_timer_int = kvm_mips_queue_timer_int_cb,
 	.dequeue_timer_int = kvm_mips_dequeue_timer_int_cb,
diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index 814bd1564a79..91fbf6710da4 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -3105,10 +3105,7 @@ static int kvm_vz_vcpu_setup(struct kvm_vcpu *vcpu)
 
 static void kvm_vz_flush_shadow_all(struct kvm *kvm)
 {
-	if (cpu_has_guestid) {
-		/* Flush GuestID for each VCPU individually */
-		kvm_flush_remote_tlbs(kvm);
-	} else {
+	if (!cpu_has_guestid) {
 		/*
 		 * For each CPU there is a single GPA ASID used by all VCPUs in
 		 * the VM, so it doesn't make sense for the VCPUs to handle
@@ -3119,8 +3116,8 @@ static void kvm_vz_flush_shadow_all(struct kvm *kvm)
 		 * kick any running VCPUs so they check asid_flush_mask.
 		 */
 		cpumask_setall(&kvm->arch.asid_flush_mask);
-		kvm_flush_remote_tlbs(kvm);
 	}
+	kvm_flush_remote_tlbs_common(kvm);
 }
 
 static void kvm_vz_vcpu_reenter(struct kvm_run *run, struct kvm_vcpu *vcpu)
-- 
2.24.1

