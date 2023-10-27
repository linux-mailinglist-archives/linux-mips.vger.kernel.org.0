Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 504A47DA056
	for <lists+linux-mips@lfdr.de>; Fri, 27 Oct 2023 20:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbjJ0S0I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Oct 2023 14:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346581AbjJ0SZs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Oct 2023 14:25:48 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0CC2133
        for <linux-mips@vger.kernel.org>; Fri, 27 Oct 2023 11:23:26 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7b9e83b70so22729457b3.0
        for <linux-mips@vger.kernel.org>; Fri, 27 Oct 2023 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698431005; x=1699035805; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zYKW06Y9tS7nzBZmp5ooZeVm0pRKPQ996s+RZNHFHDA=;
        b=rsKK6rbAYAiqifh8LhXS1YdjAp9NYCnrVBnqxDXeeDHPkXkVjrFtIaXuf0bO9vldaY
         XTLN/9io74yTG1HpPu8yrr38SKhcOycy5u+Tc5vbQ6CjISXnL17i0IKFlOrGKezVK94M
         WFLEEbx8e6r0SxponlANBHJLAd21E44zLw/HXeFDjvAWkdcS3Abnvfnpwr9lPUrrDBRq
         FTQkZ6QelqhadvtgIN5Lv6GQsdXZP5QxgTH2iIQ/LUYa6awa34vMDm6uFwccnyeHnqzi
         FbILyWx0w55rNwvnuLEMEV9k9KbkHHKHHUW4SocqFUrRzwOfaXtrvsvp1jQsMeoSxx93
         86NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698431005; x=1699035805;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYKW06Y9tS7nzBZmp5ooZeVm0pRKPQ996s+RZNHFHDA=;
        b=ujX/pQSkB73AQ//6/8UC8Z1EalkiM5EaejlSRNaCt0v6BISBC1zWcJAt3+4YVMar27
         S7IADZTxlMwbbq/UYdPKziUiyFg9dVHuUaDr+hA/C0jTADae6Z60le7OTbclhhAm9W2r
         OHuY8+sR12FEWbsWxdsOqm2B0GfA2gGsNvLJdfgjLcWrTfkXGsaIBhRc89c8bRB9Akza
         hVeeCP0JY4mqN96o+r9WwmCTRnkj4eAZaxcPntbFUtA6Jp2EURIbtL9DLxlU4K1bQcin
         m/dwbIFLsY7fxQPQh44DKH8EMOIJ4Zs7JRBr96C/TzuxpUIaC4ZBawNf5lh+S0sByLU9
         H2IA==
X-Gm-Message-State: AOJu0Yy0zpZDMk0dW86ZkxufAeIqJeM4nWv6gxn+YrdtU4jPMmnyblf5
        NfixlfY/kHutv+Z5Jz834lljKbGyqfk=
X-Google-Smtp-Source: AGHT+IErWdjWWNGtxZOL2jGOuLZz5+Zkhfhc0XQVVHxJSZZLCXWd4MbZY0rGLoG0iR2uIHcgyGOCoD0Mx1Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:ca0f:0:b0:59b:e663:23b0 with SMTP id
 m15-20020a0dca0f000000b0059be66323b0mr102891ywd.4.1698431004987; Fri, 27 Oct
 2023 11:23:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 27 Oct 2023 11:22:12 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-31-seanjc@google.com>
Subject: [PATCH v13 30/35] KVM: selftests: Add GUEST_SYNC[1-6] macros for
 synchronizing more data
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
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_PASS,T_SPF_HELO_TEMPERROR,
        USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add GUEST_SYNC[1-6]() so that tests can pass the maximum amount of
information supported via ucall(), without needing to resort to shared
memory.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/ucall_common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index ce33d306c2cb..0fb472a5a058 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -52,6 +52,17 @@ int ucall_nr_pages_required(uint64_t page_size);
 #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4)	\
 				ucall(UCALL_SYNC, 6, "hello", stage, arg1, arg2, arg3, arg4)
 #define GUEST_SYNC(stage)	ucall(UCALL_SYNC, 2, "hello", stage)
+#define GUEST_SYNC1(arg0)	ucall(UCALL_SYNC, 1, arg0)
+#define GUEST_SYNC2(arg0, arg1)	ucall(UCALL_SYNC, 2, arg0, arg1)
+#define GUEST_SYNC3(arg0, arg1, arg2) \
+				ucall(UCALL_SYNC, 3, arg0, arg1, arg2)
+#define GUEST_SYNC4(arg0, arg1, arg2, arg3) \
+				ucall(UCALL_SYNC, 4, arg0, arg1, arg2, arg3)
+#define GUEST_SYNC5(arg0, arg1, arg2, arg3, arg4) \
+				ucall(UCALL_SYNC, 5, arg0, arg1, arg2, arg3, arg4)
+#define GUEST_SYNC6(arg0, arg1, arg2, arg3, arg4, arg5) \
+				ucall(UCALL_SYNC, 6, arg0, arg1, arg2, arg3, arg4, arg5)
+
 #define GUEST_PRINTF(_fmt, _args...) ucall_fmt(UCALL_PRINTF, _fmt, ##_args)
 #define GUEST_DONE()		ucall(UCALL_DONE, 0)
 
-- 
2.42.0.820.g83a721a137-goog

