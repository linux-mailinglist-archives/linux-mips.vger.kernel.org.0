Return-Path: <linux-mips+bounces-10342-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3298B28E13
	for <lists+linux-mips@lfdr.de>; Sat, 16 Aug 2025 15:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3CB4B010B5
	for <lists+linux-mips@lfdr.de>; Sat, 16 Aug 2025 13:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1452E5B0F;
	Sat, 16 Aug 2025 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="roOlHHh6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740F22E336E
	for <linux-mips@vger.kernel.org>; Sat, 16 Aug 2025 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755350410; cv=none; b=i6ObcgIJGROQkcvaE79PbT86oj1Co/ALPpRBGPg4NY5bsaGEOsBs47ANUPyM9r1Qtzfw0wQTmgNxFwoRR3h5xzehPigmZ0A6ca2C0aGqQS9SDc6prCjPBtEyPYywNL+ivEYo4H6GLxWM0yomdFSliMpPtR1R3t/aSgMPnxwgCT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755350410; c=relaxed/simple;
	bh=v55+uk/j3Fvwvt96KQUrEKeXz+GsVL1LJoEzbMpk9mk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hbN3JICYEZL6IGwZixPAwpH/ie7lde247LdnXgZr/hxO8/JdDnKUceKYY/WGm4GD6kDXTLzmA61T7O5KxrN5Ujj5dgLHQe6xe9wErMhy/Y5eLwuAh96EeNf4zkF/U+D1FvO/YIjrb269KBlwdiqsFAp41AhItzVmvGUPvvDoS64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=roOlHHh6; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 8458 invoked from network); 16 Aug 2025 15:20:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755350403; bh=80128I2RBGrHIl/hr2Z4W9U6xFs/PT3gv666mHpvn5A=;
          h=From:To:Subject;
          b=roOlHHh6rx2O8mF6yWW5jvak9Or+tsvqiHBJmT9peV0W6TeSJUtwegOh7RiipwZrg
           +S+dlBzKVsE+DPYsuUyKqJJv4YSQlcgu8hS5Y0Ibvra3F6UGj+psl7RcnlR2oVvTJj
           Kw9lSIFNuAkeLzps72BjvhJJ6t9BBffiBimAnnnPMk1vp9RpUfU6ZUHc/FVz2NsXvE
           SdRTWgHjzzjMj5w8daLOXztGtGublnnBiZlIV4g9VEeaL18PASOL8lcqoZkCcv+Ur0
           2qpJ3x0ZR+Cejv7KTXMrXK9uci2heDqrBq1ZsoFC49Msvy8sVa1q1GqFP1xkjJUOZa
           TlWODBcEEnc1A==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 16 Aug 2025 15:20:03 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	olek2@wp.pl,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] dt-bindings: mips: lantiq: Document Lantiq Xway GPTU
Date: Sat, 16 Aug 2025 15:16:21 +0200
Message-ID: <20250816132002.3632343-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 5189e545326c8b1747186d7d8cedaa62
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [kaP0]                               

The Lantiq SoC has six built-in 16-bit general purpose timers (GPTU).

---
Changes in v2:
- added device-specific compatible
- added node name pattern
- added interrupt names
- added third patch
---
Aleksander Jan Bajkowski (3):
  dt-bindings: mips: lantiq: Document Lantiq Xway GPTU
  mips: lantiq: danube: add missing timer interrupts
  mips: lantiq: danube: add device-specified compatible in GPTU node

 .../mips/lantiq/lantiq,gptu-xway.yaml         | 67 +++++++++++++++++++
 arch/mips/boot/dts/lantiq/danube.dtsi         |  6 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml

-- 
2.47.2


