Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52FCD720720
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jun 2023 18:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbjFBQLP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jun 2023 12:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236803AbjFBQK6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jun 2023 12:10:58 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E62A1BC
        for <linux-mips@vger.kernel.org>; Fri,  2 Jun 2023 09:10:13 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-65252a80823so833193b3a.1
        for <linux-mips@vger.kernel.org>; Fri, 02 Jun 2023 09:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722192; x=1688314192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pnaTvciscS5chSJrFdy/XWmGw+v5DL+sKG313yn6vtE=;
        b=3qM+gPLnKOcFkte53nrFJ4yxYHfRvj6VAQ74elJ+qIzLMj97WYlQnMm+LRqHDvoho4
         8AW7RUIjuOvTDqJRc6MGpLfknZTHUVt0ac+jf1e4fznmqTNQB1YeAez2Pbf+vu4gX/wo
         xA9uw3YiFJ59xCiKuG3PqvgkOpwn1kfOyfDGnV3P6/41gfMjzqB9OHhb0wbZKNfck3ux
         QuubqPWPIMr2dr+usJ/0oHW/nWAg0PkVCfHTFjYBlz4FbohVSt4JZLXej+/lCcVIkw51
         dikq26nIlv8414HoG8qlckcW0gk8fed5eU7B/bJPELllDOCa6K4cYwpu/yZBPdgX/sdW
         NMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722192; x=1688314192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnaTvciscS5chSJrFdy/XWmGw+v5DL+sKG313yn6vtE=;
        b=WVwVIrxdsDU8L+tVyDUVLRkRBxQVjq+VB9rUNUFv6A5RXykUEAQmsnKAjPBshJnOJD
         ylqdIHmeyYf9SZsgAUFtbmk7rBgA2SmHViYaYpqepO8CJ8jzuhRc5LEi5bO8XzaUfkYe
         yb7X3COZEO7rnI121DUlcpAbLEtVPrU787Zmb4utrM4XC3qjo1iHdNF7r7n0/GyS7aw5
         BSal6eeQe/XZlCZHQUkrPoVd7K7C6dNtT1N/PUFsSvYQYjDLnXv6Tfj9btKyBErKvWMl
         DObM723nf2XrPyIZrUT9ZbVS+p41AiD73SjYU1gXlpqa1LiZ4qWBlkcFND02Ve031qro
         aKYQ==
X-Gm-Message-State: AC+VfDzD1cuya1nwArjDG+cPzNUJ7vrYokO/eaf8vDkNE0U6qQD5MCDN
        RSXjcE6gbVGhb2x21DsCoJPc0zI1jAEV
X-Google-Smtp-Source: ACHHUZ7CrgQcXBBk0scZtBwPutYqwQ0i1jeHWFv03iHedZStcHfAHgjqtsGQJinldbGkFtIY3nwdqwhDBsPu
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a05:6a00:2e1a:b0:64f:9e1b:d4a8 with SMTP
 id fc26-20020a056a002e1a00b0064f9e1bd4a8mr4922796pfb.1.1685722192061; Fri, 02
 Jun 2023 09:09:52 -0700 (PDT)
Date:   Fri,  2 Jun 2023 09:09:14 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-17-vipinsh@google.com>
Subject: [PATCH v2 16/16] KVM: arm64: Split huge pages during clear-dirty-log
 under MMU read lock
From:   Vipin Sharma <vipinsh@google.com>
To:     maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com,
        suzuki.poulose@arm.com, yuzenghui@huawei.com,
        catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
        aleksandar.qemu.devel@gmail.com, tsbogend@alpha.franken.de,
        anup@brainfault.org, atishp@atishpatra.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, seanjc@google.com, pbonzini@redhat.com,
        dmatlack@google.com, ricarkol@google.com
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Split huge pages under MMU read lock instead of write when clearing
dirty log.

Running huge page split under read lock will unblock vCPUs execution and
allow whole clear-dirty-log operation run parallelly to vCPUs.

