Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A98C647656
	for <lists+linux-mips@lfdr.de>; Thu,  8 Dec 2022 20:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiLHTjU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Dec 2022 14:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiLHTjP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Dec 2022 14:39:15 -0500
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF2C7683B
        for <linux-mips@vger.kernel.org>; Thu,  8 Dec 2022 11:39:13 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id h185-20020a636cc2000000b0046fc6e0065dso1623565pgc.5
        for <linux-mips@vger.kernel.org>; Thu, 08 Dec 2022 11:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zPqhilQnjSVH+DKsiF3UuxsA3mWYraWvqkpSQiCn4mk=;
        b=iEvz84VootOQzL2fuUOye77ff0RBTUJwBPc/nCp9n7wqfMIJewYjnWs+e+UV8BdMIw
         elYqajuLHReDubNQsxzeD4LQOafn7i58BjesdxlcK+vzw+x1HQo9F7VP57LAnqtKoesr
         UywCJYsjvD0BlUoCSDFWtr6dHwgWaW3JtPzOAkFIkkT8WGiWMzZ2oAHhyStfBm7eJSsS
         38EqRrqfu/Bb+ppVcaHkYCPUXH92lKxDVFDbgcDFRtoe1sRIy80NzBB22C9JYr71mn8T
         A1Ozw0Mgmaj7KonevqN/mmVI3ivsgF7FtLFAmhFybNP5PHPBvBWnlJEVJf0pakv7c2rW
         r4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPqhilQnjSVH+DKsiF3UuxsA3mWYraWvqkpSQiCn4mk=;
        b=MbC3yq0M2CfAKnWyvqYLM9IrHEafx4ptzSXVncMpsvtVMy2/GbCxZIyg1aIH5R8b6o
         p/xqZVNuYbvZ5zMBTWOmoliH0zO6L6RSv2DoeYlqQvhooVZqdyZxiPnk0zmYHKUEHKJ2
         alJUHA/DIiDU2eT5C4qoPf2eQdahbctg47EGQz2FOs8jTRw2tpA2gO7GdjjViUuL4VEO
         it6n+mXXJekeMW8RSTZ+/CX2BoLqlq0prnkeUX6kYTX7ySz7vyab5fbjdpQIYtGCyYgz
         mjZJZKgqwxvAbi559NVkp0rCMQW7wj9QuRULmfXxzdDH2Fs7W9/Cnl69TcOa4/HsY1Mq
         Uqow==
X-Gm-Message-State: ANoB5plVfmBo6fULrSCmX8ufGUFYpIgADLPwJQqSqB/pQoVnyt1SwC6J
        I+5T7VMtyjT8dwUJVQ6tVxL4dxI0IHmwUw==
X-Google-Smtp-Source: AA0mqf7eM5A3bS0eYMJF7BGmyZN+evZ/sdXM528vLtaTteWzbjmMBYJhb583jjAiLFnL4yHJF6g542RYvvvpWw==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a05:6a00:1623:b0:577:4baf:f412 with SMTP
 id e3-20020a056a00162300b005774baff412mr10161002pfc.77.1670528352538; Thu, 08
 Dec 2022 11:39:12 -0800 (PST)
Date:   Thu,  8 Dec 2022 11:38:23 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-4-dmatlack@google.com>
Subject: [RFC PATCH 03/37] KVM: MMU: Move tdp_ptep_t into common code
From:   David Matlack <dmatlack@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Matlack <dmatlack@google.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nadav Amit <namit@vmware.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
        Colin Cross <ccross@google.com>,
        Hugh Dickins <hughd@google.com>,
        Ben Gardon <bgardon@google.com>,
        Mingwei Zhang <mizhang@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Ricardo Koller <ricarkol@google.com>,
        Jing Zhang <jingzhangos@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move the definition of tdp_ptep_t into kvm/mmu_types.h so it can be used
from common code in future commits.

No functional changed intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu_internal.h | 2 --
 include/kvm/mmu_types.h         | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index c19a80fdeb8d..e32379c5b1ad 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -44,8 +44,6 @@ extern bool dbg;
 #define INVALID_PAE_ROOT	0
 #define IS_VALID_PAE_ROOT(x)	(!!(x))
 
-typedef u64 __rcu *tdp_ptep_t;
-
 struct kvm_mmu_page {
 	/*
 	 * Note, "link" through "spt" fit in a single 64 byte cache line on
diff --git a/include/kvm/mmu_types.h b/include/kvm/mmu_types.h
index 3f35a924e031..14099956fdac 100644
--- a/include/kvm/mmu_types.h
+++ b/include/kvm/mmu_types.h
@@ -34,4 +34,6 @@ union kvm_mmu_page_role {
 
 static_assert(sizeof(union kvm_mmu_page_role) == sizeof_field(union kvm_mmu_page_role, word));
 
+typedef u64 __rcu *tdp_ptep_t;
+
 #endif /* !__KVM_MMU_TYPES_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog

