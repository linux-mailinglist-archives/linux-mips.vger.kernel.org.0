Return-Path: <linux-mips+bounces-4130-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9418927014
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2024 08:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 077011C21C90
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2024 06:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F141A256C;
	Thu,  4 Jul 2024 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wX98WCi6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F41A255E
	for <linux-mips@vger.kernel.org>; Thu,  4 Jul 2024 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720076059; cv=none; b=CvOW2QVHLmj65gpkbyTFEYGRdaHV3lE5DgBoWnzERayzf6+YiZ2UBNocSw9fZJP/0yxcv7zwFjkvbegFa3qTiQ5T1hlT5YeFqzVUQM65YyyrQ5kbFyNPfxQLf4FTkABsPI++9zLHhwVRmKBqp0w2ar+P4MW/Gb0kdYpFVpgFQaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720076059; c=relaxed/simple;
	bh=rvmbprnMHM6RuihnA3iI8+faiVS/K3OKoDAAx/cTilc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KvCIMrsoSfkr134l/wLYPheqTfAp9Cz0rrmIbH45yntPMLBCfbJi6JN4YhlFAuIvMM/k26kLa1WLVKKo3YNtBVdAPAlMmevgbnA4RB/9u94hSHD7WACjPlQkiXr5cpLFDRzqpmd4BCprn+POMi2sTQzIfxCfGnF88IzeIeOWhdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wX98WCi6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c8911c84daso225660a91.3
        for <linux-mips@vger.kernel.org>; Wed, 03 Jul 2024 23:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720076057; x=1720680857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqt2bqXZTu+jtLjs9BXsNPr4gZaqVWVCViCBOTfKtXs=;
        b=wX98WCi66wvL9ePxOdfS4OnbQRyI/c0FgklI6XAqYMeWTSYJI9wvkDc4tbLNK+A1OI
         yLMVzJqwrNHu6pGKzqfymgYL0DFOJCFeQ9h7uaGAHUcynbWP+KEzTCBjAgRMpgGF61xV
         NFvoYL70Af6sfdWub3ODW6qZi5SbkI8bsHalsjjJQKB3GTZ33ABxNpdzGOOdi7Mm2qmM
         EfbP6hZQh+MpznRkdzuBWBCdt9YvGEZepyUCO3HS+U+qtbXdqj0iuGPhlzVgB0Wwicwo
         0I5rYG4E3hVC/2rMVvpYj+Rx9mSjwdZ9Bc5xbKvd7nHidr26Cy2O+YVZv9UjY9KJw3M3
         FHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720076057; x=1720680857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqt2bqXZTu+jtLjs9BXsNPr4gZaqVWVCViCBOTfKtXs=;
        b=ZDY91FyNdPQ63jmROYzNYIPA7efqwRYeghltKlZKzUdSLAnqaOcJ+1KIdySN7rNGxN
         OjoYrvfogTl3FdJznOIDsZb58rnNkDNFXqcpJpx9LFoPPKy0ce+8XfR9ceETnP7BNk39
         IzU0y6XbhYn1HjoRP4qzsjvrJcUS+zNIVV1zCzfyA+OjTEhkIT+Xf3fqvT7NcJ6WLoVN
         0qBfdhinIpypVBNPy3wVFkmMuCIZ9dRCWz6h5PMFELFKCVuUPxlaCfYL79IdkeoQZ/fY
         LEQZG4h9d9CJSCC2pGY7xdcXKvdY8HPwLyHxtIISNp3MQ1xYcIIWoK4BAJZ4+T1l5i+W
         RxyA==
X-Forwarded-Encrypted: i=1; AJvYcCXbYGFy7gBd+Wox0Nu07CJ5MdhG5w7Lp80/v8W6PIMWja3ucUEz4OHMDZdgJ2Ko0doTI8eDPtT4Q66l+wp6L40dJGuUJyUdf+qQ8Q==
X-Gm-Message-State: AOJu0YzGS8tX6rb6GYmsP/lHr1hz615bxwrDQftNnlzrWgId7ozd6sH8
	ulwnjSr/yrDAGnLD6KxlFhs263cTAVQsMjdEW6hC3dP7ZM+YA4lCM0GRfRl/V7I=
X-Google-Smtp-Source: AGHT+IE6fNB2yrW6RNftQOsnBHViWmextONFWbrX8jTlqq5TSpm4UeSlu7EdPmVmpu6y90sy4DvlNg==
X-Received: by 2002:a17:90b:4b04:b0:2c9:6791:a752 with SMTP id 98e67ed59e1d1-2c99c6d0948mr487823a91.44.1720076057304;
        Wed, 03 Jul 2024 23:54:17 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a947485sm706021a91.4.2024.07.03.23.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 23:54:16 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] cpufreq: loongson2: Remove empty exit() callback
Date: Thu,  4 Jul 2024 12:23:53 +0530
Message-Id: <f09ee1fa731db0c1565b5d4b919d54d5f258957b.1720075640.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1720075640.git.viresh.kumar@linaro.org>
References: <cover.1720075640.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exit() callback is optional, remove the empty one.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/loongson2_cpufreq.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index afc59b292153..6a8e97896d38 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -85,18 +85,12 @@ static int loongson2_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int loongson2_cpufreq_exit(struct cpufreq_policy *policy)
-{
-	return 0;
-}
-
 static struct cpufreq_driver loongson2_cpufreq_driver = {
 	.name = "loongson2",
 	.init = loongson2_cpufreq_cpu_init,
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = loongson2_cpufreq_target,
 	.get = cpufreq_generic_get,
-	.exit = loongson2_cpufreq_exit,
 	.attr = cpufreq_generic_attr,
 };
 
-- 
2.31.1.272.g89b43f80a514


