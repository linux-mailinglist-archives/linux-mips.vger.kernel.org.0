Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEE26959C0
	for <lists+linux-mips@lfdr.de>; Tue, 14 Feb 2023 08:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbjBNHHf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Feb 2023 02:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbjBNHH0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Feb 2023 02:07:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3081F5E7;
        Mon, 13 Feb 2023 23:07:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 63043B81C03;
        Tue, 14 Feb 2023 07:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FCAC433A1;
        Tue, 14 Feb 2023 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676358414;
        bh=wu6LTRXru7nWyi2Ep9Lymkp1Vs6jli+8qnKXJEfRRlk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pBWajwyC6eZHxl5YTbqnE/95CYn//yQCVENJWaDj5KhoUt1aag5nvaHja/0HdJ1mW
         X4MWumwa8fgVpZVuVCKQjcQ2ErPDfuq9EWIL1C6CsOcO4hXctxKlHJVwMXOUF+JTiF
         B+//nYfwgDdiV1oKlcXo9Hd0YLE8QOjNVv1BQhhcOsgmaTkK99tBhbNQ1crwms+Ua9
         am/PeEUzKk2CCwsnSgTjTS3Ztlw5wa3G6w/fqp3eeOJYZuKeyUDi3bvvzbM718WHOi
         Uuem/JRBOqIzvtXYvVZXF1W4bCz75afEA61iOZpnVcnNwJStxDuuCWKI6Hr+grLu3E
         hXdS10io+JBzg==
From:   Josh Poimboeuf <jpoimboe@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     jgross@suse.com, richard.henderson@linaro.org,
        ink@jurassic.park.msu.ru, mattst88@gmail.com,
        linux-alpha@vger.kernel.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
        will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org,
        linux-ia64@vger.kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp,
        dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net,
        sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
        linux-xtensa@linux-xtensa.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
        paulmck@kernel.org
Subject: [PATCH v2 03/24] arm/cpu: Make sure arch_cpu_idle_dead() doesn't return
Date:   Mon, 13 Feb 2023 23:05:37 -0800
Message-Id: <ed361403b8ee965f758fe491c47336dddcfb8fd5.1676358308.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 0b8c25763adc..adcd417c526b 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -382,6 +382,8 @@ void arch_cpu_idle_dead(void)
 		: "r" (task_stack_page(current) + THREAD_SIZE - 8),
 		  "r" (current)
 		: "r0");
+
+	BUG();
 }
 #endif /* CONFIG_HOTPLUG_CPU */
 
-- 
2.39.1

