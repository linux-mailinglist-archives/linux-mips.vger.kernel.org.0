Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94F19164EB8
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 20:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgBSTSG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 14:18:06 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41817 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgBSTSG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 14:18:06 -0500
Received: by mail-pg1-f195.google.com with SMTP id 70so573502pgf.8;
        Wed, 19 Feb 2020 11:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WjEJ75Ye0Px+T+08crOm28z729fnyGWMYQ2FM654cdM=;
        b=LXTFA8QU7YqlW5QVdE8nUWafdfEyB7iDP9nMAUiIK3mJwRd1wuBgkhxMlN4a4L6nHR
         OEQMT03smzkT5USsTiZ7YTg7Bivubu7FcVKHpa1IVF93Qrwt2J5R1V6bGcTq8imOLtRV
         52SQpkj8A1C1IWvk0w1LCAUQi2af7XVWbxPlxNc/Ghgz4/wzqCMTOmuYnJg7rjZgUEij
         5mBKwpeNBmBej7RNwqqbBpnRnDlRxB5K2o8dbgwm/kT2LuML6E5KW/606QiFRHEntRXw
         Cu/70Srr0YR9zofjXhjt0ZuFXfZ94It9DiFHXlx2Yw5532tl24XS9GVmccyCT2Ll2jSB
         qT6w==
X-Gm-Message-State: APjAAAVDwK+uLPLZTIP8ld9Kvn5wqqZu8VtFJ1YbsTs50PUFUQln0Z0u
        sq5xjRNX+LWxJz1ViiWPyZl0HeJu1fFaHw==
X-Google-Smtp-Source: APXvYqxMJP7zsU+LEWgFm/T5jDWqZepBIh7DYXHBXaH7TpzvrycIeP+yIVKnp3OrbEO3gNI9QVWduA==
X-Received: by 2002:a63:d207:: with SMTP id a7mr29492847pgg.225.1582139884856;
        Wed, 19 Feb 2020 11:18:04 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id i64sm476502pgc.51.2020.02.19.11.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 11:18:04 -0800 (PST)
From:   Paul Burton <paulburton@kernel.org>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Paul Burton <paulburton@kernel.org>
Subject: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
Date:   Wed, 19 Feb 2020 11:17:30 -0800
Message-Id: <20200219191730.1277800-3-paulburton@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200219191730.1277800-1-paulburton@kernel.org>
References: <20200219191730.1277800-1-paulburton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

My time with MIPS the company has reached its end, and so at best I'll
have little time spend on maintaining arch/mips/. Reflect that in
MAINTAINERS by changing status to Odd Fixes. Hopefully this might spur
the involvement of someone with more time, but even if not it should
help serve to avoid unrealistic expectations.

Signed-off-by: Paul Burton <paulburton@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index afa228ade18e..67f05f6dbf77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11120,7 +11120,7 @@ W:	http://www.linux-mips.org/
 T:	git git://git.linux-mips.org/pub/scm/ralf/linux.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 Q:	http://patchwork.linux-mips.org/project/linux-mips/list/
-S:	Supported
+S:	Odd Fixes
 F:	Documentation/devicetree/bindings/mips/
 F:	Documentation/mips/
 F:	arch/mips/
-- 
2.25.1

