Return-Path: <linux-mips+bounces-9339-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA22ADC84E
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 12:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E68C177473
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 10:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73DD2C08BB;
	Tue, 17 Jun 2025 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="lpwi6DZs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D551E834F
	for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156266; cv=none; b=cF3IYZgeJ+Yww+aoYcqnYuQ862xM/92a7MQbECK7beQbt8MMpQaXN6efdPlQbjXNZ+hGo7ess2KUXE1jcd3rjIteBhHXRW0evVfh3XsYcjcou2QrfxhL+xABH5oTxQfdx140crLLjq6vz4bWlcHdEQF5r3hbzAi5R3Liz5edgew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156266; c=relaxed/simple;
	bh=MRktcHHE5wKe1jZB0TVIrWfJ6bF6zz5pS8h9jFrX2gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7zTYlY+p6PWBzxV0K7hXnj6YnMNQB+3L+YsTX8vqjpLeyKnhNO5aih3FGvQTm6jTOtlvnPDzqslLUnq/RDgl83OlVw+PvJpEhqBKrk2yAPbsF8+k63GqSiHXY+J6oNR5TL3SKRDV8dyVGO6GQUr0XVaeuu6cDzGPawFT7sxPOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=lpwi6DZs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4531e146a24so33936245e9.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 03:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750156262; x=1750761062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmNwwFnf4rvDB+kei3WgHFlAgrsujTs+X07iVmmGktU=;
        b=lpwi6DZsWypgLKtWppK6ln/feYxTanwZdKrDZErTP7dCRtsCCglpHbv/cVmIMjxxFe
         ZEAHwGBGyPlgLm8wW3TpkvDUblTPI28Vtp5zXrxwHXe+wmhv/JuIx6kNW7FeMVJlqvZD
         RquXE4djvtxZni2v8VSm9DH446ou5LBtp6U0mG+z6DAWrvy+CADaakEdn5qZZtwQuxEp
         ceVDai68kwEwGEPwbHZ31/YojX5tc6MQLOMgm8DGG2m+AV52vjzLUMebrR81RHL/PEga
         IJLihngsLsEW9xao9evVTNXgw5HHDkYp4x2FnoDYBi26U2dKhuWBgH63ZQLznkgdXh0R
         NNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156262; x=1750761062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmNwwFnf4rvDB+kei3WgHFlAgrsujTs+X07iVmmGktU=;
        b=aE9S7qKR/5WVSIl31oqTt+r/547MCO4a/n8vUgXUjUN6sJFnmy37yMo/rKpJcXvv/l
         J6uLv8HQPEkYoN6FleAtn/MHpk2fEdbniowi2Za8uccIgpTC0HcLGDIW/mW7HZcKBv1h
         d7OikI0nJFOsWso4WXjs9UeXZ/mPcjp0GrNoVo5STaJ/7e0z/f6Ua9VVwYY8eWY9LTFF
         oQSKsDVJeXyNgJTdm3r6ceN8a8N3uno7smlkbaB9MR6KOtMMjWv+lRzM5Dk/Zdx/rWfb
         js6YQEWu6FXlE0QYRwplDhEWG+EEhZBWCdarxCJ0Y/8EhfUQLj8IvxLFKyN6AV1TrBSp
         Q7Eg==
X-Gm-Message-State: AOJu0YykFd8wYsopB1exlINYVFlvXkNMpyGJR101GJLEQJiwXrMIH5ZK
	/P/xKtu6c4o0oeKzpZMTmSWrMY3ceNTHTg2SJc/d8qc1PQxV7/x8WhFiiKQMaYA9WqdHrQn1I+s
	MhpgS
X-Gm-Gg: ASbGncv9q6kPDzWQRMGdAE9ID9009Q6wkdfXSOiolLWZfXVc2WpTTRkjCUp5Fmmn/hp
	3lDbvg56ULZSfhzurmXuXhGNFWYP/KoXH6Oo0r9wfNd1eQwmRPawX/h0bqIScdwbhgvcO1Bpbws
	Mcy++6ZYFuykbzIoeuCZT4RPgOUrjmvK/0aNJTHL+dUSRLeRnJmbLGvYWkPhuCCYgiMf4PkTxJL
	cUZQllKi42mBGr1smyjmG4Qovnb18BAxpEiVNnyYX0RKwhBUY030E1JDeM5b+C+d34xFiIfCGiV
	7Zh90wSX9MXhrOJQ2KrZ+woJ4Kfqg04YVv9+7phCP7MR8cvbrbJzk1PzU5FwgyiZ6y38nA==
X-Google-Smtp-Source: AGHT+IErcBfFQKTQ8cJ59Qswbejq+S65j5wGZCmMhc8Be5vHHaKvya54mDzCAiVvaL2D0IBYhiyYYw==
X-Received: by 2002:a05:600c:350f:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-4534f580000mr52297055e9.31.1750156262162;
        Tue, 17 Jun 2025 03:31:02 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:b1a7:bc8:262a:3102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e16a097sm176749215e9.33.2025.06.17.03.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 03:31:01 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: mediatek,mtmips-sysc: Adapt compatible for MT7688 boards
Date: Tue, 17 Jun 2025 12:30:55 +0200
Message-ID: <20250617103058.1125836-2-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617103058.1125836-1-ezra@easyb.ch>
References: <20250617103058.1125836-1-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

As the MT7628 and MT7688 are identical in most respects, mt7628a.dtsi is
used for both SoCs. To prevent "Kernel panic - not syncing: unable to
get CPU clock, err=-2" and allow an MT7688-based board to boot, the
following must be allowed:

    compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
---
 .../bindings/clock/mediatek,mtmips-sysc.yaml  | 29 +++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
index 83c1803ffd16..550807301fc5 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
@@ -26,18 +26,23 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - ralink,mt7620-sysc
-          - ralink,mt7628-sysc
-          - ralink,mt7688-sysc
-          - ralink,rt2880-sysc
-          - ralink,rt3050-sysc
-          - ralink,rt3052-sysc
-          - ralink,rt3352-sysc
-          - ralink,rt3883-sysc
-          - ralink,rt5350-sysc
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - ralink,mt7620-sysc
+              - ralink,mt7628-sysc
+              - ralink,mt7688-sysc
+              - ralink,rt2880-sysc
+              - ralink,rt3050-sysc
+              - ralink,rt3052-sysc
+              - ralink,rt3352-sysc
+              - ralink,rt3883-sysc
+              - ralink,rt5350-sysc
+          - const: syscon
+      - items:
+          - const: ralink,mt7628-sysc
+          - const: ralink,mt7688-sysc
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.43.0


