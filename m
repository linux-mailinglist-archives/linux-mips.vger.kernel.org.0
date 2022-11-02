Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B669E617233
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 00:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbiKBXXJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 19:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiKBXVx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 19:21:53 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0489425D5
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 16:20:05 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id q10-20020a170902f34a00b00186c5448b01so239800ple.4
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 16:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gDhPLBi4i5H6cHaf8a2jrjVYop+4Ek8Lw09caIJYwao=;
        b=TuudOMSXAL7adsZOBmgYh538VYcYhWF5nhP0M4YVJQfWwg0r4dUZ36mJ33yxVd2Fh8
         AhcLUX3yIkB9ibk1KInatQW3m5g/Xb1UjUv/pTYWyo/nNdUKM/jwJQkQp9VPPXPIpTse
         emwOM/6/Ktd+5NIL8TVzYVk2VxBsALjv/ypuxQqcHFi3jRRp2B55ZXqSfMnLEtC/HxSc
         stovQRZYEuaPtf2QjvJsPbzEyMHUcGd/vQxkSYwoxM9lz3prJOeJu1qYoXRdsdqvf9E7
         tjo5AfcasIg3m/lx8wa0nQ72JaxhhT6f9hdOGOiYZcTNcwLRRLBhpjRIkPPAdq+gGp5w
         JrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDhPLBi4i5H6cHaf8a2jrjVYop+4Ek8Lw09caIJYwao=;
        b=UBbYiHQfLKcqi7jGfhmgjjoSCtY4UU6numCk+/EnBhyz1iTdiRfyBQPtXQ6fQ9SHno
         IoiPPDX9YVmDwSp0z5at+Atrvss351kDfH5pPdXGOuL656RfZpqbGKKfKk2PHy3it0wU
         lU/4EGe8jqu337ur+VU6t3s6exQ48qu7BfXdJPjbTNEdFyR8nKUTXyr3VS4vr5WjOvve
         4oaU/zrJRLR9kDeRpv+mRinDWSOnFPPla0zz2726mrONsRhJ0F+ITfvF1pmfpI/tcDrX
         9cvptwt69QqeLLOsPAN9bhtjni+bRPjoJu0+QeOq816aSucDluNfOQf+oY4Zq/p0j5pP
         8saQ==
X-Gm-Message-State: ACrzQf1Zbdgtw8fsnq9Q5dPBbIzClzZJEoIHVSWOybt7e0nqQTerOWRD
        sC9ELt8JG7BfQ8R0UImWnc66PL+ZDOM=
X-Google-Smtp-Source: AMsMyM669E+APVVp8ZI0Da0e6lyqKNtrGNrgTK1Ki9ihR88cZjll+Sj6vtq7kMOQqNwb+vtNMKGRhrCtVeU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f28b:b0:186:b069:63fc with SMTP id
 k11-20020a170902f28b00b00186b06963fcmr27593726plc.38.1667431187773; Wed, 02
 Nov 2022 16:19:47 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed,  2 Nov 2022 23:18:47 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-21-seanjc@google.com>
Subject: [PATCH 20/44] KVM: MIPS: Setup VZ emulation? directly from kvm_mips_init()
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

Invoke kvm_mips_emulation_init() directly from kvm_mips_init() instead
of bouncing through kvm_init()=>kvm_arch_init().  Functionally, this is
a glorified nop as invoking kvm_arch_init() is the very first action
performed by kvm_init().

Emptying kvm_arch_init() will allow dropping the hook entirely once all
architecture implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mips.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index f0a6c245d1ff..75681281e2df 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1012,7 +1012,7 @@ long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 
 int kvm_arch_init(void *opaque)
 {
-	return kvm_mips_emulation_init();
+	return 0;
 }
 
 void kvm_arch_exit(void)
@@ -1636,6 +1636,10 @@ static int __init kvm_mips_init(void)
 	if (ret)
 		return ret;
 
+	ret = kvm_mips_emulation_init();
+	if (ret)
+		return ret;
+
 	ret = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 
 	if (ret)
-- 
2.38.1.431.g37b22c650d-goog

