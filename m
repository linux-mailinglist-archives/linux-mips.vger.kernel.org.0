Return-Path: <linux-mips+bounces-7588-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B05A1A338
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 12:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 267B216B0D8
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 11:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39D82135B9;
	Thu, 23 Jan 2025 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wdn7woYJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483E2135A3
	for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2025 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632326; cv=none; b=cu3BLznZNA3YuBiJq5xZnOUanYwCpMrKgtCLSp0b8NlsOTqMYt2t6yCaDubI/X+TXOWykc6ucutkeBdY9HLKujyrYGYpLkF8AOuvOya7YKQ2IG/a9WJjH0CEaoZLkwEZbqF368zmI4O7XMyENx17sV9U7tMsN67/4h3KttnsyM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632326; c=relaxed/simple;
	bh=WV84G/RB5+7f1rTZu4Rt6v1dVd1mWE1RlukKepVDMOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AOfPUEkLsq+/VIFYF9Ag7vCcWioMdD39aYXuzsprU/9kPJjgt8k8rqwm0mSwsnERNOipkIO69DLWJVyVQgTFDr+xz91h0eHaNvUr6gf7aUGRkFotGgiKwiOSQfd4K4sg/F4oUhr+WfnDbIt8IdUsiDjdiUZSDsHbok6/AZWz9/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wdn7woYJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21669fd5c7cso12414205ad.3
        for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2025 03:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632325; x=1738237125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPQFhXLLMXODhvNoypMAGj1uR2YWHafKwP+IehwFe5U=;
        b=Wdn7woYJL9ZSp22i6X1PZMk6vjuOmO4Jeio+YsjMlGFjEcjxQ3P0V1AroUVQBf50Yi
         GWEmHxeXYiTpJa9G+trWKJFxVFjTI0hK+T2dF3DzCrh4kg58RrLyoNat6ffIfrddqaro
         VOmdzU5B8IXM8C7YhhNDpMtW3i9927hZUQBpizCdvwydng0N275yl+47bzBTHqZEepc8
         Lsw6KnLtnk92Pxkh1A11pKCvKrvfXFjXP4aIvYbYnK6W8FmxpK25ABBbICt729niaBJy
         rWkRP9DBBag3x2plDB6rjunA12xGBxX+eyo0NVyxIfbR8lNyqOVqaioMzc09ALIoQY2S
         8KwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632325; x=1738237125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPQFhXLLMXODhvNoypMAGj1uR2YWHafKwP+IehwFe5U=;
        b=XpIOt2VgGi9Ygk4ccOGpNuCzEMs9wlRZMNtnvY8XV+5j4/7TEC/S3+JjEK3eLx7bgS
         f3oUBD5a++71Hj7mpdIQpMN9z3OIjBYZQwAEPATI8gUQNi/SFeXE4un/0c0q9WcMuglL
         ehFoKw0kwb9YonYT+gIcomXKCS0f8Lcsnmq1gh+YJ9DMAKmi1SyyuOTDTbr1aYEp6rF2
         nGIlojjPXpqsexxvXROqsTS4wTTozmWo5fVfrG4cpnjLAxl/zEWFQkterUPSGehdywS5
         6Mwj/XfLH8SHXruOW+dUR9qpyFXq4S6qFQqSDnNIDyFlVkaH/36taeZqdXPNsFkDfNk9
         ZjTg==
X-Forwarded-Encrypted: i=1; AJvYcCUySDgzC8IRQqrbXEBDkGnH/ZJSWclouXGC2aOPPRqEwAzh7IEVR4jX0ajYuTsZfbEUmxK3IUe9ZUau@vger.kernel.org
X-Gm-Message-State: AOJu0YzVJwTLCbN9pPek9leKqXr4mo8QWR6myhTcqMAaiZITHBcT0s9d
	Vc6DjaO0nR8wIUWMo46aAoNkRWLiWwtAXrYNRjYFlJ5ChaXPAW/qpvuzpkxXAsk=
X-Gm-Gg: ASbGncvLnaeWFu8KkEG/CEgV1yVhzwDJiqA/adZ5ZVZZWLlCAB7JTR/4NYEAJGjtGcX
	vyl4sSYBPmSbKubmSILmHjrD1+R8d6jksvAElXusqoUDPWy9j9mrSwnwrZ1RVakS3LfHOMAJC1O
	zRrqA1w8nXHvx+OtYuDlvo0IuZuCu/ClVRqLzllDZReFatJLjE17E0AjjWD6yb6nNMJwoG+iPNy
	nqrQEfmOD+viq0bQbBNc0yW0wcO2RRCBaKhiBAAOZUGnw6xHsqwfFDUyFPk815CX76ozVxxINLx
	nsMY98E=
X-Google-Smtp-Source: AGHT+IGH1rgrIO+s+Y/sZ3xBZQHUbxqMwBuZRbD1wDrTeC9bj2qH2sxuniFd3GYQRJetgoOSm4ug5w==
X-Received: by 2002:a05:6a00:bd7:b0:72d:b2ed:8788 with SMTP id d2e1a72fcca58-72db2ed89dbmr24987717b3a.10.1737632324738;
        Thu, 23 Jan 2025 03:38:44 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabace1bdsm13291546b3a.171.2025.01.23.03.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:44 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH 13/33] cpufreq: loongson: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:49 +0530
Message-Id: <d7b219882feba7c7888a40e537b154e904508503.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpufreq core handles this for basic attributes now, the drivers can
skip setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/loongson2_cpufreq.c | 1 -
 drivers/cpufreq/loongson3_cpufreq.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index ed1a6dbad638..39a6c4315a60 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -91,7 +91,6 @@ static struct cpufreq_driver loongson2_cpufreq_driver = {
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = loongson2_cpufreq_target,
 	.get = cpufreq_generic_get,
-	.attr = cpufreq_generic_attr,
 };
 
 static const struct platform_device_id platform_device_ids[] = {
diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/loongson3_cpufreq.c
index bd34bf0fafa5..ea516b939c44 100644
--- a/drivers/cpufreq/loongson3_cpufreq.c
+++ b/drivers/cpufreq/loongson3_cpufreq.c
@@ -337,7 +337,6 @@ static struct cpufreq_driver loongson3_cpufreq_driver = {
 	.offline = loongson3_cpufreq_cpu_offline,
 	.get = loongson3_cpufreq_get,
 	.target_index = loongson3_cpufreq_target,
-	.attr = cpufreq_generic_attr,
 	.verify = cpufreq_generic_frequency_table_verify,
 	.suspend = cpufreq_generic_suspend,
 };
-- 
2.31.1.272.g89b43f80a514


