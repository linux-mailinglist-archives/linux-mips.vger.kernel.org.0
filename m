Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F39AF774F18
	for <lists+linux-mips@lfdr.de>; Wed,  9 Aug 2023 01:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbjHHXN4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 19:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjHHXNw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 19:13:52 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A351BCF
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 16:13:44 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d10792c7582so5344523276.3
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 16:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536423; x=1692141223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8aS9+bqGGIGJd4osXg0UNYpwpvIxhiWvvz+QMPQ0Ulo=;
        b=r5BfuQMefAg0Tnr2FQaEIivjC4JzNAMuw4qxGVtci6+U9djSIpA11Hdl+rJc6en91J
         y/h+YDs0QAA5xFNhoGQE0fza9XyovVTAf2+ZIQj9pZdiciK8WN7z5vHDkRS5bze2JrvX
         1Pi0zGoodsu607T4DyfgYeotzEFP9OFg33WWk/J6RT4OzDi2b1Fi3JqRQ6HpyZZ+gywn
         +UZCzVUhZNvWuqdnzNxXM4bRsJeE1eSS8tnxOTUMx2/t6MN7k2idS2QWNmkVWa/w66NG
         yQ/AVA1aDJm/DL0O+01cjluCupsA1erg2PPaJFd5MY5BuRKvpf3vdiz+yo1bLlWRTbiY
         xCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536423; x=1692141223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8aS9+bqGGIGJd4osXg0UNYpwpvIxhiWvvz+QMPQ0Ulo=;
        b=QF2UXIdBztjEXBvDKktGWPlNxlcGaZL856KIoEEEWVFLylwEMhDZIq4PObqLI6cGbC
         3xbJtUrfnfAsfCa6UzpiTTj9uibDj5NzMr+DQIJmCgziD93vESUTf8vdhnngppiltOT0
         /t6gPWfe+n6TtyTKGIOthIOM62rOTHwtrtegy3s1a4Di51Jld+5um6cRKbDjWkrEPUwe
         kCw0nG5aNQIv0CahPy+kJeWdeEdEl+IL1MyMUrT1B0cqG/iAmhjNDArkrcMA5VqGvLBs
         AxGOz7EvzaQGRR3JUG7ufiixEkCepBVFyvSX0DniQH9R41YF04yH8nYXAju/6TD50QAf
         TfeA==
X-Gm-Message-State: AOJu0YyDBvpTQZiw/Qe+TGhc22Z/LejXaACjUG8m4pYPSHc+xuG1cuu6
        9Dy/qjCqjXjBsC/ZdL3YPjPIIduAlXiV
X-Google-Smtp-Source: AGHT+IGN6Wyp+xgEmWlEdpiyTqEz05f+ph0g541H8xJPxC5yzYpq7Xwg2KskI5Za7Uo8sgiAN3njNrOwDHIy
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a5b:890:0:b0:d10:dd00:385 with SMTP id
 e16-20020a5b0890000000b00d10dd000385mr25024ybq.0.1691536423557; Tue, 08 Aug
 2023 16:13:43 -0700 (PDT)
Date:   Tue,  8 Aug 2023 23:13:24 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-9-rananta@google.com>
Subject: [PATCH v8 08/14] arm64: tlb: Implement __flush_s2_tlb_range_op()
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
        kvm@vger.kernel.org
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

