Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A40C213354
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 19:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbfECRvj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 13:51:39 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36738 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbfECRvi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 13:51:38 -0400
Received: by mail-lj1-f196.google.com with SMTP id y8so5723147ljd.3;
        Fri, 03 May 2019 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PF+qWDN5jd+CubA/a3KTQRNF/nvw8rMXCf7kpE9998c=;
        b=I2+awwAwiEibJdRnk/03VwEeSUBUmh2e3C6pOFlL0I+i4tp1q+kOm5E24xPjgewa9F
         OBkyaKL+7m1GNG9n/smQ+z5u6r8AEl/Y2zsCY20DME8PYCvCLSUoS0o80qcphBYoGoYx
         gs0yVEy30WYJDPi7j1jneBGQgk09XAV7Dw2ifetUeV8N3kP7IdlgESqiBnb+Wm8/Zw6A
         WYPxemxxzf0QGXFSwxgNABX+/9aueX3Cl7hSu3aevLgWCzfEVZXXTGgoHTMSPO1Ybpy6
         lxmm6DAwsPRnJByx+KErHRtcPaqbVEvMABNekMD7hLsqL6Bd7zqHABT2Yk8jF6aIQkpY
         RI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PF+qWDN5jd+CubA/a3KTQRNF/nvw8rMXCf7kpE9998c=;
        b=GLzpJ4wI08CwgFs7jLeg6UoujVvyRa2d44ZpRJVHz3jHl+Nzu8bsRFzc/Z+08H49L+
         ESWyieLSpaJvWHQnt53RD6PUL8nuGiTlj8WmoER2Oly3Vyx73fhWBTkfS+OZfDPnJWoq
         4/60nkgzCIFogEacDFRY4DGslHx7m8fJW/3X9QH/mTY62E0V8BID0WXqjYaNdtIUUn0o
         GDceJBeqwtG1Q5vYOQA4p+Ghd3meY8++LQ70lllPQ/flXBlQT25OzIIImatCqJzeWwAo
         6pursdWyc4Qf6+R8b3BLUwTRTMsQcsK2U1EWnLsY23msy+QJno8d6gcceckYRNE/SqNy
         CdYA==
X-Gm-Message-State: APjAAAVi114augS8krEjhedPu0KATn1p+5mEky+IbYfRv29N27TYDXXH
        rU8zt/fMAH6ze8a3p4pfYAs=
X-Google-Smtp-Source: APXvYqzJ2vuR8WIB+zQsiODkBqrOuSl800TR/BnWxsbsGfdH3zgDBClp+8qGxiTJGVblALPGI1qicA==
X-Received: by 2002:a2e:9188:: with SMTP id f8mr3091066ljg.100.1556905896658;
        Fri, 03 May 2019 10:51:36 -0700 (PDT)
Received: from localhost.localdomain ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id z30sm533435lfb.87.2019.05.03.10.51.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 10:51:35 -0700 (PDT)
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>
Cc:     Serge Semin <Sergey.Semin@t-platforms.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] mips: Dump memblock regions for debugging
Date:   Fri,  3 May 2019 20:50:37 +0300
Message-Id: <20190503175041.7949-2-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190503175041.7949-1-fancer.lancer@gmail.com>
References: <20190503175041.7949-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It is useful to have the whole memblock memory space printed to console
when basic memlock initializations are done. It can be performed by
ready-to-use method memblock_dump_all(), which prints the available
and reserved memory spaces if memblock=debug kernel parameter is
specified. Lets call it at the very end of arch_mem_init() function,
when all memblock memory and reserved regions are defined, but before
any serious allocation is performed.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---
Changelog v2
- Reword commit message since memblock debug printout is activated by
  memblock=debug kernel parameter
---
 arch/mips/kernel/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 2a1b2e7a1bc9..ca493fdf69b0 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -824,6 +824,8 @@ static void __init arch_mem_init(char **cmdline_p)
 	/* Reserve for hibernation. */
 	memblock_reserve(__pa_symbol(&__nosave_begin),
 		__pa_symbol(&__nosave_end) - __pa_symbol(&__nosave_begin));
+
+	memblock_dump_all();
 }
 
 static void __init resource_init(void)
-- 
2.21.0

