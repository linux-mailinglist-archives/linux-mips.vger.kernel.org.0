Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46EDD7786BA
	for <lists+linux-mips@lfdr.de>; Fri, 11 Aug 2023 06:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbjHKEwH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Aug 2023 00:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233527AbjHKEvq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Aug 2023 00:51:46 -0400
Received: from mail-oa1-x49.google.com (mail-oa1-x49.google.com [IPv6:2001:4860:4864:20::49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3772D62
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 21:51:44 -0700 (PDT)
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-1c2560123f3so166849fac.1
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 21:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729504; x=1692334304;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OIa9YyTqwhNrd4vOTw3RHcrRyaG5nOQ7ik48y43Y4K8=;
        b=svuT6WkKlP0CJcBY9yHu6f0ZIVXj+TBAwFC4vkyG4qte4KX/hQhTloOdeOotpgH1+T
         DXpyYVGUloxDx92v1VAZ665bF3PzFTvuogex9H+ez+4kOcSEs1NpPoKrr5j/QVd2rwl6
         g2f9NRZm1/rbKvT/4R6+hin2d0V69Zt6Nx474DYbJlUKYFarceVSUjKNMNT4xaVAyiPS
         urZw2SxeG19jsWZAnALLEXkBB/2p9q8lAuwOxHwws4YfL9owdTZpPTLkoayBgxmdvQOR
         pgBNB6+4Kx/FfI/gTiUIZ6F5vL9QrNKLOP24qyMOVlYGOsPi0f18WfZOnb7/7uRUapaO
         9pDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729504; x=1692334304;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIa9YyTqwhNrd4vOTw3RHcrRyaG5nOQ7ik48y43Y4K8=;
        b=iwSHyW2dLYhB234gB15/lwPwkDYzaashiaNam+6SSu9jCbcpzzUaLpk7LNguHGoj58
         NtT/Zr8Cct6R3AjsOjMbnfCqWFi2yvOIwRMBdSis0negG4eJLNUZXq4kw6+GlvAe0SU9
         xX2gqyiorH0Okg9M4Lhs0cXqK8J5ulfnrjuuBimOHUH7dOi3M1TzCmLxJag5fjoNCkQf
         zLRLLQOZw58ydzC3I9JJ6E3/493L93HbFIAlSxkX0P7/P6KRDu0OU1B2nAQokE34GaZH
         I0gOpPnriK2VAF9ybFZc7y4Rrv9hyBj1Bw74rEorGbUBbvaC03gMPS8EqB8pM+67pJUQ
         xilA==
X-Gm-Message-State: AOJu0Yxh3uKfEqeIp4fnea3VFqA1JRUqL5sZQW6Zgy7/VVzEAjRfoaQ8
        dardlhu2lRJsQ3BdTcRPNEm4SEVR/Yye
X-Google-Smtp-Source: AGHT+IESE8XY2qQ2H+qcMtIVXtwq5XJmfXR57n+CPxM8RC3XV+4+ZlJZGDmVohMH8Hvnfx7qNufXK5PRnARF
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6870:8c32:b0:1bb:7b48:32ab with SMTP
 id ec50-20020a0568708c3200b001bb7b4832abmr11929oab.7.1691729504052; Thu, 10
 Aug 2023 21:51:44 -0700 (PDT)
Date:   Fri, 11 Aug 2023 04:51:21 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-9-rananta@google.com>
Subject: [PATCH v9 08/14] arm64: tlb: Implement __flush_s2_tlb_range_op()
From:   Raghavendra Rao Ananta <rananta@google.com>
To:     Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Reiji Watanabe <reijiw@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        Raghavendra Rao Anata <rananta@google.com>,
        David Matlack <dmatlack@google.com>,
        Fuad Tabba <tabba@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Define __flush_s2_tlb_range_op(), as a wrapper over
__flush_tlb_range_op(), for stage-2 specific range-based TLBI
operations that doesn't necessarily have to deal with 'asid'
and 'tlbi_user' arguments.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/include/asm/tlbflush.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index b9475a852d5be..93f4b397f9a12 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -340,6 +340,9 @@ do {									\
 	}								\
 } while (0)
 
+#define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
+	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, false)
+
 static inline void __flush_tlb_range(struct vm_area_struct *vma,
 				     unsigned long start, unsigned long end,
 				     unsigned long stride, bool last_level,
-- 
2.41.0.640.ga95def55d0-goog

