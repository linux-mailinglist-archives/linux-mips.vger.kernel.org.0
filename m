Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41E5464768C
	for <lists+linux-mips@lfdr.de>; Thu,  8 Dec 2022 20:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiLHTkG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Dec 2022 14:40:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiLHTjt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Dec 2022 14:39:49 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033931AA30
        for <linux-mips@vger.kernel.org>; Thu,  8 Dec 2022 11:39:35 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-360b9418f64so24735187b3.7
        for <linux-mips@vger.kernel.org>; Thu, 08 Dec 2022 11:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9RmR6EwIqCFDBLvxI6selt5ga3zw1fPd7MYyun7sh04=;
        b=pUH2F0cXu3WIGRD2ce8NSaVZncsouuIq0PwSt3Hx5XNNzUTAHyLwoPUZmYYFi5CtSP
         nVhq3u0B+puFODMcSNnljB/IQui4QQoBBoT7VK2vjldq5K0TcwfXSpD6l8CQHX5MJLf1
         +ObCB8QWeBiWlCf7gO5CWF4MLRqEya3iXno1lfQYF2S+3pFzK9GESTP8LV94Jcgc/kmm
         DGrmedpnRTomnz9+8f0JJ8smD91kG4llzTsIt3IMmR0C9KC9suLzy6zk0g20DYlyZJGB
         ATs/tP0070Y72621Cd+brELKn4hhj6+ekuepajebi56ZFA2sqrDn/ZHk1U80/2BWwxTx
         E8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RmR6EwIqCFDBLvxI6selt5ga3zw1fPd7MYyun7sh04=;
        b=6YRU8tOWp1JbL6MHBwJfDjrWWhYapKYoUsLyn7s08d5Av6sLMUCmhEYnMRB+eXzcFn
         0eVox78jh9gCfD3YevrRi6jYIGTpRlwQV/eNUROgoLLIYm2WXwQvLaPJHTCIIRopuaen
         V1NPCzlvkmw84cEunVrlPox5QOK/QoMgUsNHok50+vs2VFVJ9rXbKpAF7NOkILCrWUwZ
         eI/nGYFc+rUeFU/GmHnAdWx5kpiA+Twb357nHLvUdXokuhNFycBpC4HlWmWysel5tpP9
         BC40P9zZ7BOTeSGI8vheL2qlPEmo9TR4gh/OTEr5NNXbi20Z66hTKQgVIocSVZKEXDAY
         NfOA==
X-Gm-Message-State: ANoB5pnzauRKWUTFmOiluLX3UnIYLswqGlc09OTeTbp68b/QfJvcytaR
        2VHg0xrbbetLNPVIfSErQxeGLzNyxis6Qg==
X-Google-Smtp-Source: AA0mqf7cV11l2t3OM7agzc6qRsrai4lnDlxSMNa6gi84ZckjSbH/wAyvmmZJEJroavTOpSqZ0tfjElEm8egcuA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:d9c1:0:b0:6fd:d054:a0a7 with SMTP id
 q184-20020a25d9c1000000b006fdd054a0a7mr25462879ybg.112.1670528375112; Thu, 08
 Dec 2022 11:39:35 -0800 (PST)
Date:   Thu,  8 Dec 2022 11:38:37 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-18-dmatlack@google.com>
Subject: [RFC PATCH 17/37] KVM: Move struct kvm_gfn_range to kvm_types.h
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
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move struct kvm_gfn_range to kvm_types.h so that it's definition can be
accessed in a future commit by arch/x86/include/asm/kvm/tdp_pgtable.h
without needing to include the mega-header kvm_host.h.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h  | 7 -------
 include/linux/kvm_types.h | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 22ecb7ce4d31..469ff4202a0d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -256,13 +256,6 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
 #ifdef KVM_ARCH_WANT_MMU_NOTIFIER
-struct kvm_gfn_range {
-	struct kvm_memory_slot *slot;
-	gfn_t start;
-	gfn_t end;
-	pte_t pte;
-	bool may_block;
-};
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 59cf958d69df..001aad9ea987 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -132,4 +132,12 @@ struct kvm_vcpu_stat_generic {
 
 #define KVM_STATS_NAME_SIZE	48
 
+struct kvm_gfn_range {
+	struct kvm_memory_slot *slot;
+	gfn_t start;
+	gfn_t end;
+	pte_t pte;
+	bool may_block;
+};
+
 #endif /* __KVM_TYPES_H__ */
-- 
2.39.0.rc1.256.g54fd8350bd-goog

