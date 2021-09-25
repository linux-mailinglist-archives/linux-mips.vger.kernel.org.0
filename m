Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0796417EF4
	for <lists+linux-mips@lfdr.de>; Sat, 25 Sep 2021 02:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346594AbhIYA6f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 20:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346598AbhIYA6U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 20:58:20 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D38C0613E2
        for <linux-mips@vger.kernel.org>; Fri, 24 Sep 2021 17:55:57 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id e6-20020a0cb446000000b0037eeb9851dfso42732345qvf.17
        for <linux-mips@vger.kernel.org>; Fri, 24 Sep 2021 17:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=5cNFroYBSThqqpJCYxzBjAkytlwovA+rbtWpXsyqDeo=;
        b=SfLacDGDPv0O+ce1feGYy7BDlJVOIPkrwFpJqoWdePykloL2O82WlaKRzOwLeffojV
         WekB5mzNRTsRAE7CDSxzp55a5GlHpqh/h04E/0Cqn+9co39zSHc1rwlgwjHIm0Eq+/g1
         rLsDyI7TI6ImRbwiTwKX0t1Q8ZQyoCYrzRYyQ4Xqwn0rlAUNh8TrYEq/em7hwrNonrfc
         Au70p/9HXYWVD3oyP35n9WXZarKqfxjjLGSen8K95241TMcO649zTLMZSD1UsjUAj//k
         JNR5GrbIoX2CF5HqJzqUR8/mcVQlOI2NUabeIFYhUNE1yZiL3ZPJAKN3+lQsuLE7ow/b
         sO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=5cNFroYBSThqqpJCYxzBjAkytlwovA+rbtWpXsyqDeo=;
        b=ryLf7Lsg817k663Yb8upPzaVd6cpCi1Y5y6gDKEkZJorEIYL37NXzXhfN0G/ABOSk7
         tpVeL9WFfo4ICodm3NGe3mst7J5GLi8iCWm1EwSeXZIuc9RQsF688znm+vaPVCz57Bd3
         EXcAT9BqPAdH3OAbZzYVec14dQa6Dr9tQztVOn+hF9j3GWcx9J6LE8lqo+7chD9rw2w4
         3cvg+8cOs2VXm7joVrJ4+1eTJSdR98rttFgnldXDklFMo955bpm4NrReyObIyKYtNz5y
         xROwJjGDc/pcitl/gq/JiTTiklm97bJXJM6YZu05iTS6tA+7/J0WjIbE7ovOfaFUO1Iy
         c0qA==
X-Gm-Message-State: AOAM533qHuUR9/a3qIVcHEAwEUTIYoDtnrDSkHrsr5wUVpSGrRiF+5mv
        qVtpABr0dL08w0lQd7JhNDxapxBca4M=
X-Google-Smtp-Source: ABdhPJwTW1UybwFgg5M8F4nzh531Ub5JbtN0jF/yWxCBJfUYuvXgy/++XZQV+BSuMlLfxb0INGVd0hW95rg=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:4c72:89be:dba3:2bcb])
 (user=seanjc job=sendgmr) by 2002:a05:6214:148b:: with SMTP id
 bn11mr13269187qvb.67.1632531356963; Fri, 24 Sep 2021 17:55:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 24 Sep 2021 17:55:26 -0700
In-Reply-To: <20210925005528.1145584-1-seanjc@google.com>
Message-Id: <20210925005528.1145584-13-seanjc@google.com>
Mime-Version: 1.0
References: <20210925005528.1145584-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH 12/14] KVM: Don't redo ktime_get() when calculating
 halt-polling stop/deadline
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
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
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Matlack <dmatlack@google.com>,
        Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Calculate the halt-polling "stop" time using "cur" instead of redoing
ktime_get().  In the happy case where hardware correctly predicts
do_halt_poll, "cur" is only a few cycles old.  And if the branch is
mispredicted, arguably that extra latency should count toward the
halt-polling time.

In all likelihood, the numbers involved are in the noise and either
approach is perfectly ok.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2980d2b88559..80f78daa6b8d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3267,7 +3267,7 @@ void kvm_vcpu_halt(struct kvm_vcpu *vcpu)
 
 	start = cur = poll_end = ktime_get();
 	if (do_halt_poll) {
-		ktime_t stop = ktime_add_ns(ktime_get(), vcpu->halt_poll_ns);
+		ktime_t stop = ktime_add_ns(cur, vcpu->halt_poll_ns);
 
 		do {
 			/*
-- 
2.33.0.685.g46640cef36-goog

