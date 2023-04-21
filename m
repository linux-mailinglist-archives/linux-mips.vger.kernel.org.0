Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69ED96EAFC9
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 18:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbjDUQzB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 12:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233340AbjDUQyh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 12:54:37 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70D7903E
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 09:54:21 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-63b54cd223dso2758504b3a.1
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 09:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682095999; x=1684687999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDUI7xCr7dWf/FkK1CK1yXAqGXh9n1NZNFj54qb+KHU=;
        b=xTDct9zxZ9N8ALbPUp/viW7lM9BRRuwGhBUMNIpBcky3DENAIpUsYaKC4hxy6ElANa
         XJM0ALn9fzQGXWa5TwxvUayRtY+2kF+0hSFrS4Z13rLNDvpjdJ1bTkvnlg/aszqM3kw6
         JwtYRMMCwqvts/H9WPbPOWtINNCHPcx52iHlR+Mni7gOLO5npE1/M3beOvxeJdJAoVtK
         oYpcB0E2UWuNNPfDE3N6K7L1PsDilnRRB45iG1BH2Hs9bkLyvvb6zqJnC7OL6glGnKD+
         tqNazVeTkEV+I2VUzEqOogcJ5o+xCg88TmCeF1jcEtkdTpDT5v8zElAEZqy2mA1rdmJ4
         ZLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095999; x=1684687999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDUI7xCr7dWf/FkK1CK1yXAqGXh9n1NZNFj54qb+KHU=;
        b=QSrYGV6EmMR2DTbp42gebD1MEw/T5Cl/r8l+CuNRSul5GhA+Olxs1qe/6W/0bBqn6B
         E6plUI8YuVT2AvZsm60m3DShojgZ+TkCz0K5VGFmKnnAd1Oc5tw1iZD5PwV8E8WUO+P8
         8cuDKoiTJK2WpHNgcIhiimBP/BenH5RQ6fa6vzv2it7lxKK46gRcl6b6SujP6wUUL6Dr
         C1rmwa3yyc1APn6QkXBcssPYoEWJf5z+nKX+4TEwf5AimIm+EQ8+GyIu8OOtGvjhnmWG
         3HN2NL9XT+KJl8TX6sTdOZBW+ukCBlA17rp6h+LitxDVQWuyz0DRCFCXUPNXv8w60a4f
         aDrw==
X-Gm-Message-State: AAQBX9eqeADC6xNVXhpFAOO6Hskr/T6TzB3FXJLELb2idqxQdi28VRiM
        orAPeZHJ4s+8iUdr6s3bSqb9unSz1RzS
X-Google-Smtp-Source: AKy350Y++Ixj3yZzgu1Tm9pviEO/066Z0jMSz5NI0cEsiZPMFyAUWWqVudz+4dZEwY3ZReh5ODp8Q4bxx5mF
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a05:6a00:134b:b0:63d:5dcd:bc06 with SMTP
 id k11-20020a056a00134b00b0063d5dcdbc06mr2146455pfu.5.1682095999596; Fri, 21
 Apr 2023 09:53:19 -0700 (PDT)
Date:   Fri, 21 Apr 2023 09:53:02 -0700
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230421165305.804301-1-vipinsh@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421165305.804301-7-vipinsh@google.com>
Subject: [PATCH 6/9] KVM: arm64: Correct the kvm_pgtable_stage2_flush() documentation
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

Remove _range suffix from kvm_pgtable_stage2_flush_range which is used
in documentation of kvm_pgtable_stage2_flush(). There is no function
named kvm_pgtable_stage2_flush_range().

Fixes: 93c66b40d728 ("KVM: arm64: Add support for stage-2 cache flushing in generic page-table")
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 4cd6762bda80..4cd62506c198 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -605,9 +605,8 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 bool kvm_pgtable_stage2_is_young(struct kvm_pgtable *pgt, u64 addr);
 
 /**
- * kvm_pgtable_stage2_flush_range() - Clean and invalidate data cache to Point
- * 				      of Coherency for guest stage-2 address
- *				      range.
+ * kvm_pgtable_stage2_flush() - Clean and invalidate data cache to Point of
+ *				Coherency for guest stage-2 address range.
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address from which to flush.
  * @size:	Size of the range.
-- 
2.40.0.634.g4ca3ef3211-goog

