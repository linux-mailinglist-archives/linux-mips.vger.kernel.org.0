Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C58E7206F5
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jun 2023 18:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236673AbjFBQKC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jun 2023 12:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236803AbjFBQJv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jun 2023 12:09:51 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB25910DA
        for <linux-mips@vger.kernel.org>; Fri,  2 Jun 2023 09:09:38 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5693861875fso24476467b3.1
        for <linux-mips@vger.kernel.org>; Fri, 02 Jun 2023 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722178; x=1688314178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NyrihgmYesBmBKLp4ITVdJ3LGNh6LVDPlJHbJ3BWmKo=;
        b=6JvB68luEiFeoyKEfjP/g+vMwC/sRddTQaYllS5g+5bpQDmhXIgwwZiHHiYhNY6/hh
         +N3LQSiNtnyna/XZaiM18ivCXXQ4yuX/15A1AGZwy0Qa/f1hIAf3oKXB2h5AuHkYQgCs
         xj8Y82H0f8TZvkTqQ0Hx5MWBndbNiI7NCzZ3czEuYGWHs7LAUCirzskxbkVOl+noMZFx
         tm27fSCTKAwfbeEstcfEbI/nW6D9qAihf0lb2MdszgnmyhfNayDhGNG1boLJ+W+UNY9A
         PKxN0bCcFoMuNsJAFUnK+mzP9snrdOrZPjuzoVjhjXEuIkdNPWm6zU7rdhcbdNuxMxHK
         DaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722178; x=1688314178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyrihgmYesBmBKLp4ITVdJ3LGNh6LVDPlJHbJ3BWmKo=;
        b=M3A4QsrxjWunQvbF6xUCmp6kRUhwCecUpNcbEpQt0SX9iuIAbOf3nmDcppYcYphOvD
         OAcxocE3G8+a2arkszRVhi6b7uPXkfwGIkvuotA7fP+TD74URwwM6XRyJH2L2EgyOq8f
         wdGEJiU3px4T6FVnXFSn5OChvbERd6JKNvdjWgns8f/7mjRvbevnqzmgrOIudpXcVYAD
         hFvVbSmLRDxTUf8Y9LCE2ZQH8ilyspzSb53kvQbFOALC5cYPN2knSv82/L0t5uKARuvr
         0agD86z1XJPQJYXk2NRY7rpK1j4Q1/QYp2i9iuiTnM9Aglo7d5ZmqwNAJdobKIUpaQH/
         8rXg==
X-Gm-Message-State: AC+VfDxPgqEHzKHeT1jVrQVzr8zEjqVqn1+Bvd/a7bfm9EEqMZNg2vWq
        gYyyswBxVSv0NKaRDwjNQHEOdLvjw5yD
X-Google-Smtp-Source: ACHHUZ7z74Jy0Y96qFW+7u40ZiTgX4ucCC/5bWAvnbf5ZGF1cU7Xjv0z02cQ2QpbWgJAAII5qTnOdyVeR9zk
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a81:b620:0:b0:561:b8d1:743b with SMTP id
 u32-20020a81b620000000b00561b8d1743bmr170869ywh.10.1685722178126; Fri, 02 Jun
 2023 09:09:38 -0700 (PDT)
Date:   Fri,  2 Jun 2023 09:09:07 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-10-vipinsh@google.com>
Subject: [PATCH v2 09/16] KVM: arm64: Document the page table walker actions
 based on the callback's return value
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document what the page table walker do when walker callback function returns
a value.

Current documentation is not correct as negative error of -EAGAIN on a
non-shared page table walker doesn't terminate the walker and continues
to the next step.

There might be a better place to keep this information, for now this
documentation will work as a reference guide until a better way is
found.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 8ef7e8f3f054..957bc20dab00 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -711,8 +711,19 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * after invoking the walker callback, allowing the walker to descend into
  * a newly installed table.
  *
- * Returning a negative error code from the walker callback function will
- * terminate the walk immediately with the same error code.
+ * Depending on the return value from the walker callback function, the page
+ * table walk will continue or exit the walk. This is also dependent on the
+ * type of the walker, i.e. shared walker (vCPU fault handlers) or non-shared
+ * walker.
+ *
+ * Walker Type  | Callback         | Walker action
+ * -------------|------------------|--------------
+ * Non-Shared   | 0                | Continue
+ * Non-Shared   | -EAGAIN          | Continue
+ * Non-Shared   | Any other        | Exit
+ * -------------|------------------|--------------
+ * Shared       | 0                | Continue
+ * Shared       | Any other        | Exit
  *
  * Return: 0 on success, negative error code on failure.
  */
-- 
2.41.0.rc0.172.g3f132b7071-goog

