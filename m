Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC867786AE
	for <lists+linux-mips@lfdr.de>; Fri, 11 Aug 2023 06:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjHKEvs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Aug 2023 00:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233485AbjHKEvo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Aug 2023 00:51:44 -0400
Received: from mail-oa1-x4a.google.com (mail-oa1-x4a.google.com [IPv6:2001:4860:4864:20::4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D5E2D6A
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 21:51:40 -0700 (PDT)
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-1bb876ea3ecso1834460fac.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 21:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729499; x=1692334299;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMunAMeBPKEY9T5yrPL+aMpFgaQV0/xsp/XormRaoBM=;
        b=oGyGjViqZNQB5Og/8KSGJT7aIHo2wwBSCnK8zrh4WX1dkLcj8j7++RIJ6MMhwLKJJM
         TFwYrscibPCB3QmC1vwbGjOxG+yFgDZoqgTW46Q0I43fh6plUvYPK40YZO8XMwTjrOdi
         fnlSk08NlXYIbGNj/3hHqeyZAiHuO84I1eN3h2UfQvsIoxOYp1344xAWxUoDUNlguK/d
         5kLKAQj90+6/pX7UAxmtBlnRcJeCRHfDdeQh/yfwKQtOSPDaI07tcbauCsIMB854pARh
         XzBdqJA4i4gXWPKDMXc/sVC1BnOhZZ28pfZehmEJ44oNDRLqO12bBeCK/TDek5KZpg/u
         BZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729499; x=1692334299;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KMunAMeBPKEY9T5yrPL+aMpFgaQV0/xsp/XormRaoBM=;
        b=aUn2Zlno6ipYdeE21YBQk384kVNcGYGX2PbY+VBdZl8qeBxHzKqQsytW9WV5p4WsMn
         NcrPotT37gAkfdmv/Z0QVoH5yooel049K10YNyZiiNHLla7ET9K8TVJb/vrMAlUY6dYD
         Av2M19CY7CjL8S/+f6kX5NZ3i9bha/T1LvJtIUNuWCNMT4C16EoGrCOJCKRj62qkyHQw
         +o83GhC31660IfQqaUMVhRygckHc728WCq5SoF9pfmmcpbqo8uwZY+AcJzkIrcz5wTFo
         feYnRUfAsp7xMJcewxxf2gmOHfa35QnNOjbUKMiAWBqFH3lHOG8EU4VGm2uNb49iV2jJ
         es2Q==
X-Gm-Message-State: AOJu0YxRH0Bx04vmvANrEWojD87wSw3IjXctX2WfXGRbbMCwl9ATk37k
        Y/kkV5biKOTdNo41QBlhUa9Yz50vHilG
X-Google-Smtp-Source: AGHT+IE6iu8kZBBGXiPktI0w4Wht3tt9FXqeaiP6SFiaZO7WXbsaeVAitcRGbh4LxMh2/nvqjLQ5ZRjkCZrA
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6870:1ab5:b0:1c0:e9e9:ae91 with SMTP
 id ef53-20020a0568701ab500b001c0e9e9ae91mr13992oab.3.1691729499613; Thu, 10
 Aug 2023 21:51:39 -0700 (PDT)
Date:   Fri, 11 Aug 2023 04:51:17 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-5-rananta@google.com>
Subject: [PATCH v9 04/14] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
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
        kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>,
        Gavin Shan <gshan@redhat.com>,
        "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

kvm_arch_flush_remote_tlbs() or CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
are two mechanisms to solve the same problem, allowing
architecture-specific code to provide a non-IPI implementation of
remote TLB flushing.

Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
all architectures on kvm_arch_flush_remote_tlbs() instead of
maintaining two mechanisms.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
---
 virt/kvm/Kconfig    | 3 ---
 virt/kvm/kvm_main.c | 2 --
 2 files changed, 5 deletions(-)

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index b74916de5183a..484d0873061ca 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -62,9 +62,6 @@ config HAVE_KVM_CPU_RELAX_INTERCEPT
 config KVM_VFIO
        bool
=20
-config HAVE_KVM_ARCH_TLB_FLUSH_ALL
-       bool
-
 config HAVE_KVM_INVALID_WAKEUPS
        bool
=20
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 70e5479797ac3..d6b0507861550 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -345,7 +345,6 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigne=
d int req)
 }
 EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
=20
-#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
 void kvm_flush_remote_tlbs(struct kvm *kvm)
 {
 	++kvm->stat.generic.remote_tlb_flush_requests;
@@ -366,7 +365,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 		++kvm->stat.generic.remote_tlb_flush;
 }
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
-#endif
=20
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
--=20
2.41.0.640.ga95def55d0-goog

