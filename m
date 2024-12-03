Return-Path: <linux-mips+bounces-6850-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 793F69E2960
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 18:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 325902856FC
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 17:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8FC1F76CE;
	Tue,  3 Dec 2024 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yrx/lgxz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741C1F471B
	for <linux-mips@vger.kernel.org>; Tue,  3 Dec 2024 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733247278; cv=none; b=iuoATuGeCrUX5rdptezKsqjeQuO0DaZ9SKkZ7k3GrO4pqx5ALJ3XlWMgRPOXNRPbPmZsEsMN7UKcPnSdZZOktr2JVtAE3P9W8uRAio/sCJuATnFAW6BtqKHB1XM526bLcmO9LUb2OgW5/yJVLLMxwoxWY8GTgIyVYTk+ktNXo7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733247278; c=relaxed/simple;
	bh=3zGYGdTB6TnUBgQNb9FaHLEtVUBY7U330q2Taimm1TU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=lT0MOYysgUyhRqL8ppxT2W0ujNy0V5+6Iumm7/T2ZfAiDq7j7IUOReL7jVEu24+vZmkhx19csKLFh22HczWdAqQ3hy8wotLW0xRnJRBxjiymVkY6jK4fmpkbSLJ3FpLmsmLCG0yFwIpR0aohqsifnpsiBV/n99WohjFuso1nyMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yrx/lgxz; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e95713327eso5542195a91.1
        for <linux-mips@vger.kernel.org>; Tue, 03 Dec 2024 09:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733247276; x=1733852076; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zXBncvZ9vdZsF5fbKzAkxX5C8KUR7SVsxPVJa+dSNY0=;
        b=yrx/lgxz4ti6D9d4iRncft2t+Hc/1sVXIFs4xUZAI7JASn/qAbmS+vjGKZAURmeYiO
         fqjiY3qmr8TAXaB9afPkeyx4a8SnlNcg/0O1B77WPhIzxjxyZmiNB7no5WBopjJ0d7eG
         62VmFwqnL5V3j4c53BHGThWxiP+zTtPdoA3JhNSWt1mOndP9qaG3sLU0kYLfcErQflUO
         1gHKKS48TXWIbb/dJKUr+DZ8rSUXZ4Dakf8CpKE5rMGztHggUs3nzdhAr3gv4VT1Z8Xs
         VHBo9oes9V0j2X2vbPI/4nmCsbP+lbXOV7jVOwbvXbDwK+aM6VSwEFrUs4SPB77C8J9Y
         eJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247276; x=1733852076;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXBncvZ9vdZsF5fbKzAkxX5C8KUR7SVsxPVJa+dSNY0=;
        b=vVreSnQ1gVxIWSKXB7AtmauX9jRScAinpvX/suz/kg2LvZ2NtcAtQXcGl0GWxHUTcw
         EXdU6sULtPMYyWJoxXnXjCD+smRlS4Ec6d/Yy/OeJXSVMTtKvFH3ZZ1hwosFMZbPg7vw
         h7wCc2r+qWYGsrQpUZkIOCqxyd1gUECl4hsy85zhF7/3DRnjwXe50up3Z+T100lmBWM1
         IslVfSWDmomLRF5jC4TwIRkKSTv112lBvZLP/JlZprZ7HIwNsqhzLXQsKS1zAoJS3iPr
         hye8Oj6vWIO4zAW3ibVmRMfpwHLMC4kIDHuBEocqw64UstNL65mp7hFwYyXoqJ+o9Z8C
         5d1w==
X-Forwarded-Encrypted: i=1; AJvYcCVzD946gjfYNzHtxC2L7wRWe2J+wpNgiB3xIP33ZOBkHuIBRdbsjQZqLadLkZfZtcC/MJCbxPtDZT53@vger.kernel.org
X-Gm-Message-State: AOJu0YyFjHNM0K3G8FBAv3ALxzpOSIKuB7m9l8b71I3Dj04G8u6czTY/
	ehqNT2tua24l0PzW9XGIqN6P5eXmCaydZJE0+6BzrGkDpcSoGhLDZGAlTvQYk91aQA==
X-Google-Smtp-Source: AGHT+IFms79qBBOYMxF4VMXPfrG3RDmQyAJYwTiDO8KGvvXv58S9bgUJmgQo9KkixTuUky/11qsvSFA=
X-Received: from pjbsz16.prod.google.com ([2002:a17:90b:2d50:b0:2e2:44f2:9175])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ec90:b0:2ef:19d0:2261
 with SMTP id 98e67ed59e1d1-2ef19d02442mr1788593a91.16.1733247276107; Tue, 03
 Dec 2024 09:34:36 -0800 (PST)
Date: Tue,  3 Dec 2024 09:34:31 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203173431.3790387-1-xur@google.com>
Subject: [PATCH v2] MIPS: Add a blank line after __HEAD
From: Rong Xu <xur@google.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Klara Modin <klarasmodin@gmail.com>, Rong Xu <xur@google.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Sergey Shtylyov <s.shtylyov@omp.ru>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a blank line after __HEAD in the text section.

The __HEAD symbol was added in commit 52892ed6b03a ("MIPS:
Place __kernel_entry at the beginning of text section").

Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>

---Changelog--
Added suggested-by.
---
 arch/mips/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index e3ff6179c99f9..d99ed58b7043d 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -60,6 +60,7 @@
 	.endm
 
 	__HEAD
+
 #ifndef CONFIG_NO_EXCEPT_FILL
 	/*
 	 * Reserved space for exception handlers.

base-commit: e70140ba0d2b1a30467d4af6bcfe761327b9ec95
-- 
2.47.0.338.g60cca15819-goog


