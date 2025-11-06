Return-Path: <linux-mips+bounces-12094-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B094C3C2D4
	for <lists+linux-mips@lfdr.de>; Thu, 06 Nov 2025 16:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D3A188F018
	for <lists+linux-mips@lfdr.de>; Thu,  6 Nov 2025 15:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE6F334366;
	Thu,  6 Nov 2025 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGjlXjpL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A1D303A0D
	for <linux-mips@vger.kernel.org>; Thu,  6 Nov 2025 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444329; cv=none; b=dpKEAnSltMhjbMRhowYpEI13FiXxahHl9p2FDRmSpQxI3ams3H8xF4PX/oV3d+cd7lBJwqU3lJJuOAUJJhPuhWfznyYrmr85ZDfaPIr/bz/cnBVQJOFeqm24b9ZpMcHz5RBasXW3LQWo6wcDw30MwcNp6hrfdTN8YLfTB+viRz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444329; c=relaxed/simple;
	bh=XR9rI1E/GjUSg1P4shHRnyIGbjZqey/ajz1O0S2ON+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgRAQ/Arwb2Qihpc8DAmUjKFRZsvoPjmWg4tNU5DshoMqacocrfC584fK09BMlMs0ORYqMXl+VhYYsZm+Bpxglyb1dVkjPLFkPquZQmYiogiqLn0gKFwC7Uk8ZCWfxG4rSKn1qBYWNuhGPRENZi6p7SkKeoG/zazjcqnPL0udZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGjlXjpL; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640ef485673so191941a12.1
        for <linux-mips@vger.kernel.org>; Thu, 06 Nov 2025 07:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762444324; x=1763049124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/pDXK1AfCX+Hni59vZriLv6LYkpG1vOii9jrnO1YhfI=;
        b=zGjlXjpLIkRDTJcgZvoF0w4a0HcZVqZ5jKf9SpNeasD14T8doVN0/B+i4QhRNLYO1E
         fIPhu+Wkx+R3Q29gTly4f5GZtLhYZLaqb4QIBv02wCNVE79aSKG8m2gcw/HwIlM34QbN
         VaaaaidTYQC1ReaYtsAuwg6HrIfBHIDRqPUpSIYh6tQLvGfZwvvGceWDR287btnegVUT
         aMEn3so6YmY4xrjvpJm3qI+LZRb242EvTwTVhnm1DfQsTMIwf78UDhBE2OYqeZlUYleX
         NaI2q1n6zYYljH/69BisdDieqxJ+0RQi7rlkHZ3efa3Gc1/S3fIO0s12TNAGCdwbKfNE
         470g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762444324; x=1763049124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pDXK1AfCX+Hni59vZriLv6LYkpG1vOii9jrnO1YhfI=;
        b=s1SYEKidBXbTHJjExK9I/93yS5Cy1MZ6cKEa7MdvFezGH5PfN7cRV6K7+cxVeHwIZg
         3vsLGb8FSf9UAdJ7QkaCPkeWKXYr9evtmkL3fN5/M47zwwNLNNZv6Du33duDjtLByh3o
         lEkhugJsvU/wFOb+fpXYXuCdv6MlTcMEocdAJ8KhusjmBw90V7mkd3RKDgSgmTsBHjkb
         4nXOuc1NDtZzK2pMHXFw3wPo55HHWAr7wPtwGijO8hCz+pYPYsgfwJIfebK74HwHdzMv
         5Rj7AyYV11nCMlqt7CQn6o1buCwj0MpUzMesfEkAP68NXWk3vXQhigP/qjcVgpDOme1W
         aLqg==
X-Forwarded-Encrypted: i=1; AJvYcCVnAeYY3QEc9S2I3eiB7WdsntquYTHM1VM+105Jah84tvuITlKwUcesyBIL6buENRxQRw60wMU6Waow@vger.kernel.org
X-Gm-Message-State: AOJu0YyWRenrdzikdJYgF5zlKrYFnwYD86qIC034RhfzrUK2JuCJZLK2
	gO0aYXjUMb5oCAuDuZ+mjrnu9ge2EjN6A2gz7zEAE/uKeg9ssI3VJetODKQsk21q03M=
X-Gm-Gg: ASbGnctTIOWBYVd0fFs5OtNJ38NmmXn0BKROclNVq08eRuYhdXOOkSjfCzQt9NCKBLv
	4jzZq2CmIrrRKkG8EyjlN/IRssqMQNTKkrX1gyq+RucUzpschEO6nfS25gkcT1GKyhJ0wtXhI+T
	pCP3VvptCHObRJtMiKiY+QxqQUT3PL23Nyv45SJQ9/U5z43NJsrzDj51odRP1GBnbLd93PfsbhJ
	heCj4cJTjAXnVE6wRRcir+uE7Zst3Fteydv/OoQ2KM8T1XSMzizgug5rHqXT3FC6Ad8oFba3UD/
	o/ro4JOQpdjx6AxfHIOKCKVgNxDtKh5ixoL6MmAyIONz6RDTTeUzSZ77DiVgilec5URg4fBo47Q
	UT4PeaE46YZOBG1t9ckD4xvThQWh+cVdG5TnxNJXvwuitHdwWJQTVDM/pftwV+RqYefBZtFp221
	vzFSdsWve9L3n/msWVC8N0xA==
X-Google-Smtp-Source: AGHT+IHUL9GfAK2sSZIr1pdLdb7oSwV39dHOCg6krXf3O+qK4JxFrJeVUTzcLdiPzK33dR3osdKvNA==
X-Received: by 2002:a05:6402:2683:b0:62f:3041:c7d4 with SMTP id 4fb4d7f45d1cf-64105b9fca9mr3869113a12.7.1762444324485;
        Thu, 06 Nov 2025 07:52:04 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f8575eesm2067292a12.22.2025.11.06.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:52:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] irqchip/irq-bcm7038-l1: Drop unused reg_mask_status() function
Date: Thu,  6 Nov 2025 16:52:01 +0100
Message-ID: <20251106155200.337399-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reg_mask_status() is not referenced anywhere leading to W=1 warning:

  irq-bcm7038-l1.c:85:28: error: unused function 'reg_mask_status' [-Werror,-Wunused-function]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/irqchip/irq-bcm7038-l1.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 821b288587ca..ea1446c0a09c 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -82,12 +82,6 @@ static inline unsigned int reg_status(struct bcm7038_l1_chip *intc,
 	return (0 * intc->n_words + word) * sizeof(u32);
 }
 
-static inline unsigned int reg_mask_status(struct bcm7038_l1_chip *intc,
-					   unsigned int word)
-{
-	return (1 * intc->n_words + word) * sizeof(u32);
-}
-
 static inline unsigned int reg_mask_set(struct bcm7038_l1_chip *intc,
 					unsigned int word)
 {
-- 
2.48.1


