Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26A835AB2F
	for <lists+linux-mips@lfdr.de>; Sat, 10 Apr 2021 07:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbhDJFvX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Apr 2021 01:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234289AbhDJFvV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 10 Apr 2021 01:51:21 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78AC1C061762;
        Fri,  9 Apr 2021 22:51:07 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a4so7566619wrr.2;
        Fri, 09 Apr 2021 22:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YLgnpTDzqgZbTH7wvh2LZzvbn10dMFxSc3peI6dJFkE=;
        b=a+7Ki6wF0FvA3lPmHZs642eVYROpgvNG8HS/bWDY+d04pfyz0fEzXB4lOGOpf/lL6b
         5WbHPgjXKkHvsCkKAY/O6pndBedbVKmg0KzBziP54pwXslNI4emiQDlM8mXuLtROccqK
         oGxkd1ml9LjaBxyi/ood/+L7W7c0hZbvY99KGYdTfAc3BhRbLIatP4sPZyL1BB3Cr7QY
         LXZB0Lc3IQ957/Gzo7G120+zPyjApDGJrOtyDOAYFx12daJgcCPBDC04C8EMPSsGa1fm
         sYSmPjvEI9CLKEewPgZV+/3Y7VeJPzs88o2eqYUm1lm8oCuQMWU7ukSOLLYrQ4YY5lqj
         Acew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YLgnpTDzqgZbTH7wvh2LZzvbn10dMFxSc3peI6dJFkE=;
        b=qY4Vp9vDH5booOzv0Mo1mTGc0VVYDxi7FHWgQz2lCZ6ARucrOioswVZktazlmgzQJH
         c+IBBD2tqrqGsqmhgnuPIEMD+W2H345LqdQ/SWcaTUkRS8UQEQeYVWyq+re/XW7k+yVK
         NcTfaQu8AEl83XO/iySmapI+4Djjvwb+q0GV8QlAdJUC8n37k+rBB/sidDMVhGwaeNW1
         9Up5QH7uQQJwkp3oGBs9Iqybyj1ET1b0g8/ee2Jc5iATwfMO7Z93UhGii3uTiahM1wWb
         ZR44NMqmjD5vlJDNdL5d5uTH1KJLj3yYeOpKCFDIMdbDViMhRAz2xNz5dTHBu6ivJ7Cu
         wGtw==
X-Gm-Message-State: AOAM530/GtKRJcSUMH1B1xQre3PaxqxEyi6PQU/AzpDknsND66iLd+/H
        0Pggrmam9tK8XfVpcoNa2DU=
X-Google-Smtp-Source: ABdhPJwX43C1QI+A7YcF/1UW239rOdz1jJtlk+DT7GxdlBAbcDoDLs/yRAJKJXn6T6pjudkjEKnT2A==
X-Received: by 2002:adf:fcca:: with SMTP id f10mr11954580wrs.148.1618033866338;
        Fri, 09 Apr 2021 22:51:06 -0700 (PDT)
Received: from localhost.localdomain (225.red-83-57-119.dynamicip.rima-tde.net. [83.57.119.225])
        by smtp.gmail.com with ESMTPSA id o2sm6376518wmc.23.2021.04.09.22.51.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Apr 2021 22:51:06 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v13 4/4] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Sat, 10 Apr 2021 07:50:59 +0200
Message-Id: <20210410055059.13518-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210410055059.13518-1-sergio.paracuellos@gmail.com>
References: <20210410055059.13518-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adding myself as maintainer for mt7621 clock driver.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d68184d3f76..02986055fdbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11484,6 +11484,12 @@ L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt7601u/
 
+MEDIATEK MT7621 CLOCK DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml
+F:	drivers/clk/ralink/clk-mt7621.c
+
 MEDIATEK MT7621/28/88 I2C DRIVER
 M:	Stefan Roese <sr@denx.de>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

