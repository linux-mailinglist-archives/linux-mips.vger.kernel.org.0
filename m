Return-Path: <linux-mips+bounces-5999-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E80AF99B2DB
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2024 12:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F8711F221E7
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2024 10:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB70B14F9CC;
	Sat, 12 Oct 2024 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS0YtJ/w"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243F014EC51;
	Sat, 12 Oct 2024 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728727955; cv=none; b=NUBeQR5mkbIwnrQgM91zJ+wOAeZLO/Y/n7+wh+OKxCRU4HpDAoCTaoHdpEaeVgI2UJt+MdzLK+aR1C7wUrth/rYJAddTEQlSu6oUcHOQAk5n/bG7ZR7/RBCKIuCk84P5rATkMzmKcOIIGXLZfPQbAi8btKXSEpdB/vKKKdj4AbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728727955; c=relaxed/simple;
	bh=sMCH/lqWjufuE6ofyEOG9Hg7wezXb3apJMwvu43jOM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dlRmKM7oBjo0nQuR7HipJZFSMrbHivi5v0c9ZhB5t0KQvHwveNjiLaSLp/h8krYnkVZlJiIobdONHLddqJIMKS+jTapn6OBJEK+bC0eQnjzcIn1NiqKWlGqJOGWrarP9AYARpz+oBcRvl4PhhAhiZXOwnKrbN7UveSfIX7VZ6iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS0YtJ/w; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99650da839so469322466b.2;
        Sat, 12 Oct 2024 03:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728727952; x=1729332752; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/X/T9oTs3aekEMIqMSRaL7+yx6weoq2/bzz9Tt96kU=;
        b=CS0YtJ/w6V7/RzeLtmpJo9apSgCvRGMtweCGLQellGwmQzoi7aKKej+S7EH7Yo0kU+
         ydYOZsuqx8Hi/B3s8AJsWv/BHbWCeAZMCgmcJTMyshJDk3s8oJcDZPALxuLlzCXlLglN
         uE6F43cTQSPFaYd5Ezrg4AIMqH5yZjVmoyV4rHGPxkBF+fuo9FE+VDHfqAd2RotmVxv3
         81z+9JaRCtTTG41sIdv1iPmsgbhObI2hHNUO/6l8OQAkXDSK797P6Fvv4K3rlXxRlH43
         GrQIz3DDcAceXDdAssKTtUTBr7wVpoAHTUmNURvcOubbfmZifWCF4BSX4ROBm58iV3us
         Z/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728727952; x=1729332752;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/X/T9oTs3aekEMIqMSRaL7+yx6weoq2/bzz9Tt96kU=;
        b=dL0vN0JUU8AGjHqCzR8iZ8KPOUqzae089sGzk606MQXy0PfwSRWT2rQbNRCqTbyrLo
         OWxe9Ks0RUgrMa3dJdUIbbnc/W5QwvbmaNT4LOxpY+bt9qSBw0DF9OrWhWyXQ64KOIQb
         RPonuJjtI1kYnlDOPHIkeOzSCDQR5LdDUqlaxTj/ye0AEf1k8FVxT1HwNaXJxiNyXZS6
         +wMAk6CRNAdiVmNPD+zE+lKwskNH8WIrAhcjR0LIkDh4Kw9mF6OVwnEH2XVEAOcoAmiK
         zz2hrlyB/d1wE3pk9i0Tdm9HWbqK24dFFaxH+Kl+ZfkxLsVRiheGP4jeD4GHmLhPAJzR
         +1Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWvRML20cSCiyjoBVURIvNGeQNMmY8a3UF7yotS+mwwfYzf7KwHQEhrLF4uTGlZ6O8lq/MauuN5cvyG/O8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+wFxWyuxSlXhdyRkUq0yv1gFf2TwwfRaqCRcXOwZUbCDLsIJW
	oed6/5lWU1J1OpTnasZ2LfTLusV4o+QRotrZcAR0W+6z4Y4dqOtEYdiq5OrnGU8=
X-Google-Smtp-Source: AGHT+IFgbliLD8zx7aqUgeC2A019bGhV08p4NDXejXpp8qQc2d4ARLNBVabkdQswxoBv7uy/vb7/4g==
X-Received: by 2002:a17:906:fe01:b0:a99:e5d5:5654 with SMTP id a640c23a62f3a-a99e5d556a7mr219111266b.6.1728727952148;
        Sat, 12 Oct 2024 03:12:32 -0700 (PDT)
Received: from localhost (dslb-002-200-173-220.002.200.pools.vodafone-ip.de. [2.200.173.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f49a2cddsm24631266b.95.2024.10.12.03.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 03:12:31 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 12 Oct 2024 12:12:14 +0200
Subject: [PATCH] mips: asm: fix warning when disabling MIPS_FP_SUPPORT
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241012-mips-fcr31-warning-v1-1-bac1d869d775@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH1LCmcC/x3MQQ5AQAxA0atI15roYMFVxIJOhy4M6SRIxN1NL
 N/i/weSmEqCvnjA5NSke8ygsgBep7gIqs8GV7mGKnK46ZEwsNWE12RR44K+EZk5cEfcQg4Pk6D
 3Px3G9/0AneZYF2QAAAA=
X-Change-ID: 20241012-mips-fcr31-warning-d4eebcfc91c5
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

When MIPS_FP_SUPPORT is disabled, __sanitize_fcr31() is defined as
nothing, which triggers a gcc warning:

    In file included from kernel/sched/core.c:79:
    kernel/sched/core.c: In function 'context_switch':
    ./arch/mips/include/asm/switch_to.h:114:39: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
      114 |                 __sanitize_fcr31(next);                                 \
          |                                       ^
    kernel/sched/core.c:5316:9: note: in expansion of macro 'switch_to'
     5316 |         switch_to(prev, next, prev);
          |         ^~~~~~~~~

Fix this by providing an empty body for __sanitize_fcr31() like one is
defined for __mips_mt_fpaff_switch_to().

Fixes: 36a498035bd2 ("MIPS: Avoid FCSR sanitization when CONFIG_MIPS_FP_SUPPORT=n")
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/mips/include/asm/switch_to.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/switch_to.h b/arch/mips/include/asm/switch_to.h
index a4374b4cb88fd830f8b83caab52d6e3c133fd0c4..d6ccd53440213315ec75a54caf683c32c69dcdbe 100644
--- a/arch/mips/include/asm/switch_to.h
+++ b/arch/mips/include/asm/switch_to.h
@@ -97,7 +97,7 @@ do {									\
 	}								\
 } while (0)
 #else
-# define __sanitize_fcr31(next)
+# define __sanitize_fcr31(next) do { (void) (next); } while (0)
 #endif
 
 /*

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241012-mips-fcr31-warning-d4eebcfc91c5

Best regards,
-- 
Jonas Gorski <jonas.gorski@gmail.com>


