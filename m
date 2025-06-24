Return-Path: <linux-mips+bounces-9471-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4ECAE6406
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 13:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 290DD7A04AF
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 11:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B856291C0A;
	Tue, 24 Jun 2025 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="JPBFx8ZN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E3D252287
	for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 11:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766300; cv=none; b=fg8/NPPpxMvXxkpojEXEKRWx3CnWX9Vmn+UUFbAWzbutA1LvBioC5rt7+hLs3E907S2wM2nUmyoyRuCZFpkT9ipdZ4zIDfVzpQ1sUTCxhiRavzNGy9ew2GEDa1luXjIjV+zfDyIpE6CwbQpKbU/OGc1MODXlGEdE9HNDLl88gHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766300; c=relaxed/simple;
	bh=h3UPqbe4sHsIOrKmfTrEkvLZUI22mR3WiPaH1WtZ+Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3ZMevbT4yvdgbkKfyLl+OFRQpKT4k9qPDmcZyBy0G69ra//oQyKioM5/tlKJoCFtw68f2WpF4/RcvNePWEUJtvD2ZTkAu3XjLwg6l/zYPLfzXptE/ozd7ToINyKfS/3dqdRGjkPwdkFCFXDzGhafhz/ATLqplGfbSiI4+Snhow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=JPBFx8ZN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so2551935e9.0
        for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750766296; x=1751371096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqIJMZJtR2MozSAlBaEIUnoVSAIXjXDAyYywqzDZ/go=;
        b=JPBFx8ZNYBCfsCYwjGZ3ZTBgyDqo7JHIhnajbbSLQ6QBMSE0tHtLll4cgqgcYG7Qgc
         rR4mio20CXx1UaBXyp5T/BLyeQYfV9W66ukxCjXuFw5F/9/eymqjlKY2haKioOC8RGCI
         pgWPvu6+SMXm/zKD5OyjZfeiUX3xDT618cPKwZWuL8XpN7Zmm/I+q6QnujsKDGpyXOa0
         J2FexpHSl35O326qFF7di3WhxZ0rhgrcpDEAl+y2SBM7Wsg/qpUS/uT2q7Bhov7C1Zqv
         UluJfD7BeagijCA9gjUxIV+j3gvm+KPSLg0w9flZ34kLUUoQgtu6t25LeawMCij2r5AC
         aJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766296; x=1751371096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqIJMZJtR2MozSAlBaEIUnoVSAIXjXDAyYywqzDZ/go=;
        b=d5UP98osFRutGKbp2oovGsenz2NkMTB6228WxxJZG7PKX50xEjkSNS/WmaqaJtkfSi
         yOrhtL0ukNsYX9XxRVJhWOtbYGU2IDzzD7qByH4ef0YwWOTX6To/tfIBl01w0uNZNKoc
         9vDrbflXLTpdzIYNnGldCpudU+TupqwdBwQiwA7kzocOjg8d3EvMvUL8I8p3sCSNB8jR
         TGuDG4RBJFkNJTETCyPvXyz+KsWKXOyoNSopfZfPKgscToBX4P6BMehkb0dlpEDP7uMy
         3R1xGNHbSonGtu4Q3A6UkBXF91C7ILf3O1qV6d72wI26on9W1rNTaU/QvnBmq4PC/ECx
         w2gw==
X-Gm-Message-State: AOJu0YxZRdj9vWOazTVwtqvMNx7LEq+CtT4j3HpLnw6Mu0xli9Ov+Z0D
	tsl2EULGTXonBkcroZc5iqtmSn0hmbEoOvTkm76MG95D/7DaKIJ9QoY/hzetvkXDpBmQaOPqujM
	mICKb
X-Gm-Gg: ASbGncsKo3EFROT1bjcTQ+z2F2h0Kxvyt+IZXzEJpZ20rPEo1gOztTpATjaBqgLOBSk
	M+3XkzzADaBDBozDFQZ7Ds8qDdw7mYCNIyDtJ4U0J2b9fs3ALGf/5F5Tz5FglViysTh//dKK3ga
	S23tJybDSyOKYOXMqPX3uM04dOKhxHp4DHFdBdytPvPLkB3JH8NrGlxQgNJSK4wuc6ow2a0IwnR
	BwOO11+uh5v2ZuU1VAp2oUIhS/dljTLPDTiKFBFGhy1yCd1tD4fiXc9CYGz5Mn8ueDdsxHPVIvv
	ikCQwKDh2RhlewV4g0VRdS8pAFbGB0fDTDXnMlHN0Q2dM3ePL3CYgRVidTvh
X-Google-Smtp-Source: AGHT+IFZqIw8bLXtSV6XdjOFwm1q09y+Z3Lyq9q+dC6uPgyD8A5iZkqUhd3u/McRF3nzE8AebVg30Q==
X-Received: by 2002:a05:600c:3b1e:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-453659c0c47mr178343315e9.30.1750766295532;
        Tue, 24 Jun 2025 04:58:15 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:d834:684f:62eb:5df0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a5fsm173860985e9.34.2025.06.24.04.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:58:15 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v4 2/4] MIPS: dts: ralink: mt7628a: Fix sysc's compatible property for MT7688
Date: Tue, 24 Jun 2025 13:58:08 +0200
Message-ID: <20250624115810.37851-3-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624115810.37851-1-ezra@easyb.ch>
References: <20250624115810.37851-1-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Otherwise, the MT7688-based GARDENA smart Gateway will fail to boot
printing "Kernel panic - not syncing: unable to get CPU clock, err=-2".

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Reviewed-by: Stefan Roese <sr@denx.de>
---
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 0212700c4fb4..10221a41f02a 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -33,7 +33,7 @@ palmbus@10000000 {
 		#size-cells = <1>;
 
 		sysc: syscon@0 {
-			compatible = "ralink,mt7628-sysc", "syscon";
+			compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
 			reg = <0x0 0x60>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.43.0


