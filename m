Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26EB43A5BB9
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 04:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbhFNC5W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Jun 2021 22:57:22 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:42597 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbhFNC5U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Jun 2021 22:57:20 -0400
Received: by mail-pl1-f202.google.com with SMTP id x15-20020a170902e04fb02900f5295925dbso4040994plx.9
        for <linux-mips@vger.kernel.org>; Sun, 13 Jun 2021 19:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=G0BvcWLb4IeXiMagmDzrz7Uqmh6mNFjQeYSUfBYTeS0=;
        b=J5d2R6fWgIT7owLOkJV6VeWqsPNmA3XhITMy2ACzrDEZhT0Hlwu1Mv1CGvxmT9xZEJ
         zOh45iAE5qCbYIz/1wXZBdrottBUD7tpMTeePsXb7v9pq1MVKNz/w44zNDX5DV7GJSNw
         tUg2JDh1hnHw8Fct0UeMIcmZl+UUTt3HJqYS4yXoEOYYItYDzo+7W04DATqfZNjGj0EE
         FJ4jtuO3fwrMXv+WswutYrXdpiDAx3BQTTnr1PTdXUUB8IPOb33aV1KfvgYWQbQSHSW+
         jN4K6ERakZJxjI6TqbwlCEllee61z7OrSO6pbKuyV3wieGgx7IAhVQP6z/uCtPoNXmQE
         gfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=G0BvcWLb4IeXiMagmDzrz7Uqmh6mNFjQeYSUfBYTeS0=;
        b=jBIZ5seUqDvp3ZOZg92K/+3fka8ZUeKiT+zR/vwzi+o2e56uKa7oinc1uxNk2Dx/oE
         r7FgTmXcHyk51YUZ5WbKrUxgaPfeWbaR+WPuhoZMbp//YaNgjnBIgcyB16srjJrk7jJy
         NuTdlQhSeNMMM7n5BtKdtQkCTJlb3Cvedh0tzh7SgUGzHv4GWKWglGRcTHXIHhT/XrAA
         MzbIYMk40X9/2iFU7PSjeXVItxQG+LKyWajtDrJX1FYW8P7mmzcHfGGKW4QoljymOu4W
         MBJSnjf8dQpEox7UfB3aIX7hP5WRhIU3ZU53eecVPpvk5Tq9bOHOeCOjCUlKoq0ADPCp
         OxFA==
X-Gm-Message-State: AOAM532+ZKbq/s5W9GVfjASfuNMm5sCz7itQrOqJ46LMF5d+oxBjisVG
        Vr75l2+7ktDkEzgzrZv9ZcXFezZ3Mzyq+QZm9g==
X-Google-Smtp-Source: ABdhPJycgiFSbxMZLS8Bil1CYzhmeCE7vWg07Yh1drE2XVuoYrfaHxoRxI6LH8bCvEcGVqokSkYhAgwO3CRfAtV4/A==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:1acf])
 (user=jingzhangos job=sendgmr) by 2002:a63:ed4d:: with SMTP id
 m13mr15005137pgk.433.1623639242315; Sun, 13 Jun 2021 19:54:02 -0700 (PDT)
Date:   Mon, 14 Jun 2021 02:53:51 +0000
In-Reply-To: <20210614025351.365284-1-jingzhangos@google.com>
Message-Id: <20210614025351.365284-5-jingzhangos@google.com>
Mime-Version: 1.0
References: <20210614025351.365284-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH 4/4] KVM: selftests: Update binary stats test for stats mode
From:   Jing Zhang <jingzhangos@google.com>
To:     KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Fuad Tabba <tabba@google.com>
Cc:     Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Update binary stats selftest to support sanity test for stats
read/write mode and offset.

Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 tools/testing/selftests/kvm/kvm_binary_stats_test.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/kvm_binary_stats_test.c b/tools/testing/selftests/kvm/kvm_binary_stats_test.c
index d85859a6815a..2a34b5e822e8 100644
--- a/tools/testing/selftests/kvm/kvm_binary_stats_test.c
+++ b/tools/testing/selftests/kvm/kvm_binary_stats_test.c
@@ -77,6 +77,8 @@ static void stats_test(int stats_fd)
 				<= KVM_STATS_UNIT_MAX, "Unknown KVM stats unit");
 		TEST_ASSERT((pdesc->flags & KVM_STATS_BASE_MASK)
 				<= KVM_STATS_BASE_MAX, "Unknown KVM stats base");
+		TEST_ASSERT((pdesc->flags & KVM_STATS_MODE_MASK)
+				<= KVM_STATS_MODE_MAX, "Unknown KVM stats mode");
 		/* Check exponent for stats unit
 		 * Exponent for counter should be greater than or equal to 0
 		 * Exponent for unit bytes should be greater than or equal to 0
@@ -106,11 +108,18 @@ static void stats_test(int stats_fd)
 	}
 	/* Check overlap */
 	TEST_ASSERT(header->data_offset >= header->desc_offset
-			|| header->data_offset + size_data <= header->desc_offset,
-			"Data block is overlapped with Descriptor block");
+		|| header->data_offset + size_data <= header->desc_offset,
+		"Data block is overlapped with Descriptor block");
 	/* Check validity of all stats data size */
 	TEST_ASSERT(size_data >= header->count * sizeof(stats_data->value[0]),
 			"Data size is not correct");
+	/* Check stats offset */
+	for (i = 0; i < header->count; ++i) {
+		pdesc = (void *)stats_desc + i * size_desc;
+		TEST_ASSERT(pdesc->offset < size_data,
+			"Invalid offset (%u) for stats: %s",
+			pdesc->offset, pdesc->name);
+	}
 
 	/* Allocate memory for stats data */
 	stats_data = malloc(size_data);
-- 
2.32.0.272.g935e593368-goog

