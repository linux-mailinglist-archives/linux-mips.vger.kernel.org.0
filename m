Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9123861721F
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 00:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbiKBXWJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 19:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbiKBXUg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 19:20:36 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB8F644F
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 16:19:51 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 204-20020a2510d5000000b006be7970889cso323584ybq.21
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 16:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jjwuYM33wa0dwVWFlLHKwYhVaHzm2FgiCKOfn+QDNQ4=;
        b=Fhq9PEIX8LJQUbJ64jTN1JvSF4aDYgMhxvOWYGX1iAWoV/lvAdG5LOXuNivkfQWmaN
         XoYRELj0iLXTcGUgDHg9R/bhGsJRvY0Qx7IEF0y4w7dFOPQtmSUB+O6PUVY8/MhozQfF
         AX6SYnVZgv9nJGu4JJBc65UftCLAjC1MJHk1aUCf2yILUXt8A+rMwOgyzW8jvMWXgkl0
         LgkleUhB3pCNMAS+BVFzOjuYh6vlw9PADZ2etUZ8fiuYZCiK9hkRPf6dczcVLTjo6nqb
         SNGwaGeIsaxofOZxTFjiZYanOv3dUMmT9VRhi3xCUQ51Z2IYrlwrIcc2Hbem0XHCdIi2
         UM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjwuYM33wa0dwVWFlLHKwYhVaHzm2FgiCKOfn+QDNQ4=;
        b=tKD6SIqkqOIHmmYL7Ya7dIrfdp7+KhshBWakvkX36Nwlkoi9SyNUBYEjbROENFzfBo
         Jq3/X+1G/IoymaJEd6ITrehdSMAFmdB34tYkWwdSrKUCFqInyvHS6pDExW7Ae9nOL7Cf
         JkTe/UwnKM/Gw+Roqf2/sXj9YNQ0Rzg4MbpBeblC290n7xjoa/+XG7jnBHK4KIqf+QOG
         QDvkTuiGxkA+t/nEK2yhYJO4+tf2whZipdVGLU4cxL4ruCWRH0aGH2DvrRo37kNnfKFw
         yuuUOpo3Fxn+Z0/OEWRAUNoFU1MvDgsIfeDu2oHwh7lXLAtXBg5GevnKHSJyYjWz/BP4
         Y3Dg==
X-Gm-Message-State: ACrzQf3hl11O6fizBw/FFMlYZyqX706geX3G+ETKXatp2RievIA3bA0T
        KkrfnD4nbuBLLP8EJvHruBf0C/F808A=
X-Google-Smtp-Source: AMsMyM6G8+cpsdlQ24WmBjSm0uN0SQ0FUjj6LFQ9PdnISN+9XlJSF9tKC3IM7fcpwDmLrOspg5L0a2rB188=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:e695:0:b0:6cb:895b:5a35 with SMTP id
 d143-20020a25e695000000b006cb895b5a35mr25441755ybh.573.1667431179587; Wed, 02
 Nov 2022 16:19:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed,  2 Nov 2022 23:18:42 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-16-seanjc@google.com>
Subject: [PATCH 15/44] KVM: arm64: Free hypervisor allocations if vector slot
 init fails
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

Teardown hypervisor mode if vector slot setup fails in order to avoid
leaking any allocations done by init_hyp_mode().

Fixes: b881cdce77b4 ("KVM: arm64: Allocate hyp vectors statically")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 0c328af064dd..73644def7780 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2232,18 +2232,18 @@ int kvm_arch_init(void *opaque)
 	err = kvm_init_vector_slots();
 	if (err) {
 		kvm_err("Cannot initialise vector slots\n");
-		goto out_err;
-	}
-
-	err = init_subsystems();
-	if (err)
 		goto out_hyp;
+	}
+
+	err = init_subsystems();
+	if (err)
+		goto out_subs;
 
 	if (!in_hyp_mode) {
 		err = finalize_hyp_mode();
 		if (err) {
 			kvm_err("Failed to finalize Hyp protection\n");
-			goto out_hyp;
+			goto out_subs;
 		}
 	}
 
@@ -2257,8 +2257,9 @@ int kvm_arch_init(void *opaque)
 
 	return 0;
 
-out_hyp:
+out_subs:
 	hyp_cpu_pm_exit();
+out_hyp:
 	if (!in_hyp_mode)
 		teardown_hyp_mode();
 out_err:
-- 
2.38.1.431.g37b22c650d-goog

