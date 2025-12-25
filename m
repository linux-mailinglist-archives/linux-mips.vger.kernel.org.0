Return-Path: <linux-mips+bounces-12596-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42168CDDA88
	for <lists+linux-mips@lfdr.de>; Thu, 25 Dec 2025 11:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AA6B3045F60
	for <lists+linux-mips@lfdr.de>; Thu, 25 Dec 2025 10:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FE931A56D;
	Thu, 25 Dec 2025 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZWoElh4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45785225409
	for <linux-mips@vger.kernel.org>; Thu, 25 Dec 2025 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766658379; cv=none; b=b/XRWMwGR50XlPt2HHj6V9qR5t1gocTae8iiCTSEPvcBPGi6MY11gO5GS80ozLb9+ynzWDLfWuU9V0hJ1M+T0n4z7p3llyQPxj/KH6NaD79DG6vT2pcaV5/ba0yN9rZCs6+nScX+kQMjnBv6tNh0YCDG+dKb06mOOau1UxQJQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766658379; c=relaxed/simple;
	bh=E5s5dAa0VTQdMXpF2lnAVWKinAqcZz1UaWRSxHODcwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iv5H31rRmxbw1rxKKKCtajD6WDS/nx4VOtXK52FdRHWyIGzZqPuF5OqI0iTLdj4of8JKYjkybtoI6WISzLHpWq9SYepV34r0BcsOje4EwrAdBzORsAr4KRmgsR97M9VUG2DDICSYglitmUaRacaOgG9FFih94LITiu1aVVXkIqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZWoElh4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7355f6ef12so1248589966b.3
        for <linux-mips@vger.kernel.org>; Thu, 25 Dec 2025 02:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766658375; x=1767263175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIaCuy0Yr5csM4hT0NvBc9MsbJrznZV2wGR+tUVj03k=;
        b=HZWoElh4UJ+ufUhtfwiNswtX2iLcH7BnPCkzs/s4OntDcqFfyfCqlHmrP8GIBz3sK2
         /UFgAf0oErVO+tjsPSYZTnaDCj4uZ07wktkGeHqxmFEy5FsBiBCYr6CXApnTUWlIqCdr
         Im3kImTlJ4u3nkjgNSvB0DHgD16QNkvJl50KlXluiEZsmXGeANzyrYXbw2rKKu+Y0Stu
         /0sEQpdfpgxKCcMjnRNawxN9lEYYjVWpCi9WwfnsS4gRydmNnTC1uWRmJwzFdSkNs73H
         aGJyzl9SqOd6Jow+e07bWKnaApO9Wf6xYtwxOlg3VIrwNmHFtib93lT2eM0ivxsEEhkt
         3wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766658375; x=1767263175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIaCuy0Yr5csM4hT0NvBc9MsbJrznZV2wGR+tUVj03k=;
        b=iOamg05dBo/w9LD1a+5s8sQZqbZLgmf6KCZye6kvGMecIs90evarWnBph/WNEFP1qm
         WLlNdiCpA0flg3RHFrLd23nbYob3Y+FqVIQ8rfFCpPuQjkbDiGMstAF3CyW0S07ZicKX
         oMH2BGoHXFdSPL+xUXS/K5+On66t7j2z7Z9YWQ0ZkEdjNrT8i4ud3xa4Go9zECekcmvb
         U3E3FNRzRq2wUMbon1jjWm9dKjHCeYMZT9FwH9X41WnUggzlGqXchUV+911Ay3V6WAZy
         Oc/XEBnRr8uwRVHwgcPUCb0iHqAf/l0wJsUZVwoeLwFjQOrp+7v/G4W01rPWzd4uHYZg
         pweA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0hq/cu12/SPjW1r97mw/aA13ZrFd7ABsQ8PvluMcvg6gVWfOe+HU0RgqlIB2rZK35HjKihWg0/1f@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEzkBCTxAFeI9Lomzfs8ahbcOZeOZa7kv0TitVaJ/Zira3LEK
	Guf33G0QkMlwWloAHSbVLf9WHXzr4++/2bsyHtfHYIwHnLqaJKyLaWrz
X-Gm-Gg: AY/fxX4mzWWLFkjhozfbWlZrSaAU0vTMCPFb64WCIxmFgTBvgr5u0sVSCUsfHfEF4aD
	B6sidnS23+WX4UgfolLO7Kkma9NAPgXRV0M+o9MWPpltsd5/bxFnsmuZKNvUB/noicHZXROlQqq
	NcJiJxC+Ocm8tV1feXlH+ZmNIjb5fhAm9MqWDNEvLDGSG5cDzpqYoz/PniZJHMM8zgrg7qmDcAI
	RhHlXKhHfT0AH/YiSA/3v4Wuyer1LxvybmAH1h3BOEglnoFdMGoTiPCzpmF/PNaCZdtnuiuToxj
	B1z6egPlHfmpMgdQ7QBwXZsSyIEYOd6JHtJPETTKvd23K18eBU7w1lndE2moTryQjqlP8w3Y+UR
	Xk0eNABImjJ5lUjhlHVkI1hlGfXuwkboLNcY5a1NDEdVoJca4W/rekBxCxu5fGmiHQTBGTYuXN0
	ZAzpSWPc3OuquEhtg0jpEqNDmfWbrSq1lRYjSS4IAoBieQnhwQz25cOFlTAHkL9V/qjps=
X-Google-Smtp-Source: AGHT+IGTq+3+tIFc9OrOssc41kCs1BnvDhuOWslkFodTOLZK9xgo+B67Du+bLzTqEF27zfk+DrePnA==
X-Received: by 2002:a17:907:6093:b0:b83:246c:c857 with SMTP id a640c23a62f3a-b83246ccc94mr173915466b.17.1766658375320;
        Thu, 25 Dec 2025 02:26:15 -0800 (PST)
Received: from localhost (dslb-002-205-018-238.002.205.pools.vodafone-ip.de. [2.205.18.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8056ff4925sm1570885166b.31.2025.12.25.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 02:26:14 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: brcm,spi-bcm-qspi: allow hif_mspi as alternative for mspi
Date: Thu, 25 Dec 2025 11:25:30 +0100
Message-ID: <20251225102533.30772-2-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225102533.30772-1-jonas.gorski@gmail.com>
References: <20251225102533.30772-1-jonas.gorski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "hif_mspi" as an alternative reg-name for brcm,spi-bcm-qspi, as
it is in use by BCM7xxx (BMIPS) device trees.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml b/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml
index 45975f40d943..ffe8d7f8dd4a 100644
--- a/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml
@@ -57,7 +57,7 @@ properties:
   reg-names:
     minItems: 1
     items:
-      - const: mspi
+      - enum: [ hif_mspi, mspi ]
       - const: bspi
       - enum: [ intr_regs, intr_status_reg, cs_reg ]
       - enum: [ intr_regs, intr_status_reg, cs_reg ]
-- 
2.43.0