Note that splitting huge pages involves two walkers. First walker calls
stage2_split_walker() callback on each huge page. This callback will call
another walker which creates an unlinked page table. This commit makes
first walker as shared page walker which means, -EAGAIN will be retried.
Before this patch, -EAGAIN would have been ignored and walker would go
to next huge page. In practice this would not happen as the first walker
was holding MMU write lock. Inner walker is unchanged as it is working
on unlinked page table so no other thread will have access to it.

To improve confidence in correctness tested via dirty_log_test.

To measure performance improvement tested via dirty_log_perf_test.

Set up:
-------
Host: ARM Ampere Altra host (64 CPUs, 256 GB memory and single NUMA
      node)

Test VM: 48 vCPU, 192 GB total memory.

Ran dirty_log_perf_test for 400 iterations.
 ./dirty_log_perf_test -k 192G -v 48 -b 4G -m 2 -i 4000 -s anonymous_hugetlb_2mb -j

Observation:
------------

+==================+=============================+===================+
| Clear Chunk size | Clear dirty log time change | vCPUs improvement |
+==================+=============================+===================+
| 192GB            | 56%                         | 152%              |
+------------------+-----------------------------+-------------------+
| 1GB              | -81%                        | 72%               |
+------------------+-----------------------------+-------------------+

When larger chunks are used, clear dirty log time increases due to lots
of cmpxchg() but vCPUs are also able to execute parallelly causing
better performance of guest.

When chunk size is small, read lock is very fast in clearing dirty logs
as it is not waiting for MMU write lock and vCPUs are also able to run
parallelly.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/mmu.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6dd964e3682c..aa278f5d27a2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -126,7 +126,10 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 	int ret, cache_capacity;
 	u64 next, chunk_size;
 
-	lockdep_assert_held_write(&kvm->mmu_lock);
+	if (flags & KVM_PGTABLE_WALK_SHARED)
+		lockdep_assert_held_read(&kvm->mmu_lock);
+	else
+		lockdep_assert_held_write(&kvm->mmu_lock);
 
 	chunk_size = kvm->arch.mmu.split_page_chunk_size;
 	cache_capacity = kvm_mmu_split_nr_page_tables(chunk_size);
@@ -138,13 +141,19 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 
 	do {
 		if (need_split_memcache_topup_or_resched(kvm)) {
-			write_unlock(&kvm->mmu_lock);
+			if (flags & KVM_PGTABLE_WALK_SHARED)
+				read_unlock(&kvm->mmu_lock);
+			else
+				write_unlock(&kvm->mmu_lock);
 			cond_resched();
 			/* Eager page splitting is best-effort. */
 			ret = __kvm_mmu_topup_memory_cache(cache,
 							   cache_capacity,
 							   cache_capacity);
-			write_lock(&kvm->mmu_lock);
+			if (flags & KVM_PGTABLE_WALK_SHARED)
+				read_lock(&kvm->mmu_lock);
+			else
+				write_lock(&kvm->mmu_lock);
 			if (ret)
 				break;
 		}
@@ -1139,9 +1148,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 
 	read_lock(&kvm->mmu_lock);
 	stage2_wp_range(&kvm->arch.mmu, start, end, KVM_PGTABLE_WALK_SHARED);
-	read_unlock(&kvm->mmu_lock);
 
-	write_lock(&kvm->mmu_lock);
 	/*
 	 * Eager-splitting is done when manual-protect is set.  We
 	 * also check for initially-all-set because we can avoid
@@ -1151,8 +1158,8 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	 * again.
 	 */
 	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-		kvm_mmu_split_huge_pages(kvm, start, end, 0);
-	write_unlock(&kvm->mmu_lock);
+		kvm_mmu_split_huge_pages(kvm, start, end, KVM_PGTABLE_WALK_SHARED);
+	read_unlock(&kvm->mmu_lock);
 }
 
 static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
-- 
2.41.0.rc0.172.g3f132b7071-goog

