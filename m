Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1FE863E4CD
	for <lists+linux-mips@lfdr.de>; Thu,  1 Dec 2022 00:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiK3XMx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Nov 2022 18:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiK3XMA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Nov 2022 18:12:00 -0500
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E6D975F1
        for <linux-mips@vger.kernel.org>; Wed, 30 Nov 2022 15:10:26 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id pi2-20020a17090b1e4200b0021834843687so3836789pjb.0
        for <linux-mips@vger.kernel.org>; Wed, 30 Nov 2022 15:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eiSwfPmu4ewAiGcYbvYY+86df6I0KPgxP3gGecAMxPE=;
        b=iL8L003XqB+GKgCwHArr5kcxs4MyewOQ/xo1XysK8lk71q/4iO5w3SKvia9KqD7amd
         nXu1/r0fblzdTNOJpq/EYl9gFk0lysyFVV/7oFccNNQgU1JhwDr1/0HsYHMNLSclslmA
         UAtezhSD+JCAni39XkYX4QGkvZksvWY0lR4tjm/jCfiuQLeieGvg5A3LN33ihkcJ66/D
         QbO+O4mX6xEZLgdpufHO4gE+50I1GNIH2gNitP+ZjnsiKLl2r5s0LRLVS15/Koi+mQZn
         TJODgWK9oIR1COz+tFiDAPrhXmMt5j7wHvbTN67IWmBvfAG9+GHxtj6LR7jSg7tvIMuj
         4E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiSwfPmu4ewAiGcYbvYY+86df6I0KPgxP3gGecAMxPE=;
        b=Dh27dL2Qc8rHbxKHboshru2WfOXk1GkvJ6z7k09vKxGvMhfs9GuGH7kh6t4lUDBYfl
         u7m+bHDp3+bk5PcTj7WVvs8c16FdQpByzHfy2yq4U6xJqLhytbiYHXdYdaoOxa2UEMSn
         hN/JjAbp0yYgr4H1OcQ4CR1lYscuDn12tUKCRhuQwxnp7hU1kdhiZXRaATG8m5FgbRfY
         KRusKQv1mdCA/a0x/6Whs6oduleRV8/KI58sBf3TgMM9f9eNa2lqISvzkoC+BN8qdHFD
         zSNA9rfiZFcZXy80uDkw+MXYAgMUUUiGKLZ1AMYHrSGxSdsCURkDhr3/ISuE4k9lmINf
         A2fw==
X-Gm-Message-State: ANoB5plpjIEFsjKkJHiwjraUuheyQ56z4uZD3s3UEZ/kziEfEvbzuxkF
        cSjT0i0M7ZKun6YFVVPMjas1tdDlquY=
X-Google-Smtp-Source: AA0mqf6KEmE4iPJ9U98BX162/oz5Lzb4cw+ziaGyrlJEvv/WGc/WSrrcrRcdtUijxIw8BMhf6X3VggubLl4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ce05:b0:219:23ea:b314 with SMTP id
 f5-20020a17090ace0500b0021923eab314mr23130247pju.230.1669849806254; Wed, 30
 Nov 2022 15:10:06 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed, 30 Nov 2022 23:09:01 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-18-seanjc@google.com>
Subject: [PATCH v2 17/50] KVM: arm64: Free hypervisor allocations if vector
 slot init fails
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
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Paul Durrant <paul@xen.org>
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
        linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>
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
index 07f5cef5c33b..fa986ebb4793 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2237,18 +2237,18 @@ int kvm_arch_init(void *opaque)
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
 
@@ -2262,8 +2262,9 @@ int kvm_arch_init(void *opaque)
 
 	return 0;
 
-out_hyp:
+out_subs:
 	hyp_cpu_pm_exit();
+out_hyp:
 	if (!in_hyp_mode)
 		teardown_hyp_mode();
 out_err:
-- 
2.38.1.584.g0f3c55d4c2-goog

