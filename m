Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439664275B7
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244233AbhJICOx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244199AbhJICOv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:14:51 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31049C061755
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:12:55 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id p8-20020a056902114800b005bad2571fbeso3623279ybu.23
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=OSahwrCOM8hvTCjGSN0bryGWa8lO1ktrkgbUtpkiWTU=;
        b=M5Nnc+p8tzrX3sNy50+q4rLjDSCqSRYtbN8NDtIMtL5lz0M1RLPaDK9QbmYeZ771j6
         iFkLbm77/+6Yc0cSHxabd0QyOohOgtVklZfs3Cn2dN0a1ZwfX67QbT1JAQNLhjpc4+uO
         vi9O60Ie3T48wyOT5Z4Gu0fSaeBm6K+RcT5Zaus4zoWDP/z2bfzcS0MRP6qrM18VmvI1
         q2TtwZL4vCj4M6FLDBiRgBUXmYKIdxYeZUm1TBqJ6arSG1KgtQu+aFJsGYHUTkfjGQof
         tTaWlTLEfPIrKFJvjF0monIrG5PmtaBKUx6Tf3cXwYd6T3mEDwvkPUW8UU30Bw8nBP9y
         0gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=OSahwrCOM8hvTCjGSN0bryGWa8lO1ktrkgbUtpkiWTU=;
        b=S+6kcgyRGWGzEHcp++/+5sEW2klPa714SgO3Tu0kfAclvOT1VztWy6peyhoWFR1AIx
         lcIRUGK65l1IyCWZwcN6i5ZmJSu/nKRkQ+b8Aec5E9dvAz0UMy+Co0XOTFl1UlHOx6Ow
         Rz6Rpz6qCvBwjIuVQkBCwKU02osKc3NeOxtztVsoAmeyAdi/FvcHYbK1IiiSA0qetqj0
         e5yoj+IYZqKM8TgQ3Kd/kIbB1p88RJS0yO0QPEkbFKpm9WIxFoaLbcYp6sQtYVI2FBS7
         oGn+clmMYqK/sqVVwNUccShbKFD4Wxb19Mb8Gt0nXkd6vVnVB/KrVaOarGcJPNBbq1cU
         8BKw==
X-Gm-Message-State: AOAM530TiqAOO/ETGpcMT6zrmgCbcBkuLL/V5Ruu7SEma/hrAxMl8gzY
        zG4ju4SmbPbokBp9j2Df2q97gXrsbv0=
X-Google-Smtp-Source: ABdhPJx08F+X6N2reeGnFXth9S6Ys93QnEjCYVn+7HtsQKARH+T/4QlHmLInc1/XQW7XkZX+0RcLTuK00A4=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a05:6902:124e:: with SMTP id
 t14mr2047183ybu.221.1633745574354; Fri, 08 Oct 2021 19:12:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:11:58 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-6-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 05/43] KVM: Update halt-polling stats if and only if
 halt-polling was attempted
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Matlack <dmatlack@google.com>,
        Oliver Upton <oupton@google.com>,
        Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Don't update halt-polling stats if halt-polling wasn't attempted.  This
is a nop as @poll_ns is guaranteed to be '0' (poll_end == start), but it
will allow a future patch to move the histogram stats into the helper to
resolve a discrepancy in what is considered a "successful" halt-poll.

No functional change intended.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5d4a90032277..6156719bcbbc 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3217,6 +3217,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 {
 	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
 	bool halt_poll_allowed = !kvm_arch_no_poll(vcpu);
+	bool do_halt_poll = halt_poll_allowed && vcpu->halt_poll_ns;
 	ktime_t start, cur, poll_end;
 	bool waited = false;
 	u64 block_ns;
@@ -3224,7 +3225,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	kvm_arch_vcpu_blocking(vcpu);
 
 	start = cur = poll_end = ktime_get();
-	if (vcpu->halt_poll_ns && halt_poll_allowed) {
+	if (do_halt_poll) {
 		ktime_t stop = ktime_add_ns(ktime_get(), vcpu->halt_poll_ns);
 
 		++vcpu->stat.generic.halt_attempted_poll;
@@ -3276,8 +3277,9 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	kvm_arch_vcpu_unblocking(vcpu);
 	block_ns = ktime_to_ns(cur) - ktime_to_ns(start);
 
-	update_halt_poll_stats(
-		vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
+	if (do_halt_poll)
+		update_halt_poll_stats(
+			vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
 
 	if (halt_poll_allowed) {
 		if (!vcpu_valid_wakeup(vcpu)) {
-- 
2.33.0.882.g93a45727a2-goog

