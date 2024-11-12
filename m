Return-Path: <linux-mips+bounces-6733-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 114B19C6337
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2024 22:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C052BC4CFA
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2024 20:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5EF219E35;
	Tue, 12 Nov 2024 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wZU3Idkh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A521219E32
	for <linux-mips@vger.kernel.org>; Tue, 12 Nov 2024 20:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442113; cv=none; b=EqsdxVsRMQddCZZROMo9inYCWh5tg8YbBXRKkPstm5RykI4jpD3j3oA/na9VkNGCJjI1TKLxQJgxzQiwTUhCoOd5rGsD5ODZsYApl9Vu8ba2maZzHz1AuEo5BsR/X/aUNvd/adzwllzxCNwUU/0MASZzsRjVzFeOwf4ElMkx6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442113; c=relaxed/simple;
	bh=WOG+kgPGig2JUBPu7JB8xbaKMfawPzWoJPhuE/OPV4M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=fRfq34vi0ZkksNJvgc5Plzs+O+sPB9B7sMf8pqfL6pqpOqbc7xphBeJBavZlYV9XjJEvdEgB++HzQjDM+rOBzB7m3sbN/8jdwLqX/klAfFM/7Oh7F+27hFZMOUnLAd4XWOUkBB8ywOPty/9aFqZzTE/22ksTtlEm9UmTiqVNL8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wZU3Idkh; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e35199eb2bso114528787b3.3
        for <linux-mips@vger.kernel.org>; Tue, 12 Nov 2024 12:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442111; x=1732046911; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NlbeGs7JzC2W9w1yjuvb/RMP1pWjBAdOqSbmcYhNrdI=;
        b=wZU3IdkhIvUcYfP75KuYt+nvKz3I1uu7CiCQO46caXe+5JQGKTpK0sTutfP883OW7r
         p4eJhwGYiGEB3yPhyBXvVZf73MdZGi8/BVN52MZD6agDbO+hvOHGRG3oGzuGX9Ng/QzL
         bvMrNvJvKQq0DyJNjIN6twqxdy0Ed4rFI7LouxCbc0mNoaGzmIABs9U7g+RESM3IWmtx
         dqoqiqQMvlEeYm602f1is6Nyxgyk7hGGDpAqq+44iF662ER+MLemL4tZt2vO7uSHBVP1
         55k7tSxHpFaOjXQjnRDXdZba6YEOPi6oXmayAFBHQHcWI+qnrgbmUuLesO+ye3rt6k9B
         cAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442111; x=1732046911;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NlbeGs7JzC2W9w1yjuvb/RMP1pWjBAdOqSbmcYhNrdI=;
        b=DlQsYlKQpzKB+twYppx8DyBGL1v/JOKB4M29uoTOCZJAwYxcm4SgsILGAwTiL/85OX
         FI9JOPGTJ8RvTByR0ePqpJBPI1+/HyFA/m08SzciHxF+pYFYUc657K5w4qzGVgWSIXNI
         sYIIWy4Sj5wd6ZYkSLgNImTpa/d7rLhwO2F4wX3caAPBaTEC3JYDMYw7ZrZmoCtU9ZMn
         7mS3/TIftOv4sl/hskKWS0n73wXfrgumfV2HjqrUWA+VgqD/V2sSvGpUkzYJ8Hav+Hi/
         Hw0Ngv1YSi3J0A5J+uj52TUt32lajVsz3b8awxXcxZE/lJGgjKkTzylotsNIDQtvYPP7
         uIRw==
X-Forwarded-Encrypted: i=1; AJvYcCUNfYNaqNU8PTM2kk0HK+yuCP2VnTUai+6o3PSUVHYeu3tIE69oFP92ER3XSitZNjrlfhelDJpLagKk@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDoi31JsnTKQhsTeBQaE6RzqTQTUS6s8uUBdKvcTfBlpKAAgg
	J3UMWgIr629fX7jfF3PdH5R2xu6OmQUD8LCP2ikPDO+dmAUZxe8dQF2dhX81FqK3oA==
X-Google-Smtp-Source: AGHT+IGCL8U9ifps5TPOwN+X7kXsBlcL9Xh5IyCJrh3W8wjk2SFN9gp7CKojZzJpYopV80U+K2lLLP8=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:aaea:0:b0:e2b:d28f:bf28 with SMTP id
 3f1490d57ef6-e337f844036mr52339276.2.1731442111096; Tue, 12 Nov 2024 12:08:31
 -0800 (PST)
Date: Tue, 12 Nov 2024 12:08:27 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241112200827.2594291-1-xur@google.com>
Subject: [PATCH] vmlinux.lds.S: Explicitly set _stext for mips
From: Rong Xu <xur@google.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Klara Modin <klarasmodin@gmail.com>, 
	Rong Xu <xur@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With commit 622240ea8d71 ("vmlinux.lds.h: Adjust symbol ordering in
text output section"), symobls in sections .text.unlikely will be
placed before symbols in .text. This can lead to the misplacement
of _stext, which resides in the .text section, and result in a boot
hang.

Explicitly set _stext to the beginning of text output section.

Signed-off-by: Rong Xu <xur@google.com>
Reported-by: Klara Modin <klarasmodin@gmail.com>
Tested-by: Klara Modin <klarasmodin@gmail.com>
---
 arch/mips/kernel/vmlinux.lds.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 9ff55cb80a64..62c3db869a18 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -61,6 +61,11 @@ SECTIONS
 	/* read-only */
 	_text = .;	/* Text and read-only data */
 	.text : {
+		/* Explicitly set _stext to the beginning of text output
+		   section. _stext is in text section and might be matched
+		   after symbols in sections with a specific prefix (like
+		   .text.unlikely).  */
+		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT

base-commit: 06513ddaf77b8f49ef8540c92d92c9ef0ad49426
-- 
2.47.0.338.g60cca15819-goog


