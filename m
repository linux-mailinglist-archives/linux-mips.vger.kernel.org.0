Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 645214E71C3
	for <lists+linux-mips@lfdr.de>; Fri, 25 Mar 2022 12:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237557AbiCYLCY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Mar 2022 07:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237353AbiCYLCX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Mar 2022 07:02:23 -0400
X-Greylist: delayed 191 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Mar 2022 04:00:49 PDT
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BCCC4E0E
        for <linux-mips@vger.kernel.org>; Fri, 25 Mar 2022 04:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1648206047;
        bh=6OcTYymcpn1ETfdJpMGEKngpR17gFGKQz5gHn9I1PVs=;
        h=From:To:Cc:Subject:Date;
        b=By06l6ACVEcWvfxd+9va8TefbbVWRuLn+CaKf2xKrOPE2zldMtsefjC0DNlx2QO2w
         KlmZVmI5Sy4onP5lgNX8/RIL4yg5LDUALO3hbQBQWIrejA92tKY/gQ+jFnoH9S4iPm
         YgGY0HMhZZYljfYyi6+89yYw491zkSU15AFfKWiY=
Received: from localhost.localdomain ([43.227.136.188])
        by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
        id E602687E; Fri, 25 Mar 2022 18:57:32 +0800
X-QQ-mid: xmsmtpt1648205852tconbqa3l
Message-ID: <tencent_33384AA3FF65207ECC63B9531C1F1417E108@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeieFm7kI9XblVO1Ypif6OeHBEb2nEHDiQJ3sU6oQQmw5b1GkMOP7O
         Mnb1pv9Urdl+jVwu9BK08Pcl/Qfm274NkG8mQOHFlLL4wJCK/8PRt/Y8ZyqPNW1cPnYLQ5dUVMYI
         LJNrNT/ETTzZ55PY+baBFGSygMRKPmeqMqwchlkvBsHcOgPvP9aEFB87yzq+hbZGYW7OiwaLibPh
         rlkxwETKD+Cs8/BdqeGLNzdqNUX4I7lTnqY2dbv129sC8bLaLOFCpsllcBzO4XimrAVS2MWGMPK+
         K/aU6U3HErZv+mDnucPhxcus6DecqSMaKZSSGvwfFeZ2OYNiWt/ZD45UiyQHS7SqjuyuJiDzsXuo
         7hrtX5IvVcT4wtZgFdB7Hvsl8Fqlgi+jbxQUiItzOMY+tYaeLtVB4IfNUfbdeInrsywTnpN9/Xlu
         c5hCYDFF2IQNpoHMgq6dhS8n+3tRU33rSIxuEUdTWWOw9C4UBVaBmWkn2MVrehPp6071QN1DpPvW
         OMXZJCscAPzIl5fUZIuBy/RcMxb63Qn7BSf1OvPI7VkFp4VJGX9GabBMQLkHRBcBbCFrP8tywaay
         3qV5yZmg2+sTxXdhJUVGpkrs9CB5UG3gW35WHT3+EmQsuJWhXVO+NbhWXCHvVVnKr5mDZZVqYreH
         9qIGtwKjlUThCBHmtMKDTJTab+JY0y1JZOVAsT5oYG1MLedLLdIfQneIHMVFfMyu5UjDwX4Mt/TN
         c9XjlGHy2eZrJ/jR6rfOs6VaO5M8DFgggsXA7cTVZh5oRwxsvhzP9vWKIr69qMhZ5anmHozWty+3
         LJek2SVyH8XvZq1r9MV8aVvIH9o/G7c9DkWJgwTN2A65l/2dsDmPGUtgFJ60MYKGeS37NNuqawyc
         H3nzDBDKkp346Tvyk4DfVC5erHHN6UDN3jYyNTLGr6w53DHzAd3LDG7If4qbNF9NSzLuahzFjFcB
         b1rvKqIcE=
From:   xkernel.wang@foxmail.com
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] mips: sgi-ip22: add a check for the return of kzalloc()
Date:   Fri, 25 Mar 2022 18:57:18 +0800
X-OQ-MSGID: <20220325105719.4348-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check it to
prevent potential wrong memory access.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 arch/mips/sgi-ip22/ip22-gio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
index dfc52f6..38d12f4 100644
--- a/arch/mips/sgi-ip22/ip22-gio.c
+++ b/arch/mips/sgi-ip22/ip22-gio.c
@@ -363,6 +363,8 @@ static void ip22_check_gio(int slotno, unsigned long addr, int irq)
 		printk(KERN_INFO "GIO: slot %d : %s (id %x)\n",
 		       slotno, name, id);
 		gio_dev = kzalloc(sizeof *gio_dev, GFP_KERNEL);
+		if (!gio_dev)
+			return;
 		gio_dev->name = name;
 		gio_dev->slotno = slotno;
 		gio_dev->id.id = id;
-- 
