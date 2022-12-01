Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6C663E50C
	for <lists+linux-mips@lfdr.de>; Thu,  1 Dec 2022 00:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbiK3XPD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Nov 2022 18:15:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiK3XOJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Nov 2022 18:14:09 -0500
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4907DA1A03
        for <linux-mips@vger.kernel.org>; Wed, 30 Nov 2022 15:11:01 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id a3-20020a17090a8c0300b00218bfce4c03so3812344pjo.1
        for <linux-mips@vger.kernel.org>; Wed, 30 Nov 2022 15:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sHcyHjJ8KuW26EmyMG2GCKXDxJlY2ojJURA0kcfw/9k=;
        b=VFFqhuPme1m1eQU16n2iG/J4RAGy2zrHzndrwcDa2UqPCuhmGJAJUoqWiUJ0hBawNj
         h+1PCcwEa7TWtGKSi7eE+1ph58rOUBv3xDHOkx/n95w6cUeiQfhXEh79gM7EIyUtnO0y
         ioN8O+FtRJeTVR0iP2uSqqMMZ5ce7bBX8TmoSKstA2185sSr20JSkv0QaUPbyNWz1HPN
         V+igGOZxxi1EiiIK8zOP02RlczC9ypmTY7mqbv223oTCKi8YwUrElYdikisBH1Zh971w
         Fr2k5IgU2gcv415RYRumMziSQSo+TFWu1mQkGuJbocDRmVfBg+o1I6JFksOzDsAHNWBN
         gCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHcyHjJ8KuW26EmyMG2GCKXDxJlY2ojJURA0kcfw/9k=;
        b=kzdJ51LemOBxpgsJoKhTUoYnkRnBNs7iH4ZiXKGkIozEOEBTrTIamtWJQiRaNv95aI
         3eq1l2cpGUDELO1gliCTX6s23N2Jy7/nQzDnmUbsZCINPWPI4SfV4ikNZ9nIiGQ0UPql
         1agyS+F7BY5Nsg/OX8jRvpTKdZ7TfNZovR5zRv/ZV1m+0qc6Bvb3CEeXZ+XQbZukuflR
         dKIBLe0itTG4KGYlBOKss3HxctD+EwhAfWrp4DAfL3KdTwmpEM67DJdhN764wSQTOrOh
         hOFFQf8LxNqy62sLYp6zHPlkfNBrkB838oOcwTo5uRuOxLayV+18Gc94ssKHfHdiZ2Te
         ZFxw==
X-Gm-Message-State: ANoB5pkDGiOPawyNeXDQZGpGRzrI3JKBtFvkb8gmR67P+U4deMkVygF7
        mTL42CXeE73Uv/xbUDX5H+hxW5fFQLY=
X-Google-Smtp-Source: AA0mqf6iPCX6KyjCp3cF1IRt5Mv13lZJWlEm0jsHehxUqphsE1Cogz37ZNgUSTWxB9XNJiT56sIeMfxkVVA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:63d8:0:b0:477:172b:c350 with SMTP id
 n24-20020a6563d8000000b00477172bc350mr40707643pgv.313.1669849838234; Wed, 30
 Nov 2022 15:10:38 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed, 30 Nov 2022 23:09:19 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-36-seanjc@google.com>
Subject: [PATCH v2 35/50] KVM: VMX: Use current CPU's info to perform
 "disabled by BIOS?" checks
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

Use this_cpu_has() instead of boot_cpu_has() to perform the effective
"disabled by BIOS?" checks for VMX.  This will allow consolidating code
between vmx_disabled_by_bios() and vmx_check_processor_compat().

Checking the boot CPU isn't a strict requirement as any divergence in VMX
enabling between the boot CPU and other CPUs will result in KVM refusing
to load thanks to the aforementioned vmx_check_processor_compat().

Furthermore, using the boot CPU was an unintentional change introduced by
commit a4d0b2fdbcf7 ("KVM: VMX: Use VMX feature flag to query BIOS
enabling").  Prior to using the feature flags, KVM checked the raw MSR
value from the current CPU.

Reported-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index e859d2b7daa4..3f7d9f88b314 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2492,8 +2492,8 @@ static __init int cpu_has_kvm_support(void)
 
 static __init int vmx_disabled_by_bios(void)
 {
-	return !boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
-	       !boot_cpu_has(X86_FEATURE_VMX);
+	return !this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
+	       !this_cpu_has(X86_FEATURE_VMX);
 }
 
 static int kvm_cpu_vmxon(u64 vmxon_pointer)
-- 
2.38.1.584.g0f3c55d4c2-goog

