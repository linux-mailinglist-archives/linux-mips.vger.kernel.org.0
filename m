Return-Path: <linux-mips+bounces-8510-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA22A7D7D8
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 10:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4375F3BD096
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 08:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855AE228CB8;
	Mon,  7 Apr 2025 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jjN5FDYZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913A5228CB0;
	Mon,  7 Apr 2025 08:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014496; cv=none; b=qXph61/P5qMDCMUT8dC01JiihDkp28R+JKKIUVUIAcqVg3qEXjyqshL9gjHb4PzDQRwB5KWJMubRpP5UfK/IoQrl7JOr7XvV0q/lmzzvzxvPJzq9Z1RE1k4JZHfAJyVfeIkTn1tKbdeWDRrk+BfX3/0SP50+Rr3swRlfV2PdPJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014496; c=relaxed/simple;
	bh=EivRHSAtgDyY+dAxX5GqXBkcIwzYXhvrOY7AZsW0Uck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJEvfYs5N1BFO/OGMzUzDBeF68fNLtke60s184aDNpOtpImxfYAx6aUKC4aF+o8zk3yWJiL5ir2mZJXnWLPqgCgnKSB+1U8A7pWdVMAYmWEx3mRy8zBRUV2qjDh0HxoqR/bNoDNN6a/BoK5t/a2iMjSwYVywlb2vR64r35ume64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jjN5FDYZ; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744014492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r+lrJOKr8j6gVtWJaXtQgJkZ15e6JlGdjN+41t4SPAE=;
	b=jjN5FDYZgohQN9YF2nK2xgPYkaryD5y6Uf6NJMpQ00/X0re5NkiZhxLcg2DNlXgpsyyKTt
	DscofJL5wV2lYOPcb9U7Gt7Ct7B6x0e7/Omlhh4z/97cIPcykVh6zpTnFrg6Yh/QovpHeq
	ehgIJRv8BnqOjib+RdRuKbXQz95ABhY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: ralink: Fix refcount leak in ill_acc_of_setup()
Date: Mon,  7 Apr 2025 10:27:58 +0200
Message-ID: <20250407082759.742105-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The of_find_device_by_node() function increments the reference count of
the embedded device, which should be released with put_device() when it
is no longer needed.

In ill_acc_of_setup(), put_device() is only called on error paths, but
not on the success path. Fix this by calling put_device() before
returning successfully.

Compile-tested only.

Cc: stable@vger.kernel.org
Fixes: 5433acd81e873 ("MIPS: ralink: add illegal access driver")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/ralink/ill_acc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/ralink/ill_acc.c b/arch/mips/ralink/ill_acc.c
index 25341b2319d0..6d1d829854b6 100644
--- a/arch/mips/ralink/ill_acc.c
+++ b/arch/mips/ralink/ill_acc.c
@@ -84,6 +84,7 @@ static int __init ill_acc_of_setup(void)
 	rt_memc_w32(ILL_INT_STATUS, REG_ILL_ACC_TYPE);
 
 	dev_info(&pdev->dev, "irq registered\n");
+	put_device(&pdev->dev);
 
 	return 0;
 }
-- 
2.49.0


