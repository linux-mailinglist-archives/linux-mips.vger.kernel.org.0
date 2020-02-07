Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A430156148
	for <lists+linux-mips@lfdr.de>; Fri,  7 Feb 2020 23:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbgBGWfg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Feb 2020 17:35:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33834 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727514AbgBGWfe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Feb 2020 17:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581114933;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9XsUS877THbbHLMWAH0vUYHxXn1kbs8c4Q1KcyCj1WI=;
        b=buw6pKaUW2K21G0zKLGMfDeqZ0twUHV+5ImIuJopQ0dq5/5IsNUtinMygMHIseFNN5Ausb
        RCTNt0OIp5qEPDni+AoAdNZSUiZGdrxHzC7IHW04IgrYx8MhTnOdg0QM5Tc2cYREJKrL+Q
        PrDQzaWkm1kt9OTtHcs17gycblZjLzc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-h5iNX2G-MUCrgJ9MYblMZQ-1; Fri, 07 Feb 2020 17:35:31 -0500
X-MC-Unique: h5iNX2G-MUCrgJ9MYblMZQ-1
Received: by mail-qv1-f69.google.com with SMTP id l1so485609qvu.13
        for <linux-mips@vger.kernel.org>; Fri, 07 Feb 2020 14:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9XsUS877THbbHLMWAH0vUYHxXn1kbs8c4Q1KcyCj1WI=;
        b=hbMfwV2yOfg9UJ/4jvlm0uujp+lG9HjYOhlKk+3u5RUTBBh93ldjsaLjuJAooDTWS2
         bebu5DhPDOx7hbMDJslkhcDYO4FMLvN8PbofY+4mO9te+j0pVxZ3ps2vVMG/wBBSrL/9
         zOfCGiw5RQ4HzB/lyB5i0ypfvAzqps/HEJ37jY8cAl77mVtdkGTAHmci/9ZKYWj2Jpe5
         e8zRnChdf0tAyIiF0/4QNtxDpIISeJhoV7puBRos9JYgJyYmWNyOZ/vsWP4N+wmi44a8
         HhOASIJ42k6JezLsSDT6HyFjjj6MIm/4nnjcRDUZMb6HwyunIQ4S28D/KUwtzKV9EkK9
         hXFQ==
X-Gm-Message-State: APjAAAVxOf3FdosiSONuEJi/0wgkff6MnaYC8I6m2TLl57Ba7s2gFtST
        5hTnE0FO5I5QCKCwccvPDviGrf5ghNKW8XfqTNmGrCZa2AiD8aKcHEb1DjOSKqtbJNg0kTPUkAg
        Hxo4M4WZ7qIwnjEie7ETEdA==
X-Received: by 2002:ac8:7388:: with SMTP id t8mr598857qtp.244.1581114930698;
        Fri, 07 Feb 2020 14:35:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwn5fwgG8yLSUv1nZMep7TxP6EHJN2W9klV6ZqRv2GguI28ys/WxlL4swGn7j7HsjM3rXcdpw==
X-Received: by 2002:ac8:7388:: with SMTP id t8mr598847qtp.244.1581114930463;
        Fri, 07 Feb 2020 14:35:30 -0800 (PST)
Received: from xz-x1.redhat.com ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id u12sm2178736qtj.84.2020.02.07.14.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 14:35:29 -0800 (PST)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-mips@vger.kernel.org, peterx@redhat.com,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PATCH RFC 4/4] KVM: MIPS: Define arch-specific kvm_flush_remote_tlbs()
Date:   Fri,  7 Feb 2020 17:35:20 -0500
Message-Id: <20200207223520.735523-5-peterx@redhat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207223520.735523-1-peterx@redhat.com>
References: <20200207223520.735523-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Select HAVE_KVM_ARCH_TLB_FLUSH_ALL for MIPS to define its own
kvm_flush_remote_tlbs().  It's as simple as calling the
flush_shadow_all(kvm) hook.  Then replace all the flush_shadow_all()
calls to use this KVM generic API to do TLB flush.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/mips/kvm/Kconfig |  1 +
 arch/mips/kvm/mips.c  | 22 ++++++++++------------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
index eac25aef21e0..8a06f660d39e 100644
--- a/arch/mips/kvm/Kconfig
+++ b/arch/mips/kvm/Kconfig
@@ -26,6 +26,7 @@ config KVM
 	select KVM_MMIO
 	select MMU_NOTIFIER
 	select SRCU
+	select HAVE_KVM_ARCH_TLB_FLUSH_ALL
 	---help---
 	  Support for hosting Guest kernels.
 
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 1d5e7ffda746..518020b466bf 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -194,13 +194,16 @@ int kvm_arch_create_memslot(struct kvm *kvm, struct kvm_memory_slot *slot,
 	return 0;
 }
 
+void kvm_flush_remote_tlbs(struct kvm *kvm)
+{
+	kvm_mips_callbacks->flush_shadow_all(kvm);
+}
+
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
 	/* Flush whole GPA */
 	kvm_mips_flush_gpa_pt(kvm, 0, ~0);
-
-	/* Let implementation do the rest */
-	kvm_mips_callbacks->flush_shadow_all(kvm);
+	kvm_flush_remote_tlbs(kvm);
 }
 
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
@@ -215,8 +218,7 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 	/* Flush slot from GPA */
 	kvm_mips_flush_gpa_pt(kvm, slot->base_gfn,
 			      slot->base_gfn + slot->npages - 1);
-	/* Let implementation do the rest */
-	kvm_mips_callbacks->flush_shadow_all(kvm);
+	kvm_flush_remote_tlbs(kvm);
 	spin_unlock(&kvm->mmu_lock);
 }
 
@@ -258,7 +260,7 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 					new->base_gfn + new->npages - 1);
 		/* Let implementation do the rest */
 		if (needs_flush)
-			kvm_mips_callbacks->flush_shadow_all(kvm);
+			kvm_flush_remote_tlbs(kvm);
 		spin_unlock(&kvm->mmu_lock);
 	}
 }
@@ -1001,9 +1003,7 @@ int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log)
 	if (flush) {
 		slots = kvm_memslots(kvm);
 		memslot = id_to_memslot(slots, log->slot);
-
-		/* Let implementation handle TLB/GVA invalidation */
-		kvm_mips_callbacks->flush_shadow_all(kvm);
+		kvm_flush_remote_tlbs(kvm);
 	}
 
 	mutex_unlock(&kvm->slots_lock);
@@ -1024,9 +1024,7 @@ int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm, struct kvm_clear_dirty_log *lo
 	if (flush) {
 		slots = kvm_memslots(kvm);
 		memslot = id_to_memslot(slots, log->slot);
-
-		/* Let implementation handle TLB/GVA invalidation */
-		kvm_mips_callbacks->flush_shadow_all(kvm);
+		kvm_flush_remote_tlbs(kvm);
 	}
 
 	mutex_unlock(&kvm->slots_lock);
-- 
2.24.1

