Return-Path: <linux-mips+bounces-8260-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E05A6BC25
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 14:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 031837A6E11
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 13:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A5415574E;
	Fri, 21 Mar 2025 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="deIesldz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEAA14AD2D;
	Fri, 21 Mar 2025 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565183; cv=none; b=i/ry/q39cYOMNTHIGgJQyrESOJC47W/b/30iH8iDumm1lIIkoDxyfujFARqQjkf8bVqySI3tWmfpwI58wo2HvGvkg7gFeuoc4JvCI+9ihe2svSWhnHMguCOUnojVGn9e9uqDvJo6fH6TIzGOtymhsjTj0WKAqxTrPNT5om3yqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565183; c=relaxed/simple;
	bh=4vXekzsWHmvR94GsE6lgMrIwMkPY5qevNSy1oBeUqIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QeHvTum6NcBkBDfk8z/K+XZDD7K4qxa3Zqt2KYcjQNPNEDObiy2BB8EoZJIovUetvx2ZkwocdD9k0aUDBFCV2CZunu0Po7u/DGRFoDo++NZEXqJjcWRcy82TbLeJ0yr3timKqBF5sjgGKjWu0rFihcHWIo5DVfw5+kS8UIx2mmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=deIesldz; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88A2F2A3957;
	Fri, 21 Mar 2025 14:46:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742564816; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=rItGop7/a5/qbko2Ss3dBjIuYcyFS3TGR+2NriB9xKs=;
	b=deIesldzqmdXxkc20gVll0bhzIfYrBsqfpy3avf93I0bjC0LI5n0Ppu7XBLXIEUEfw1lk7
	SZc4Mkw3MxkGi1S/fajKOrw4rGsrsFxUo4tzhGG1bSuGA5abL2Ex+ewyTjhvfSRHhyc0y7
	gxiiRR2ORjCBx96R1tsbU41qV/D/yJkRvvMwoJ7yNW3PL92/clbLfsty6kpM1NT7eAYFkN
	/ce7esEmnhCjq/fh+SB7zCh5dBqK85Y+HImRgUgseoUBD3nzNFU7tmJkBAUxnBlFLmb5Br
	tosrfnxQLBlsgYEFHDWZ4ptl8NxcAnJcVCzXflGVGiAUqpdOvJ2CSGDUhdHyDg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v1 1/8] dt-bindings: vendor-prefixes: Add EcoNet
Date: Fri, 21 Mar 2025 13:46:26 +0000
Message-Id: <20250321134633.2155141-2-cjd@cjdns.fr>
In-Reply-To: <20250321134633.2155141-1-cjd@cjdns.fr>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add the "econet" vendor prefix for EcoNet devices, to be used in upcoming
device tree bindings.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..4cd050e50743 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -416,6 +416,8 @@ patternProperties:
     description: dServe Technology B.V.
   "^dynaimage,.*":
     description: Dyna-Image
+  "^econet,.*":
+    description: EcoNet (HK) Limited
   "^ea,.*":
     description: Embedded Artists AB
   "^ebang,.*":
-- 
2.30.2


