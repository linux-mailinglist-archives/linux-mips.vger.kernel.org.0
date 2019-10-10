Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93CFAD3411
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2019 00:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbfJJWqu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Oct 2019 18:46:50 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44719 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbfJJWqu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Oct 2019 18:46:50 -0400
Received: by mail-pf1-f196.google.com with SMTP id q21so4814893pfn.11
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2019 15:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=1bKGtbkU276Qic7083jH1GxErr25ze2mM6VPeh2J7GA=;
        b=DyCP4NZI/zuNYDu7jY/ZZUEXHfDKMSazvkYJ6PuzJxjMRKhp+rAxzK5Dt2H01Pv6+m
         LlMpUzTq+PUEEJZm/ab4gpJ3nZT0JvOiDbHG3GengQcNOIRuhA8pbDGv4navVXCn01qB
         xpFAse9TBG8UdMjY262hjIHZRhZAMMC7WV7UM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=1bKGtbkU276Qic7083jH1GxErr25ze2mM6VPeh2J7GA=;
        b=TRCwdko+mjvwi8tIn3KlLGWEYk32MMuj3mNn9ORTiXy5bCfk2VPxRm2PRlJt30ppY6
         61uX8fmqHjrz5kqB/pFLSGr11ku0dN/YTKfyArFPnEk662f3veDrk+ja0XT51gNIe0f7
         d2rtWCh67dxxYHfbozkvM5HWQ7t3YkXgN6avEuu51UIne05TlqaKxTYtMA7kr/igd/g0
         5UKh3v/FQzZ0iyjwpwBRStP11HAp/2H39sW8BwDYw1umwR6XkJS8+Jq4lUmIVEIvXMbx
         arn9DIHAmN9DiyX6bFfSeVWXlPi5KrrRwQwiteV0rE/QzQc9HVjcAH/i+qNvCtBAdXLd
         paBQ==
X-Gm-Message-State: APjAAAVEBt0xrVDg13sLh/5gZRHwMai0OZx1e2EM4fdnJgTS1TMZt6/F
        zCj6Ds7TX1Vt5E7Cvdsm41uAlw==
X-Google-Smtp-Source: APXvYqzPLTDHvgkpFIsRejZmoidbgu1xjUA2eDPKSvdkhsR2rKQm7kIBl5bRbTqnNTcfRoKBUArVEA==
X-Received: by 2002:a17:90a:c383:: with SMTP id h3mr13985098pjt.122.1570747609862;
        Thu, 10 Oct 2019 15:46:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w134sm6554453pfd.4.2019.10.10.15.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 15:46:49 -0700 (PDT)
Date:   Thu, 10 Oct 2019 15:46:48 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Ralf Baechle <ralf@linux-mips.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: OCTEON: Replace SIZEOF_FIELD() macro
Message-ID: <201910101545.586BCFC@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

In preparation for switching to a standard sizeof_member() macro to find the
size of a member of a struct, remove the custom SIZEOF_FIELD() macro and use
the more common FIELD_SIZEOF() instead. Later patches will globally replace
FIELD_SIZEOF() and sizeof_field() with the more accurate sizeof_member().

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Link: https://lore.kernel.org/r/20190924105839.110713-4-pankaj.laxminarayan.bharadiya@intel.com
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/mips/cavium-octeon/executive/cvmx-bootmem.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-bootmem.c b/arch/mips/cavium-octeon/executive/cvmx-bootmem.c
index ba8f82a29a81..44b506a14666 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-bootmem.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-bootmem.c
@@ -44,13 +44,6 @@ static struct cvmx_bootmem_desc *cvmx_bootmem_desc;
 
 /* See header file for descriptions of functions */
 
-/**
- * This macro returns the size of a member of a structure.
- * Logically it is the same as "sizeof(s::field)" in C++, but
- * C lacks the "::" operator.
- */
-#define SIZEOF_FIELD(s, field) sizeof(((s *)NULL)->field)
-
 /**
  * This macro returns a member of the
  * cvmx_bootmem_named_block_desc_t structure. These members can't
@@ -65,7 +58,7 @@ static struct cvmx_bootmem_desc *cvmx_bootmem_desc;
 #define CVMX_BOOTMEM_NAMED_GET_FIELD(addr, field)			\
 	__cvmx_bootmem_desc_get(addr,					\
 		offsetof(struct cvmx_bootmem_named_block_desc, field),	\
-		SIZEOF_FIELD(struct cvmx_bootmem_named_block_desc, field))
+		FIELD_SIZEOF(struct cvmx_bootmem_named_block_desc, field))
 
 /**
  * This function is the implementation of the get macros defined
-- 
2.17.1


-- 
Kees Cook
