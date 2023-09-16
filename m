Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0057D7A2C11
	for <lists+linux-mips@lfdr.de>; Sat, 16 Sep 2023 02:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238451AbjIPAcU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Sep 2023 20:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238626AbjIPAcL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Sep 2023 20:32:11 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAFF269D
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 17:31:27 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d7ea08906b3so3161811276.1
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824286; x=1695429086; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nWWn+h7amRZMBDw3vQNPHGAGWvxVaFdsCPW0ONMozkY=;
        b=iZkx+4Z1668sMxI2NjINFfskMHO4HshWvqApQj+yXolwCZslseI+2rqTps5ehLAbhe
         xACwkYE+MrnGahGR5lxszwUfirkQ1qDmLL0jvr4KxJYU8Xb6viI9iX4c1edff9cgGvuE
         g9DozZ8QgAycpWplDf24pZjIytOEO0yhT85jShSSJOl6iGDfVV5kbFjSlxVMjbWkJP2+
         XEeW5U/2J0KXuWha1pVCmzPwol+60L7/9xnburMEzuMAVRG0oNFkDP/7y07ssELOaZoL
         6UGWLPtm3AEAsip/b1wJ2c/YkWSRE4hy4F2NWAkmrJ+wFFtZm3gY0x4dgbrG/v5JCTsZ
         1Hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824286; x=1695429086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWWn+h7amRZMBDw3vQNPHGAGWvxVaFdsCPW0ONMozkY=;
        b=bAMJEoDQbMd0HHb+9+kJh6w+IQLn5TfEjx6hbu1uhTeos3CGfaJ6xL5FDOxYGnblBV
         ieQaVlCGCmkEr7lT2uydn1s7HeCFN7xG5pHAQMTa9B63bzXLTfvrUf2sjhc4IKARngnp
         EfaHU8raW/VWcmqtQ76+08lE5FtmqrdVSMRykaCWsOBeRUEa8NRPBTcY2u3tHDVBkPZK
         vlku3wUwEg83XeLptqREiLf58Km3FFQXFCa+LpamihTkrGu/HoQ2nMWPnSbaiklLYyST
         80GE7Y9/e2PSwe73QVf/sHsRBlA135v3iIKZC95j7evMYl0xGBdv1m2dflS0+zPEo67r
         QWXA==
X-Gm-Message-State: AOJu0YzsHCPL8dL4aZTWYIsyDauUWVsKVoDEh0OiV1WpCR7m1u/2JLAM
        xdvSWDBEMYPXxDo3e2ERVbZtqkvu/SM=
X-Google-Smtp-Source: AGHT+IEq7PdKxRZn76T8dxJekIJKystQKt2vwlGFVVGJbIP+fTzk72beaUliTqaKSj/nh0feFGYdLVI2swc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:98b:b0:d81:5948:970 with SMTP id
 bv11-20020a056902098b00b00d8159480970mr72987ybb.13.1694824286666; Fri, 15 Sep
 2023 17:31:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 15 Sep 2023 17:30:55 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-4-seanjc@google.com>
Subject: [PATCH 03/26] virt: Declare and define vfio_file_set_kvm() iff
 CONFIG_KVM is enabled
From:   Sean Christopherson <seanjc@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Andy Lutomirski <luto@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        Anish Ghulati <aghulati@google.com>,
        Venkatesh Srinivas <venkateshs@chromium.org>,
        Andrew Thornton <andrewth@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hide vfio_file_set_kvm() and its unique helpers if KVM is not enabled,
nothing else in the kernel (or out of the kernel) should be using a
KVM specific helper.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio_main.c | 2 +-
 include/linux/vfio.h     | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 6368eed7b7b2..124cc88966a7 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1352,7 +1352,6 @@ void vfio_device_put_kvm(struct vfio_device *device)
 clear:
 	device->kvm = NULL;
 }
-#endif
 
 static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 {
@@ -1388,6 +1387,7 @@ void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
 		vfio_device_file_set_kvm(file, kvm);
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
+#endif
 
 /*
  * Sub-module support
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 454e9295970c..e80955de266c 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -311,7 +311,9 @@ static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *devi
 #endif
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
+#if IS_ENABLED(CONFIG_KVM)
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
+#endif
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
-- 
2.42.0.459.ge4e396fd5e-goog

