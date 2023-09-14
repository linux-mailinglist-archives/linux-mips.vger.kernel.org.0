Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A1079F6C7
	for <lists+linux-mips@lfdr.de>; Thu, 14 Sep 2023 03:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234077AbjINB4V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Sep 2023 21:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234152AbjINB4B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Sep 2023 21:56:01 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7A5210E
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 18:55:44 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d7e8e12df78so539514276.3
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 18:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656544; x=1695261344; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5olfKKfAgOBEIWorNeGA6oMvbpwHV/k+KeYKQRUdq04=;
        b=bdIMT7k5UpwL0z+XvScHcf9jpYN5+dVi5xzFu2O9MWIMM32oAqzM4KN8XykaM16YUY
         YzvZruztiA1/vZf9OVN4agBdyBZdVJTRdZsLki+sc0NJ/iTeGg4HJx7Fz5o4p9z1qrMH
         sNAU5f5GrWFx3jgKckDFayc2lvRg3R08qo7wl+R40CLvXsPK0E9+KoamWo7PO3XnEmjc
         jNgIPGBPFoX5C5cWybiYlObLpUam/IHDObmiBrAQsWahbH1j0lv6H5AmJbhXuP6FVAqQ
         vP/oeOfpaTVLYk9IHWTWHxkne3AuKTv2FkpHSLunQI9BfcDIgV8bYjVSJcTg5zFk3CTb
         0yYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656544; x=1695261344;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5olfKKfAgOBEIWorNeGA6oMvbpwHV/k+KeYKQRUdq04=;
        b=MnLVyd+DKCf/RzjJ6D3hyTfXC+f6Qn3uHebXzRslfB010IagKC5Y/j0+JQ9lm1Ys/U
         pNTD7M4qXl6US7YkozqMz4zHwCLD55zDwCjELzVxBgdW9/n6dmPNDlAgEGCLCGDjrhL0
         MJiAIEQA5sQ8jvRhEDuKYim24NlgO9HKO8yKSWdc5p2IV6a0KJvMwpp3hE5fZtelYHjf
         5Jnng/M15TDIwfwCZuGPuJe1tJt6Sb+Vswwihw3Ok09fRCE7/f+vUyboZKf4zqQ8hlbQ
         naHePIKlQSLZCMon4ZkEM+a1URjpKWXhrhp/AQPps8h+ZvtzI0snMYSQMnMq5+D8jY6i
         whOQ==
X-Gm-Message-State: AOJu0YzzmCSfO8WyW0HTdh2QlGwdHwuB2tVu8HH5+WZs01PHldFknGfC
        YWZ02AJ9N7gfn8kyWybl3rzcOUPK+JA=
X-Google-Smtp-Source: AGHT+IFAWDIKY3pID0CrDZgtjj2bXptPteu0k42w51y6Ps+oH46knUj2OnzhEQTEbd0IbAu5MzXei5K4JBI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:684:b0:d81:8e4d:b681 with SMTP id
 i4-20020a056902068400b00d818e4db681mr15248ybt.12.1694656543919; Wed, 13 Sep
 2023 18:55:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed, 13 Sep 2023 18:55:02 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-5-seanjc@google.com>
Subject: [RFC PATCH v12 04/33] KVM: PPC: Return '1' unconditionally for KVM_CAP_SYNC_MMU
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Advertise that KVM's MMU is synchronized with the primary MMU for all
flavors of PPC KVM support, i.e. advertise that the MMU is synchronized
when CONFIG_KVM_BOOK3S_HV_POSSIBLE=y but the VM is not using hypervisor
mode (a.k.a. PR VMs).  PR VMs, via kvm_unmap_gfn_range_pr(), do the right
thing for mmu_notifier invalidation events, and more tellingly, KVM
returns '1' for KVM_CAP_SYNC_MMU when CONFIG_KVM_BOOK3S_HV_POSSIBLE=n
and CONFIG_KVM_BOOK3S_PR_POSSIBLE=y, i.e. KVM already advertises a
synchronized MMU for PR VMs, just not when CONFIG_KVM_BOOK3S_HV_POSSIBLE=y.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/powerpc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index b0a512ede764..8d3ec483bc2b 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -635,11 +635,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 #if !defined(CONFIG_MMU_NOTIFIER) || !defined(KVM_ARCH_WANT_MMU_NOTIFIER)
 		BUILD_BUG();
 #endif
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-		r = hv_enabled;
-#else
 		r = 1;
-#endif
 		break;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	case KVM_CAP_PPC_HTAB_FD:
-- 
2.42.0.283.g2d96d420d3-goog

