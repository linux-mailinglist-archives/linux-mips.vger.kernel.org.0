Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251FA758934
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jul 2023 01:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjGRXtQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Jul 2023 19:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjGRXtO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Jul 2023 19:49:14 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FE8E53
        for <linux-mips@vger.kernel.org>; Tue, 18 Jul 2023 16:48:39 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b896096287so48928365ad.0
        for <linux-mips@vger.kernel.org>; Tue, 18 Jul 2023 16:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724119; x=1692316119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WUfCrqcqzPgtS1UwKv933k1oCAb1hY7UF4nDFC6XfxY=;
        b=kxtMkPfBzSrDgFwiM6lTbnnV1ORifom1wTCX0JDc2o8v5mvJbgd+eW3FzBholZ+QF/
         ZB/tw1vxVtp6lnWfOuYWDBnkA/zcHKeYCxsNI4yLGBDWisxt2V2CGW6+/c9nKHHqWO0Z
         pwjXyxzIVoB/8QMRAPYJ2ESVagoDqveLkahmzeblrfSHi+C7b/LSvjVeGXXFBmG27xpW
         46+iHLUL/iDL1W1dNobEnmnSwB6oZXJ54GsRbQDHUEuzlNSG0pgY2rC5/BfRYynN9jnl
         9GH+3FZfZFTDU0qQSnRrsV2OdAHlQuwXUaGl7W047p5QIleFQWR+9FWJ+QSsSRbSbDcH
         Ypxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724119; x=1692316119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUfCrqcqzPgtS1UwKv933k1oCAb1hY7UF4nDFC6XfxY=;
        b=LZCrTW9zP1DW2o5J9jbPJ+3SI06wSKnKV0SQJ60IN2cqMxTEHYGxHUxSMZpqa4fOTx
         2r1lu2XMnds8civQLrboWsHc2mh9uAaLpqinh031njz3c341SHDI41fcnIhdRRsWlWbe
         k/Xer5xiv/asHRt0U/alLIfvYWcHU0rNIOzW6ExQatlRGZooVgczUhx8+ZJXEOohPia5
         dtIJI7gPc/RRAzh4fsB14C6rv2HfzTz2nyY0drsMMb7ZNa1i/dd9EnhVjEWwMvZM5ctC
         61NoatnAKGk19vZgbkxpWMeMNPJC2nlo2l/eguHX5AGRU1lyQMy6nqtPyO7/gvTDWb22
         SLuw==
X-Gm-Message-State: ABy/qLa/xeRqs3Q5lxvBn3nanWil9WeHFP7SZBj4joOM1YqSUwD9x+aX
        g+n2DLCm6Rom++HTc9sgedcyo/Gs/Vk=
X-Google-Smtp-Source: APBJJlEMcu/rfMRBwbQ2zq+ymY4hD2c5F3AYtj0FSwyildZO2Oo0gOzBKGYbg9jbJCtpjTvhx4PmM9/8MPA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f546:b0:1b8:a552:c8c9 with SMTP id
 h6-20020a170902f54600b001b8a552c8c9mr7279plf.13.1689724119324; Tue, 18 Jul
 2023 16:48:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Tue, 18 Jul 2023 16:44:47 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-5-seanjc@google.com>
Subject: [RFC PATCH v11 04/29] KVM: PPC: Drop dead code related to KVM_ARCH_WANT_MMU_NOTIFIER
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/powerpc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 7197c8256668..5cf9e5e3112a 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -634,10 +634,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_SYNC_MMU:
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 		r = hv_enabled;
-#elif defined(KVM_ARCH_WANT_MMU_NOTIFIER)
-		r = 1;
 #else
-		r = 0;
+#ifndef KVM_ARCH_WANT_MMU_NOTIFIER
+		BUILD_BUG();
+#endif
+		r = 1;
 #endif
 		break;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-- 
2.41.0.255.g8b1d071c50-goog

