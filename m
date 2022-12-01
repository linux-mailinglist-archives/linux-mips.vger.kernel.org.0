Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953C963E474
	for <lists+linux-mips@lfdr.de>; Thu,  1 Dec 2022 00:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiK3XKW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Nov 2022 18:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiK3XKD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Nov 2022 18:10:03 -0500
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BAC975E6
        for <linux-mips@vger.kernel.org>; Wed, 30 Nov 2022 15:09:48 -0800 (PST)
Received: by mail-pj1-x1049.google.com with SMTP id pq17-20020a17090b3d9100b0020a4c65c3a9so203138pjb.0
        for <linux-mips@vger.kernel.org>; Wed, 30 Nov 2022 15:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QlJvPwjggaoIvKlYM82YemehOzmoztqkkgxFsX+UpR8=;
        b=T6DVUHgDiyaylj8jeyRc/tJaTPsEr56sFr6JiiJRfSgSRo4JFqx/NfTBtkGCflU1T7
         GmuQ0fJ2MLIx5SmWh7sz9Aupssh3H218XdF/xeVe4kwLx4dVNwO7NE6dtVecycuMR5h8
         hR5EaWsYFF9XRSIsck9agUPNZK/p+WoiJvAdnD8SuIwugfV9C29gWgEeXNNCOEGguRb0
         XjIfVg1fZ984NsiEdqOG53u7zIAyct6pqlzwtwTUD+/QpAUDoczJMloj4YeV6uaJ57LY
         pm1/ZmMCMtVst2hZA3dRvqmU4AoS7D9glw2GuspqwXSz0dSJzOpa3Jh+TkIBwm3FDrfG
         N1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlJvPwjggaoIvKlYM82YemehOzmoztqkkgxFsX+UpR8=;
        b=1+Dusexs0VKKeHc1W7PtqxGhToceM2db4UmC3ZHkDqXUOcwsgqzIIoXC5Szb4ghvZu
         9UEZYWqH1xUnKD6SvGAbuPAWeAUiXFEY6c40GZ/MCPOwuS7xYbUMjhf1gl16IULenb+e
         aohqEP9CJlkunYLZjnKuDNh9dHjKQiXW4dpcVBTvOOasMmM9bX8FFogOMvNxfZ/FhnT/
         58gl6mxI6dcCx1s9TuJkc25FBUlaRnZ1K0DnwP7X6XBHOVKjPWg4BlmKy9IM8gPHTSav
         XNb7Np6uKWiZMwuNTlI7Ua4sexMaJUAuygdpaKOcMG11Hkj29f5QaLsI/Ti5W/uWWJ0k
         wE8g==
X-Gm-Message-State: ANoB5pmO9zgJnXs0gFYeQaNVEcWfRct/c6VvQr4hL/V1taJvNQkrNQs1
        tNP9j6XUZ2uEOyTAKcnNQUWnoxOFG3A=
X-Google-Smtp-Source: AA0mqf44tW9GDP3EkdJH7xw0iZ70GDsfIH9r2lh+gXnuxkKZzS4e7JkPFcOIgykrnjSYDs+Xry7x+GKdL/s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:3084:0:b0:56d:dd2a:c494 with SMTP id
 w126-20020a623084000000b0056ddd2ac494mr44471552pfw.76.1669849787908; Wed, 30
 Nov 2022 15:09:47 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed, 30 Nov 2022 23:08:50 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-7-seanjc@google.com>
Subject: [PATCH v2 06/50] KVM: s390: Move hardware setup/unsetup to init/exit
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

Now that kvm_arch_hardware_setup() is called immediately after
kvm_arch_init(), fold the guts of kvm_arch_hardware_(un)setup() into
kvm_arch_{init,exit}() as a step towards dropping one of the hooks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 arch/s390/kvm/kvm-s390.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 221481a09742..97c7ccd189eb 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -331,21 +331,12 @@ static struct notifier_block kvm_clock_notifier = {
 
 int kvm_arch_hardware_setup(void *opaque)
 {
-	gmap_notifier.notifier_call = kvm_gmap_notifier;
-	gmap_register_pte_notifier(&gmap_notifier);
-	vsie_gmap_notifier.notifier_call = kvm_s390_vsie_gmap_notifier;
-	gmap_register_pte_notifier(&vsie_gmap_notifier);
-	atomic_notifier_chain_register(&s390_epoch_delta_notifier,
-				       &kvm_clock_notifier);
 	return 0;
 }
 
 void kvm_arch_hardware_unsetup(void)
 {
-	gmap_unregister_pte_notifier(&gmap_notifier);
-	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
-	atomic_notifier_chain_unregister(&s390_epoch_delta_notifier,
-					 &kvm_clock_notifier);
+
 }
 
 static void allow_cpu_feat(unsigned long nr)
@@ -525,6 +516,13 @@ int kvm_arch_init(void *opaque)
 	if (rc)
 		goto err_gib;
 
+	gmap_notifier.notifier_call = kvm_gmap_notifier;
+	gmap_register_pte_notifier(&gmap_notifier);
+	vsie_gmap_notifier.notifier_call = kvm_s390_vsie_gmap_notifier;
+	gmap_register_pte_notifier(&vsie_gmap_notifier);
+	atomic_notifier_chain_register(&s390_epoch_delta_notifier,
+				       &kvm_clock_notifier);
+
 	return 0;
 
 err_gib:
@@ -541,6 +539,11 @@ int kvm_arch_init(void *opaque)
 
 void kvm_arch_exit(void)
 {
+	gmap_unregister_pte_notifier(&gmap_notifier);
+	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
+	atomic_notifier_chain_unregister(&s390_epoch_delta_notifier,
+					 &kvm_clock_notifier);
+
 	kvm_s390_gib_destroy();
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
 		kvm_s390_pci_exit();
-- 
2.38.1.584.g0f3c55d4c2-goog

