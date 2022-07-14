Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E876757509A
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jul 2022 16:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240125AbiGNORo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jul 2022 10:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239397AbiGNORf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jul 2022 10:17:35 -0400
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 90F716393C
        for <linux-mips@vger.kernel.org>; Thu, 14 Jul 2022 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=snhiz
        waPBUhfnCTmn/gap4giwBuCuZ53qOkKj8jmInM=; b=I7lvqWrWLLtviRY74iHvH
        yse4BDVU9wLYEw8/QqmU2UrrH0JIyvaX8DlO+r9MeeqnA5lLe4cApY3psY9fmnkt
        5CxanPS822v5oaxRXYDwNsFoH5qVRabHafXjFZvNQ/HL20urq1mk9g4GjfRFCk18
        JJMwEQ2L1+eq8bH6bpugMk=
Received: from test.pnp.gw (unknown [218.247.43.97])
        by smtp8 (Coremail) with SMTP id NORpCgDXNZpiJdBi6XiDHw--.63493S2;
        Thu, 14 Jul 2022 22:17:07 +0800 (CST)
From:   Ning Qiang <sohu0106@126.com>
To:     dan.carpenter@oracle.com, sohu0106@126.com
Cc:     greg@kroah.com, security@kernel.org, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de
Subject: [PATCH] MIPS: vpe: fix integer overflow in vpe_write()
Date:   Thu, 14 Jul 2022 22:17:05 +0800
Message-Id: <20220714141705.2375-1-sohu0106@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgDXNZpiJdBi6XiDHw--.63493S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF43trWDXw1rtF18tw17GFg_yoWfKFXEkr
        yqvw48Cr45Aw1UXry7K39Ygr15KayftFZaywn8uryYy34rXryFyay8G3sYgw1DXrn5tFZa
        v34rursrCFsrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRipuWtUUUUU==
X-Originating-IP: [218.247.43.97]
X-CM-SenderInfo: pvrk3iqrqwqiyswou0bp/xtbBGhM+Hl-HZf4clgAAsg
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the vpe_write function of arch/mips/kernel/vpe.c,parameter "size_t
count" is pass by userland, if "count" is very large, it will bypass
the check of "if ((count + v->len) > v->plen)".(such as
count=0xffffffffffffffff). Then it will lead to buffer overflow in
"copy_from_user(v->pbuffer + v->len, buffer, count)".

Signed-off-by: Ning Qiang <sohu0106@126.com>
---
 arch/mips/kernel/vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
index 13294972707b..1529e755200d 100644
--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -849,7 +849,7 @@ static ssize_t vpe_write(struct file *file, const char __user *buffer,
 	if (v == NULL)
 		return -ENODEV;
 
-	if ((count + v->len) > v->plen) {
+	if ((count + v->len) > v->plen || count + v->len < v->len) {
 		pr_warn("VPE loader: elf size too big. Perhaps strip unneeded symbols\n");
 		return -ENOMEM;
 	}
-- 
2.25.1

