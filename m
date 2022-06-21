Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4540C553670
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jun 2022 17:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353201AbiFUPl6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jun 2022 11:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353200AbiFUPll (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jun 2022 11:41:41 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EF2042CE19
        for <linux-mips@vger.kernel.org>; Tue, 21 Jun 2022 08:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=6uQYp
        trw7IZBjnbUg4GbSjS8GM49xU3jv5quovyWUBk=; b=eOLXqsBuf4WsYCz2CLOQN
        Qj1VbeA8MW3oZdxEDVMwg27bEwwHEUazphW+Fd50EOY7VaidCNQTIqNPG2KVykFX
        Bb1ypp3lKYRf0J2VFCCtlMlpuHH2/bAVDtT2s1KbAyamQ3eIUkwvcJexkiFDjZLQ
        VqbmG3WSJromxnyWAaCE6w=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowAAHA9ul5rFit6wSDw--.59399S2;
        Tue, 21 Jun 2022 23:41:27 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        windhl@126.com
Subject: [PATCH v2] mips: lantiq: Add missing of_node_put() in irq.c
Date:   Tue, 21 Jun 2022 23:41:25 +0800
Message-Id: <20220621154125.4084010-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAAHA9ul5rFit6wSDw--.59399S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr1rCry8Gw45uFykCFy7GFg_yoW3XFgEg3
        WI939rKFWrJw4kX39ruF43GrnxA3yvgFn5Awn7Aw1Fyw1fA3WUtFZrtrZ2qw4rZFZIvFWr
        AryDWr1Yvw429jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNVbkDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2ggnF1uwMQPeCgAAsv
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In icu_of_init(), of_find_compatible_node() will return a node
pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: fix bug intro-ed by v1, only one put needed.
 v1: add missing of_node_put()

 arch/mips/lantiq/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index b732495f138a..20622bf0a9b3 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -408,6 +408,7 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
 		if (!ltq_eiu_membase)
 			panic("Failed to remap eiu memory");
 	}
+	of_node_put(eiu_node);
 
 	return 0;
 }
-- 
2.25.1

