Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00B176EAFD0
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 18:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbjDUQ4I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 12:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233306AbjDUQzw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 12:55:52 -0400
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA9312C9F
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 09:55:18 -0700 (PDT)
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1a66bd44f6dso15805935ad.0
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682095994; x=1684687994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PAF8eecHjdHkncCHVDxnuwZD238/O/D5uX087DV6gk=;
        b=PTkyUTn2160dQG/w0LBEubHoXT6/kolM07eAXpOkI5VQKBjVge2/G3D9DJWv4EmluF
         jwrYT87c/pr1Xst3R4sPDfwUW1QW6N7gw0yt507TfR8+t+X9AZokv5qPyHgjsmekGrNG
         N5lb8NDbmayYdr4sbEsTRxgCzT7JDO2aRCdXd3ULGGsFS/IzMoTjppouMIJbEHzjtzJn
         0UQdx9F3D1PLMFaK3GeO580/u61tzYb2QXdQjUSDj2cShYPf8ASAPVv3u7/P4wOk+ciC
         66tN/SEGEQMjy6UGRqCfjY+yHppjjUO6tyxdYKf7p4Z/hg9iu3GtO1l0LIPj0nE4z4c0
         zDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095994; x=1684687994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PAF8eecHjdHkncCHVDxnuwZD238/O/D5uX087DV6gk=;
        b=PFtTZhkpEyzQH2jJnE2RdrtPeD6fJBounKrR/D71wOofPTfoDGdBkzLg2qA2gZNnIQ
         dozMcbAto9WVLO5PKofUNq0MrY0IEQCajthNdbCIRhLZME0gyhAAwsI0h98UCdzTuERQ
         CyHAadvT09obGKWehmwtE3ydNEhBzu1xRymVrDvmVYUEfJbSB5AnTz2NnlkDHm0vO4Sg
         QE9OMvLDDspIky0tbYHLqxIj+GeaaSbz7cCn+BNFMJL6ETSXjP8xRcMq1SEEfarMLA2p
         XaX2PbhUcDkiBjIP+vsbfU95rQGX8G3zTBVJ7s0qmYXFn7nB/Zb4duG6wj1oA7uznD3e
         ipdw==
X-Gm-Message-State: AAQBX9f2y7RSPMmtwChZ/hCX0rOtXMmnHsv8bJpWUMfWQpJTDPtdv0R8
        4l5jTmTMnCHAgYqujqESYi2X1ZRmkyWp
X-Google-Smtp-Source: AKy350ZhDTjaiDsWlopRxc48Dw1pNwwJqPHfzna6+NHQQh4Cp6jlmLNI1MOs2L3SqIF7smNjuMPM7IP//W/I
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a17:902:7b85:b0:1a0:4321:920e with SMTP id
 w5-20020a1709027b8500b001a04321920emr1816879pll.12.1682095994335; Fri, 21 Apr
 2023 09:53:14 -0700 (PDT)
Date:   Fri, 21 Apr 2023 09:52:59 -0700
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230421165305.804301-1-vipinsh@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421165305.804301-4-vipinsh@google.com>
Subject: [PATCH 3/9] KVM: selftests: Pass count of read and write accesses
 from guest to host
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
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Pass number of read and write accesses done in the memstress' guest code
to userspace.

These counts will be one way to measure vCPU performances during
memstress and dirty logging related tests. For example, in
dirty_log_perf_test this can be used to measure impact of dirty and
clear log APIs on vCPUs performances.

In current dirty_log_perf_test, each vCPU executes in lockstep to the
current iteration in userspace, therefore, these access counts will not
provide much useful information except for observing individual vCPUs
read vs write accesses.

However, in future commits, dirty_log_perf_test behavior will be changed
to allow vCPUs to execute independent of userspace iterations. This will
mimic real world workload where guest keeps on executing while VMM is
collecting and clearing dirty logs separately. With read and write
accesses known for each vCPU, impact of get and clear dirty log APIs can
be quantified. Note that these access counts will not be 100% reliable
in knowing vCPUs performances since vCPUs scheduling can impact
the progress.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/lib/memstress.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/memstress.c b/tools/testing/selftests/kvm/lib/memstress.c
index 483ecbc53a5b..9c2e360e610f 100644
--- a/tools/testing/selftests/kvm/lib/memstress.c
+++ b/tools/testing/selftests/kvm/lib/memstress.c
@@ -50,6 +50,8 @@ void memstress_guest_code(uint32_t vcpu_idx)
 	struct memstress_args *args = &memstress_args;
 	struct memstress_vcpu_args *vcpu_args = &args->vcpu_args[vcpu_idx];
 	struct guest_random_state rand_state;
+	uint64_t write_access;
+	uint64_t read_access;
 	uint64_t gva;
 	uint64_t pages;
 	uint64_t addr;
@@ -65,6 +67,8 @@ void memstress_guest_code(uint32_t vcpu_idx)
 	GUEST_ASSERT(vcpu_args->vcpu_idx == vcpu_idx);
 
 	while (true) {
+		write_access = 0;
+		read_access = 0;
 		for (i = 0; i < pages; i++) {
 			if (args->random_access)
 				page = guest_random_u32(&rand_state) % pages;
@@ -73,13 +77,16 @@ void memstress_guest_code(uint32_t vcpu_idx)
 
 			addr = gva + (page * args->guest_page_size);
 
-			if (guest_random_u32(&rand_state) % 100 < args->write_percent)
+			if (guest_random_u32(&rand_state) % 100 < args->write_percent) {
 				*(uint64_t *)addr = 0x0123456789ABCDEF;
-			else
+				write_access++;
+			} else {
 				READ_ONCE(*(uint64_t *)addr);
+				read_access++;
+			}
 		}
 
-		GUEST_SYNC(1);
+		GUEST_SYNC_ARGS(1, read_access, write_access, 0, 0);
 	}
 }
 
-- 
2.40.0.634.g4ca3ef3211-goog

