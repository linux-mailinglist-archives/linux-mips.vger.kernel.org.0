Return-Path: <linux-mips+bounces-6840-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B82669E0DAD
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 22:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C5242826C7
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 21:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74641DF26A;
	Mon,  2 Dec 2024 21:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nN47wCae"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0801DF268
	for <linux-mips@vger.kernel.org>; Mon,  2 Dec 2024 21:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733174475; cv=none; b=BS5BtqpZnclfsFbKJ+YU8crzfFMFx7a9SMwQl4zr+2m3J099dfEOa7l8UBSkUWnOmkWD+T92dAi9SS50JJUJsPHSOM93UBPGWNrcWBRh/xV2xmgTE1I/AkwKP9bAnc66Rvr7rbMhu9W1y3XSMn+BC+8GzUo0hKyQ2Za8wNSg6HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733174475; c=relaxed/simple;
	bh=bKodebLJ1/tmi7Ve6WEOQ9mpeuqLwzk+D+nZMIEw8Zc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=GT7rF3tMt00+0DAVnjQSRqSynYLY+6htBzatbx2kIwksJP093VIaNRbBwP/db+AzO5GZ6agx06zbVc+u9/3mEq2S2i9qxRvBQ3Y5dyCX9W1p7EGXA/J/NLv4svkD7nxqexnfnHBfGcGxUlrc8faxFkRYRwIFBno9PuzPlNVWAow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nN47wCae; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-215b1900fc4so4954785ad.3
        for <linux-mips@vger.kernel.org>; Mon, 02 Dec 2024 13:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733174473; x=1733779273; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YtdDg3+r2CUKjgXpHXakAwGWhoYlu9Q7gwbhbNJjOLs=;
        b=nN47wCaeBoGMFtqTmGSY0qB4opaz1+t/mVRNmbN0o7oyawoMHv0UWmJ7kyBNyDUuaB
         bFxZlAeWOKh/KVAZ6rmCL8/4fP4vdOJKRRloHqeT2c2PNJgADkXvYQmEr1rgUAF/h/Tx
         O9+oDACpwWnvvK1toWaOWJPkTtVfW+zrSjMmBzFfAHBK7ZkjYSWrYvNlLbmEOZHz30g1
         lmZIaFqvqKIJTVCLKqWyuN+8WoB5Zh+VB1tgzTCHDCgIBIME9GGzBvNUi9ag1rabti32
         /L3GcX25dN9FaOf1t3VlxsrDDB6ucy3p5Y3QpTeLjdnrT3UGo17XH/ajBIM6G+z9JYub
         k2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733174473; x=1733779273;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YtdDg3+r2CUKjgXpHXakAwGWhoYlu9Q7gwbhbNJjOLs=;
        b=mTdexHyniMz8GXzAo3sv6hKOXTwYNDRHWB/jWqRQPWP8adB0S2brwFGJzm6/oauPqs
         2cmc+QpRQAUBODfZLmbHbWosud6rJQxDuWUOFsrRFcG69ZSuXTd9qJM+OZOna7BmfNvf
         IT2PSz23g0VDefCcRs6/Ke41D9YYFPwJE0VaItwdL5vwxHa2t/Y84dw6FfmvJgPb83QQ
         vBxRNNlqFFGBT0kliBX0UDmvZcS8YNaLvyBgePcICEMn0e0baJD4Muz6LIAJbM+Ux8t8
         eNURp7JNd1vY2PNC0uIQ3lXDsIHPhI3L74mDROijyA0fJlCjsHpiNkaNIEOpty+RF+ph
         uMMg==
X-Forwarded-Encrypted: i=1; AJvYcCUFZXqHvLN5Nb15UNhYO7MGM43EHhvvQHcPMP3VykyzMlHmlvuAI+w41jx4i2kb8OzSjrd/2ubthmTh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+5UZmdbpxJrNckd3KdVdMaIqhde/y50fvHOzLqRF49/jvaFXN
	0VIIm+03SQOu6iOL5mKgbV1esDzwO+AvzFgOCoXVBRjmFpGu2icwL/g5xtOEhffkDw==
X-Google-Smtp-Source: AGHT+IEoiRqnfvchz9eenVGpUUMxSYjpaof7MC37M9FwhsoffQXFFqQKuQARKv5qACG8WYwb/hZ6mZY=
X-Received: from plgk16.prod.google.com ([2002:a17:902:ce10:b0:215:9dc:8556])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e846:b0:215:ba2b:cd51
 with SMTP id d9443c01a7336-215bd0d71e4mr596335ad.15.1733174473296; Mon, 02
 Dec 2024 13:21:13 -0800 (PST)
Date: Mon,  2 Dec 2024 13:21:09 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202212109.3201452-1-xur@google.com>
Subject: [PATCH] MIPS: Add a blank line after __HEAD
From: Rong Xu <xur@google.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Klara Modin <klarasmodin@gmail.com>, Rong Xu <xur@google.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a blank line after __HEAD in the text section.

This change is based on a suggestion from Maciej W. Rozycki
<macro@orcam.me.uk>.

The __HEAD symbol was added in commit 52892ed6b03a ("MIPS:
Place __kernel_entry at the beginning of text section").

Signed-off-by: Rong Xu <xur@google.com>
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


