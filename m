Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F3D1D215B
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 23:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbgEMVqp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 17:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729752AbgEMVqo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 17:46:44 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128AEC061A0E;
        Wed, 13 May 2020 14:46:44 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z72so20605923wmc.2;
        Wed, 13 May 2020 14:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SsGLhvtzNNE3Um+kD27FrquNqhBmiHi5qwlCc1MeclU=;
        b=XiuECaHuWlZtqmf2V9RziiPXPESy1M5JPlu5ULkY1Lq+ut+oFJhcdMTgwL8RtzNBUV
         slYA65/n18tW4XScYRxcfofPeB0hkM1niA79FfTflHA8206jGnBB1em5BozDhCCKIs5s
         Of+LQcm2e4gZIPPxSt6hpTQ+oD0f7H7qjnnguQvB+7bPo4Q+A8tiYIewQkjcGa0TY4M6
         2Vwfm8RIAaGCX8i19Ue/tSbRgXnuE5ME8dI8KYqGdr0JO95Bg3t63kP+vDCfdTvdEM34
         GZ8DDZzy9jiM9k8AUC6DMts6GkZaNtSXkx+Jg041oD4WxMaElsC9zd2m1/qTAbUZulrg
         N39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SsGLhvtzNNE3Um+kD27FrquNqhBmiHi5qwlCc1MeclU=;
        b=M7dvT4grnK0RYqsrGLH+jeXMJq+ItYuiu+WGmMYMLYT66E2o937WDiC4X6m4Ng/Zvt
         PgvPL6JMciGW/0X3vm1ogcBCy9KDyDJGcyoc6gozORc3t1EIVP1IQuthMj8eYrUSWUPR
         ilcppBjZlfGDT/7B9Omo7JDDXQ5l1JIHe0F68qMlKyl4D6TgIjNzHA27A4mMlY6PE58T
         sDVpnudtYh5bjmi57OalFTs/Oo4Gd3HFWDJa4Gwmsgch00kEHX9eNihTIxmiBfR7vmW8
         GlHFZfpVPX68AXU84KQx5KXAWBWd3W77EO1xBKRRAxRSk149wElD/Cm4cj/k9OMkSMzs
         Q9XQ==
X-Gm-Message-State: AGi0PuaF7fgsUmmbgscKTSe8yBO3zMDXSgh82u4hKekTdLDwv7Fhe8/7
        esK4lJ7CY2KMtF1o3hInWsw=
X-Google-Smtp-Source: APiQypIjDv9j1WGGbsrXKzuvn+8PI0doRo0I/EblRla78tb2gcpayV63BaEBdC9Tkx4qISmrxAydUQ==
X-Received: by 2002:a1c:25c4:: with SMTP id l187mr42071872wml.89.1589406402802;
        Wed, 13 May 2020 14:46:42 -0700 (PDT)
Received: from localhost.localdomain (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
        by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:46:42 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     emil.l.velikov@gmail.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH 05/11] MIPS: constify sysrq_key_op
Date:   Wed, 13 May 2020 22:43:45 +0100
Message-Id: <20200513214351.2138580-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better it this gets merged this via the tty tree.
---
 arch/mips/kernel/sysrq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/sysrq.c b/arch/mips/kernel/sysrq.c
index e5a2a6ab71ac..9c1a2019113b 100644
--- a/arch/mips/kernel/sysrq.c
+++ b/arch/mips/kernel/sysrq.c
@@ -52,7 +52,7 @@ static void sysrq_handle_tlbdump(int key)
 #endif
 }
 
-static struct sysrq_key_op sysrq_tlbdump_op = {
+static const struct sysrq_key_op sysrq_tlbdump_op = {
 	.handler        = sysrq_handle_tlbdump,
 	.help_msg       = "show-tlbs(x)",
 	.action_msg     = "Show TLB entries",
-- 
2.25.1

