Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11D864769A
	for <lists+linux-mips@lfdr.de>; Thu,  8 Dec 2022 20:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiLHTkQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Dec 2022 14:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbiLHTkD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Dec 2022 14:40:03 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE672389C3
        for <linux-mips@vger.kernel.org>; Thu,  8 Dec 2022 11:39:43 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id h7-20020a170902f54700b00189deebdb91so2184391plf.9
        for <linux-mips@vger.kernel.org>; Thu, 08 Dec 2022 11:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zxu59m+BC3IHN6G+DZ7Gfccf72aG4aOXJ0CWcNu+xQ=;
        b=SdJhXds2L90YC8FNHmtWh5Fh9TEgerNWhfkuw8x3d9CBnfm/9eipZjv0gPdpJNH4I0
         S+51SqBNWDjQiWTiQlTyu6PNy4niyZRnQhbIkbzuxQiNibwxH6mkZqPrFqBbyJTrkaSd
         9Mn4ob8QKmJos009LfgYNnOTusdfrKp1xLSuoRmHmtBWBuBrOTTzfiu5JzBu+friunut
         7j3QXKw2PfZd7vhhYsSAGJiGY/32mBAW8UAr3zD1WlpFMVlQcqneZ096cl3TmZsBGjzc
         3x4d21+FAOrJhsugApLkXvPF1NkwgnZMzvQRH+9jPPL4ZLADP+yEglXH2v1r5QVynX/K
         vjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zxu59m+BC3IHN6G+DZ7Gfccf72aG4aOXJ0CWcNu+xQ=;
        b=0IRetJZFmDy5zocERAAqPbSXTa4Vlcz1pDrDTJWVWEAAPtOxd7dahsu8DSfDUj3kUg
         jbeINRUlzR9k95bYZzrvrM+SAhuVGKLAzIolSdHOQpJqfqZGDJPuCSWU71fMW3M5LHTb
         VrJ5Zf4i8uovKAM4HSUzSBkQ7fYD1l8WEWuzY2kHJWaG8TMW60P7YEKxfGoRr5IV8H6n
         OKu5gba8DDVR7N9Ary1iTSqfC1iWuSfSJbbmDzGojquiFMr+2rjHw3Kuw8m7qLEVdKqT
         BHcuYONLb5PIpbff9HXiqFv/xU1k6KTMX0AWiONYGpl0B2SJIUxdtovCfPS42nTsZZbc
         yIUA==
X-Gm-Message-State: ANoB5pnLqyyUOhM4zMOZEbda4TMemEXI/Ka0UhyZ5HlC7t8+9m08abyG
        wM1lohy2/ezsy5zG/lqEw+HbEIYo4VJt5g==
X-Google-Smtp-Source: AA0mqf7xeoOaS0AA84SgKnbp6lpiXTBq7xMlUXV6MswQxMERGECN0IbonM/14NtNvPIycx9F8VqJbtOKzbBrCA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a17:90a:d3d5:b0:218:845f:36a1 with SMTP
 id d21-20020a17090ad3d500b00218845f36a1mr97581242pjw.117.1670528382072; Thu,
 08 Dec 2022 11:39:42 -0800 (PST)
Date:   Thu,  8 Dec 2022 11:38:41 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-22-dmatlack@google.com>
Subject: [RFC PATCH 21/37] KVM: Introduce CONFIG_HAVE_TDP_MMU
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
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Introduce a new config option to gate support for the common TDP MMU.
This will be used in future commits to avoid compiling the TDP MMU code
and avoid adding fields to common structs (e.g. struct kvm) on
architectures that do not support the TDP MMU yet.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 virt/kvm/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 9fb1ff6f19e5..75d86794d6cf 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -92,3 +92,6 @@ config KVM_XFER_TO_GUEST_WORK
 
 config HAVE_KVM_PM_NOTIFIER
        bool
+
+config HAVE_TDP_MMU
+       bool
-- 
2.39.0.rc1.256.g54fd8350bd-goog

