Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2ED16171DE
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 00:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbiKBXUN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 19:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiKBXTf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 19:19:35 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF45221AD
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 16:19:23 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id f19-20020a63f113000000b0046fde69a09dso90873pgi.10
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 16:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=61+uc/Y9XgqKqIqJKklgZKwyXFi4EpAveqLf+gzND20=;
        b=Utw2bIoFpd0OsW8gcFI5XrC8r/opoeV6PzEujs3E4Mr9+St+h1iGz7I0t2dfS8UClh
         tAtUjqK55zt6/KkvBXOzqfYjfHXVvlGdNUDx6aXeRWpNBB/SzUU3M7O4hGxRvmfcP7Dv
         H7xUVWjzIm9fOWFawnQ+tUiBa9aTdqs3xjhRiHy7QmZH5iQmDFc0LC68bjVk8Tk76MUY
         okNb1d05tSvdlxWMqm8WJt1KJ94gRKBpU/aaJyEkAN3CmyDtunrNwjuXsVAB9MDK12T5
         qP1tSiadBS2lzWdtmS7wbdVgSkTUTO1m/e38yDr5/ydciJMTwj/jwYNum8ez3aI14Ekv
         m1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61+uc/Y9XgqKqIqJKklgZKwyXFi4EpAveqLf+gzND20=;
        b=moQEL0R+BEBY3fiqCl0myJtIuBA9RlAinHVWbpdGRNK970OQiDG/PQJEVN4nLEZefo
         x+d2SiNDi0Gf/9jma7ULnAqO9WnLclY9lz86lPj4wHmG99zTPG2LMxJCD0ofrjGCVj/w
         PQSPS6QttoKXa7RQ+ZqXuv3vt7FVRp7YB3ANHFI1KwdVBJxg1FVNbAIctYXPSVeMRTYt
         1/hlAKrDo8B0aNRZ7tHq9L02zNHeKK3bxyfAsv32V24hWqGRyWJpkbaMhCfAaVd9J0+V
         DYQaKErCi2j1h+81m7R09R2nTZLjiT5yy2zufyQ08Jz5G/xQgOsI4M8bPRsw08IwxFtr
         NPcQ==
X-Gm-Message-State: ACrzQf0WG9tCiiKp5sJulAtpL3QrYiBu/yYdURKkaoaPriPnvNNrlBKl
        C27HnA/4VWvaQkuizk9y/50UWP02JMY=
X-Google-Smtp-Source: AMsMyM69CxKgcSWgM1vAnwvZeDyLX7/AeVTRbrDaM9LXBznOzPR+Ikthjk94S3wZJoe6s5YkzQYZMQYdPec=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:38cd:b0:214:184f:4007 with SMTP id
 nn13-20020a17090b38cd00b00214184f4007mr9764899pjb.82.1667431162802; Wed, 02
 Nov 2022 16:19:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed,  2 Nov 2022 23:18:32 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-6-seanjc@google.com>
Subject: [PATCH 05/44] KVM: s390: Unwind kvm_arch_init() piece-by-piece() if a
 step fails
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
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
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In preparation for folding kvm_arch_hardware_setup() into kvm_arch_init(),
unwind initialization one step at a time instead of simply calling
kvm_arch_exit().  Using kvm_arch_exit() regardless of which initialization
step failed relies on all affected state playing nice with being undone
even if said state wasn't first setup.  That holds true for state that is
currently configured by kvm_arch_init(), but not for state that's handled
by kvm_arch_hardware_setup(), e.g. calling gmap_unregister_pte_notifier()
without first registering a notifier would result in list corruption due
to attempting to delete an entry that was never added to the list.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 45d4b8182b07..8395433a79b2 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -490,11 +490,11 @@ int kvm_arch_init(void *opaque)
 
 	kvm_s390_dbf_uv = debug_register("kvm-uv", 32, 1, 7 * sizeof(long));
 	if (!kvm_s390_dbf_uv)
-		goto out;
+		goto err_kvm_uv;
 
 	if (debug_register_view(kvm_s390_dbf, &debug_sprintf_view) ||
 	    debug_register_view(kvm_s390_dbf_uv, &debug_sprintf_view))
-		goto out;
+		goto err_debug_view;
 
 	kvm_s390_cpu_feat_init();
 
@@ -502,25 +502,32 @@ int kvm_arch_init(void *opaque)
 	rc = kvm_register_device_ops(&kvm_flic_ops, KVM_DEV_TYPE_FLIC);
 	if (rc) {
 		pr_err("A FLIC registration call failed with rc=%d\n", rc);
-		goto out;
+		goto err_flic;
 	}
 
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM)) {
 		rc = kvm_s390_pci_init();
 		if (rc) {
 			pr_err("Unable to allocate AIFT for PCI\n");
-			goto out;
+			goto err_pci;
 		}
 	}
 
 	rc = kvm_s390_gib_init(GAL_ISC);
 	if (rc)
-		goto out;
+		goto err_gib;
 
 	return 0;
 
-out:
-	kvm_arch_exit();
+err_gib:
+	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
+		kvm_s390_pci_exit();
+err_pci:
+err_flic:
+err_debug_view:
+	debug_unregister(kvm_s390_dbf_uv);
+err_kvm_uv:
+	debug_unregister(kvm_s390_dbf);
 	return rc;
 }
 
-- 
2.38.1.431.g37b22c650d-goog

