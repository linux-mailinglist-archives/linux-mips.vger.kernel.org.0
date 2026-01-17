Return-Path: <linux-mips+bounces-12954-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A41AD38BA3
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jan 2026 03:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A40E303D68A
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jan 2026 02:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475BD3191DF;
	Sat, 17 Jan 2026 02:27:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01F9318142;
	Sat, 17 Jan 2026 02:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768616846; cv=none; b=sxZAaRUjNjC2PgWcSayAoam70mUL005cMuz13PaMu86loT7K5Dg2JlFVvlbA7MfAPE/2Y97jMHRmt3BVh1mYEBCHcJDGp7sH/zkML7c/ol0r6jH1VsnJEH2zMy+xvtkWuU/yAVAQ0lrDjAiEZq64L0PRo1auAhZbwIStX4xjMiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768616846; c=relaxed/simple;
	bh=m/utFi0BLeB3LVND3/ezPIBfaGLGy8uoDxdmB4a+gz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaxLeap6LE3g8moIgQDiMd6hBPMkbV/csQHKe+/nvFASr75falNXjOt/cdc4k0w2bPbvXewoy7gADWJEYVWp1by9T1FM9FNZTKQE54JvirRC/wrq4K+zXYbsKVCj2EsaOWw8E22sUHuLcyUTYXerHQl7LB2NweMcTolpOdO3lLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8BxHMN+82pp2ccJAA--.31610S3;
	Sat, 17 Jan 2026 10:27:10 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJDxTMJ082ppbNkgAA--.65061S4;
	Sat, 17 Jan 2026 10:27:09 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 2/3] dt-bindings: rtc: loongson: Document Loongson-2K0300 compatible
Date: Sat, 17 Jan 2026 10:26:49 +0800
Message-ID: <0c6a4fd221b5bf05f06cae9bb543a5bf7ea59f57.1768616276.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768616276.git.zhoubinbin@loongson.cn>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTMJ082ppbNkgAA--.65061S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGlp0xwWVwAAsP
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xry5tr13uFWfGryUKw43twc_yoWDtFc_Ka
	4Iy3W8Gws8AF1ag34jvr4xGr13Z34Iy3WDC3ZrtF1Fy34jv3y5JFykAw1akFy7urW3ur1r
	Zw4kGry8Zrn7GosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxhiSDUUUU

Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
interface of the Loongson-2K0300 chip.

Its hardware design is similar to that of the Loongson-1B, but it does
not support the alarm feature.

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/rtc/loongson,rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
index fac90a18153e..aac91c79ffdb 100644
--- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
@@ -23,6 +23,7 @@ properties:
           - loongson,ls1b-rtc
           - loongson,ls1c-rtc
           - loongson,ls7a-rtc
+          - loongson,ls2k0300-rtc
           - loongson,ls2k1000-rtc
       - items:
           - enum:
@@ -48,6 +49,7 @@ if:
       contains:
         enum:
           - loongson,ls1c-rtc
+          - loongson,ls2k0300-rtc
 
 then:
   properties:
-- 
2.47.3


