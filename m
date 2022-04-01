Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65EF74EF953
	for <lists+linux-mips@lfdr.de>; Fri,  1 Apr 2022 19:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350693AbiDAR6M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Apr 2022 13:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350673AbiDAR6K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Apr 2022 13:58:10 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFE3215469
        for <linux-mips@vger.kernel.org>; Fri,  1 Apr 2022 10:56:21 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id t66-20020a625f45000000b004fabd8f5cc1so1999566pfb.11
        for <linux-mips@vger.kernel.org>; Fri, 01 Apr 2022 10:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=zKDQj9FrafQ+86iVPP3K51OIfRdmfs50RkYPmE+oxOQ=;
        b=jwJrV9wgSOZhOdo64taCxPoODAC6XGsgJuKkwc48uKLDwCehUF0oYRs0fx/6iUYJsN
         bDU8lVrfYvdUg3f5cyhCck37cCyLL5/oocbLVeX/2RMocHB7whP9YgJV1BPU0FInpT8M
         Jey3QTtqfjXizgqaTWKrOuc0XTGX8k9DlHlIvbHGsjO2yN1YnnybWB4lTqrMuaaxskHT
         tzBNngTy7KVEqbn10arUq+QvHMRdcdxlBk6ThObz7bZ8fYOmHleUEQKDX3znsHn2k++f
         k/IMtVSXnTPiSX4RDt6Ql8Je3nitAyb3Jw6XHuF5ueww4Kk/F0qDai4j5R/xhVPgfIGK
         wEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=zKDQj9FrafQ+86iVPP3K51OIfRdmfs50RkYPmE+oxOQ=;
        b=ZU5HuC2gcgYYQDtRYZTOoiVTvG2mgOwkG/g7daIqmPAPtFy2zzyU+DTeWblVQ3zA8j
         0PSQj75FNxLqpvmg8/3lE7rbTc/k4xjXV5icQSWmnGOyjj5DR/6cWloRISa2M6DFX+7T
         vyBaGxkm7yjV+5dOgBssOtDeTgsaRwXRzSV7RovU2Ivy6eNUHd8EXCrXxWbIHjDR88mR
         eDxHKJQH2vu9amvbUTj9h8HFZeptnajEIb+v92+xXQJIGU9lslsFA++uVKyNNOySOHJi
         6RkDZTQO7T3pfznf6FMJx9RfHfol2qEqGw8xOyxkK71Aqx2OEMP3j2SRbqcSj8p/N1WP
         6c6Q==
X-Gm-Message-State: AOAM533FDUH2kLyq56MQKc4vutVmD1acljKkP99vwMUSdXyr3eISTinh
        BC6vyeqovTcyfwTAVK9ICRVZ6IBXsOOS5Q==
X-Google-Smtp-Source: ABdhPJxYcEKA7pbWp7jjIlDB7Ac6r83BwprafTTSyvULHdi4YCW6thoQ1uhQkF3OnBLrsgJpdsF5d76dQHZQHA==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:90a:7304:b0:1c6:aadc:90e5 with SMTP
 id m4-20020a17090a730400b001c6aadc90e5mr13237879pjk.164.1648835780708; Fri,
 01 Apr 2022 10:56:20 -0700 (PDT)
Date:   Fri,  1 Apr 2022 17:55:43 +0000
In-Reply-To: <20220401175554.1931568-1-dmatlack@google.com>
Message-Id: <20220401175554.1931568-13-dmatlack@google.com>
Mime-Version: 1.0
References: <20220401175554.1931568-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH v3 12/23] KVM: x86/mmu: Pass const memslot to rmap_add()
From:   David Matlack <dmatlack@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        David Matlack <dmatlack@google.com>
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

rmap_add() only uses the slot to call gfn_to_rmap() which takes a const
memslot.

No functional change intended.

Reviewed-by: Ben Gardon <bgardon@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 37385835c399..1efe161f9c02 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1596,7 +1596,7 @@ static bool kvm_test_age_rmapp(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
 
 #define RMAP_RECYCLE_THRESHOLD 1000
 
-static void rmap_add(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
+static void rmap_add(struct kvm_vcpu *vcpu, const struct kvm_memory_slot *slot,
 		     u64 *spte, gfn_t gfn)
 {
 	struct kvm_mmu_page *sp;
-- 
2.35.1.1094.g7c7d902a7c-goog

