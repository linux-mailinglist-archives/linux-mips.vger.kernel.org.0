Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D801B616C80
	for <lists+linux-mips@lfdr.de>; Wed,  2 Nov 2022 19:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbiKBShY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 14:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbiKBShJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 14:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9852FC1D
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 11:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667414066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vPxNJZ59dAj9Aw/rnn/vqSwo8b8sDM1O6Xi76OwhNZs=;
        b=L/8+QVXWBbfiZ92AeTl7/2LbksdpihZV1psDO5gjVTnM+4vDSA87xZ5/fQJ8YOL+ULZv1B
        Z3o3AjwtimKYjiRnBM4Mgxu7kjtLRolsZoSv3iysrHhBzkOr3dArOdK/aPh8wu89zvSS+3
        oCZ6FRgBDL160DtPy8KgcqyH5Q8HFUY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-292-k-rjlPu5P7eA-bnN22XYOw-1; Wed, 02 Nov 2022 14:34:25 -0400
X-MC-Unique: k-rjlPu5P7eA-bnN22XYOw-1
Received: by mail-qv1-f70.google.com with SMTP id b2-20020a0cfe62000000b004bbfb15297dso5392379qvv.19
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 11:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPxNJZ59dAj9Aw/rnn/vqSwo8b8sDM1O6Xi76OwhNZs=;
        b=Zj+UsYy3s4pzO2HV5QgK5xRduxHYpcyXYZj3NBMNsa0HEcfL8dZvHz+DFYVl6196HO
         ZhgRZGvZ03zT+PtwAooq+8Yup/FLFIqPNYgnhaViY6siWDwHkZ+fqV4+wC9YIGQRall0
         bgsOCeVcDFALr0eaYHiylsjj6t/uNGdcqHQProl479jD2hTD6FsI0znZK+q7irqft4jE
         yLEJ34jIqOfArSFaIzwBwASBcMQQsMcHDGNWODEeGJssKocmXbYctDnS5ZredEbEI9ND
         3xAdXIJ9Z/3srcNVih73dnn7KIKeFXDLDoIPTCmgVJw2cb1YYYcPmzStIYqelp4mP16M
         2Qwg==
X-Gm-Message-State: ACrzQf08EEXw0wCZEIs1CdrxdY94vg10aJ8LONC+iXzBay8XvqrFSP8x
        XIampIO4fxcazFSGzm1dWpdmG+oGFo2rvfgRCkMdVG3miewOXxB+YRf6rPBhpho3R+aB7eHTZiS
        1b3ekm/WgoUI4IMNEpy9Esw==
X-Received: by 2002:a37:92c6:0:b0:6fa:28b2:1e2a with SMTP id u189-20020a3792c6000000b006fa28b21e2amr13574186qkd.9.1667414064983;
        Wed, 02 Nov 2022 11:34:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4EXOUjNlIxUYR8PDvF9w7H8/QWuUsvimzUEYEqnOFqRnuqhuZtDCzI4Vu/740apEttSzlakQ==
X-Received: by 2002:a37:92c6:0:b0:6fa:28b2:1e2a with SMTP id u189-20020a3792c6000000b006fa28b21e2amr13574163qkd.9.1667414064758;
        Wed, 02 Nov 2022 11:34:24 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id w187-20020a3794c4000000b006eed47a1a1esm8757820qkd.134.2022.11.02.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:34:23 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        Guo Ren <guoren@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: [RFC PATCH v2 5/8] irq_work: Trace self-IPIs sent via arch_irq_work_raise()
Date:   Wed,  2 Nov 2022 18:33:33 +0000
Message-Id: <20221102183336.3120536-4-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221102182949.3119584-1-vschneid@redhat.com>
References: <20221102182949.3119584-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

IPIs sent to remove CPUs via irq_work_queue_on() are now covered by
trace_ipi_send_cpumask(), add another instance of the tracepoint to cover
self-IPIs.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/irq_work.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/irq_work.c b/kernel/irq_work.c
index 7afa40fe5cc43..aec38c294ce68 100644
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -22,6 +22,8 @@
 #include <asm/processor.h>
 #include <linux/kasan.h>
 
+#include <trace/events/ipi.h>
+
 static DEFINE_PER_CPU(struct llist_head, raised_list);
 static DEFINE_PER_CPU(struct llist_head, lazy_list);
 static DEFINE_PER_CPU(struct task_struct *, irq_workd);
@@ -74,6 +76,16 @@ void __weak arch_irq_work_raise(void)
 	 */
 }
 
+static inline void irq_work_raise(struct irq_work *work)
+{
+	if (trace_ipi_send_cpumask_enabled() && arch_irq_work_has_interrupt())
+		trace_ipi_send_cpumask(cpumask_of(smp_processor_id()),
+				       _RET_IP_,
+				       work->func);
+
+	arch_irq_work_raise();
+}
+
 /* Enqueue on current CPU, work must already be claimed and preempt disabled */
 static void __irq_work_queue_local(struct irq_work *work)
 {
@@ -99,7 +111,7 @@ static void __irq_work_queue_local(struct irq_work *work)
 
 	/* If the work is "lazy", handle it from next tick if any */
 	if (!lazy_work || tick_nohz_tick_stopped())
-		arch_irq_work_raise();
+		irq_work_raise(work);
 }
 
 /* Enqueue the irq work @work on the current CPU */
-- 
2.31.1

