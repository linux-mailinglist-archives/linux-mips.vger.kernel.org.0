Return-Path: <linux-mips+bounces-9469-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A650AAE640B
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 13:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AACDB169304
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 11:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510BA291894;
	Tue, 24 Jun 2025 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="Uykw7vY3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8120228EA70
	for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766298; cv=none; b=d19BSDQrdLlerSNpEB3STX8RcOy9ECmQvsUC7yjZzN81lVsx+FQNiyeR9BEQG4dOLdk6qss6TXTAlEnG9KmZAC33KPdwIgvvBiUI6N67aWgMB13I9n8iDpxVpfhxa2CwM0QSPRhCENGRiULxNdaghwf+cYaoUtgtc+z9w6OJ1fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766298; c=relaxed/simple;
	bh=qFS2Df0LGYtIBKdyhFmoRDQ6hxnNB2VwShQ6zNnXWCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvwc9Jdgr0OQAHNICII+cjMvoBscjIj+sq97sX4oSwaXUHcDdiO72SnJ3knqeMS8pXk39l8dQcGzlyTM3Vj2rhIUNdKuQF3qNn268bsbptkMsKUfo5jRG08u6c9ta3TD27DfA2lTXSRMqWTA+VR1hh+AKjpzIjCog3t2V1W0oQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=Uykw7vY3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so188442f8f.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 04:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750766295; x=1751371095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=She5AWJcLgG0NH4lPSRbBqXrA6M2R9hAOfTzkAkoLu0=;
        b=Uykw7vY3m0nUlxDA7FShswO3ofd0zPufoWEWBVQlOVIz/wtT4sgv0ODfT/RmPdi2Mj
         A9XHFZZ5FTus4NwAiXPEe2VwG/KTl41gZBqP7QWlmrgsqdIWYP1ByqzYinV+XT9pMMO6
         BEUfkdQW+MFKJwmeL9EGOTgyI0rJqNgnU/qDs08bPlHNjBzzCylA3hFkaho8EiuqZuP9
         wGitat5B4yoPbUbkwkP27cFtiOhcOjFxDvH7oc+0DDnvT7B56I8OIgHWhLIvduTVtefI
         3byTDMxVrOcOvCiO8Ps/vjTlSI5Z7WjieenC+41mhF2reCxMGd/X5J6NpxeD5zGXNQxC
         FLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766295; x=1751371095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=She5AWJcLgG0NH4lPSRbBqXrA6M2R9hAOfTzkAkoLu0=;
        b=RuwvuHpLhBbGloNY8egtnwsU7zNi++3ETWQMy308io1f4hVedp7jVw/eoCD+NdzAFv
         Cb3kKxkrhxQlKt4uAPQq4oH4HBUswbxC3C+klNmCRxDtDovay4zbz9CSgDwMF8SnhlfA
         xr+MuhccWFeWHfcW1dr4UJO2Q8DlLW/LIOaJDyBDNvUVyKBOlt4msZAZvtSLe282IHSI
         bRg4l+vaoMP/RXE0TKX4+QEbSWnQHJ8YdxUlhVGKPAjlcH0q1JzRe9rPSR3LASI7gQWp
         8kC9rrix5+/ZTxiGMFTYTwcrN2IrTASfWqYEkv1MG94jUGU9ST2qqpdUkaS5xg8j2qvV
         QCeQ==
X-Gm-Message-State: AOJu0YyrdgIGSs+Tz8ih9qQtqPr5JBob8wjejGtnWrgM0JcQtCjPV5gA
	LqVFz+rBv7BwKLBO3HESt2NPASomD4/646LgkBTn2dhw2PQh2mSXvCIvTSFXkgN4v7xEMbdDxo8
	Adca+
X-Gm-Gg: ASbGncsPltEMzGWrW1WqkdF6Qzg3/1a18NwIBMizD9lDfAtbTlvVmGXe6d57Gs2N5+R
	iSMEXPQg5JDbiAPlSaq2iRe2TlL6aj2eyjirESBR/9ytusD0qYdOCBzUlB1GaJfl5G/r+fXaMnB
	G2O1DTFQvmWiguIj3YdIHEOww3I2PTZpkSKq5rNl2xpHFG8JQFgRylUUo60ccCCLKjo+jNu4uV2
	aCbmnx3PncWi+V6SoHtjjYUo1sueftC/E5Km8j8jTZUlgbu0boAhqayJYYcI8x+8jGksIT6WQTe
	7E7dl2IKGlJb9aSUV/eS58atXJnC+qZBclNgmh/urudaomUdACLcQjYPnOiN
X-Google-Smtp-Source: AGHT+IHQ75gxD/hQHpsxBFO46dJVrbPVXqfHmGQ10VRjfGrlg+uybtFmTCLM5kggdwMmU/TqkcTsIg==
X-Received: by 2002:a05:6000:4712:b0:3a5:2ed2:118e with SMTP id ffacd0b85a97d-3a6d1193e87mr12133006f8f.9.1750766294562;
        Tue, 24 Jun 2025 04:58:14 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:d834:684f:62eb:5df0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a5fsm173860985e9.34.2025.06.24.04.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:58:14 -0700 (PDT)
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
Subject: [PATCH v4 1/4] dt-bindings: clock: mediatek,mtmips-sysc: Adapt compatible for MT7688 boards
Date: Tue, 24 Jun 2025 13:58:07 +0200
Message-ID: <20250624115810.37851-2-ezra@easyb.ch>
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

As the MT7628 and MT7688 are identical in most respects, mt7628a.dtsi is
used for both SoCs. To prevent "Kernel panic - not syncing: unable to
get CPU clock, err=-2" and allow an MT7688-based board to boot, the
following must be allowed:

    compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
---
 .../bindings/clock/mediatek,mtmips-sysc.yaml  | 28 +++++++++++--------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
index 83c1803ffd16..56bbd69b16d9 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
@@ -26,18 +26,22 @@ description: |
 
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


