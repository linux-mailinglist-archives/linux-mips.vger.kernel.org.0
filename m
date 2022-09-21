Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1475BF222
	for <lists+linux-mips@lfdr.de>; Wed, 21 Sep 2022 02:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbiIUAdc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Sep 2022 20:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbiIUAdC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Sep 2022 20:33:02 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A5A7968A
        for <linux-mips@vger.kernel.org>; Tue, 20 Sep 2022 17:32:58 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id j11-20020a056a00234b00b005415b511595so2572224pfj.12
        for <linux-mips@vger.kernel.org>; Tue, 20 Sep 2022 17:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=MbPfwZWv+I6kc3yY72JCQSO5yCJ8JCb5ELGKfLOjwok=;
        b=grJuuh2+k9rqNemRgEr/i3C9qelUa8pmjrIwpZzOZWsob4m9BMj0id2HZJEYNqX2vk
         IyiBqggCegoMniVIEZ7ve0Pcy1+h2jKB9+MbFtK10I6z6o71JeWojaaos6m7WE8fir0j
         heFLVTWw3UN27mkc0NRFrTsxNKdJe5TptRVjlgbhxvmnLYxPIxj71ZtTzy+8U9psEbMq
         /DJvRQaVwnNJl+52DMbtmS4ycyYoramkBPdq9kNpcRPXozDD2tMcpY+VTWl4f/e0cZ1u
         xUxifAHZRm7LM+0f4tqB8q/MJPB9s8lTaVH0t++C99WkByoXTjU2cYt2Zh/7y53Gwmu9
         hSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=MbPfwZWv+I6kc3yY72JCQSO5yCJ8JCb5ELGKfLOjwok=;
        b=tvYneYzvRL9f5VMJjH+MgtLvouBQbIty/rYcBG+ApLuo3Ca8DMuCIZGiv33+EoWy+K
         ZNTlahxYRugL67rM6oW4npSxDex5ai64g5WdZ9HiCWRm2kiTqp4bPlVMlN5skKsSaMwl
         IDdvJJcJSkpMkci+7hHcKKjVwPm6oX6zyiT2TRXcbc7xUhRzcxfc5jmpGxLKujdI5o5n
         GHAmep2XMQaVPPw9G6z9t0L53i4lTcw32FBjR5dC60u5i8kIrpHZfUhvi7fzTyepm1Jr
         fWgW+yUCcEB3wTA5AbVB7ZADmRBbxvDo/bhnE/XJ/OnPfDNctqsKmu+WMpqj//miqFI4
         SQuQ==
X-Gm-Message-State: ACrzQf3hNrMbdm8S4AgNliIDU69USNIdjks6ty863MJ1VJDqp2RoBkKO
        z7rpj63wP+ChdwdOvINA4XOHOsubOWQ=
X-Google-Smtp-Source: AMsMyM7f/RJC1MtdX6LkmKjLrG4mZov+EsK6V2BR+rQVSc6X+vDgdbpWXXujI7vaEWcw3mjY8BTW5lUZVRw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dac7:b0:178:b5e0:3627 with SMTP id
 q7-20020a170902dac700b00178b5e03627mr2094501plx.147.1663720377687; Tue, 20
 Sep 2022 17:32:57 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed, 21 Sep 2022 00:31:55 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-7-seanjc@google.com>
Subject: [PATCH v4 06/12] KVM: SVM: Make an event request if INIT or SIPI is
 pending when GIF is set
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Atish Patra <atishp@atishpatra.org>,
        David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Set KVM_REQ_EVENT if INIT or SIPI is pending when the guest enables GIF.
INIT in particular is blocked when GIF=0 and needs to be processed when
GIF is toggled to '1'.  This bug has been masked by (a) KVM calling
->check_nested_events() in the core run loop and (b) hypervisors toggling
GIF from 0=>1 only when entering guest mode (L1 entering L2).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index dd599afc85f5..58f0077d9357 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2339,7 +2339,8 @@ void svm_set_gif(struct vcpu_svm *svm, bool value)
 		enable_gif(svm);
 		if (svm->vcpu.arch.smi_pending ||
 		    svm->vcpu.arch.nmi_pending ||
-		    kvm_cpu_has_injectable_intr(&svm->vcpu))
+		    kvm_cpu_has_injectable_intr(&svm->vcpu) ||
+		    kvm_apic_has_pending_init_or_sipi(&svm->vcpu))
 			kvm_make_request(KVM_REQ_EVENT, &svm->vcpu);
 	} else {
 		disable_gif(svm);
-- 
2.37.3.968.ga6b4b080e4-goog

