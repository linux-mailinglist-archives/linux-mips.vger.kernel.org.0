Return-Path: <linux-mips+bounces-8951-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73782AAD616
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 08:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93A3817E9F3
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 06:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4745220E003;
	Wed,  7 May 2025 06:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/oGkvKy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E46205E16;
	Wed,  7 May 2025 06:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599536; cv=none; b=oGV7PFBR7a0aFGjfh6/UJWzzdhTA3wL86+KCHA9dvslvZWjWa0O3fbP1L+cHH/l7INFVQSL54xLKzxUsCnnPfGoZflhB3MCpq2xOc0hMvphuAhC2phsUMU7mBqRJebOrebbHMvqIsBbBmwGjIcPsSDnyMDZGEyW4laQ0S7W4EjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599536; c=relaxed/simple;
	bh=26Qv9LOixC0/nw+NcE/gYTx98MQj761PMPpsb0aVnDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ba6YDRX5DqJIWyAKWY0FNY3qJPiR2tMykrjc1ND5/UWb9WekBw5e7sdYbuels8BbJHwym1gwaKWADRSj1kZ4clH/jBka5HvmRcAwyYnCCZWfmCuSiPuTD+D+/aDYHjib5cgaXUa0nhggA5fsBm0aA07cD5FNMFZxO16UBiluexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/oGkvKy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fb0f619dso76422665ad.1;
        Tue, 06 May 2025 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746599534; x=1747204334; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HRumt61hIcek/cB4Zu227bKkZ9hkeOlfalxZihclBlA=;
        b=S/oGkvKyznRTLjPaLRpJ90SUWQqt7+iA30x7zr0JGqGNdRMhuDugoWq31hNouFFx6z
         QgvHLCqsWpKfZc5LZ4eXfiE4BBZ0mjKytvfJk1gTnUp4eTwE46JRBfz/X6nqbAOss1K/
         Ij9GxpzFW3LCv12BupXIHdBQmaZqPplJHywpOU1w6EWqKBqmsfnwat37MQNDqDufZgRT
         LMS2miM96YofTx+J/w/9vEe6nlVL2irHn1g3Em94p462JJUpjMdo63qLiyOf3M86hHkd
         Bs6DWwtG9GBDWUHI/XC1xsLNDaySBpCoOLoZXceHTPUzM964KiUjLJnnXC6j6D8oNB6W
         32zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599534; x=1747204334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRumt61hIcek/cB4Zu227bKkZ9hkeOlfalxZihclBlA=;
        b=he+HoQW+FO48n/b5EhsWNAgfZXZVFhhunklBxQU67S+5W4bQ/ADZ7AesTwA6vdjjuh
         sOHen4n6t58NF1D4ffw2tBZpD3c2GcRzZzsZxJppNJoprDHpAxHnrAxE7DPt5Cl6+Egh
         FKo2UWMLrQQtVVTf7kL0OUJbarU+ezFd18dNgXJTD26AAxoMMzzs18FPQvzvmxlmXRw4
         jB7WNMDtEOMxL4PiXOZW3C64Q1ce/7JWhgB9gjoa8JexMnA1lSq3I3V9NyoaFfwFWuce
         D4UFxYkiszONKEu7ZBhp1Zyo/veu/U+KWkkVfnvxjE8u7j0vXBwQlwX9SEKUjuhuA9iE
         8n2A==
X-Forwarded-Encrypted: i=1; AJvYcCU/WOFA1oogCDBvtqUr1BACcgNZl4AapbpyzM7ObiLXaGh/FZAbeRe6yMXHW//XKBaC4JIWzjhg92NZiO8=@vger.kernel.org, AJvYcCUghRjyjeeXlw8uJwoCH+CtQoQGVGmnw0VWyGVWfcq67XTe/a6DS7Q4IccgVa6mY5ZYRhVaseFJaQZt7A==@vger.kernel.org, AJvYcCVK075mvFf0m0dOXW5ByDeiMRTNVzYe5zkZl9q5U5gXA2zM/7ejPFDJ74bdgfliGOHrK8oZglB5cMwV@vger.kernel.org
X-Gm-Message-State: AOJu0YxUV/k89o8M7lRq7HowSieNV5a3NGIhMktHq5vkDleRZHn67Ysw
	dehzE2wu0BTGhLy7zKjDeI7cBFsgjlEZJ88gkwvvPYlKVjXPQTy0
X-Gm-Gg: ASbGncuODK6UOMmJh9joCqxgwIBmz6ge2y+wC+R9jOaIzxflPK2LBL7WTofqHiQwgpp
	4UFbBIMQvxtoCWuRN4TKe4pkrQlQjujCw3DP7DHwq9vRtptI12NBKq8moCz2rfcCMJGfzzqiALc
	JeHxVo7H3ycOgQh0yDANp0iIZrGu5LA7XGACIyrLfb4WWi5a8L1IzI/Wu2QmWYJ+erUy6w99dZy
	eFP8nVGxX7M47MvFFkKLJE0n8bWV5Eym08jmDpU7Eo5EqJYKpFsagptNCgjNC51Dy/rArP4TuQE
	A51O2CFwbdNvokH3ER5OUd4E/JBP+jlLt6j5E7Z+IlXL31xc/QQ=
X-Google-Smtp-Source: AGHT+IFgQgrSwnbfJwJ7AUO/JIivWOsVdA1uyc2S9u2Ih5zSXrOB8xhKxfGlOR3DdJ5CKg0i6CQMMA==
X-Received: by 2002:a17:902:d4c9:b0:22e:3730:e7c4 with SMTP id d9443c01a7336-22e5ece3e54mr25920265ad.37.1746599533892;
        Tue, 06 May 2025 23:32:13 -0700 (PDT)
Received: from Black-Pearl. ([122.162.204.119])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22e15229384sm85805295ad.206.2025.05.06.23.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:32:13 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH 0/2] dt-bindings: dma: microchip,sdhci-pic32: Add json
 schema for text binding
Date: Wed, 07 May 2025 06:29:34 +0000
Message-Id: <20250507-mchp-sdhci-v1-0-ed29de05295a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM79GmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwMj3dzkjALd4pSM5Exdc4NEE0tzE0NzQwMTJaCGgqLUtMwKsGHRsbW
 1AJ7/LetcAAAA
X-Change-ID: 20250502-mchp-sdhci-70a497417104
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.2

Create a YAML binding for microchip,sdhci-pic32 and modify the sdhci
nodename in dts to match with the common mmc-controller binding.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Charan Pedumuru (2):
      mips: dts: pic32: pic32mzda: Rename the sdhci nodename to match with common mmc-controller binding
      dt-binding: mmc: microchip,sdhci-pic32: convert text based binding to json schema

 .../bindings/mmc/microchip,sdhci-pic32.txt         | 29 ----------
 .../bindings/mmc/microchip,sdhci-pic32.yaml        | 66 ++++++++++++++++++++++
 arch/mips/boot/dts/pic32/pic32mzda.dtsi            |  2 +-
 3 files changed, 67 insertions(+), 30 deletions(-)
---
base-commit: 3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
change-id: 20250502-mchp-sdhci-70a497417104

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


