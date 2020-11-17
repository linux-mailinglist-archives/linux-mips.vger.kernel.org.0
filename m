Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69822B5BC5
	for <lists+linux-mips@lfdr.de>; Tue, 17 Nov 2020 10:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgKQJ1U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Nov 2020 04:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgKQJ1U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Nov 2020 04:27:20 -0500
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1692C0613CF
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2020 01:27:19 -0800 (PST)
Received: by mail-il1-x142.google.com with SMTP id k1so17952381ilc.10
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2020 01:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yYoMVS6XHt0ISaD8paEnxowW5oF1z27X4fBub9Vq2WY=;
        b=tXANMzSXy6PMjDpjgWUyOCnVkwaEom6pzZhUquCO7xrVG7PMZl7YGrLCWHAnB3dPIa
         n0k7nUYX76mLpAz1A6KwYPLzHzJjyqj7rBms9pMmFcwCWFTQb1ADqRxPrYtr/zuDLiRO
         avG8GD5A2VpCQ+7TNb+vH16v8RQCeSxfEZxXeIf0M9foVzMEE7XAx5WLW6eVvntVfE2j
         V/Hs0bGPVHrra7wJbp26+4D1bVzi3aK/tapyComVTjQiQSJOqiiGWgEPgmQXi6yqe5jf
         l+cV9VhC7QaaLC9aS2NIAPnUHhL8sW1z5brpQXbaIKgH/Iw5xVlhL6yxBmJYLGlwYXO5
         +aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yYoMVS6XHt0ISaD8paEnxowW5oF1z27X4fBub9Vq2WY=;
        b=iiK60Wg7SNUDqDYJtUcvE2qe/Hd6LaKi4dwJcxDxV4SCLekdJWYYjwBfaHZtdry5wn
         RAw5cOGdjmx9K1gV9REDiIsw5kqLpJuJLWVmmw1HP978GcGXpEZa5c1c35OZ0Ceyeuy3
         AzWvXAC8ampe/Xj5e+HfxjXhmmJubz3niqimcrcHOm6DKI++92ke8bmp1Mt4t+i1CHDC
         i6Jyosi99NdbDQIXVojcAeICs7MIqFR44IQT5Me+MQo0oFQh1b0r5QWufFq85SpsNY+1
         FJtBVcV2lcyZyaLzs6ytyBWmQQY2ikGel5pKRkInGaOk5jzw7ns1255KPM1xqbb2P5b9
         cuAw==
X-Gm-Message-State: AOAM530lVwHJyyIUBzfOLH5jT5uR4/jzHSz8I1r22c5On4TlYza4CHlG
        EhOP7yfIWKGkod/Ec8lVjTeolN0FvjFNc9jT7fKbkrz2funK4A==
X-Google-Smtp-Source: ABdhPJzB/BYhC36twhmtleq+zOZBnMzi8lJYSURX3TV+P90wxx/7zyPY/CwR/Qyro+YPrV4JHR0GiEJAsm1G412d5BM=
X-Received: by 2002:a05:6e02:105:: with SMTP id t5mr6532834ilm.122.1605605239101;
 Tue, 17 Nov 2020 01:27:19 -0800 (PST)
MIME-Version: 1.0
References: <20201117072918.2666-1-liuzhengyuan@tj.kylinos.cn>
In-Reply-To: <20201117072918.2666-1-liuzhengyuan@tj.kylinos.cn>
From:   Zhengyuan Liu <liuzhengyuang521@gmail.com>
Date:   Tue, 17 Nov 2020 17:27:07 +0800
Message-ID: <CAOOPZo4P1iOmx34Dc-jeoh4u9ZxF=wdLEZSteRs0=XmVkybYgw@mail.gmail.com>
Subject: [PATCH] MIPS: Loongson64: return cpu_all_mask when node is NUMA_NO_NODE
To:     chenhc@lemote.com
Cc:     jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The @node passed to cpumask_of_node() can be NUMA_NO_NODE, in that
case we should just return cpu_all_mask.

Signed-off-by: Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>
---
 arch/mips/include/asm/mach-loongson64/topology.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-loongson64/topology.h
b/arch/mips/include/asm/mach-loongson64/topology.h
index 3414a1fd1783..57f0306fcf34 100644
--- a/arch/mips/include/asm/mach-loongson64/topology.h
+++ b/arch/mips/include/asm/mach-loongson64/topology.h
@@ -7,7 +7,9 @@
 #define cpu_to_node(cpu)       (cpu_logical_map(cpu) >> 2)

 extern cpumask_t __node_cpumask[];
-#define cpumask_of_node(node)  (&__node_cpumask[node])
+#define cpumask_of_node(node)  ((node) == -1 ?                         \
+                                cpu_all_mask :                         \
+                                &__node_cpumask[node])

 struct pci_bus;
 extern int pcibus_to_node(struct pci_bus *);
--
2.20.1
