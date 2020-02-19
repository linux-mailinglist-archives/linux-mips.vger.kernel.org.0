Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F36D4164EB6
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 20:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgBSTSA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 14:18:00 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35606 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgBSTSA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 14:18:00 -0500
Received: by mail-pg1-f194.google.com with SMTP id v23so587907pgk.2;
        Wed, 19 Feb 2020 11:17:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Dlch+GyX+zKy3uJeNhvkNPbzZCbtvJ2NZncirOTCTo=;
        b=KesySklsCgxE5tIMxp++4vkeCnCIMqdSeKqfympryKUGGwJ5N5HvgRMgxqYk6xcSUI
         PjfWzhl3kriTzof+AL8YHLTkT3+amg1ESk8UKmpgtpzIzw1wib9cbEqXzPvLsmiWg68r
         0ZAWawbKyZ/LCERWMCHj633Fjbb1wi/lF2iSoc3ELPSXK2Pi1GECel61LT4YgJqGr+0d
         KtzqqaEorxeDia8CFMLJmVfCQYv/cdBcaXGsd97WhPX0U+AmmWkZaY3WvyR+cxzPX7mm
         D8jWDhc93xp0V26813bu8dkZONKCWMfYH5TIyT43+9P+OG0T51Ijnmhvn/XxEimPwY37
         Y7rg==
X-Gm-Message-State: APjAAAXj416dV8rldvWog4Z9LcZen5XUlLwqmmBbH+iTSX1LV6ASDqP5
        p9umGG+bB5PtA4Qi49XPy5BIZn8ZUbfQxA==
X-Google-Smtp-Source: APXvYqytQ2LWxXIEi6HH8fK0ieenX39XAczwa55lRcIJ5Rbf/ib7A7emU1rjK0L/MnCfzrh3HOiwXg==
X-Received: by 2002:a63:f454:: with SMTP id p20mr4569336pgk.149.1582139878774;
        Wed, 19 Feb 2020 11:17:58 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id t8sm563133pjy.20.2020.02.19.11.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 11:17:58 -0800 (PST)
From:   Paul Burton <paulburton@kernel.org>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Paul Burton <paulburton@kernel.org>
Subject: [PATCH 1/2] MAINTAINERS: Remove Ralf Baechle as MIPS maintainer
Date:   Wed, 19 Feb 2020 11:17:29 -0800
Message-Id: <20200219191730.1277800-2-paulburton@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200219191730.1277800-1-paulburton@kernel.org>
References: <20200219191730.1277800-1-paulburton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ralf last authored a patch over 2 years ago, the last time he committed
one is even further back & activity was sporadic for a while before
that. Remove him from MAINTAINERS to reflect the reality that he isn't
active anymore. Ralf already has an entry in CREDITS to honor his
contributions.

Signed-off-by: Paul Burton <paulburton@kernel.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0d86490c2c6..afa228ade18e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11114,7 +11114,6 @@ S:	Maintained
 F:	drivers/usb/image/microtek.*
 
 MIPS
-M:	Ralf Baechle <ralf@linux-mips.org>
 M:	Paul Burton <paulburton@kernel.org>
 L:	linux-mips@vger.kernel.org
 W:	http://www.linux-mips.org/
-- 
2.25.1

