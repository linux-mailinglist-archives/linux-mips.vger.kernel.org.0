Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B6864769E
	for <lists+linux-mips@lfdr.de>; Thu,  8 Dec 2022 20:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiLHTkV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Dec 2022 14:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbiLHTkE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Dec 2022 14:40:04 -0500
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BAF389CF
        for <linux-mips@vger.kernel.org>; Thu,  8 Dec 2022 11:39:46 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id 94-20020a17090a09e700b002191897f70aso1552974pjo.9
        for <linux-mips@vger.kernel.org>; Thu, 08 Dec 2022 11:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LgQMdy+BRV6etzCdcak09K9MMPBRYTlG1+oihaFX4ek=;
        b=HTWjIigcZ7WZjOnOg61QHaCTfbHLyHGvpSvV9l8zZQ5K6Grf0VUcQH9XdDcrgQ0qnO
         1QAcwSASOHpForiZANO2+68V5a8rNealSQ0apW5C0hOTyqLw/F+VPLY3asRhXgPKSuVc
         ATHZcBO/0vYL56E/Ir829fUHKApmsLZ4Axd/FvOUVfKwdR9J0BHthDhp0OlK+DWkEs9G
         8DbJlx/DyawOHuuPdY5BhEZwMd2ETb8lHyA5mmcw6iiBiq+/CMkbN4u0OnU/XPiCWYAg
         4c1jbNQi9nK7+jDlMHAK9qxmS0z+lVbXn90csRVgjpeYpmndVSm5rYF7D0TXl9GZ2RVc
         4lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgQMdy+BRV6etzCdcak09K9MMPBRYTlG1+oihaFX4ek=;
        b=yA39hHLCTweZBa6T3ECJZiXzvsnxJzbejFGA+xT7+P7POVBKD7+a5PG1NdLiVrK0jb
         7qBgONokiNVXFEZW/1ELuRojBg3iTTEyFg5c8ffwSnPYRjdYXQywA7VoHi0emnK4Zt6J
         19QVKyI54/EMLrgNkW33A0UcHHWbKElF5Hl9GpFdY3zCQs6+OnJz77if7lJregtC35kr
         +M08XclsVfutWDmrNERdbz33GWSDDAVUECEyyUev0GSnIu6ZCfaOIfCetvMHONFgqYSQ
         VrQd1XXhk94nZ5mVGKr9h4VuauGhOpA6VPmjs3UYZZ0VQd2hWP1EHpA01lKQAjX1lpKK
         gQhg==
X-Gm-Message-State: ANoB5pnkmX432P5gygFikUj0XgPNDWiHAoQhbq4hQ/UOjyMBzmb3CdcK
        Dj0LmFEfHmHyniTU4kdruw2mLjxx5ClMuA==
X-Google-Smtp-Source: AA0mqf6s5jpCYuu3sADTa5hiPGsaDUIFXQc5seS/2ekXFn3zxyf2G6r6oJqYRkkShhh/Mij7t3AhSFvHIH2QTg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a17:90b:11d6:b0:219:ce92:17a1 with SMTP
 id gv22-20020a17090b11d600b00219ce9217a1mr20111973pjb.235.1670528383766; Thu,
 08 Dec 2022 11:39:43 -0800 (PST)
Date:   Thu,  8 Dec 2022 11:38:42 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-23-dmatlack@google.com>
Subject: [RFC PATCH 22/37] KVM: x86: Select HAVE_TDP_MMU if X86_64
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

In preparation for moving the TDP MMU implementation into virt/kvm/
guarded behind HAVE_TDP_MMU, ensure that HAVE_TDP_MMU is selected in
X86_64 builds that enable KVM. This matches the existing behavior of the
TDP MMU in x86.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index fbeaa9ddef59..849185d5020d 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -49,6 +49,7 @@ config KVM
 	select SRCU
 	select INTERVAL_TREE
 	select HAVE_KVM_PM_NOTIFIER if PM
+	select HAVE_TDP_MMU if X86_64
 	help
 	  Support hosting fully virtualized guest machines using hardware
 	  virtualization extensions.  You will need a fairly recent
-- 
2.39.0.rc1.256.g54fd8350bd-goog

