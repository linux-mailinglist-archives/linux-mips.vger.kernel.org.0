Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184AA4DCD2
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 23:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbfFTVj2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 17:39:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38027 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfFTVj2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jun 2019 17:39:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so4543277wmj.3
        for <linux-mips@vger.kernel.org>; Thu, 20 Jun 2019 14:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K6XyYBpZYTZIhNAqwvma6CPAxW9A+FG7+THYnS1wA+I=;
        b=UbGftDAcrr1GE32Qd6KkmpICdn8SCXIlBld/g1srbCN2tyYqORbnOFuMZmVy29j3Vj
         VHwr+moshdr91lH/tcIjt7JJZge2/LSjc3E3IrwSlwhIWfcCxJSZjVuPJdjw15A21uZM
         j/632vIzZVBH1m/FuQ8pFeFmpw/+tSkZBxTWrfDDc+eHN60dqXzRYMonxSp2sDa71mO6
         FgveMHS6/J9fjZ/fcYZgiFRFEHX4gMF7w0mkZydUDB+TtCW3azltAU/twMS6gL12oBUw
         JGgPPItPqkkQxvXU0uOJtN7e19q2v5VqbgY51/cbPvNHBHbiT4u7uYa34QIS0uXb4p9N
         TLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K6XyYBpZYTZIhNAqwvma6CPAxW9A+FG7+THYnS1wA+I=;
        b=rMGtR5OjIIbBcCtHtYHXT9YJBd/si85m7l/TLM6oR4c5Z/SfqjnsamlPvEwF1WLEja
         2Mzy/GwcMgnUbrUGhQSi0simsg4FsCVKpReFaFe5GfYits6BEf2WyGefrqjBwC8olyKz
         lfQYf80Ib9qxNyjqdQfydjLxLSj8wJc2hPd3rqr/Kkm1fTXyd1FvCJOrUOXUt3ihMrIu
         qoo6RPH8aDVi8DzMlUqVGafAd79IwPEEtNRSUIU79hCjOsFKC+3e+ydIFrWXm7KBghyo
         EJPwaOH2fmroomzm2V/Jqf/b8FJD0w//n3YdWKGpdoFrqQc5Bx14a3qkJ2Nd6hmY0wSy
         0o0Q==
X-Gm-Message-State: APjAAAVRydxSELh6N+8+ZSVdSVRHVzwZZmC99JV55VAadOn6JWDrQHoK
        pLBfqT/1RIzx2vLDguEjldYGKCqe
X-Google-Smtp-Source: APXvYqyaMfoLNLtNOL7QSY6DauUUCgTpC9kOTKvGlZECcjYL9J0N8pIrgdF2ITD7J/hxLwauHVcPvw==
X-Received: by 2002:a1c:208c:: with SMTP id g134mr1018201wmg.112.1561066766342;
        Thu, 20 Jun 2019 14:39:26 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-ecaa-d74f-d492-3738.ip6.tmcz.cz. [2001:1ae9:ff1:f191:ecaa:d74f:d492:3738])
        by smtp.gmail.com with ESMTPSA id j4sm575426wrx.57.2019.06.20.14.39.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 14:39:25 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v2 3/7] MIPS: lantiq: Fix attributes of of_device_id structure
Date:   Thu, 20 Jun 2019 23:39:35 +0200
Message-Id: <ff66ca5b146e40ac56009a4e511bd0d0120c7814.1561065843.git.petrcvekcz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561065843.git.petrcvekcz@gmail.com>
References: <cover.1561065843.git.petrcvekcz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Petr Cvek <petrcvekcz@gmail.com>

According to the checkpatch the driver structure of_device_id requires
to be const and with attribute __initconst. Change it accordingly.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
---
 arch/mips/lantiq/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index ef946eb41439..2df5d37d0a7b 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -347,7 +347,7 @@ unsigned int get_c0_compare_int(void)
 	return CP0_LEGACY_COMPARE_IRQ;
 }
 
-static struct of_device_id __initdata of_irq_ids[] = {
+static const struct of_device_id of_irq_ids[] __initconst = {
 	{ .compatible = "lantiq,icu", .data = icu_of_init },
 	{},
 };
-- 
2.21.0

